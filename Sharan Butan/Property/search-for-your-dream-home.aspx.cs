using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;

namespace Property
{
    public partial class search_for_your_dream_home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {

                //MailAddress mailFrom = new MailAddress(ConfigurationManager.AppSettings["RegFromMailAddress"].ToString(), "Real Property");
                MailAddress mailToUser = new MailAddress(ConfigurationManager.AppSettings["MailToAddress"].ToString());
                MailAddress mailFrom = new MailAddress(txtEmail.Text);
                MailMessage mailUser = new MailMessage(mailFrom, mailToUser);
                mailUser.IsBodyHtml = true;
                mailUser.Subject = txtFirstName.Text + " :  " + txtLastName.Text;
                mailUser.Body = "Contact Infomation:<br>PhoneNo:" + txtPhone.Text +
                                        "Email:" + txtEmail.Text + "<br><b>Address</b>" + txtStreet.Text + "<br><b>City</b>" + txtCity1.Text + "<br><b>Postal Code</b>" + txtlblPostalCode.Text +
                                      "<br><b>Contry</b>" + txtCountry.Text +
                                      "<br><b> Home Evaluation</b>" +
                                       "<br><b>Province:</b>" + txtProvince.Text +
                                       "<br><b>City:</b>" + txtCity.Text +
                                       "<br><b>Area</b>" + txtArea.Text +
                                       "<br><b>Street Address:</b>" + txtAddress.Text +
                                       "<br><b>Number of Bedrooms::</b>" + txtBedroom.Text +
                                       "<br><b>Number of Bathrooms:</b>" + txtBathroom.Text +
                                       "<br><b>LotSize:</b>" + txtLotSize.Text +
                                       "<br>House type:" + rbHouseType.SelectedItem.Value +
                                        "<br>Garage:" + rbGarage.SelectedItem.Value +

                                        "<br>Garage:" + rbGarage.SelectedItem.Value +
                                      "<br>Approximate Age of Home:" + rbHome.SelectedItem.Value +
                                        "<br>When Do You Plan To Move?:" + rbMovePlan.SelectedItem.Value;
                SmtpClient client = new SmtpClient();//create new smtp client object to send the mail using SMTP protocol
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["RegFromMailAddress"].ToString(), ConfigurationManager.AppSettings["RegPassword"].ToString());
                client.Host = ConfigurationManager.AppSettings["SmtpServer"].ToString();//host server
                client.Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());//port number of host server
                client.EnableSsl = true;//secured connection
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.Send(mailUser);
                clear();
                //  txtMessage.Text = "";
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

        public void clear()
        {
            txtProvince.Text = "";
            txtProvince1.Text = "";
            txtPhone.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtAdditionalInfo.Text = "";
            txtAddress.Text = "";
            txtArea.Text = "";
            txtBathroom.Text = "";
            txtBedroom.Text = "";
            txtCity.Text = "";
            txtCity1.Text = "";
            txtCountry.Text = "";
            txtlblPostalCode.Text = "";
            txtLotSize.Text = "";
            txtStreet.Text = "";

            // txtArea.Text = "";
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
           // Response.Redirect("search_for_your_dream_home.aspx");
            clear();
        }
    }
}
