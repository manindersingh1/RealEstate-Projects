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
    public partial class Registration : System.Web.UI.Page
    {

        #region Global

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        Cryptography crpt = new Cryptography();

        #endregion Global

        #region PageLoad

        protected void Page_Load(object sender, EventArgs e)
        {

          
        }

        #endregion PageLoad

        #region button click

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_RegistrationExist";
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                cmd.Connection = conn;

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                DataTable dt = new DataTable();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Congrts!", "alert('Email already Exist');", true);
                   
                }
                else
                {
                   
                    SqlCommand cmd1 = new SqlCommand();
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.CommandText = "usp_AddRegistration";
                    SqlParameter sp = new SqlParameter();
                    sp.ParameterName = "@ID";
                    sp.SqlDbType = SqlDbType.Int;
                    sp.Direction = ParameterDirection.InputOutput;
                    sp.SqlValue = 0;
                    cmd1.Parameters.Add(sp);
                    cmd1.Parameters.AddWithValue("@FirstName", txtName.Text);
                    cmd1.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd1.Parameters.AddWithValue("@City", txtCity.Text);
                    cmd1.Parameters.AddWithValue("@State", txtState.Text);
                    cmd1.Parameters.AddWithValue("@PhoneNumber", txtPhoneNo.Text);
                    cmd1.Parameters.AddWithValue("@UserName", txtUserName.Text);
                    cmd1.Parameters.AddWithValue("@Password", crpt.Encrypt(txtPassword.Text));
                    cmd1.Parameters.AddWithValue("@IsDelete", false);
                    cmd1.Connection = conn;
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    cmd1.ExecuteNonQuery();
                    string ID = Convert.ToString(cmd1.Parameters["@ID"].Value);
                    int UserID = Convert.ToInt32(ID);
                    conn.Close();

                    MailMessage msg = new MailMessage();
                    msg.To.Add(txtUserName.Text);
                    msg.From = new MailAddress(ConfigurationManager.AppSettings["RegFromMailAddress"].ToString());
                    msg.Subject = "Verification Mail";
                    string body = "<b>Please verify your mail to login<b>";
                    string EncodeUserId = (UserID.ToString());
                    string Url = Request.Url.AbsoluteUri.Replace("Registration.aspx", "Verification.aspx?UserID=" + EncodeUserId);
                    body += "<br /><a href = '" + Url + "'>Click here to verify your Email</a><br /><br />";
                    msg.Body = body;

                    msg.IsBodyHtml = true;
                    SmtpClient client = new SmtpClient();
                    client.UseDefaultCredentials = false;
                    client.Host = ConfigurationManager.AppSettings["SmtpServer"].ToString();//host server
                    client.Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());//port
                    NetworkCredential credentials = new NetworkCredential(ConfigurationManager.AppSettings["RegFromMailAddress"].ToString(), ConfigurationManager.AppSettings["RegPassword"].ToString());
                    client.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                    client.Credentials = credentials;

                    client.Send(msg);

                    Clear();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Congrts!", "alert('Check your mail for EmailId Verification');", true);
                    //lblmsg.Text = "Check your mail for EmailId Verification";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion button click

        #region Other Methods

        public void Clear()
        {
            txtName.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtPhoneNo.Text = "";
        }

        #endregion Other Methods

        #region TextBox Event

        //protected void txtUserName_TextChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        SqlCommand cmd = new SqlCommand();
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.CommandText = "usp_RegistrationExist";
        //        cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
        //        cmd.Connection = conn;

        //        if (conn.State == ConnectionState.Closed)
        //        {
        //            conn.Open();
        //        }

        //        DataTable dt = new DataTable();
        //        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        //        sda.Fill(dt);
        //        if (dt.Rows.Count > 0)
        //        {
        //            lblUserMsg.Text = "Email already Exist";
        //        }
        //        else
        //        {
        //            lblUserMsg.Text = "";
        //        }
        //        cmd.ExecuteNonQuery();
        //        conn.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        #endregion TextBox Event

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~Login.aspx");
        }

    }
}