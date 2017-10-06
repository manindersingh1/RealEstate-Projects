using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;
using Property_cls;
using Property_Cryptography;

namespace Property
{
    public partial class VipAccess : System.Web.UI.Page
    {

        #region Global

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());

        #endregion Global

        protected void Page_Load(object sender, EventArgs e)
        {
           // CalendarExtender1.StartDate = DateTime.Now;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {

                string email = ConfigurationManager.AppSettings["RegFromMailAddress"];
                //string toemail = ConfigurationManager.AppSettings["MailToAddress"];
                MailMessage message = new MailMessage();
                message.To.Add(txtEmail.Text);
                message.From = new MailAddress(ConfigurationManager.AppSettings["RegFromMailAddress"]);
                message.Subject = "You are registered for VIP Aceess";
                message.Body = "Name:" + txtFirstName.Text + "<br/>" + "You are sucessfully register for VIP Access.";
                message.IsBodyHtml = true;
                SmtpClient smtpClient = new SmtpClient(ConfigurationManager.AppSettings["SmtpServer"]);
                smtpClient.Port = Int32.Parse(ConfigurationManager.AppSettings["Port"]);
                smtpClient.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["RegFromMailAddress"], ConfigurationManager.AppSettings["RegPassword"]);
                smtpClient.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                smtpClient.Send(message);
                clearform();
                //dvshw.Style["display"] = "show";
                //lblmessage.Text = "Thanks For Sending Message!";
                conn.Close();
                if ((Session["FeatureType"]) != null)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ScriptKey", "alert('Your Appointment  has been saved');window.location='featureListing.aspx'; ", true);
                    //   Response.Redirect("~/featureListing.aspx", false);

                }
                else if (Session["Municipality"] != null)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "click", "alert('Your Appointment  has been saved');window.location.href ='Search.aspx?Municipality=" + Convert.ToString(Session["Municipality"]) + "'", true);
                    //  string targeturl=  "~/Search.aspx?Municipality=" + Convert.ToString(Session["Municipality"]);
                }
                else if (Session["Type1"] != null)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "click", "alert('Your Appointment  has been saved..');window.location.href ='PropertyDetails.aspx?MLSID=" + Convert.ToString(Session["MLSID"]) + "&PropertyType=" + Convert.ToString(Session["Type1"]) + "'", true);
                    //     Response.Redirect("PropertyDetails.aspx?MLSID=" + Convert.ToString(Session["MLSID"]) + "&PropertyType=" + Convert.ToString(Session["Type1"]), false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ScriptKey", "alert('Your Appointment  has been saved');window.location='ScheduleAppointment.aspx'; ", true);
                    //   Response.Redirect("~/Search.aspx", false);
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = "An error occurred!!Try again";
                // ErrorMessege.Text = "An error occurred!!";
            }
        }
        private void clearform()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPhoneNo.Text = "";
            ProjectName.Text = "";
            txtNotes.Text = "";
        }

    }
}