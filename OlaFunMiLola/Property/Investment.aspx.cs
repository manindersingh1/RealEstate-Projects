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
    public partial class UpCommingProjects : System.Web.UI.Page
    {

        #region Global

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());

        #endregion Global

        protected void Page_Load(object sender, EventArgs e)
        {
            //CalendarExtender1.StartDate = DateTime.Now;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
            //    SqlCommand cmd = new SqlCommand();
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.CommandText = "usp_AddUpCommingProj";
            //    cmd.Connection = conn;

            //    cmd.Parameters.AddWithValue("@ID", 0);
            //    cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            //    cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
            //    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            //    cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNo.Text);
            //    cmd.Parameters.AddWithValue("@ProjectName", txtProjectName.Text);                
            //    cmd.Parameters.AddWithValue("@Description", txtNotes.Text);

            //    if (conn.State == ConnectionState.Closed)
            //    {
            //        conn.Open();
            //    }
            //    cmd.ExecuteNonQuery();

                string UserEmailId = ConfigurationManager.AppSettings["RegFromMailAddress"].ToString();
                string ToEmailId = ConfigurationManager.AppSettings["ToEmailID"].ToString();
                SendMailToAdmin(UserEmailId);
                SendMailToUser(UserEmailId);
                clearform();
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
            txtProjectName.Text = "";            
            txtNotes.Text = "";
        }
        public void SendMailToAdmin(string UserEmailId)
        {

            MailMessage mail = new MailMessage();


            string ToEmailID = ConfigurationManager.AppSettings["ToEmailID"].ToString(); //From Email & To Email are same for admin
            //string ToEmailPassword = ConfigurationManager.AppSettings["ToEmailPassword"].ToString();
            string FromEmailID = ConfigurationManager.AppSettings["RegFromMailAddress"].ToString();
            string FromEmailPassword = ConfigurationManager.AppSettings["RegPassword"].ToString();


            string _Host = ConfigurationManager.AppSettings["SmtpServer"].ToString();
            int _Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());
            Boolean _UseDefaultCredentials = false;
            Boolean _EnableSsl = true;

            mail.To.Add(ToEmailID);
            mail.From = new MailAddress(FromEmailID);
            mail.Subject = "Regarding investment property looking for.";
            string body = "";
            body = "<p>Person Name : " + txtFirstName.Text + "</p>";
            body = body + "<p>Email ID : " + txtEmail.Text + "</p>";
            body = body + "<p>Phone Number : " + txtPhoneNo.Text + "</p>";
            body = body + "<p>Area : " + txtProjectName.Text + "</p>";
            body = body + "<p>Message : " + txtNotes.Text + "</p>";
           
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
            mail.Subject = "Ola Funmilola";
            string body = "";
            body = "<p>Your Investment property looking for registered successfully.</p>";
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
    }
}