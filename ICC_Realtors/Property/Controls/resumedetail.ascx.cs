using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;
using System.Net;
using System.Data;
using Property_cls;
using System.IO;

namespace Property
{
    public partial class resumedetail : System.Web.UI.UserControl
    {

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            if (url.Contains("ProjectDetails"))
            {
                lblTitle.InnerText = " Fill the following information";
            }
            else
            {
                lblTitle.InnerText = " Post Resume And Detail";
            }
         
            if (!IsPostBack)
            {
                LoadImageandName();
            }
        }

        #endregion PageLoad

        #region Other Methods

        private void LoadImageandName()
        {
            cls_Property clsp = new cls_Property();       
            DataTable dt = new DataTable();
            dt = clsp.GetUserInfo();
            if (dt.Rows.Count > 0)
            {
                //lblDealerName.Text = Convert.ToString(dt.Rows[0]["firstname"]) + " " + Convert.ToString(dt.Rows[0]["LastName"]);
                //lblDealerAddress.Text = Convert.ToString(dt.Rows[0]["Address"]);
                //byte[] imagedata = (byte[])dt.Rows[0]["image"];

                //if (imagedata.Length > 0)
                //{

                //    Session["ContactImage"] = imagedata;
                //    //imgDealer.Visible = true;
                //    //imgDealer.ToolTip = " Admin Pic";
                //    //imgDealer.ImageUrl = "~/ShowImage.aspx";

                //}
                //else
                //{
                //    //imgDealer.Visible = false;
                //}
            }
        }

        #endregion Other Methods

        #region Button Click
        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                var url = "";
                HttpFileCollection FileColl = Request.Files;
                for (int i = 0; i < FileColl.Count; i++)
                {
                    HttpPostedFile PostedFile = FileColl[i];
                  
                    if (PostedFile.ContentLength > 0)
                    {
                        //Save the photo in Folder
                        var fileExt = Path.GetExtension(PostedFile.FileName);
                        string fileName = Guid.NewGuid() + fileExt;
                        var subPath = Server.MapPath("~/UploadFiles");

                        //Check SubPath Exist or Not
                        if (!Directory.Exists(subPath))
                        {
                            Directory.CreateDirectory(subPath);
                        }
                        //End : Check SubPath Exist or Not

                        var path = Path.Combine(subPath, fileName);
                        PostedFile.SaveAs(path);

                        url = "http://localhost:61761/UploadFiles/" + fileName;

                        
                    }
                }

                string UserEmailId = "";                
                SendMailToAdmin(UserEmailId,url);
                //SendMailToUser(UserEmailId);

                txtFirstName.Text = "";
                txtLastName.Text = "";
                txtPhoneno.Text = "";
                txtEmail.Text = "";
                txtMessage.Text = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Congrts!", "alert('Your E-mail has been sent sucessfully - Thank You');", true);
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
        public void SendMailToAdmin(string UserEmailId,string url)
        {
      

            // Send mail.
            MailMessage mail = new MailMessage();
            var Emailid = "only4agentss@gmail.com";

            string ToEmailID = ConfigurationManager.AppSettings["ToEmailID"].ToString(); //From Email & To Email are same for admin
            //string ToEmailPassword = ConfigurationManager.AppSettings["ToEmailPassword"].ToString();
            string FromEmailID = ConfigurationManager.AppSettings["RegFromMailAddress"].ToString();
            string FromEmailPassword = ConfigurationManager.AppSettings["RegPassword"].ToString();


            string _Host = ConfigurationManager.AppSettings["SmtpServer"].ToString();
            int _Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());
            Boolean _UseDefaultCredentials = false;
            Boolean _EnableSsl = true;

            mail.To.Add(Emailid);
            mail.From = new MailAddress(FromEmailID);
            mail.Subject = txtFirstName.Text + " :  " + txtPhoneno.Text;
            string body = "";
            body = "<p>Person Name : " + txtFirstName.Text + "</p>";
            body = body + "<p>Email ID : " + txtFirstName.Text + "</p>";
            body = body + "<p>Phone Number : " + txtPhoneno.Text + "</p>";
            body = body + "<p>Message : " + txtMessage.Text + "</p>";
            body = body + "<p>" + url + "</p>";
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
        public void SendMailToUser(string UserEmailId)
        {
            // Send mail.
            MailMessage mail = new MailMessage();

            string ToEmailID = txtEmail.Text; //From Email & To Email are same for admin
            string FromEmailID = ConfigurationManager.AppSettings["RegFromMailAddress"].ToString();
            string FromEmailPassword = ConfigurationManager.AppSettings["RegPassword"].ToString();

            string _Host = ConfigurationManager.AppSettings["SmtpServer"].ToString();
            int _Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());
            Boolean _UseDefaultCredentials = false;
            Boolean _EnableSsl = true;

            mail.To.Add(ToEmailID);
            mail.From = new MailAddress(FromEmailID);
            mail.Subject = "Vadim Chuzhinov";
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
        #endregion Button Click

    }
}