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
    public partial class Service : System.Web.UI.Page
    {
        cls_Property clsobj = new cls_Property();
        protected void Page_Load(object sender, EventArgs e)
        {
            var DreamHouseId = Convert.ToString(Request.QueryString["Id"]);           
            GetImages(Convert.ToInt32(DreamHouseId));
            bindmenulist();
            GetDreamHouseDetail(Convert.ToInt32(DreamHouseId));
        }

        void GetImages(int DreamHouseId)
        {
            Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
           

            DataTable dt = clsobj.GetDreamHouseForSlider(DreamHouseId);
            if (dt.Rows.Count > 0)
            {
                rptImages.DataSource = dt;
                rptImages.DataBind();
                //sliderDiv.Visible = true;
                //sliderImageEmpty.Visible = false;
            }
            else
            {
               // sliderDiv.Visible = false;
                //sliderImageEmpty.Visible = true;
            }

            mlsClient = null;
        }
        void GetDreamHouseDetail(int DreamHouseId)
        {


            DataTable dt = clsobj.GetDreamHouseDetail(DreamHouseId);
            if (dt.Rows.Count > 0)
            {
                lblTitle.Text = Convert.ToString(dt.Rows[0]["Title"]);               
                lblDescription.Text = Convert.ToString(dt.Rows[0]["Description"]);
                if (Convert.ToString(dt.Rows[0]["Address"]) == "")
                {                   
                    VedioDiv.Style["display"] = "None";
                }
                DataTable bannerpath = clsobj.GetBannerbyProjectId(DreamHouseId);
                if (bannerpath.Rows.Count > 0)
                {
                    bannerimg.Attributes["src"] = "Multiple_Condos/images/" + Convert.ToString(bannerpath.Rows[0]["FileName"])+"";
                }
                
            }
        }
        void bindmenulist()
        {
            StringBuilder StrMenu = new StringBuilder();
            DataTable dt = new DataTable();
            DataTable dtSubmenu = new DataTable();
            dt = clsobj.GetDreamHouse();
            if (dt.Rows.Count > 0)
            {
                StrMenu.Append("<ul class='dropdown-menu'>");

                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    StrMenu.Append("<li><a href='../service.aspx?Id="+ dt.Rows[j]["Id"] +"' title='Home'>"+ dt.Rows[j]["Title"] +"</a></li>");                   
                }
                StrMenu.Append("</ul>");
            }
            dynamicmenus.Text = StrMenu.ToString();
        }

        //protected void btnSend_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        cls_Property clsp = new cls_Property();
        //        clsp.Insert_ContactUS(txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtPhoneno.Text, txtMessage.Text);
        //        //int indextilldel = Request.Url.AbsoluteUri.IndexOf("Posting");

        //        string UserEmailId = ConfigurationManager.AppSettings["RegFromMailAddress"].ToString();
        //        string ToEmailId = ConfigurationManager.AppSettings["ToEmailID"].ToString();
        //        SendMailToAdmin(UserEmailId);
        //        SendMailToUser(UserEmailId);

        //        txtFirstName.Text = "";
        //        txtLastName.Text = "";
        //        txtPhoneno.Text = "";
        //        txtEmail.Text = "";
        //        txtMessage.Text = "";
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Congrts!", "alert('Your E-mail has been sent sucessfully - Thank You');", true);
        //        return;

        //    }
        //    catch (Exception ex)
        //    {
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Failure", "alert('Your message failed to send, please try again.');", true);
        //        return;
        //    }
        //}

        //public void SendMailToAdmin(string UserEmailId)
        //{
        //    MailMessage mail = new MailMessage();
        //    string ToEmailID = ConfigurationManager.AppSettings["ToEmailID"].ToString(); //From Email & To Email are same for admin
        //    //string ToEmailPassword = ConfigurationManager.AppSettings["ToEmailPassword"].ToString();
        //    string FromEmailID = ConfigurationManager.AppSettings["RegFromMailAddress"].ToString();
        //    string FromEmailPassword = ConfigurationManager.AppSettings["RegPassword"].ToString();
        //    string _Host = ConfigurationManager.AppSettings["SmtpServer"].ToString();
        //    int _Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());
        //    Boolean _UseDefaultCredentials = false;
        //    Boolean _EnableSsl = true;
        //    mail.To.Add(ToEmailID);
        //    mail.From = new MailAddress(FromEmailID);
        //    mail.Subject = "User Details";
        //    string body = "";
        //    body = "<p>Person Name : " + txtFirstName.Text + "</p>";
        //    body = body + "<p>Email ID : " + txtEmail.Text + "</p>";
        //    body = body + "<p>" + txtMessage.Text + "</p>";
        //    mail.Body = body;
        //    mail.IsBodyHtml = true;
        //    SmtpClient smtp = new SmtpClient();
        //    smtp.Host = _Host;
        //    smtp.Port = _Port;
        //    smtp.UseDefaultCredentials = _UseDefaultCredentials;
        //    smtp.Credentials = new System.Net.NetworkCredential
        //    (FromEmailID, FromEmailPassword);// Enter senders User name and password
        //    smtp.EnableSsl = _EnableSsl;
        //    smtp.Send(mail);
        //}
        //public void SendMailToUser(string UserEmailId)
        //{
        //    // Send mail.
        //    MailMessage mail = new MailMessage();

        //    string ToEmailID = txtEmail.Text; //From Email & To Email are same for admin
        //    string FromEmailID = ConfigurationManager.AppSettings["RegFromMailAddress"].ToString();
        //    string FromEmailPassword = ConfigurationManager.AppSettings["RegPassword"].ToString();

        //    string _Host = ConfigurationManager.AppSettings["SmtpServer"].ToString();
        //    int _Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());
        //    Boolean _UseDefaultCredentials = false;
        //    Boolean _EnableSsl = true;

        //    mail.To.Add(ToEmailID);
        //    mail.From = new MailAddress(FromEmailID);
        //    mail.Subject = "Multiple Condos";
        //    string body = "";
        //    body = "<p>Thanks for contacting us.</p>";
        //    mail.Body = body;

        //    mail.IsBodyHtml = true;
        //    SmtpClient smtp = new SmtpClient();
        //    smtp.Host = _Host;
        //    smtp.Port = _Port;
        //    smtp.UseDefaultCredentials = _UseDefaultCredentials;
        //    smtp.Credentials = new System.Net.NetworkCredential
        //    (FromEmailID, FromEmailPassword);// Enter senders User name and password
        //    smtp.EnableSsl = _EnableSsl;
        //    smtp.Send(mail);
        //}
    }
}