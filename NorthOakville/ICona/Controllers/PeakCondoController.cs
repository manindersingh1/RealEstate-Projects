using Amit_Khurana.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;

namespace ICona.Controllers
{
    public class PeakCondoController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            return View();
        }


        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Location()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Neighbourhood()
        {
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult sendmail(PersonModel person)
        {
            System.Threading.Thread.Sleep(2000);  /*simulating slow connection*/

            /*Do something with object person*/
            if (person != null)
            {
                SendEmail(person);
            }
            else
            {
                return Json(new { msg = "model empty " });
            }

            return Json(new { msg = "Successfully added " + person.Name });
        }

        public string SendEmail(PersonModel model)
        {
            var subject = "";
            if (model.subject != null)
            {
                subject = model.subject;
            }
            else
            {
                subject = "New Client Appointment";
            }


            string Status = "";
            //string EmailId = "only4agentss@gmail.com";

            //Send mail
            MailMessage mail = new MailMessage();

            string FromEmailID = WebConfigurationManager.AppSettings["RegFromMailAddress"];
            string FromEmailPassword = WebConfigurationManager.AppSettings["FromEmailPassword"];
            string ToEmailID = WebConfigurationManager.AppSettings["ToEmailID"];
            
            SmtpClient smtpClient = new SmtpClient(ConfigurationManager.AppSettings["SmtpServer"]);
            int _Port = Convert.ToInt32(WebConfigurationManager.AppSettings["Port"].ToString());
            Boolean _UseDefaultCredentials = Convert.ToBoolean(WebConfigurationManager.AppSettings["UseDefaultCredentials"].ToString());
            Boolean _EnableSsl = Convert.ToBoolean(WebConfigurationManager.AppSettings["EnableSsl"].ToString());
            mail.To.Add(new MailAddress(ToEmailID));
            mail.From = new MailAddress(FromEmailID);
            mail.Subject = subject;

            string msgbody = "";
            msgbody = "<p>Person Name : " + model.Name + "</p>";
            msgbody = msgbody + "<p>Email ID : " + model.email + "</p>";
            msgbody = msgbody + "<p>Phone Number : " + model.Phone + "</p>";
            msgbody = msgbody + "<p>Realtor : " + model.IsRealtor + "</p>";

            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            System.Net.Mail.AlternateView plainView = System.Net.Mail.AlternateView.CreateAlternateViewFromString(System.Text.RegularExpressions.Regex.Replace(msgbody, @"<(.|\n)*?>", string.Empty), null, "text/plain");
            System.Net.Mail.AlternateView htmlView = System.Net.Mail.AlternateView.CreateAlternateViewFromString(msgbody, null, "text/html");

            mail.AlternateViews.Add(plainView);
            mail.AlternateViews.Add(htmlView);
            // mail.Body = msgbody;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Host = "smtp.gmail.com"; //_Host;
            smtp.Port = _Port;
            //smtp.UseDefaultCredentials = _UseDefaultCredentials;
            smtp.Credentials = new System.Net.NetworkCredential(FromEmailID, FromEmailPassword);// Enter senders User name and password
            smtp.EnableSsl = _EnableSsl;
            smtp.Send(mail);

            return Status;
        }



        public ActionResult UploadMultiFileAndData()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        [HttpPost]
        public ActionResult Upload(HttpPostedFileBase file)
        {
            string status = "";
            if (Request.Files.Count > 0)
            {
                foreach (string File in Request.Files)
                {
                    var _file = Request.Files[File];
                }
                var data = Request["Name"];
                var data1 = Request["Address"];
                var data2 = Request["Phone"];
            }

            return View("index");
        }
    }
}
