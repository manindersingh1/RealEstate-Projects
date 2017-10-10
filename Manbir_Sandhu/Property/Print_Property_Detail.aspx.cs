using Property_cls;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace Property
{
    public partial class Print_Property_Detail : System.Web.UI.Page
    {
     
        cls_Property clsobj = new cls_Property();
        #region PageLoad
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Municipality"] = null;
            SiteSetting();
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
            public string Latitude { get; set; }
            public string Longitude { get; set; }
            public string Address { get; set; }
            public void GeoCode()
            {
                StreamReader sr = null;
                string url = String.Format("http://maps.googleapis.com/maps/api/geocode/xml?address=" + Address + "&sensor=false");
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
                    //lblemail.Text = Convert.ToString(dt.Rows[0]["Email"]);
                    //lblmobile.Text = Convert.ToString(dt.Rows[0]["Mobile"]);
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
                img1.ImageUrl = Convert.ToString(dt.Rows[0]["MLSImage"]);
                Image1.ImageUrl = Convert.ToString(dt.Rows[1]["MLSImage"]);
                Image2.ImageUrl = Convert.ToString(dt.Rows[2]["MLSImage"]);
                Image3.ImageUrl = Convert.ToString(dt.Rows[3]["MLSImage"]);
                //rptImages.DataSource = dt;
                //rptImages.DataBind();
                //sliderDiv.Visible = true;
                //sliderImageEmpty.Visible = false;
            }
            else
            {
                //sliderDiv.Visible = false;
                //sliderImageEmpty.Visible = true;
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

                //lblListBrokerage.Text = "Listing Contracted with: " + Convert.ToString(dt.Rows[0]["ListBrokerage"]);
                //if ((Convert.ToString(dt.Rows[0]["PImage"])) == "images/no-image.gif")
                //{
                //    imgge.Visible = false;
                //    img.Visible = true;
                //}
                //imgge.ImageUrl = Convert.ToString(dt.Rows[0]["PImage"]);

                //lblPrice.Text = "$" + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["ListPrice"]));
                //lblListPrice.Text = "$" + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["ListPrice"]));
                //try
                //{
                //    lblStyle.Text = Convert.ToString(dt.Rows[0]["TypeOwn1Out"]) + " " + Convert.ToString(dt.Rows[0]["Style"]);
                //}
                //catch
                //{
                //    lblStyle.Text = Convert.ToString(dt.Rows[0]["TypeOwn1Out"]) + " " + Convert.ToString(dt.Rows[0]["Category"]);
                //}
               // lblMLS.Text = Convert.ToString(dt.Rows[0]["MLS"]);
                Session["Address"] = (CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["address"])) + ", " + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Municipality"])) + " , " + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["PostalCode"])));
                lblAddressBar1.Text = (CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["address"])) + ", " + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Municipality"])) + ", " + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["PostalCode"])) + " , " + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["province"])));
                lblPropertyDescription.Text = Convert.ToString(dt.Rows[0]["remarksforclients"]);
                string extras;
                if (dt.Rows[0]["extras"].ToString().Length > 5)
                    extras = "<b style='float:left; width:80px;'>Extras :</b>" + "<div style='margin:0 0 0 96px;'>" + Convert.ToString(dt.Rows[0]["extras"]) + "</div>";
                else
                    extras = "";

                //lblCommunity.Text = Convert.ToString(dt.Rows[0]["Community"]);

               // lblprovince.Text = CheckNullOrEmptyvalue(dt.Rows[0]["Municipality"].ToString());

                //try
                //{
                //    lblStorey.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Style"]));
                //}
                //catch
                //{
                //    lblStorey.Text = "";
                //}

                //lblSubTypeofhome.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["typeown1out"]));
                string frontONNsew = "";
                try
                {
                    frontONNsew = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["FrontingOnNSEW"]));
                }
                catch
                { }
                //if (frontONNsew.ToString() == "E")
                //    lblfronting.Text = "<b>Fronting On: </b>" + "East";
                //else if (frontONNsew.ToString() == "W")
                //    lblfronting.Text = "<b>Fronting On: </b>" + "West";
                //else if (frontONNsew.ToString() == "N")
                //    lblfronting.Text = "<b>Fronting On: </b>" + "North";
                //else if (frontONNsew.ToString() == "S")
                //    lblfronting.Text = "<b>Fronting On: </b>" + "South";
                try
                {
                    //lbltype.Text = Convert.ToString(dt.Rows[0]["TypeOwn1Out"]) + " " + Convert.ToString(dt.Rows[0]["Style"]);
                }
                catch
                {
                    //lbltype.Text = Convert.ToString(dt.Rows[0]["TypeOwn1Out"]);
                }
                lblgarage.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["GarageType"]));
                lblgarage1.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["GarageType"]));
                try
                {
                    //lblbasement122.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Basement1"]));
                    //lblroom.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Rooms"]));
                    lblbed.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Bedrooms"]));
                    lblBedroom.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Bedrooms"]));
                    lblbath.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Washrooms"]));
                    lblbath1.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Washrooms"]));
                    //lblWashRooms.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Washrooms"]));
                    //lblDirCrossSt.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["DirectionsCrossStreets"]));
                   // lblAreaLabel.Text = "Area";
                    // lblAreaLabel.Text = CheckNullOrEmptyvalue(dt.Rows[0]["areacode"].ToString());
                    //lblAreaValue.Text = CheckNullOrEmptyvalue(dt.Rows[0]["area"].ToString());
                    //lblKitchen.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Kitchens"])) + "+" + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["KitchensPlus"]));
                    //lblfamilyrm.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["FamilyRoom"]));
                    //lblExterior.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Exterior1"]));
                  //  lblsqrfeet.Text = CheckNullOrEmptyvalue(dt.Rows[0]["totalarea"].ToString()) + " " + CheckNullOrEmptyvalue(dt.Rows[0]["totalareacode"].ToString());
                    lblremarks.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Remarksforclients"]));
                }
                catch
                {
                    //lblbasement122.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Basement1"]));
                    //lblAreaLabel.Text = "Office Area";
                    //lblAreaValue.Text = CheckNullOrEmptyvalue(dt.Rows[0]["OfficeAptarea"].ToString()) + " " + CheckNullOrEmptyvalue(dt.Rows[0]["officeaptareacode"].ToString());
                    //lblBedLabel.Text = "Total Area";
                    //lblbed.Text = CheckNullOrEmptyvalue(dt.Rows[0]["totalarea"].ToString()) + " " + CheckNullOrEmptyvalue(dt.Rows[0]["totalareacode"].ToString());
                    //lblBathLabel.Text = "Water";
                    lblbath.Text = CheckNullOrEmptyvalue(dt.Rows[0]["Water"].ToString());
                }

             //   lblMLS1.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["MLS"]));
                //lbltx.Text = dt.Rows[0]["TotalTaxes"].ToString();
               // lblBasement.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["Basement1"]));
               // lblGarageType.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["GarageType"]));
               // lblParking.Text = CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["ParkingSpaces"]));
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
                    //rptImages.DataSource = dt;
                    //rptImages.DataBind();
                    //sliderDiv.Visible = true;
                    //sliderImageEmpty.Visible = false;
                }
                else
                {
                    //sliderDiv.Visible = false;
                    //sliderImageEmpty.Visible = true;
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
                //rptImages.DataSource = dt;
                //rptImages.DataBind();
                //sliderDiv.Visible = true;
                //sliderImageEmpty.Visible = false;
            }
            else
            {
                //sliderDiv.Visible = false;
                //sliderImageEmpty.Visible = true;
            }

            mlsClient = null;
        }

        #endregion Condo Methods


        #region Button Click

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
            }
            catch (Exception ex)
            {
            }
        }
        #endregion Button Click

        protected void AddFavourite_Click(object sender, EventArgs e)
        {
            Session["Type"] = Convert.ToString(Session["PropertySearchType"]);
            if (Session["LoginUser"] == null)
            {
                Response.Redirect("~/Login.aspx", false);
            }
            else
            {
                int UserID = Convert.ToInt32(Session["UserId"]);
            }
        }
        protected void AddAppointment_Click(object sender, EventArgs e)
        {
            Session["Type1"] = Convert.ToString(Session["PropertySearchType"]);
            Response.Redirect("~/ScheduleAppointment.aspx", false);

        }

    }
}