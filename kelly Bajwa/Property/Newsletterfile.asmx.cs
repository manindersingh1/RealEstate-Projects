using Property.Models;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Security;
using System.Web.Services;
using System.Web.SessionState;
namespace Property
{
    /// <summary>
    /// Summary description for Newsletterfile
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Newsletterfile : System.Web.Services.WebService
    {

        

        [System.Web.Services.WebMethod]
        [ScriptMethod(UseHttpGet = false)]
        public string FirstNewsLetterPrint(string NewsletterType, string FirstContent, string SecondContent, string ThirldContent)
        {
            string html = "";
            string Template = "";

            if (NewsletterType == "first")
            {
                Template = "PrintHtmlFiles/FirstNewsletter.html";
            }


            using (StreamReader reader = new StreamReader(Path.Combine(HttpRuntime.AppDomainAppPath, Template)))
            {

                html = reader.ReadToEnd();

                html = html.Replace("{FirstContent}", FirstContent);
                html = html.Replace("{SecondContent}", SecondContent);
                html = html.Replace("{ThirdContent}", ThirldContent);
                
            }

            return html;
        }

       
    }
}
