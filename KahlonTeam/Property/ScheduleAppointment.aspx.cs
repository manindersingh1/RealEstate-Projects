﻿using System;
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
    public partial class ScheduleAppointment : System.Web.UI.Page
    {

        #region Global

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());

        #endregion Global

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Title = "Homelife Properties :Schedule Appointment";
            string v = Request.QueryString["Municipality"];
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_AddScheduleAppointment";
                cmd.Connection = conn;

                cmd.Parameters.AddWithValue("@ID", 0);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNo.Text);
                cmd.Parameters.AddWithValue("@AppointmentDate", txtAppointmentDate.Text);
                cmd.Parameters.AddWithValue("@AppointmentTime", ddlAppointmentTime.SelectedValue);
                cmd.Parameters.AddWithValue("@Notes", txtNotes.Text);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                cmd.ExecuteNonQuery();

                string email = ConfigurationManager.AppSettings["RegFromMailAddress"];
                //string toemail = ConfigurationManager.AppSettings["MailToAddress"];
                MailMessage message = new MailMessage();
                message.To.Add(txtEmail.Text);
                message.From = new MailAddress(ConfigurationManager.AppSettings["RegFromMailAddress"]);
                message.Subject = "Your Appointment  has been saved";
                message.Body = "Name:" + txtFirstName.Text + "<br/>" + "Your Appointment  has been saved on " + txtAppointmentDate.Text + "" + ddlAppointmentTime.SelectedValue + "";
                message.IsBodyHtml = true;
                SmtpClient smtpClient = new SmtpClient(ConfigurationManager.AppSettings["SmtpServer"]);
                smtpClient.Port = Int32.Parse(ConfigurationManager.AppSettings["Port"]);
                smtpClient.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["RegFromMailAddress"], ConfigurationManager.AppSettings["FromEmailPassword"]);
                smtpClient.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                smtpClient.Send(message);
                clearform();
           
                conn.Close();
                if ((Session["FeatureType"]) != null)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ScriptKey", "alert('Your Appointment  has been saved');window.location='featureListing.aspx'; ", true);
                    //   Response.Redirect("~/featureListing.aspx", false);

                }
                else if (Request.QueryString["Municipality"] != null)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "click", "alert('Your Appointment  has been saved');window.location.href ='Search.aspx?Municipality=" + Convert.ToString(Request.QueryString["Municipality"]) + "'", true);
                    //  string targeturl=  "~/Search.aspx?Municipality=" + Convert.ToString(Session["Municipality"]);
                }
                else if (Request.QueryString["MLSID"] != null)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "click", "alert('Your Appointment  has been saved..');window.location.href ='PropertyDetails.aspx?MLSID=" + Convert.ToString(Request.QueryString["MLSID"]) + "&PropertyType=" + Convert.ToString(Request.QueryString["PropertyType"]) + "'", true);
                    //     Response.Redirect("PropertyDetails.aspx?MLSID=" + Convert.ToString(Session["MLSID"]) + "&PropertyType=" + Convert.ToString(Session["Type1"]), false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ScriptKey", "alert('Your Appointment  has been saved');window.location='Search.aspx'; ", true);
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
            txtAppointmentDate.Text = "";
            ddlAppointmentTime.Text = "";
            txtNotes.Text = "";
        }

    }
}