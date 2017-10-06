using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Property_cls;
using System.Configuration;
using System.Net.Mail;

namespace Property
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        Cryptography crpt = new Cryptography();
        cls_Property clsobj = new cls_Property();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_GetEmail";
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);

                cmd.Connection = conn;

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                conn.Close();
                if (dt.Rows.Count > 0)
                {
                    string password = crpt.Decrypt(Convert.ToString(dt.Rows[0]["Password"]));


                    MailAddress mailToUser = new MailAddress(txtEmail.Text);
                    MailAddress mailFrom = new MailAddress(ConfigurationManager.AppSettings["RegFromMailAddress"].ToString());
                   // MailAddress mailToUser = new MailAddress(ConfigurationManager.AppSettings["MailToAddress"].ToString());
                   // MailAddress mailToUser = new MailAddress(txtEmail.Text);
                    MailMessage mailUser = new MailMessage(mailFrom, mailToUser);
                    mailUser.IsBodyHtml = true;
                    mailUser.Subject = "Old Password";
                    mailUser.Body = "Email =" + txtEmail.Text + "<br/>Password :" + password;
                    SmtpClient client = new SmtpClient();//create new smtp client object to send the mail using SMTP protocol
                    client.UseDefaultCredentials = false;
                    client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["RegFromMailAddress"].ToString(), ConfigurationManager.AppSettings["RegPassword"].ToString());
                    client.Host = ConfigurationManager.AppSettings["SmtpServer"].ToString();//host server
                    client.Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());//port number of host server
                    client.EnableSsl = true;//secured connection
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.Send(mailUser);

                    //  txtMessage.Text = "";

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ScriptKey", "alert('Your password  has been sent to "+txtEmail.Text+"'); ", true);
                   // ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Your password  has been sent to " + txtEmail.Text + ");", true);
                    txtEmail.Text = "";

                   // return;

                }
                else
                {
                    lblerror.Text = "EmailID does not exist";
                }
            }
            catch (Exception ex)
            {
                lblerror.Text = "An error occurred";
            }
        }
    }
}