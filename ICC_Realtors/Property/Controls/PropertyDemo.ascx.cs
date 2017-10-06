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
    public partial class PropertyDemo : System.Web.UI.UserControl
    {
        #region PageLoad
        cls_Property clsobj = new cls_Property();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            SiteSetting();
            Session["Municipality"] = null;

            if (Page.IsPostBack == false)
            {
                Session["PropertySearchType"] = Request.QueryString["PropertyType"].ToString();
               if (Session["PropertySearchType"].ToString().Contains("Residential"))
                {
                    GetImages();
                }
                else if (Session["PropertySearchType"].ToString().Contains("Commercial"))
                {
                    GetCommercialImages();
                }
                else if (Session["PropertySearchType"].ToString().Contains("Condo"))
                {
                    GetCondoImages();
                }
                else
                {
                    Response.Write("Invalid MLS#");
                }
                GetPropertyDetails();
            }
        }
        #endregion Page Load



        public class Adress
        {
            public Adress()
            {
            }
            //Properties
            public string Latitude { get; set; }
            public string Longitude { get; set; }
            public string Address { get; set; }

            //The Geocoding here i.e getting the latt/long of address
            public void GeoCode()
            {
                //to Read the Stream
                StreamReader sr = null;
                //The Google Maps API Either return JSON or XML. We are using XML Here
                //Saving the url of the Google API 
                string url = String.Format("http://maps.googleapis.com/maps/api/geocode/xml?address=" + Address + "&sensor=false");
                //to Send the request to Web Client 
                WebClient wc = new WebClient();
                try
                {
                    sr = new StreamReader(wc.OpenRead(url));
                }
                catch (Exception ex)
                {
                    throw new Exception("The Error Occured" + ex.Message);
                }
                try
                {
                    XmlTextReader xmlReader = new XmlTextReader(sr);
                    bool latread = false;
                    bool longread = false;
                    while (xmlReader.Read())
                    {
                        xmlReader.MoveToElement();
                        switch (xmlReader.Name)
                        {
                            case "lat":
                                if (!latread)
                                {
                                    xmlReader.Read();
                                    this.Latitude = xmlReader.Value.ToString();
                                    latread = true;
                                }
                                break;
                            case "lng":
                                if (!longread)
                                {
                                    xmlReader.Read();
                                    this.Longitude = xmlReader.Value.ToString();
                                    longread = true;
                                }
                                break;
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("An Error Occured" + ex.Message);
                }
            }
        }

        public DataSet GetWalkingScore1(string address, string lat, string lon)
        {
            DataSet dsResult = new DataSet();
            try
            {
                string key = "c02fd15e688b6bffae8913ee64e4ea17";
                string url = @"http://api.walkscore.com/score?format=xml&address=1119%8th%20Avenue%20Seattle%20WA%2098101&lat=" + lat + "&lon=" + lon + "&wsapikey=" + key;

                //string url = @"http://api.walkscore.com/score?format=xml&address=1119%8th%20Avenue%20Seattle%20WA%2098101&lat=47.6085&lon=-122.3295&wsapikey=" + key;
                WebRequest request = WebRequest.Create(url);
                using (WebResponse response = (HttpWebResponse)request.GetResponse())
                {
                    using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
                    {

                        dsResult.ReadXml(reader);
                        //Address = dsResult.Tables["result"].Rows[0]["formatted_address"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                string ErrorMsg = ex.Message.ToString();
            }
            return dsResult;
        }



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
        #region Residential Methods

        void GetImages()
        {
            Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = mlsClient.GetImageByMLSID(Convert.ToString(Request.QueryString["MLSID"]));

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
        private string CheckNullOrEmptyvalue(string pValue)
        {
            string pval1 = "";
            if (pValue == "null" || pValue == "")
                pval1 = "";
            else
                pval1 = pValue;
            return pval1;
        }
        void GetPropertyDetails()
        {
            try
            {
                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();

                DataTable dt = new DataTable();
                if (Session["PropertySearchType"].ToString().Contains("Residential"))
                {
                    dt = mlsClient.GetResidentialProperties(Convert.ToString(Request.QueryString["MLSID"]), "0", "0", "0", "0", "0", "0");
                }
                else if (Session["PropertySearchType"].ToString().Contains("Commercial"))
                {
                    dt = mlsClient.GetAllCommercialProperties(Request.QueryString["MLSID"].ToString(), "0", "0", "0", "0", "0");
                }
                else if (Session["PropertySearchType"].ToString().Contains("Condo"))
                {
                    dt = mlsClient.GetProperties_Condo(Convert.ToString(Request.QueryString["MLSID"]), "0", "0", "0", "0", "0", "0");
                }

                lblListBrokerage.Text = "Listing Contracted with: " + Convert.ToString(dt.Rows[0]["ListBrokerage"]);
                if ((Convert.ToString(dt.Rows[0]["PImage"])) == "images/no-image.gif")
                {
                    imgge.Visible = false;
                    img.Visible = true;
                }
                imgge.ImageUrl = Convert.ToString(dt.Rows[0]["PImage"]);

                lblPrice.Text = "$" + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["ListPrice"]));
                lblListPrice.Text = "$" + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["ListPrice"]));
                try
                {
                    lblStyle.Text = Convert.ToString(dt.Rows[0]["TypeOwn1Out"]) + " " + Convert.ToString(dt.Rows[0]["Style"]);
                }
                catch
                {
                    lblStyle.Text = Convert.ToString(dt.Rows[0]["TypeOwn1Out"]) + " " + Convert.ToString(dt.Rows[0]["Category"]);
                }
                lblMLS.Text = Convert.ToString(dt.Rows[0]["MLS"]);
                Session["Address"] = (CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["address"])) + ", " + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Municipality"])) + " , " + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["PostalCode"])));
                lblAddressBar1.Text = (CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["address"])) + ", " + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Municipality"])) + ", " + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["PostalCode"])) + ", " + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["province"])));
                lblPropertyDescription.Text = Convert.ToString(dt.Rows[0]["remarksforclients"]);
                string extras;
                if (dt.Rows[0]["extras"].ToString().Length > 5)
                    extras = "<b style='float:left; width:80px;'>Extras :</b>" + "<div style='margin:0 0 0 96px;'>" + Convert.ToString(dt.Rows[0]["extras"]) + "</div>";
                else
                    extras = "";

                lblCommunity.Text = Convert.ToString(dt.Rows[0]["Community"]);

                lblprovince.Text = CheckNullOrEmptyvalue(dt.Rows[0]["Municipality"].ToString());

                try
                {
                    lblStorey.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Style"]));
                }
                catch
                {
                    lblStorey.Text = "";
                }

                lblSubTypeofhome.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["typeown1out"]));
                string frontONNsew = "";
                try
                {
                    frontONNsew = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["FrontingOnNSEW"]));
                }
                catch
                { }
                if (frontONNsew.ToString() == "E")
                    lblfronting.Text = "<b>Fronting On: </b>" + "East";
                else if (frontONNsew.ToString() == "W")
                    lblfronting.Text = "<b>Fronting On: </b>" + "West";
                else if (frontONNsew.ToString() == "N")
                    lblfronting.Text = "<b>Fronting On: </b>" + "North";
                else if (frontONNsew.ToString() == "S")
                    lblfronting.Text = "<b>Fronting On: </b>" + "South";
                try
                {
                    lbltype.Text = Convert.ToString(dt.Rows[0]["TypeOwn1Out"]) + " " + Convert.ToString(dt.Rows[0]["Style"]);
                }
                catch
                {
                    lbltype.Text = Convert.ToString(dt.Rows[0]["TypeOwn1Out"]);
                }
                lblgarage.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["GarageType"]));
                try
                {
                    lblbasement122.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Basement1"]));
                    lblroom.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Rooms"]));
                    lblbed.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Bedrooms"]));
                    lblBedroom.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Bedrooms"]));
                    lblbath.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Washrooms"]));
                    lblWashRooms.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Washrooms"]));
                    lblDirCrossSt.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["DirectionsCrossStreets"]));
                    lblAreaLabel.Text = "Area";
                    // lblAreaLabel.Text = CheckNullOrEmptyvalue(dt.Rows[0]["areacode"].ToString());
                    lblAreaValue.Text = CheckNullOrEmptyvalue(dt.Rows[0]["area"].ToString());
                    lblKitchen.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Kitchens"])) + "+" + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["KitchensPlus"]));
                    lblfamilyrm.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["FamilyRoom"]));
                    lblExterior.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Exterior1"]));

                }
                catch
                {
                    lblbasement122.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Basement1"]));
                    lblAreaLabel.Text = "Office Area";
                    lblAreaValue.Text = CheckNullOrEmptyvalue(dt.Rows[0]["OfficeAptarea"].ToString()) + " " + CheckNullOrEmptyvalue(dt.Rows[0]["officeaptareacode"].ToString());
                    lblBedLabel.Text = "Total Area";
                    lblbed.Text = CheckNullOrEmptyvalue(dt.Rows[0]["totalarea"].ToString()) + " " + CheckNullOrEmptyvalue(dt.Rows[0]["totalareacode"].ToString());
                    lblBathLabel.Text = "Water";
                    lblbath.Text = CheckNullOrEmptyvalue(dt.Rows[0]["Water"].ToString());
                }

                lblMLS1.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["MLS"]));
                lbltx.Text = dt.Rows[0]["TotalTaxes"].ToString();
                lblBasement.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Basement1"]));
                lblGarageType.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["GarageType"]));
                lblParking.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["ParkingSpaces"]));

                Adress adrs = new Adress();
                adrs.Address = lblAddressBar1.Text;
                adrs.GeoCode();
                string lat = adrs.Latitude;
                string lng = adrs.Longitude;
                StringBuilder sb = new StringBuilder();
                DataSet ds = GetWalkingScore1(lblAddressBar1.Text, lat, lng);
                if (ds.Tables.Count > 0)
                {
                    imgg.ImageUrl = ds.Tables[0].Rows[0]["logo_url"].ToString();
                    lblwalk.Text = ds.Tables[0].Rows[0]["walkscore"].ToString();

                    lblwalk.PostBackUrl = "http://www.walkscore.com/score/loc/lat=" + lat + "/lng=" + lng + "/?utm_source=http://roccobuyandsell.com&amp;utm_medium=ws_api&amp;utm_campaign=ws_api";




                    //lblwalk.PostBackUrl = "https://www.walkscore.com/score/loc/lat=" + lat + "/lng=" + lng + "/?utm_source=surjitpabley.only4agents.com%20%28Canadian%20Real%20Estate%20Association%29&utm_medium=ws_api&utm_campaign=ws_api";
                    //lblwalk.PostBackUrl = "http://www.walkscore.com/score/loc/lat=" + lat + "/lng=" + lng + " /?utm_source=http://surjitpabley.only4agents.com&amp;utm_medium=ws_api&amp;utm_campaign=ws_api";
                    //sb.Append("");
                    //sb.Append("<div>");
                    //sb.Append("<div>");
                    //sb.Append("<div id='walkscore-div-1'><p><a href='https://www.walkscore.com/' target='_blank'>");
                    //sb.Append("<img src='" + ds.Tables[0].Rows[0]["logo_url"].ToString() + "'><span class='walkscore-scoretext'>" + ds.Tables[0].Rows[0]["walkscore"].ToString() + "</span></a><span id='ws_info'>");
                    //sb.Append("<a target='_blank' href='https://www.redfin.com/how-walk-score-works'></a></span></p></div>");
                    //sb.Append("</div>");
                    //sb.Append("</div>");
                }
                Response.Write(sb);

                int NoOfRoom = Convert.ToInt32("0" + lblroom.Text);
                DataTable dtRooms = new DataTable();
                dtRooms.Columns.Add("Room", typeof(string));
                dtRooms.Columns.Add("Level", typeof(string));
                dtRooms.Columns.Add("RoomDim", typeof(string));
                dtRooms.Columns.Add("RoomDesc", typeof(string));

                for (int i = 0; i < NoOfRoom; i++)
                {
                    int RowIndex = i + 1;
                    string vRoom = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Room" + RowIndex + ""]));
                    string vLevel = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Level" + RowIndex + ""])) != "" ? Convert.ToString(dt.Rows[0]["Level" + RowIndex + ""]) : "0";
                    string vRoomDim = (CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Length"])) != "" ? (Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Length"])) : "0") + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Width"]) != "" ? ("x" + Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Width"])) : "");// Convert.ToString(dt.Rows[0]["Room1Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room1Width"]);
                    string vRoomDesc = (CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Desc1"])) != "" ? (Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Desc1"])) : "----") + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Desc2"]) != "" ? ("," + Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Desc2"])) : "");

                    DataRow dr = dtRooms.NewRow();
                    dr["Room"] = vRoom;
                    dr["Level"] = vLevel;
                    dr["RoomDim"] = vRoomDim;
                    dr["RoomDesc"] = vRoomDesc;
                    dtRooms.Rows.Add(dr);
                    LVroom.DataSource = dtRooms;
                    LVroom.DataBind();
                }


            
            }
            catch (Exception ex)
            { }
        }

        #endregion Residential Methods
        #region Commercial Methods
        void GetCommercialImages()
        {
            try
            {
                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                DataTable dt = mlsClient.GetCommercialPropertiesByMLSID(Convert.ToString(Request.QueryString["MLSID"]));

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
            catch (Exception ex)
            { }
        }

        #endregion Commercial Methods

        #region Condo Methods

        void GetCondoImages()
        {
            Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = mlsClient.GetPropertiesByMLSID_Condo(Convert.ToString(Request.QueryString["MLSID"]));

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

        #endregion Condo Methods


        #region Button Click

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

        protected void AddFavourite_Click(object sender, EventArgs e)
        {
            Session["MLSID"] = lblMLS.Text;
            Session["Type"] = Convert.ToString(Session["PropertySearchType"]);
            if (Session["LoginUser"] == null)
            {
                Response.Redirect("~/Login.aspx", false);
            }
            else
            {
                int UserID = Convert.ToInt32(Session["UserId"]);
                string MLSID = lblMLS.Text;
                int result = clsobj.Insert_Favourite(UserID, MLSID);
                //FavouriteSpan.InnerText = "Favourite Property";
            }

        }

        protected void AddAppointment_Click(object sender, EventArgs e)
        {
            Session["MLSID"] = lblMLS.Text;
            Session["Type1"] = Convert.ToString(Session["PropertySearchType"]);

            Response.Redirect("~/ScheduleAppointment.aspx", false);

        }

         

        
    }
}