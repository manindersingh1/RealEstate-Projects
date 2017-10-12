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
            else if (NewsletterType == "second")
            {
                Template = "PrintHtmlFiles/SecondNewsLetter.html";
            }
            else if (NewsletterType == "thirld")
            {
                Template = "PrintHtmlFiles/ThirldNewsLetter.html";
            }
            else if (NewsletterType == "fourth")
            {
                Template = "PrintHtmlFiles/FourthNewsLetter.html";
            }
            else if (NewsletterType == "fifth")
            {
                Template = "PrintHtmlFiles/FifthNewsLetter.html";
            }
            else if (NewsletterType == "six")
            {
                Template = "PrintHtmlFiles/SixNewsLetter.html";
            }
            else if (NewsletterType == "seven")
            {
                Template = "PrintHtmlFiles/SevenNewsLetter.html";
            }
            else if (NewsletterType == "eight")
            {
                Template = "PrintHtmlFiles/EighthNewsLetter.html";
            }
            else if (NewsletterType == "nine")
            {
                Template = "PrintHtmlFiles/NinthNewsLetter.html";
            }
            else if (NewsletterType == "ten")
            {
                Template = "PrintHtmlFiles/TenthNewsLetter.html";
            }
            else if (NewsletterType == "eleven")
            {
                Template = "PrintHtmlFiles/EleventhNewsLetter.html";
            }
            else if (NewsletterType == "twelve")
            {
                Template = "PrintHtmlFiles/TwelvethNewsLetter.html";
            }
            else if (NewsletterType == "thirteen")
            {
                Template = "PrintHtmlFiles/ThirteenthNewsLetter.html";
            }
            else if (NewsletterType == "fourteen")
            {
                Template = "PrintHtmlFiles/FourteenthNewsLetter.html";
            }
            else if (NewsletterType == "fifteen")
            {
                Template = "PrintHtmlFiles/FifteenthNewsLetter.html";
            }
            else if (NewsletterType == "sixteen")
            {
                Template = "PrintHtmlFiles/SixteenthNewsLetter.html";
            }
            else if (NewsletterType == "seventeen")
            {
                Template = "PrintHtmlFiles/SeventeenthNewsLetter.html";
            }
            else if (NewsletterType == "eightteen")
            {
                Template = "PrintHtmlFiles/EightteenthNewsLetter.html";
            }
            else if (NewsletterType == "ninteen")
            {
                Template = "PrintHtmlFiles/NinteenthNewsLetter.html";
            }
            else if (NewsletterType == "twenty")
            {
                Template = "PrintHtmlFiles/TwentiethNewsLetter.html";
            }
            else if (NewsletterType == "twentyone")
            {
                Template = "PrintHtmlFiles/TwentyOneNewsLetter.html";
            }


            using (StreamReader reader = new StreamReader(Path.Combine(HttpRuntime.AppDomainAppPath, Template)))
            {

                html = reader.ReadToEnd();
                if (NewsletterType == "first")
                {
                    html = html.Replace("{FirstContent}", FirstContent);
                    html = html.Replace("{SecondContent}", SecondContent);
                    html = html.Replace("{ThirdContent}", ThirldContent);
                }
            }

            return html;
        }

        [System.Web.Services.WebMethod]
        [ScriptMethod(UseHttpGet = false)]
        public string FirstPostCard(string FirstContent, string SecondContent, string ThirldContent)
        {
            string html = "";
            string Template = "";

            Template = "PrintHtmlFiles/FirstPostCard.html";

            using (StreamReader reader = new StreamReader(Path.Combine(HttpRuntime.AppDomainAppPath, Template)))
            {

                html = reader.ReadToEnd();

                html = html.Replace("{FirstContent}", FirstContent);
                html = html.Replace("{SecondContent}", SecondContent);
                html = html.Replace("{ThirdContent}", ThirldContent);

            }

            return html;
        }

        [System.Web.Services.WebMethod]
        [ScriptMethod(UseHttpGet = false)]
        public string SecondPostCard(string First_feature_cntnt, string Second_feature_cntnt, string Thirld_feature_cntnt, string Fourth_feature_cntnt)
        {
            string html = "";
            string Template = "";

            Template = "PrintHtmlFiles/Second_feature.html";

            using (StreamReader reader = new StreamReader(Path.Combine(HttpRuntime.AppDomainAppPath, Template)))
            {

                html = reader.ReadToEnd();

                html = html.Replace("{First_feature_cntnt}", First_feature_cntnt);
                html = html.Replace("{Second_feature_cntnt}", Second_feature_cntnt);
                html = html.Replace("{Thirld_feature_cntnt}", Thirld_feature_cntnt);
                html = html.Replace("{Fourth_feature_cntnt}", Fourth_feature_cntnt);

            }

            return html;
        }

        [System.Web.Services.WebMethod]
        [ScriptMethod(UseHttpGet = false)]
        public string ThirldPostCard(string First_feature_cntnt, string Second_feature_cntnt, string Thirld_feature_cntnt, string Fourth_feature_cntnt)
        {
            string html = "";
            string Template = "";

            Template = "PrintHtmlFiles/ThirldPostcard.html";

            using (StreamReader reader = new StreamReader(Path.Combine(HttpRuntime.AppDomainAppPath, Template)))
            {

                html = reader.ReadToEnd();

                html = html.Replace("{First_feature_cntnt}", First_feature_cntnt);
                html = html.Replace("{Second_feature_cntnt}", Second_feature_cntnt);
                html = html.Replace("{Thirld_feature_cntnt}", Thirld_feature_cntnt);
                html = html.Replace("{Fourth_feature_cntnt}", Fourth_feature_cntnt);

            }

            return html;
        }

        [System.Web.Services.WebMethod]
        [ScriptMethod(UseHttpGet = false)]
        public string FourthPostCard(string First_feature_cntnt, string Second_feature_cntnt, string Thirld_feature_cntnt, string Fourth_feature_cntnt, string Fifth_feature_cntnt, string Sixth_feature_cntnt, string Seventh_feature_cntnt, string Eighth_feature_cntnt, string Ninth_feature_cntnt, string Tenth_feature_cntnt, string Elaventh_feature_cntnt, string Twelevth_feature_cntnt, string Thirteenth_feature_cntnt, string Fourteenth_feature_cntnt)
        {
            string html = "";
            string Template = "";


            Template = "PrintHtmlFiles/Jst_sold.html";

            using (StreamReader reader = new StreamReader(Path.Combine(HttpRuntime.AppDomainAppPath, Template)))
            {

                html = reader.ReadToEnd();

                html = html.Replace("{First_feature_cntnt}", First_feature_cntnt);
                html = html.Replace("{Second_feature_cntnt}", Second_feature_cntnt);
                html = html.Replace("{Thirld_feature_cntnt}", Thirld_feature_cntnt);
                html = html.Replace("{Fourth_feature_cntnt}", Fourth_feature_cntnt);
                html = html.Replace("{Fifth_feature_cntnt}", First_feature_cntnt);
                html = html.Replace("{Sixth_feature_cntnt}", Second_feature_cntnt);
                html = html.Replace("{Seventh_feature_cntnt}", Thirld_feature_cntnt);
                html = html.Replace("{Eighth_feature_cntnt}", Fourth_feature_cntnt);
                html = html.Replace("{Ninth_feature_cntnt}", First_feature_cntnt);
                html = html.Replace("{Tenth_feature_cntnt}", Second_feature_cntnt);
                html = html.Replace("{Elaventh_feature_cntnt}", Thirld_feature_cntnt);
                html = html.Replace("{Twelevth_feature_cntnt}", Fourth_feature_cntnt);
                html = html.Replace("{Thirteenth_feature_cntnt}", Thirteenth_feature_cntnt);
                html = html.Replace("{Fourteenth_feature_cntnt}", Fourteenth_feature_cntnt);
            } 

            return html;
        }
    
    }
}
