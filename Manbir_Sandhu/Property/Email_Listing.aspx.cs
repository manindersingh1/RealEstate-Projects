using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;
using System.Text;
using System.Data;

namespace Property
{
    public partial class Email_Listing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            Session["QueryString"] = Request.QueryString["PropertyType"];
            Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = new DataTable();
            if (Convert.ToString(Session["QueryString"]) == "IDXImagesResidential" || Convert.ToString(Session["QueryString"]) == "VoxResidential")
            {
                dt = mlsClient.GetResidentialProperties(Convert.ToString(Request.QueryString["MLSID"]), "0", "0", "0", "0", "0", "0");
            }
            else if (Convert.ToString(Session["QueryString"]) == "IDXImagesCommercial" || Convert.ToString(Session["QueryString"]) == "VoxCommercial")
            {
                dt = mlsClient.GetAllCommercialProperties(Request.QueryString["MLSID"].ToString(), "0", "0", "0", "0", "0");
            }
            else if (Convert.ToString(Session["QueryString"]) == "IDXImagesCondo" || Convert.ToString(Session["QueryString"]) == "VoxCondo")
            {
                dt = mlsClient.GetProperties_Condo(Convert.ToString(Request.QueryString["MLSID"]), "0", "0", "0", "0", "0", "0");
            }
            Property.InnerHtml = (Convert.ToString(dt.Rows[0]["address"]) != "null" && (Convert.ToString(dt.Rows[0]["address"]) != "") ? (Convert.ToString(dt.Rows[0]["address"])) : "") + (Convert.ToString(dt.Rows[0]["province"]) != "null" && (Convert.ToString(dt.Rows[0]["province"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["province"])) : "");
            if (!IsPostBack)
            {
                FillCapctha();
            }
        }
        protected void btnVerify_Click(object sender, EventArgs e)
        {
            if (txtCaptcha.Text.ToString() == Session["captcha"].ToString())
            {
                MailAddress mailToUser = new MailAddress(txtFriendEmail.Text);
                MailAddress mailFrom = new MailAddress(ConfigurationManager.AppSettings["RegFromMailAddress"].ToString());
                MailMessage mailUser = new MailMessage(mailFrom, mailToUser);
                mailUser.IsBodyHtml = true;
                mailUser.Subject = txtSubject.Text;
                mailUser.Body = GetPropertyDetails();
                SmtpClient client = new SmtpClient();//create new smtp client object to send the mail using SMTP protocol
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["RegFromMailAddress"].ToString(), ConfigurationManager.AppSettings["RegPassword"].ToString());
                client.Host = ConfigurationManager.AppSettings["SmtpServer"].ToString();//host server
                client.Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());//port number of host server
                client.EnableSsl = true;//secured connection
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.Send(mailUser);
                //  txtMessage.Text = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Congrts!", "alert('Your E-mail has been sent sucessfully - Thank You');", true);
                txtCaptcha.Text = "";
                txtFriendEmail.Text = "";
                txtComments.Text = "";
                txtSubject.Text = "";
                return;
            }
            else
            {
                lblErrorMessage.ForeColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "InValid Text";
            }
        }
        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            FillCapctha();
        }
        public string GetPropertyDetails()
        {
            Session["QueryString"] = Request.QueryString["PropertyType"];
            StringBuilder html = new StringBuilder();
            DataTable dt = new DataTable();
            DataTable dtimages = new DataTable();
            Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
            Property1.MLSDataWebServiceSoapClient mlsClientimages = new Property1.MLSDataWebServiceSoapClient();

            if (Convert.ToString(Session["QueryString"]) == "IDXImagesResidential" || Convert.ToString(Session["QueryString"]) == "VoxResidential")
            {
                dt = mlsClient.GetResidentialProperties(Convert.ToString(Request.QueryString["MLSID"]), "0", "0", "0", "0", "0", "0");

            }
            else if (Convert.ToString(Session["QueryString"]) == "IDXImagesCommercial" || Convert.ToString(Session["QueryString"]) == "VoxCommercial")
            {
                dt = mlsClient.GetAllCommercialProperties(Request.QueryString["MLSID"].ToString(), "0", "0","0", "0", "0");

            }
            else if (Convert.ToString(Session["QueryString"]) == "IDXImagesCondo" || Convert.ToString(Session["QueryString"]) == "VoxCondo")
            {
                dt = mlsClient.GetProperties_Condo(Convert.ToString(Request.QueryString["MLSID"]), "0", "0", "0", "0", "0", "0");
            }
            if (Convert.ToString(Session["QueryString"]) == "IDXImagesResidential")
            {
                dtimages = mlsClientimages.GetImageByMLSID(Convert.ToString(Request.QueryString["MLSID"]));
            }
            else if (Convert.ToString(Session["QueryString"]) == "IDXImagesCommercial" || Convert.ToString(Session["QueryString"]) == "VoxCommercial")
            {
                dtimages = mlsClientimages.GetCommercialPropertiesByMLSID(Convert.ToString(Request.QueryString["MLSID"]));
            }
            else if (Convert.ToString(Session["QueryString"]) == "IDXImagesCondo")
            {
                dtimages = mlsClientimages.GetPropertiesByMLSID_Condo(Convert.ToString(Request.QueryString["MLSID"]));
            }
            if (dt.Rows.Count > 0)
            {

                html.AppendLine("<div id='divEmail' style='width:100%; float:left;'>");
                html.AppendLine("<h2 style='font-weight:bold; font-size:16px;'>Manbir Sandhu for Property ID  " + dt.Rows[0]["MLS"].ToString() + ";</h2>");
                html.AppendLine("<h2 style='font-weight: bold; font-size: 16px;'>Message Received From:</h2>");
                html.AppendLine("<p style='float: left; margin: 0 40px 0 0;'>Phone Number:</p><span style='float:left;'>647-403-4855</span><br/>");
                html.AppendLine("<h2 style='font-weight: bold; font-size: 16px;'>Message:</h2>");
                html.AppendLine("<p>Please take a look at Property ID# " + dt.Rows[0]["MLS"].ToString() + " located at " + dt.Rows[0]["Address"].ToString() + "</p>");
                html.AppendLine("<h2 style='font-weight:bold; font-size:16px;'>Referring Page:</h2>");
                html.AppendLine("<p>http://manbirsandhu.com</p>");
                html.AppendLine("<h2 style='font-weight:bold; font-size:16px;'>Property Information:</h2>");
                html.AppendLine("<div style='float:left; width:30%;'>");
                html.AppendLine("<h2 style='font-weight:bold; font-size:13px; margin:0px;'>" + dt.Rows[0]["ListPrice"].ToString() + "<br />");
                //html.AppendLine("470 Chrysler Dr # 20, Brampton, L6S0C1<br/>Property ID: " + dt.Rows[0]["MLS"].ToString() + "</h2>");
                html.AppendLine("</div>");
                html.AppendLine("<div style='float:left;'>");
                html.AppendLine("<p style='float:left; margin:0 12px 0 0; font-weight:bold;'>Beds:</p><span style='float:left; margin:0 30px 0 0;'>" + dt.Rows[0]["BedRooms"].ToString() + "</span>");
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
                html.AppendLine("<p>For more information visit <a href='#'>http://manbirsandhu.only4agents.ca</a> </p></div>");
                html.AppendLine("<div style='float:left; padding-left:12px;'>");
                html.AppendLine("<p style='margin:0px;'>Listed By</p><br/><p>Manbir Sandhu<br/>Sales Representative</p>");
                //html.AppendLine(" <h2 style='font-size:16px;'>Leading Edge Realty Inc.</h2>");
                //html.AppendLine("<p style='margin:0px;'>2250 BOVAIRD DRIVE EAST UNIT # 502 BRAMPTON ON L6R 0W3 </p>");
                html.AppendLine("<p style='float:left; margin:0 40px 0 0; font-weight:bold;'>Cell::</p><span style='float:left;'>647-403-4855</span><br/>'");
                //html.AppendLine("<p style='float:left; margin:0 40px 0 0; font-weight:bold;'>Office:</p><span style='float:left;'>905-497-2300</span><br/>");
                //html.AppendLine("<p style='float:left; margin:0 40px 0 0; font-weight:bold;'>Office Fax:</p><span style='float:left;'>905-497-0400</span><br/>'");
                html.AppendLine("<p style='float:left; margin:0 40px 0 0; font-weight:bold;'>E-mail:</p><span style='float:left;'>manbirsandhu07@gmail.com</span><br/>");
                html.AppendLine("<p style='float:left; margin:0 40px 0 0; font-weight:bold;'>Website:</p><span style='float:left;'>http:/manbirsandhu.only4agents.com</span><br/></div></div>");
                html.AppendLine("<div style='float:left; width:100%;'>");
                html.AppendLine("<div style='float:left; margin:0 0 0 250px; border-right:1px solid grey; padding-right:7px; width:400px; border-top:1px solid grey;>");
                html.AppendLine("<h2 style='font-size:16px;'>Property Details</h2>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>ID:</p><span style='float:left;'>" + dt.Rows[0]["MLS"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Style:</p><span style='float:left;'>" + dt.Rows[0]["PType"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Beds:</p><span style='float:left;'>" + dt.Rows[0]["BedRooms"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Baths:</p><span style='float:left;'>" + dt.Rows[0]["WashRooms"].ToString() + "   (Full: 2   3/4: 1   1/2: 1   Other: 0)</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Washrooms:</p><span style='float:left;'>" + dt.Rows[0]["WashRooms"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Status:</p><span style='float:left;'>Active</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Total Rooms:</p><span style='float:left;'>" + dt.Rows[0]["Rooms"].ToString() + "</span></div>");
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
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Bedroom 5</p><span style='float:left;'>" + dt.Rows[0]["Room5Length"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Kitchen </p><span style='float:left;'>" + dt.Rows[0]["Room3Length"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Living / Dining Room </p><span style='float:left;'>" + dt.Rows[0]["Room1Length"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Den / Office</p><span style='float:left;'>" + dt.Rows[0]["Room5Length"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Dining Room</p><span style='float:left;'>" + dt.Rows[0]["Room2Length"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Family Room</p><span style='float:left;'>" + dt.Rows[0]["Room5Length"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Kitchen</p><span style='float:left;'>" + dt.Rows[0]["Room5Length"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Living Room</p><span style='float:left;'>" + dt.Rows[0]["Room5Length"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Bathroom 2</p><span style='float:left;'>" + dt.Rows[0]["Room5Length"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Bathroom 3</p><span style='float:left;'>" + dt.Rows[0]["Room5Length"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Bathroom 4</p><span style='float:left;'>" + dt.Rows[0]["Room5Length"].ToString() + "</span></div>");
                html.AppendLine("<div style='float:left; width:100%;'><p style='float:left; margin:0 80px 0 0; width:20%;'>Master Bedroom</p><span style='float:left;'>" + dt.Rows[0]["Room5Length"].ToString() + "</span></div> </div>");
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
            }
            //literal.Text = html.ToString();
            return html.ToString();
        }
        void FillCapctha()
        {
            try
            {
                Random random = new Random();
                string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                StringBuilder captcha = new StringBuilder();
                for (int i = 0; i < 6; i++)
                    captcha.Append(combination[random.Next(combination.Length)]);
                imgCaptcha.Text = captcha.ToString();
                Session["captcha"] = captcha.ToString();
                imgCaptcha.Text = captcha.ToString();
            }
            catch
            {
                throw;
            }
        }
    }
}