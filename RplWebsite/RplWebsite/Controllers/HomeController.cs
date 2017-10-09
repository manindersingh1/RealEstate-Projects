using rpl_registrations.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;

namespace RplWebsite.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult index()
        {
            
            return View();
        }

        public ActionResult gallery4()
        {

            return View();
        }
        public ActionResult gallery5()
        {

            return View();
        }
        
        public ActionResult about_us()
        {
            
            return View();
        }

        public ActionResult contact_us()
        {
            
            return View();
        }
        public ActionResult gallery2()
        {
            
            return View();
        }
        public ActionResult gallery3()
        {
            
            return View();
        }
        public ActionResult main_gallery()
        {           
            return View();
        }
        public ActionResult match_result()
        {   
            return View();
        }
        public ActionResult match_scedule()
        {
            
            return View();
        }
        public ActionResult opening_gallery()
        {
            
            return View();
        }
        public ActionResult points_table()
        {
            
            return View();
        }
        public ActionResult team1()
        {
           
            return View();
        }
        public ActionResult team2()
        {
            
            return View();
        }
        public ActionResult team3()
        {
            
            return View();
        }
            public ActionResult team4()
        {
            
            return View();
        }
        public ActionResult team5()
        {
           
            return View();
        }
        public ActionResult team6()
        {
            
            return View();
        }
          public ActionResult team7()
        {
           
            return View();
        }
          public ActionResult team8()
        {
            

            return View();
        }
          public ActionResult team9()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }




          [HttpPost]
          public ActionResult ContactUs(PersonModel person)
          {
              System.Threading.Thread.Sleep(2000);  /*simulating slow connection*/

              /*Do something with object person*/
              if (person != null)
              {
                 var status= SendEmail(person);
                  if(status=="success")
                  {
                      return Json(new { msg = "Successfully send email.Please check your email." });
                  }
                  else
                  {
                      return Json(new { msg = "unable to send email." });
                  }
                  

              }
              else
              {
                  return Json(new { msg = "model empty " });
              }


          }
          public string SendEmail(PersonModel model)
          {
              var subject = "Client contact mail.";
              var EmailId = "Only4agentss@gmail.com";
              var Status = "";
              try
              {
                  //Send mail
                  MailMessage mail = new MailMessage();
                  string FromEmailID = WebConfigurationManager.AppSettings["FromEmailID"];
                  string FromEmailPassword = WebConfigurationManager.AppSettings["FromEmailPassword"];
                  SmtpClient smtpClient = new SmtpClient(ConfigurationManager.AppSettings["SmtpServer"]);
                  int _Port = Convert.ToInt32(WebConfigurationManager.AppSettings["Port"].ToString());
                  Boolean _UseDefaultCredentials = Convert.ToBoolean(WebConfigurationManager.AppSettings["UseDefaultCredentials"].ToString());
                  Boolean _EnableSsl = Convert.ToBoolean(WebConfigurationManager.AppSettings["EnableSsl"].ToString());
                  mail.To.Add(new MailAddress(EmailId));
                  mail.From = new MailAddress(FromEmailID);
                  mail.Subject = subject;

                  string msgbody = "";
                  msgbody += "<b>Name</b>    : " + model.FirstName + "<br>";
                  msgbody += "<b>Email</b>   : " + model.Email + "<br>";
                  msgbody += "<b>Phone No</b>: " + model.PhoneNo + "<br>";
                  msgbody += "<b>Comments</b> : " + model.Remarks + "<br>";
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
                  Status = "success";
              }
              catch
              {
                  Status = "fail";
              }

              return Status;
          }

        }
    }

