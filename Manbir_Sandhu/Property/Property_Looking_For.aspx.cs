using Property_cls;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property
{
    public partial class Property_Looking_For : System.Web.UI.Page
    {
        cls_Property clsobj = new cls_Property();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                cls_Property clsp = new cls_Property();
                clsp.Insert_ContactUS(txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtPhoneno.Text, txtMessage.Text + "<br/>" + HttpContext.Current.Request.Url.AbsoluteUri);
                //int indextilldel = Request.Url.AbsoluteUri.IndexOf("Posting");
                string UserEmailId = ConfigurationManager.AppSettings["RegFromMailAddress"].ToString();
                DataTable dt = clsobj.GetSiteSettings();
                if (dt.Rows.Count > 0)
                {
                    string ToEmailId = Convert.ToString(dt.Rows[0]["Email"]);
                }
                //string ToEmailId = ConfigurationManager.AppSettings["ToEmailID"].ToString();
                SendMailToAdmin(UserEmailId);
                SendMailToUser(UserEmailId);

                txtFirstName.Text = "";
                txtLastName.Text = "";
                txtPhoneno.Text = "";
                txtEmail.Text = "";
                txtMessage.Text = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Congrts!", "alert('Your E-mail has been sent successfully - Thank You');", true);
                return;

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Failure", "alert('Your message failed to send, please try again.');", true);
                return;
                //If the message failed at some point, let the user know
                //lblResult.Text = "Your message failed to send, please try again.";
            }
        }
        public void SendMailToAdmin(string UserEmailId)
        {

            MailMessage mail = new MailMessage();
            DataTable dt1 = clsobj.GetSiteSettings();
            StringBuilder html = new StringBuilder();
            DataTable dt = new DataTable();
            DataTable dtimages = new DataTable();
            if (dt1.Rows.Count > 0)
            {
                //string ToEmailID = Convert.ToString(dt1.Rows[0]["Email"]);
                string ToEmailID = ConfigurationManager.AppSettings["ToEmailID"].ToString(); //From Email & To Email are same for admin
                //string ToEmailPassword = ConfigurationManager.AppSettings["ToEmailPassword"].ToString();
                string FromEmailID = ConfigurationManager.AppSettings["RegFromMailAddress"].ToString();
                string FromEmailPassword = ConfigurationManager.AppSettings["FromEmailPassword"].ToString();
                string _Host = ConfigurationManager.AppSettings["SmtpServer"].ToString();
                int _Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());
                Boolean _UseDefaultCredentials = false;
                Boolean _EnableSsl = true;
                mail.To.Add(ToEmailID);
                mail.From = new MailAddress(FromEmailID);
                mail.Subject = "Manbir Sandhu - Property Looking for : '" + txtFirstName.Text + " :  " + txtPhoneno.Text;
                //string body = "";
                ////body = "<p>Person Name : " + txtFirstName.Text + "</p>";
                ////body = body + "<p>Email ID : " + UserEmailId + "</p>";
                ////body = body + "<p>" + txtMessage.Text + "</p>";
                //body = "<p> First Name : " + txtFirstName.Text + "</p>";
                //body = body + "<p> Last Name : " + txtLastName.Text + "</p>";
                //body = body + "<p>E-Mail : " + txtEmail.Text + "</p>";
                //body = body + "<p>Phone Number : " + txtPhoneno.Text + "</p>";
                //body = body + "<p>Desired Property Type : " + ddltype.SelectedItem.Text + "</p>";
                //body = body + "<p>Price Range : " + ddlrange.SelectedItem.Text + "</p>";
                //body = body + "<p>Preferred Location : " + txtSearch.Text + "</p>";
                //body = body + "<p> Comments : " + txtMessage.Text + "</p>";
                Session["MLSID"] = txtSearch.Text;
                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                Property1.MLSDataWebServiceSoapClient mlsClientimages = new Property1.MLSDataWebServiceSoapClient();
                dt = mlsClient.GetResidentialProperties(Convert.ToString(Session["MLSID"]), "0", "0", "0", "0", "0", "0");
                html.AppendLine("<div id='divEmail' style='width:100%; float:left;'>");
                html.AppendLine("<h2 style='font-weight:bold; font-size:16px;'>KahlonTeam for Property ID  " + dt.Rows[0]["MLS"].ToString() + ";</h2>");
                html.AppendLine("<h2 style='font-weight: bold; font-size: 16px;'>Message Received From:</h2>");
                html.AppendLine("<p style='float: left; margin: 0 40px 0 0;'>Name:</p><span style='float:left;'>" + txtFirstName.Text + "</span><br/>");
                html.AppendLine("<p style='float: left; margin: 0 40px 0 0;'>Phone Number:</p><span style='float:left;'>" + txtEmail.Text + "</span><br/>");
                html.AppendLine("<p style='float: left; margin: 0 40px 0 0;'>Phone Number:</p><span style='float:left;'>" + txtPhoneno.Text + "</span><br/>");
                html.AppendLine("<h2 style='font-weight: bold; font-size: 16px;'>Message:</h2>");
                html.AppendLine("<p>Please take a look at Property ID " + dt.Rows[0]["MLS"].ToString() + " located at " + dt.Rows[0]["Address"].ToString() + "</p>");
                //html.AppendLine("<h2 style='font-weight:bold; font-size:16px;'>Referring Page:</h2>");
                //html.AppendLine("<p>Gurdeepkalra.tejassolutions.ca</p>");
                html.AppendLine("<h2 style='font-weight:bold; font-size:16px;'>Property Information:</h2>");
                html.AppendLine("<div style='float:left; width:30%;'>");
                html.AppendLine("<h2 style='font-weight:bold; font-size:16px; margin:0px;'>" + dt.Rows[0]["ListPrice"].ToString() + "<br />");
                html.AppendLine("" + dt.Rows[0]["Address"].ToString() + "  <br/>Property ID: " + dt.Rows[0]["MLS"].ToString() + "</h2>");
                html.AppendLine("</div>");
                html.AppendLine("<div style='float:left;'>");
                //html.AppendLine("<p style='float:left; margin:0 12px 0 0; font-weight:bold;'>Beds:</p><span style='float:left; margin:0 30px 0 0;'>" + dt.Rows[0]["BedRooms"].ToString() + "</span>");
                html.AppendLine("<p style='float:left; margin:0 12px 0 0; font-weight:bold;'>Bath:</p><span style='float:left;'>" + dt.Rows[0]["WashRooms"].ToString() + "</span><br/>");
                //html.AppendLine("<p style='float:left; margin:0 12px 0 0; font-weight:bold;'>Square Feet:</p><span style='float:left;'>" + dt.Rows[0]["Maintenance"].ToString() + "</span><br/>");
                //html.AppendLine("<p style='float:left; margin:0 12px 0 0; font-weight:bold;'>Year Built:</p><span style='float:left;'>" + dt.Rows[0]["Maintenance"].ToString() + "</span><br/>");
                html.AppendLine("<p style='float:left; margin:0 12px 0 0; font-weight:bold;'>Style:</p><span style='float:left;'>" + dt.Rows[0]["PType"].ToString() + "</span><br/>");
                html.AppendLine("</div>");
                html.AppendLine("<p style='float:left; width:100%;'>For more information on this property, <a href='#'>click HERE.</a></p>");
                html.AppendLine("<div style='float:left; width:100%;'>");
                html.AppendLine("<div style='float:left; margin:0 0 0 250px; border-right:1px solid grey; padding-right:7px; width:400px;'>");
                html.AppendLine("<div style='float:left; margin:0 56px 0 0;'>");
                html.AppendLine("<p style='margin:0px;'>16 Bretton Circle<br/>" + dt.Rows[0]["Address"].ToString() + "</p></div>");
                html.AppendLine("<div style='float:left;'>");
                html.AppendLine("<p style='margin:0px;'>" + dt.Rows[0]["ListPrice"].ToString() + "</p>");
                html.AppendLine("<p style='float:left; margin:0 40px 0 0; font-size:12px;'>Property ID:</p><span style='float:left; font-size:12px;'>" + dt.Rows[0]["MLS"].ToString() + "</span><br/></div>");
                html.AppendLine("<p style='float:left; width:100%;'>ELEGANT EXECUTIVE GREENPARK HOME IN PRESTIGIOUS ROUGE FAIRWAYS</p>");
                html.AppendLine("" + dt.Rows[0]["RemarksForClients"].ToString() + "");
                html.AppendLine("<p>For more information visit <a href='#'>" + ConfigurationManager.AppSettings["WebSiteUrl"].ToString() + "</a> </p></div>");
                html.AppendLine("<div style='float:left; padding-left:12px;'>");
                html.AppendLine("<p style='margin:0px;'>Listed By</p><br/><p>Jasveer Kahlo<br/>Broker of record</p>");
                html.AppendLine(" <h2 style='font-size:16px;'>Leading Edge Realty Inc.</h2>");
                html.AppendLine("<p style='margin:0px;'>470 Chrysler Dr. Unit #20 Brampton,Ontario</p>");
                html.AppendLine("<p style='float:left; margin:0 40px 0 0; font-weight:bold;'>Cell::</p><span style='float:left;'>" + dt1.Rows[0]["PhonenUmber"].ToString() + "</span><br/>'");
                //html.AppendLine("<p style='float:left; margin:0 40px 0 0; font-weight:bold;'>Office:</p><span style='float:left;'>905-497-2300</span><br/>");
                //html.AppendLine("<p style='float:left; margin:0 40px 0 0; font-weight:bold;'>Office Fax:</p><span style='float:left;'>905-497-0400</span><br/>'");
                html.AppendLine("<p style='float:left; margin:0 40px 0 0; font-weight:bold;'>E-mail:</p><span style='float:left;'>jasveerkahlon@gmail.com</span><br/>");
                html.AppendLine("<p style='float:left; margin:0 40px 0 0; font-weight:bold;'>Website:</p><span style='float:left;'>" + ConfigurationManager.AppSettings["WebSiteUrl"].ToString() + "</span><br/></div></div>");
                html.AppendLine("<div style='float:left; width:100%; margin-left: 247px;'>");
                html.AppendLine("<div style='float:left; margin:0 0 0 250px; border-right:1px solid grey; padding-right:7px; width:400px; border-top:1px solid grey;>");
                html.AppendLine("<h2 style='font-size:16px;'>Property Details</h2>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>ID:</p><span style='float:left;'>" + dt.Rows[0]["MLS"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Style:</p><span style='float:left;'>" + dt.Rows[0]["PType"].ToString() + "</span></div>");
                //html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Beds:</p><span style='float:left;'>" + dt.Rows[0]["BedRooms"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Baths:</p><span style='float:left;'>" + dt.Rows[0]["WashRooms"].ToString() + "   (Full: 2   3/4: 1   1/2: 1   Other: 0)</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Washrooms:</p><span style='float:left;'>" + dt.Rows[0]["WashRooms"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Status:</p><span style='float:left;'>Active</span></div>");
                //html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Total Rooms:</p><span style='float:left;'>" + dt.Rows[0]["Rooms"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Storeys:</p><span style='float:left;>" + dt.Rows[0]["TypeOwn1Out"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Fireplaces:</p><span style='float:left;>1</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>New Construction:</p><span style='float:left;>No</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Financial Considerations Estimated Annual Taxes:</p><span style='float:left;>$5,663</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Locale County:</p><span style='float:left;>York</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>High School:</p><span style='float:left;>Markham District Highschool</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Elementary School:</p><span style='float:left;>Boxwood Public School</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Neighbourhood:</p><span style='float:left;>Rouge Fairways Community</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>School District:</p><span style='float:left;>York Region</span></div>");
                html.AppendLine("<h2 style='font-size:16px;'>Property Details</h2>");
                html.AppendLine("<div style='float:left; padding-left:12px; width:500px; border-top:1px solid grey;'>");
                html.AppendLine("<h2 style='font-size:16px;'>Features</h2>");
                html.AppendLine("<p style='float:left; width:100%; margin:0px;'>Air Conditioning</p>");
                html.AppendLine("<p style='float:left; width:100%;' margin:0px;>Central Air</p>");
                html.AppendLine("<p style='float:left; width:100%; margin:0px;'>Basement</p>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Full</p><span style='float:left;'>Finished</span></div>");
                html.AppendLine("<p style='float:left; width:100%; margin:0px;'>Shingle - Newer Roof 2009 (40 Year Shingles)Other - Wrap Around</p>");
                html.AppendLine("<p style='float:left; width:100%; margin:0px;'>Brick</p>");
                html.AppendLine("<p style='float:left; width:100%; margin:0px;'>Family Room</p>");
                html.AppendLine("<p style='float:left; width:100%; margin:0px;'>Y - Main Floor Family Room With</p>");
                html.AppendLine("<p style='float:left; width:100%; margin:0px;'>Fireplace</p>");
                html.AppendLine("<p style='float:left; width:100%; margin:0px;'>Garage Type</p>");
                html.AppendLine("<p style='float:left; width:100%; margin:0px;'>Attached</p>");
                html.AppendLine(" <p style='float:left; width:100%; margin:0px;'>Laundry Access</p>");
                html.AppendLine("<p style='float:left; width:100%; margin:0px;'>In Area - Main Floor Laundry</p>");
                html.AppendLine("<p style='float:left; width:100%; margin:0px;'>Parking/Drive</p>");
                html.AppendLine("<p style='float:left; width:100%; margin:0px;'>Private - Parking For 4 Cars on </p>");
                html.AppendLine(" <p style='float:left; width:100%; margin:0px;'>Driveway</p> </div> </div> </div>");
                mail.Body = html.ToString();
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = _Host;
                smtp.Port = _Port;
                smtp.UseDefaultCredentials = _UseDefaultCredentials;
                smtp.Credentials = new System.Net.NetworkCredential
                (FromEmailID, FromEmailPassword);// Enter senders User name and password
                smtp.EnableSsl = _EnableSsl;
                smtp.Send(mail);
            }
        }
        public void SendMailToUser(string UserEmailId)
        {
            // Send mail.
            MailMessage mail = new MailMessage();

            string ToEmailID = txtEmail.Text; //From Email & To Email are same for admin
            string FromEmailID = ConfigurationManager.AppSettings["RegFromMailAddress"].ToString();
            string FromEmailPassword = ConfigurationManager.AppSettings["FromEmailPassword"].ToString();
            string _Host = ConfigurationManager.AppSettings["SmtpServer"].ToString();
            int _Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());
            Boolean _UseDefaultCredentials = false;
            Boolean _EnableSsl = true;
            mail.To.Add(ToEmailID);
            mail.From = new MailAddress(FromEmailID);
            mail.Subject = "Manbir Sandhu";
            string body = "";
            body = "<p>Thanks for contacting us.</p>";
            mail.Body = body;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = _Host;
            smtp.Port = _Port;
            smtp.UseDefaultCredentials = _UseDefaultCredentials;
            smtp.Credentials = new System.Net.NetworkCredential
            (FromEmailID, FromEmailPassword);// Enter senders User name and password
            smtp.EnableSsl = _EnableSsl;
            smtp.Send(mail);
        }



        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] GetAutoCompleteData(string prefixText, int count, string contextKey)
        {
            List<String> itemNames = new List<String>();
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = ml.GetAutoCompleteData(prefixText);
            foreach (DataRow dr in dt.Rows)
            {
                String item = dr["Province"].ToString();

                itemNames.Add(item);
            }
            string[] prefixTextArray = itemNames.ToArray();
            return prefixTextArray;
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] GetAutoCompleteData_Comm(string prefixText, int count, string contextKey)
        {
            List<String> itemNames = new List<String>();
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = ml.GetAutoCompleteData_Comm(prefixText);
            foreach (DataRow dr in dt.Rows)
            {
                String item = dr["Province"].ToString();

                itemNames.Add(item);
            }
            string[] prefixTextArray = itemNames.ToArray();
            return prefixTextArray;
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] GetAutoCompleteData_Condo(string prefixText, int count, string contextKey)
        {
            List<String> itemNames = new List<String>();
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = ml.GetAutoCompleteData_Condo(prefixText);
            foreach (DataRow dr in dt.Rows)
            {
                String item = dr["Province"].ToString();

                itemNames.Add(item);
            }
            string[] prefixTextArray = itemNames.ToArray();
            return prefixTextArray;
        }
    }
}