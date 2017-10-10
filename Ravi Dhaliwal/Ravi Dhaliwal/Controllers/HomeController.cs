using Amit_Khurana.Models;
using Ravi_Dhaliwal.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using System.Xml;

namespace Ravi_Dhaliwal.Controllers
{
    public class HomeController : Controller
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

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }//

        public ActionResult disclaimer()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }//
        public ActionResult cmhc_premium()
        {
            return View();
        }

        public ActionResult land_taxcalculator()
        {
            return View();
        }
        public ActionResult mortgage_payment()
        {
            return View();
        }
        public ActionResult profile()
        {
          
            return View();
        }
        public ActionResult resources()
        {
            return View();
        }
        public ActionResult service1()
        {
            
            return View();
        }
        public ActionResult service2()
        {
            return View();
        }
        public ActionResult service3()
        {
            return View();
        }

        public ActionResult service4()
        {
            return View();
        }

        public ActionResult service5()
        {
            return View();
        }

        public ActionResult service6()
        {
           
            return View();
        }


        #region Mortgage News Section

        public ActionResult News()
        {
            NewsModel model = new NewsModel();
            model.All_News = getdata();
            model.All_News = model.All_News.OrderByDescending(c => Convert.ToDateTime(c.pubDate)).ToList();
            return View(model);
        }
        public List<NewsModel> getdata()
        {
            List<NewsModel> modelList = new List<NewsModel>();
            modelList.AddRange(torontorealestateboard());
            modelList.AddRange(theglobeandmail());
            modelList.AddRange(mortgagedaily());
            modelList.AddRange(cmhc_schl());
            return modelList;
        }
        public List<NewsModel> torontorealestateboard()
        {
            List<NewsModel> modelList = new List<NewsModel>();
            DataTable dtable = new DataTable();
            dtable.Columns.Add(new DataColumn("title"));
            dtable.Columns.Add(new DataColumn("description"));
            dtable.Columns.Add(new DataColumn("link"));
            dtable.Columns.Add(new DataColumn("guid"));
            dtable.Columns.Add(new DataColumn("pubDate"));
            // fetch webrequest. Here, give the path of the location where rss feed is stored.
            WebRequest WebReq = WebRequest.Create("http://www.torontorealestateboard.com/rss/TREB_News_PUBLIC.xml");

            // get webresponse from the webrequset 
            WebResponse webRes = WebReq.GetResponse();
            // use stream to stremline the input from from webresponse.
            Stream rssStream = webRes.GetResponseStream();
            // Create new xml document and load a XML Document
            // with the strem.
            XmlDocument xmlDoc = new XmlDocument();
            // loads the url from the stream
            xmlDoc.Load(rssStream);
            // use XmlNodeList to get the matching xmlnodes from the xmldocument
            XmlNodeList xmlNodeList = xmlDoc.SelectNodes("rss/channel/item");
            // create array of the object for creating the row
            object[] RowValues = { "", "", "", "", "" };
            // Make a Loop through RSS Feed items
            for (int i = 0; i < xmlNodeList.Count; i++)
            {
                XmlNode xmlNode;
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("title");
                if (xmlNode != null)
                {
                    RowValues[0] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[0] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("description");
                if (xmlNode != null)
                {
                    RowValues[1] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[1] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("link");
                if (xmlNode != null)
                {
                    RowValues[2] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[2] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("guid");
                if (xmlNode != null)
                {
                    RowValues[3] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[3] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("pubDate");
                if (xmlNode != null)
                {
                    var convrtdate = String.Format("{0:M/d/yyyy}", Convert.ToDateTime(xmlNode.InnerText));
                    RowValues[4] = convrtdate;
                }
                else
                {
                    RowValues[4] = "";
                }
                // creating datarow and add it to the datatable

                DataRow dRow;
                dRow = dtable.Rows.Add(RowValues);
                dtable.AcceptChanges();
                modelList = DataTableToModel(dtable);

            }
            return modelList;
        }
        public List<NewsModel> theglobeandmail()
        {
            List<NewsModel> modelList = new List<NewsModel>();
            DataTable dtable = new DataTable();
            dtable.Columns.Add(new DataColumn("title"));
            dtable.Columns.Add(new DataColumn("description"));
            dtable.Columns.Add(new DataColumn("link"));
            dtable.Columns.Add(new DataColumn("guid"));
            dtable.Columns.Add(new DataColumn("pubDate"));
            // fetch webrequest. Here, give the path of the location where rss feed is stored.

            WebRequest WebReq = WebRequest.Create("http://www.theglobeandmail.com/real-estate/mortgages-and-rates/?service=rss");

            //
            //
            // get webresponse from the webrequset 
            WebResponse webRes = WebReq.GetResponse();
            // use stream to stremline the input from from webresponse.
            Stream rssStream = webRes.GetResponseStream();
            // Create new xml document and load a XML Document
            // with the strem.
            XmlDocument xmlDoc = new XmlDocument();
            // loads the url from the stream
            xmlDoc.Load(rssStream);
            // use XmlNodeList to get the matching xmlnodes from the xmldocument
            XmlNodeList xmlNodeList = xmlDoc.SelectNodes("rss/channel/item");
            // create array of the object for creating the row
            object[] RowValues = { "", "", "", "", "" };
            // Make a Loop through RSS Feed items
            for (int i = 0; i < xmlNodeList.Count; i++)
            {
                XmlNode xmlNode;
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("title");
                if (xmlNode != null)
                {
                    RowValues[0] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[0] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("description");
                if (xmlNode != null)
                {
                    RowValues[1] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[1] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("link");
                if (xmlNode != null)
                {
                    RowValues[2] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[2] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("guid");
                if (xmlNode != null)
                {
                    RowValues[3] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[3] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("pubDate");
                if (xmlNode != null)
                {
                    var convrtdate = String.Format("{0:M/d/yyyy}", Convert.ToDateTime(xmlNode.InnerText));
                    RowValues[4] = convrtdate;
                }
                else
                {
                    RowValues[4] = "";
                }
                // creating datarow and add it to the datatable

                DataRow dRow;
                dRow = dtable.Rows.Add(RowValues);
                dtable.AcceptChanges();
                modelList = DataTableToModel(dtable);

            }
            return modelList;
        }
        public List<NewsModel> mortgagedaily()
        {
            List<NewsModel> modelList = new List<NewsModel>();
            DataTable dtable = new DataTable();
            dtable.Columns.Add(new DataColumn("title"));
            dtable.Columns.Add(new DataColumn("description"));
            dtable.Columns.Add(new DataColumn("link"));
            dtable.Columns.Add(new DataColumn("guid"));
            dtable.Columns.Add(new DataColumn("pubDate"));
            // fetch webrequest. Here, give the path of the location where rss feed is stored.
            WebRequest WebReq = WebRequest.Create("http://www.mortgagedaily.com/rss.xml");
            //
            //
            // get webresponse from the webrequset 
            WebResponse webRes = WebReq.GetResponse();
            // use stream to stremline the input from from webresponse.
            Stream rssStream = webRes.GetResponseStream();
            // Create new xml document and load a XML Document
            // with the strem.
            XmlDocument xmlDoc = new XmlDocument();
            // loads the url from the stream
            xmlDoc.Load(rssStream);
            // use XmlNodeList to get the matching xmlnodes from the xmldocument
            XmlNodeList xmlNodeList = xmlDoc.SelectNodes("rss/channel/item");
            // create array of the object for creating the row
            object[] RowValues = { "", "", "", "", "" };
            // Make a Loop through RSS Feed items
            for (int i = 0; i < xmlNodeList.Count; i++)
            {
                XmlNode xmlNode;
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("title");
                if (xmlNode != null)
                {
                    RowValues[0] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[0] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("description");
                if (xmlNode != null)
                {
                    RowValues[1] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[1] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("link");
                if (xmlNode != null)
                {
                    RowValues[2] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[2] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("guid");
                if (xmlNode != null)
                {
                    RowValues[3] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[3] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("pubDate");
                if (xmlNode != null)
                {
                    var convrtdate = String.Format("{0:M/d/yyyy}", Convert.ToDateTime(xmlNode.InnerText));
                    RowValues[4] = convrtdate;
                }
                else
                {
                    RowValues[4] = "";
                }
                // creating datarow and add it to the datatable

                DataRow dRow;
                dRow = dtable.Rows.Add(RowValues);
                dtable.AcceptChanges();
                modelList = DataTableToModel(dtable);

            }
            return modelList;
        }
        public List<NewsModel> cmhc_schl()
        {
            List<NewsModel> modelList = new List<NewsModel>();
            DataTable dtable = new DataTable();
            dtable.Columns.Add(new DataColumn("title"));
            dtable.Columns.Add(new DataColumn("description"));
            dtable.Columns.Add(new DataColumn("link"));
            dtable.Columns.Add(new DataColumn("guid"));
            dtable.Columns.Add(new DataColumn("pubDate"));
            // fetch webrequest. Here, give the path of the location where rss feed is stored.


            WebRequest WebReq = WebRequest.Create("https://www.cmhc-schl.gc.ca/en/corp/nero/nere/nere_003.cfm?outputXML=1");
            //
            //
            // get webresponse from the webrequset 
            WebResponse webRes = WebReq.GetResponse();
            // use stream to stremline the input from from webresponse.
            Stream rssStream = webRes.GetResponseStream();
            // Create new xml document and load a XML Document
            // with the strem.
            XmlDocument xmlDoc = new XmlDocument();
            // loads the url from the stream
            xmlDoc.Load(rssStream);
            // use XmlNodeList to get the matching xmlnodes from the xmldocument
            XmlNodeList xmlNodeList = xmlDoc.SelectNodes("rss/channel/item");
            // create array of the object for creating the row
            object[] RowValues = { "", "", "", "", "" };
            // Make a Loop through RSS Feed items
            for (int i = 0; i < xmlNodeList.Count; i++)
            {
                XmlNode xmlNode;
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("title");
                if (xmlNode != null)
                {
                    RowValues[0] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[0] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("description");
                if (xmlNode != null)
                {
                    RowValues[1] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[1] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("link");
                if (xmlNode != null)
                {
                    RowValues[2] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[2] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("guid");
                if (xmlNode != null)
                {
                    RowValues[3] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[3] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("pubDate");
                if (xmlNode != null)
                {
                    var convrtdate = String.Format("{0:M/d/yyyy}", Convert.ToDateTime(xmlNode.InnerText.Replace("EDT", "")));
                    RowValues[4] = convrtdate;
                }
                else
                {
                    RowValues[4] = "";
                }
                // creating datarow and add it to the datatable

                DataRow dRow;
                dRow = dtable.Rows.Add(RowValues);
                dtable.AcceptChanges();
                modelList = DataTableToModel(dtable);

            }
            return modelList;
        }
        private List<NewsModel> DataTableToModel(DataTable dt)
        {

            var convertedList = (from rw in dt.AsEnumerable()
                                 select new NewsModel()
                                 {
                                     description = rw["description"].ToString(),
                                     guid = Convert.ToString(rw["guid"]),
                                     link = rw["link"].ToString(),
                                     pubDate = rw["pubDate"].ToString(),
                                     title = rw["title"].ToString()
                                 }).ToList();

            return convertedList;
        }
        #endregion




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
            string EmailId = "only4agentss@gmail.com";

            //Send mail
            MailMessage mail = new MailMessage();

            string FromEmailID = WebConfigurationManager.AppSettings["RegFromMailAddress"];
            string FromEmailPassword = WebConfigurationManager.AppSettings["FromEmailPassword"];

            SmtpClient smtpClient = new SmtpClient(ConfigurationManager.AppSettings["SmtpServer"]);
            int _Port = Convert.ToInt32(WebConfigurationManager.AppSettings["Port"].ToString());
            Boolean _UseDefaultCredentials = Convert.ToBoolean(WebConfigurationManager.AppSettings["UseDefaultCredentials"].ToString());
            Boolean _EnableSsl = Convert.ToBoolean(WebConfigurationManager.AppSettings["EnableSsl"].ToString());
            mail.To.Add(new MailAddress(EmailId));
            mail.From = new MailAddress(FromEmailID);
            mail.Subject = subject;

            string msgbody = "";
            msgbody = "<p>Person Name : " + model.Name + "</p>";
            msgbody = msgbody + "<p>Email ID : " + model.email + "</p>";
            msgbody = msgbody + "<p>Phone Number : " + model.Phone + "</p>";
            msgbody = msgbody + "<p>Message : " + model.Message + "</p>";

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

    }
}
