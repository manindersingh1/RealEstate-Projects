(function()
{
	var CheckoutObserver =
	{
		appDomain: similarproducts.b.site,
		domainName: '',
		observerLifetime: 15 * 60 * 1000, // 15 minutes
		opener: null,
		storedData: {},
		spawns: {},

		initialize: function()
		{
			this.domainName = this.extractDomainName(location.host);
			this.opener = window.opener && window.opener.top || window.opener;

			if (window.addEventListener)
			{
				this.storedData = JSON.parse(localStorage.getItem('__sfCheckoutObserverData')) || {};

				window.addEventListener("message", this.openerMessagesRouter.bind(this), false);

				if (this.opener) // A spawned window
				{
					this.spawnObserveCheckout();
				}
				else
				{
					this.isCheckoutPage();
				}
			}
		},

		spawnObserveCheckout: function()
		{
			if (this.isObserverTimestampValid(this.storedData.timestamp))
			{
				this.isCheckoutPage();
			}
			else // more than 15 minutes passed
			{
				localStorage.removeItem('__sfCheckoutObserverData'); // Remove the old checkout stored data

				this.attemptHandshakeWithTheOpener();
			}
		},

		isCheckoutPage: function()
		{
			if (!this.storedData.complete && this.isObserverTimestampValid(this.storedData.timestamp) && location.href.search(/checkout|shipping\saddress/i) !== -1)
			{
				this.completeCheckoutCycle();
			}
		},

		attemptHandshakeWithTheOpener: function()
		{
			var windowId = self.window.name || '__sfWindow_'+new Date().getTime();

			self.window.name = windowId;

			this.sendMessageToWindow(this.opener, 'handshakeFromSpawnedWindow',
			{
				windowId: windowId,
				domainName: this.domainName
			}); // Attempt handshake with opener
		},

		handshakeFromSpawnedWindow: function(data, event) // Called by the spawned window on the opener
		{
			var spawnWindowId = data.windowId;
			var spawnDomain = data.domainName;

			if (spawnWindowId && !this.spawns[spawnWindowId])
			{
				this.spawns[spawnWindowId] = spawnDomain;
			}

			if (!spawnWindowId || this.spawns[spawnWindowId] == spawnDomain)
			{
				this.sendMessageToWindow(event.source, 'returnedHandshakeFromOpener',
				{
					userId: similarproducts.b.userid,
					sessionId: spsupport.p.initialSess
				}); // Politely return gesture (and user id) to the spawned window
			}
		},

		returnedHandshakeFromOpener: function(data) // Invoked by the opener on the spawned window. The handshake was successful
		{
			var dataToStore =
			{
				timestamp: new Date().getTime(), // Set the observer timestamp
				userId: data.userId, // Save the user id received from the opener
				sessionId: data.sessionId // Save the session id received from the opener
			};

			localStorage.setItem('__sfCheckoutObserverData', JSON.stringify(dataToStore));
			this.storedData = dataToStore;

			this.spawnObserveCheckout();
		},


		completeCheckoutCycle: function()
		{
			var sb = similarproducts && similarproducts.b || {};
			var pixel = new Image();

			pixel.src =
			[
				this.appDomain,
				'trackSession.action?action=checkout',
				"&dlsource=", sb.dlsource,
				"&version=", sb.appVersion,
				"&userid=", this.storedData.userId,
				"&sessionid=", this.storedData.sessionId,
				"&page_url=", encodeURIComponent(document.location.href)
			].join('');

			this.storedData.complete = true;

			localStorage.setItem('__sfCheckoutObserverData', JSON.stringify(this.storedData));
		},

		extractDomainName: function(url)
		{
			var slicedUrl = url.toLowerCase().split('.');
	        var length = slicedUrl.length;
	        var tldRegex = /^(com|net|info|org|gov|co)$/;

	        if (length > 2)
	        {
	            if (tldRegex.test(slicedUrl[length-2]))
	            {
	                slicedUrl.splice(0, length-3);
	            }
	            else
	            {
	                slicedUrl.splice(0, length-2);
	            }
	        }

	        return slicedUrl.join('.');
		},

		isObserverTimestampValid: function(timestamp)
		{
			return timestamp && (timestamp + this.observerLifetime > new Date().getTime()) || false;
		},

		openerMessagesRouter: function(event)
		{
			var data = event.data.split('__similarproductsCheckoutNamespaceMarker')[1];

			data = data && JSON.parse(data) || null;

            if (data && typeof this[data.fn] === 'function')
            {
                this[data.fn](data.data, event);
            }
		},

		sendMessageToWindow: function(wnd, fn, data)
		{
			var message =
            {
                fn: fn,
                data: data
            };

            wnd && wnd.postMessage('__similarproductsCheckoutNamespaceMarker'+JSON.stringify(message), '*');
		}
	};

	CheckoutObserver.initialize();
})();