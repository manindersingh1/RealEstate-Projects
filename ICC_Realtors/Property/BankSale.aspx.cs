using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Security;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Property_cls;
using System;

namespace Property
{
    public partial class BankSale : System.Web.UI.Page
    {
        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
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
                cls_Property clsp = new cls_Property();
                clsp.Insert_AddPowerOfSale(txtName.Text, txtEmail.Text, txtPhoneno.Text, Convert.ToString(ddlPriceRange.SelectedValue), Convert.ToString(ddlCity.SelectedValue));

                //int indextilldel = Request.Url.AbsoluteUri.IndexOf("Posting");

                string UserEmailId = txtEmail.Text;
                string ToEmailId = ConfigurationManager.AppSettings["ToEmailID"].ToString();
                SendMailToAdmin(UserEmailId);
                SendMailToUser(UserEmailId);

                txtName.Text = "";

                txtPhoneno.Text = "";
                txtEmail.Text = "";

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
        public void SendMailToAdmin(string UserEmailId)
        {
            MailMessage mail = new MailMessage();


            string ToEmailID = ConfigurationManager.AppSettings["ToEmailID"].ToString(); //From Email & To Email are same for admin
            string FromEmailID = ConfigurationManager.AppSettings["RegFromMailAddress"].ToString();
            string FromEmailPassword = ConfigurationManager.AppSettings["RegPassword"].ToString();


            string _Host = ConfigurationManager.AppSettings["SmtpServer"].ToString();
            int _Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());
            Boolean _UseDefaultCredentials = false;
            Boolean _EnableSsl = true;

            mail.To.Add(ToEmailID);
            mail.From = new MailAddress(FromEmailID);
            mail.Subject = "ICC Realtypoint";
            string body = "";
            body = "<p>Person Name : " + txtName.Text + "</p>";
            body = body + "<p>Email ID : " + UserEmailId + "</p>";
            body = body + "<p>Price Range : " + ddlPriceRange.SelectedValue + "</p>";
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

            string ToEmailID = UserEmailId; //From Email & To Email are same for admin
            string FromEmailID = ConfigurationManager.AppSettings["RegFromMailAddress"].ToString();
            string FromEmailPassword = ConfigurationManager.AppSettings["RegPassword"].ToString();

            string _Host = ConfigurationManager.AppSettings["SmtpServer"].ToString();
            int _Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());
            Boolean _UseDefaultCredentials = false;
            Boolean _EnableSsl = true;

            mail.To.Add(ToEmailID);
            mail.From = new MailAddress(FromEmailID);
            mail.Subject = "ICC Realtypoint";
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