using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using rpl_registrations.Models;

namespace RplWebsite.Controllers
{
    public class RegistrationController : Controller
    {
        SqlConnection con = new SqlConnection("Data Source=74.208.69.145;Initial Catalog=Rpl_Only4agents;User ID=sa;Password=!nd!@123");
        string qry = "";
        public ActionResult Index()
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            return View();
        }

        public ActionResult home()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Users()
        {
            qry = "";
            qry = "select * from Users";
            var users = GetdataTable(qry);


            List<PersonModel> modelList = new List<PersonModel>();
            foreach (DataRow row in users.Rows)
            {
                PersonModel model = new PersonModel();
                model.UserId = Convert.ToInt32(row["UserId"]);
                model.FirstName = row["FirstName"].ToString();
                model.LastName = row["LastName"].ToString();
                model.Email = row["Email"].ToString();
                model.PhoneNo = row["PhoneNo"].ToString();
                model.Brokerage = row["Brokerage"].ToString();
                model.Kids = Convert.ToInt32(row["Kids"]);
                model.Adults = Convert.ToInt32(row["Adult"]);
                model.TotalAdults = Convert.ToInt32(users.Compute("Sum(Adult)", ""));
                model.TotalKids = Convert.ToInt32(users.Compute("Sum(Kids)", ""));

                modelList.Add(model);
            }

            return View(modelList.OrderByDescending(c => c.UserId));
        }

        [HttpPost]
        public ActionResult sendmail(PersonModel person)
        {
            System.Threading.Thread.Sleep(2000);  /*simulating slow connection*/

            /*Do something with object person*/
            if (person != null)
            {
                qry = "";
                qry = "select * from Users";
                var users = GetdataTable(qry);

                var foundRows = users.AsEnumerable().Any(row => person.Email.ToString() == row.Field<String>("Email")); ;
                if (foundRows)
                {
                    return Json(new { msg = "Email is already exist. " });
                }

                foundRows = users.AsEnumerable().Any(row => person.PhoneNo == row.Field<String>("PhoneNo")); ;

                if (foundRows)
                {
                    return Json(new { msg = "Phone No is already exist." });
                }


                if (users.Rows.Count > 0)
                {
                    person.TotalKids = Convert.ToInt32(users.Compute("Sum(Kids)", ""));
                    person.TotalAdults = Convert.ToInt32(users.Compute("Sum(Adult)", ""));
                }


                qry = "";
                qry = "INSERT INTO [dbo].[Users]([FirstName],[LastName],[Email],[PhoneNo],[Brokerage],[Adult],[Kids],[Message])";

                qry += " VALUES ('" + person.FirstName + "','" + person.LastName + "','" + person.Email + "','" + person.PhoneNo + "','" + person.Brokerage + "'," + person.Adults + "," + person.Kids + ",'')";

                var message = ExecuteNonQuery(qry);
                if (message == "success")
                {
                    SendEmail(person);
                    person.AdminEmail = "only4agentss@gmail.com";
                    SendEmail(person);
                    return Json(new { msg = "Successfully Registered.Please check your email." });
                }
                else
                {
                    return Json(new { msg = "Error " });
                }

            }
            else
            {
                return Json(new { msg = "model empty " });
            }

            return Json(new { msg = "Successfully Registered.Please check your email." });
        }


        [HttpPost]
        public ActionResult ClosingCermony(PersonModel person)
        {
            System.Threading.Thread.Sleep(2000);  /*simulating slow connection*/

            /*Do something with object person*/
            if (person != null)
            {
                qry = "";
                qry = "select * from ClosingCermonyUsers";
                var users = GetdataTable(qry);

                var foundRows = users.AsEnumerable().Any(row => person.Email.ToString() == row.Field<String>("Email")); ;
                if (foundRows)
                {
                    return Json(new { msg = "Email is already exist. " });
                }

                foundRows = users.AsEnumerable().Any(row => person.PhoneNo == row.Field<String>("PhoneNo")); ;

                if (foundRows)
                {
                    return Json(new { msg = "Phone No is already exist." });
                }


                if (users.Rows.Count > 0)
                {
                    person.TotalKids = Convert.ToInt32(users.Compute("Sum(Kids)", ""));
                    person.TotalAdults = Convert.ToInt32(users.Compute("Sum(Adult)", ""));
                }


                qry = "";
                qry = "INSERT INTO [dbo].[ClosingCermonyUsers]([FirstName],[LastName],[Email],[PhoneNo],[Brokerage],[Adult],[Kids],[Message])";

                qry += " VALUES ('" + person.FirstName + "','" + person.LastName + "','" + person.Email + "','" + person.PhoneNo + "','" + person.Brokerage + "'," + person.Adults + "," + person.Kids + ",'')";

                var message = ExecuteNonQuery(qry);
                if (message == "success")
                {
                    SendEmail(person);
                    person.AdminEmail = "only4agentss@gmail.com";
                    SendEmail(person);
                    return Json(new { msg = "Successfully Registered.Please check your email." });
                }
                else
                {
                    return Json(new { msg = "Error " });
                }

            }
            else
            {
                return Json(new { msg = "model empty " });
            }

            return Json(new { msg = "Successfully Registered.Please check your email." });
        }
        public ActionResult ClosingCermony()
        {
            qry = "";
            qry = "select * from ClosingCermonyUsers";
            var users = GetdataTable(qry);


            List<PersonModel> modelList = new List<PersonModel>();
            foreach (DataRow row in users.Rows)
            {
                PersonModel model = new PersonModel();
                model.UserId = Convert.ToInt32(row["UserId"]);
                model.FirstName = row["FirstName"].ToString();
                model.LastName = row["LastName"].ToString();
                model.Email = row["Email"].ToString();
                model.PhoneNo = row["PhoneNo"].ToString();
                model.Brokerage = row["Brokerage"].ToString();
                model.Kids = Convert.ToInt32(row["Kids"]);
                model.Adults = Convert.ToInt32(row["Adult"]);
                model.TotalAdults = Convert.ToInt32(users.Compute("Sum(Adult)", ""));
                model.TotalKids = Convert.ToInt32(users.Compute("Sum(Kids)", ""));

                modelList.Add(model);
            }

            return View(modelList.OrderByDescending(c => c.UserId));
        }

        public ActionResult DeleteUser(int Id)
        {

            if (Id != null || Id != 0)
            {
                qry = "";
                qry = "delete from users where Userid=" + Id;
                var status = ExecuteNonQuery(qry);
                if (status == "success")
                {
                    return RedirectToAction("Users");

                }
                else
                {
                    return Json(new { msg = "Error", JsonRequestBehavior.AllowGet });
                }
            }
            else
            {
                return Json(new { msg = "User id not found.", JsonRequestBehavior.AllowGet });
            }

        }
        public string SendEmail(PersonModel model)
        {
            var subject = "";
            subject = "RPL Ticket Pass.";
            string Status = "";
            string EmailId = model.Email;
            if (model.AdminEmail == "only4agentss@gmail.com")
            {
                EmailId = model.AdminEmail;
                subject = "New Client registration";
            }
            else if (model.EmailType == "sponser")
            {
                EmailId = "only4agentss@gmail.com";
                subject = "New Client registration";
            }
            else if (model.EmailType == "realtor")
            {
                EmailId = "only4agentss@gmail.com";
                subject = "New Client registration";
            }

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

            if (model.EmailType == "sponser")
            {
                msgbody += "<b>Name</b>    : " + model.FirstName + " " + model.LastName + "<br>";
                msgbody += "<b>Email</b>   : " + model.Email + "<br>";
                msgbody += "<b>Phone No</b>: " + model.PhoneNo + "<br>";
                msgbody += "<b>Type Of Business</b> : " + model.TypeOfBussiness + "<br>";
                msgbody += "<b>Intrested In</b>: " + model.IntrestedIn + "<br>";

            }
            else if (model.EmailType == "realtor")
            {
                msgbody += "<b>Name</b>    : " + model.FirstName + " " + model.LastName + "<br>";
                msgbody += "<b>Email</b>   : " + model.Email + "<br>";
                msgbody += "<b>Phone No</b>: " + model.PhoneNo + "<br>";
                msgbody += "<b>Brokerage</b> : " + model.Brokerage + "<br>";
                msgbody += "<b>Remarks</b>: " + model.Remarks + "<br>";
            }
            else
            {
                msgbody = GetTemplate(model);

            }


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
        public ActionResult RealtorForm()
        {

            return View();
        }

        public ActionResult SponserForm()
        {

            return View();
        }


        [HttpPost]
        public ActionResult Sponser(PersonModel person)
        {
            System.Threading.Thread.Sleep(2000);  /*simulating slow connection*/

            /*Do something with object person*/
            if (person != null)
            {
                SendEmail(person);
                return Json(new { msg = "Successfully send email.Please check your email." });

            }
            else
            {
                return Json(new { msg = "model empty " });
            }


        }

        [HttpPost]
        public ActionResult Realtor(PersonModel person)
        {
            System.Threading.Thread.Sleep(2000);  /*simulating slow connection*/

            /*Do something with object person*/
            if (person != null)
            {
                SendEmail(person);
                return Json(new { msg = "Successfully send email.Please check your email." });
            }
            else
            {
                return Json(new { msg = "model empty " });
            }
        }
        public string GetTemplate(PersonModel model)
        {

            string msgbody = "";
            using (StreamReader reader = new StreamReader(@"C:\Sites\Paramsites\RplWebsite\RplWebsite\Template\index.html"))
            {
                msgbody = reader.ReadToEnd();
                msgbody = msgbody.Replace("{username}", model.FirstName + " " + model.LastName);
                msgbody = msgbody.Replace("{brokerage}", model.Brokerage);
                msgbody = msgbody.Replace("{kids}", model.Kids.ToString());
                msgbody = msgbody.Replace("{adults}", model.Adults.ToString());

                if (model.AdminEmail == "only4agentss@gmail.com")
                {
                    msgbody = msgbody.Replace("{total}", "<div><p style='float:left; font-family:Arial, Helvetica, sans-serif; font - size:15px; margin: 16px 5px 0 0; padding: 0 8px; color:#4f4d4d;'>Total Adults and Kids</p> <h2 style='float:left; font-family:Arial, Helvetica, sans - serif; font - size:20px; color:#12268f; margin:0px; padding:12px;'>" + model.TotalAdults + " " + model.TotalKids + " </h2>  </div>");
                }
                else
                {
                    msgbody = msgbody.Replace("{total}", "");
                }

            }
            return msgbody;
        }
        public DataTable GetdataTable(string qry)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter NewsLetter_Adp = new SqlDataAdapter(qry, con);
            NewsLetter_Adp.Fill(dt);

            return dt;

        }

        public string ExecuteNonQuery(string QStr)
        {
            string ErrorMessage = "";
            SqlCommand cmd = null;
            try
            {

                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                con.Open();
                cmd = new SqlCommand(QStr, con);
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                con.Close();

                ErrorMessage = "success";
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("The DELETE statement conflicted with the REFERENCE constraint"))
                {
                    ErrorMessage = "FK";
                }
            }
            finally
            {
                if (cmd != null)
                {
                    cmd.Dispose();
                }
                if (con != null)
                {
                    con.Close();
                }

            }

            return ErrorMessage;
        }

    }
}
