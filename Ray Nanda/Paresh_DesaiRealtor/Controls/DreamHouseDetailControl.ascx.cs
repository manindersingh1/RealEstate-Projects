using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Property_cls;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Text;
using System.Xml;

namespace Property.Controls
{
    public partial class DreamHouseDetailControl : System.Web.UI.UserControl
    {
        #region PageLoad
        cls_Property clsobj = new cls_Property();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            SiteSetting();
            //Session["Municipality"] = null;

            if (Page.IsPostBack == false)
            {

                var DreamHouseId = Convert.ToString(Request.QueryString["Id"]);
                GetImages(Convert.ToInt32(DreamHouseId));
                GetDreamHouseDetail(Convert.ToInt32(DreamHouseId));
                // GetDreamHouseDetail();
            }
        }
        #endregion Page Load



        //public class Adress
        //{
        //    public Adress()
        //    {
        //    }
        //    //Properties
        //    public string Latitude { get; set; }
        //    public string Longitude { get; set; }
        //    public string Address { get; set; }

        //    //The Geocoding here i.e getting the latt/long of address
        //    public void GeoCode()
        //    {
        //        //to Read the Stream
        //        StreamReader sr = null;
        //        //The Google Maps API Either return JSON or XML. We are using XML Here
        //        //Saving the url of the Google API 
        //        string url = String.Format("http://maps.googleapis.com/maps/api/geocode/xml?address=" + Address + "&sensor=false");
        //        //to Send the request to Web Client 
        //        WebClient wc = new WebClient();
        //        try
        //        {
        //            sr = new StreamReader(wc.OpenRead(url));
        //        }
        //        catch (Exception ex)
        //        {
        //            throw new Exception("The Error Occured" + ex.Message);
        //        }
        //        try
        //        {
        //            XmlTextReader xmlReader = new XmlTextReader(sr);
        //            bool latread = false;
        //            bool longread = false;
        //            while (xmlReader.Read())
        //            {
        //                xmlReader.MoveToElement();
        //                switch (xmlReader.Name)
        //                {
        //                    case "lat":
        //                        if (!latread)
        //                        {
        //                            xmlReader.Read();
        //                            this.Latitude = xmlReader.Value.ToString();
        //                            latread = true;
        //                        }
        //                        break;
        //                    case "lng":
        //                        if (!longread)
        //                        {
        //                            xmlReader.Read();
        //                            this.Longitude = xmlReader.Value.ToString();
        //                            longread = true;
        //                        }
        //                        break;
        //                }
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            throw new Exception("An Error Occured" + ex.Message);
        //        }
        //    }
        //}

        //public DataSet GetWalkingScore1(string address, string lat, string lon)
        //{
        //    DataSet dsResult = new DataSet();
        //    try
        //    {
        //        string key = "c02fd15e688b6bffae8913ee64e4ea17";
        //        string url = @"http://api.walkscore.com/score?format=xml&address=1119%8th%20Avenue%20Seattle%20WA%2098101&lat=" + lat + "&lon=" + lon + "&wsapikey=" + key;

        //        //string url = @"http://api.walkscore.com/score?format=xml&address=1119%8th%20Avenue%20Seattle%20WA%2098101&lat=47.6085&lon=-122.3295&wsapikey=" + key;
        //        WebRequest request = WebRequest.Create(url);
        //        using (WebResponse response = (HttpWebResponse)request.GetResponse())
        //        {
        //            using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
        //            {

        //                dsResult.ReadXml(reader);
        //                //Address = dsResult.Tables["result"].Rows[0]["formatted_address"].ToString();
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        string ErrorMsg = ex.Message.ToString();
        //    }
        //    return dsResult;
        //}



        protected void SiteSetting()
        {
            try
            {
                DataTable dt = clsobj.GetSiteSettings();
                DataTable dt1 = clsobj.GetUserInfo();
                if (dt.Rows.Count > 0)
                {
                    lblemail.Text = Convert.ToString(dt.Rows[0]["Email"]);
                    //   lblname.Text = Convert.ToString(dt1.Rows[0]["Firstname"]) + " " + Convert.ToString(dt1.Rows[0]["LastName"]);
                    lblmobile.Text = Convert.ToString(dt.Rows[0]["Mobile"]);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        void GetImages(int DreamHouseId)
        {
            Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
            //DataTable dt = mlsClient.GetImageByMLSID(Convert.ToString(Request.QueryString["MLSID"]));
            
            DataTable dt = clsobj.GetDreamHouseForSlider(DreamHouseId);
            if (dt.Rows.Count > 0)
            {
                rptImages.DataSource = dt;
                rptImages.DataBind();
                sliderDiv.Visible = true;
                sliderImageEmpty.Visible = false;
            }
            else
            {
                sliderDiv.Visible = false;
                sliderImageEmpty.Visible = true;
            }

            mlsClient = null;
        }
        void GetDreamHouseDetail(int DreamHouseId)
        {
           

            DataTable dt = clsobj.GetDreamHouseDetail(DreamHouseId);
            if (dt.Rows.Count > 0)
            {
                lblTitle.Text = Convert.ToString(dt.Rows[0]["Title"]);
                lblAddress.Text = Convert.ToString(dt.Rows[0]["Address"]);
                lblPrice.Text = Convert.ToString(dt.Rows[0]["Price"]);
                lblDescription.Text = Convert.ToString(dt.Rows[0]["Description"]);
            }
        }


        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                cls_Property clsp = new cls_Property();
                clsp.Insert_ContactUS(txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtPhoneno.Text, txtMessage.Text);
                //int indextilldel = Request.Url.AbsoluteUri.IndexOf("Posting");

                string UserEmailId = ConfigurationManager.AppSettings["RegFromMailAddress"].ToString();
                string ToEmailId = ConfigurationManager.AppSettings["ToEmailID"].ToString();
                SendMailToAdmin(UserEmailId);
                SendMailToUser(UserEmailId);

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
            }
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
            mail.Subject = "User Details";
            string body = "";
            body = "<p>Person Name : " + txtFirstName.Text + "</p>";
            body = body + "<p>Email ID : " + txtEmail.Text + "</p>";
            body = body + "<p>" + txtMessage.Text + "</p>";
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
            mail.Subject = "Ray Nanda";
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
       
         

        
    }
}