using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Property
{
    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
        }
        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown
        }
        void Application_Error(object sender, EventArgs e)
       
        {
            // Code that runs when an unhandled error occurs
           Exception exception = Server.GetLastError();
           Response.Clear();
           HttpException httpException = exception as HttpException;
           if (httpException != null)
           {
               string action;
               switch (httpException.GetHttpCode())
               {
                   case 404:
                       // page not found
                       Server.ClearError();
                       Response.Redirect("~/error_404.aspx", false);
                       break;
                   case 500:
                       Server.ClearError();
                       // server error
                       Response.Redirect("~/error_500.aspx", false);
                       break;

                   default:
                       Server.ClearError();
                       Response.Redirect("~/error_403.aspx", false);
                       break;
               }
               // clear error on server
               //  Server.ClearError();

               //  Response.Redirect(String.Format("/", action, exception.Message));
               //   Response.Redirect(String.Format("~/error_403.aspx"));
           }
           else
           {
               // clear error on server
               Server.ClearError();

               //Response.Redirect(String.Format("~/ErrorView/{0}/?message={1}", action, exception.Message));
               Response.Redirect("~/error_404.aspx", false);
           }
        }
        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started
        }
        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }

    }
}
