using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Property_cls;

namespace Property.Controls
{
    public partial class PropertyDetailsControl : System.Web.UI.UserControl
    {
        #region PageLoad
        cls_Property clsobj = new cls_Property();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Municipality"] = null;
            this.Page.Title = "kahlonteam Properties:Property Details";
            //txtAddress.Text = Convert.ToString(Session["Address"]);
            if (Page.IsPostBack == false)
            {
                //Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                //DataTable dt = mlsClient.GetPropertyTypesByMLSID(Convert.ToString(Request.QueryString["MLSID"]));
                Session["PropertySearchType"] = Request.QueryString["PropertyType"].ToString();
                if (Session["PropertySearchType"].ToString().Contains("Residential"))
                {
                    GetImages();
                    GetPropertyDetails();
                }
                else if (Session["PropertySearchType"].ToString().Contains("Commercial"))
                {
                    GetCommercialImages();
                    GetCommercialPropertyDetails();
                }
                else if (Session["PropertySearchType"].ToString().Contains("Condo"))
                {
                    GetCondoImages();
                    GetCondoPropertyDetails();
                }
                else
                {
                    Response.Write("Invalid MLS#");
                }
            }
        }
        #endregion Page Load
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
            rptPropertyImages.DataSource = dt;
            rptPropertyImages.DataBind();

            mlsClient = null;
        }

        void GetPropertyDetails()
        {
            try
            {
                Commercial.Visible = false;
                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                DataTable dt = mlsClient.GetResidentialProperties(Convert.ToString(Request.QueryString["MLSID"]), "0", "0", "0", "0", "0", "0");
                lblListBrokerage.Text = "Listing Contracted with: " + Convert.ToString(dt.Rows[0]["ListBrokerage"]);
                lblPrice.Text = (Convert.ToString(dt.Rows[0]["ListPrice"]) != "" && Convert.ToString(dt.Rows[0]["ListPrice"]) != "null" ? ("$" + Convert.ToString(dt.Rows[0]["ListPrice"])) : "");
                lblListPrice.Text = (Convert.ToString(dt.Rows[0]["ListPrice"]) != "" && Convert.ToString(dt.Rows[0]["ListPrice"]) != "null" ? ("$" + Convert.ToString(dt.Rows[0]["ListPrice"])) : "");
                lblStyle.Text = Convert.ToString(dt.Rows[0]["TypeOwn1Out"]) + " " + Convert.ToString(dt.Rows[0]["Style"]);
                lblMLS.Text = Convert.ToString(dt.Rows[0]["MLS"]);
                //lblPageH1.Text = Convert.ToString(dt.Rows[0]["address"].ToString() + ", " + Convert.ToString(dt.Rows[0]["province"]) + ", " + Convert.ToString(dt.Rows[0]["PostalCode"]));
                //lblPageh2.Text = lblPageH1.Text;
                string PostalCode = Convert.ToString(dt.Rows[0]["PostalCode"]);
                PostalCode = PostalCode.Insert(3, " ");
                Session["Address"] = ((Convert.ToString(dt.Rows[0]["address"]) != "" && Convert.ToString(dt.Rows[0]["address"]) != "null" ? Convert.ToString(dt.Rows[0]["address"]) : "") + (Convert.ToString(dt.Rows[0]["province"]) != "null" && Convert.ToString(dt.Rows[0]["province"]) != "" ? (", " + Convert.ToString(dt.Rows[0]["province"])) : "") + (PostalCode != "" && PostalCode != "null" ? (", " + PostalCode) : ""));
                lblAddressBar1.Text = ((Convert.ToString(dt.Rows[0]["address"]) != "" && Convert.ToString(dt.Rows[0]["address"]) != "null" ? Convert.ToString(dt.Rows[0]["address"]) : "") + (Convert.ToString(dt.Rows[0]["Municipality"]) != "" && Convert.ToString(dt.Rows[0]["Municipality"]) != "null" ? "," + Convert.ToString(dt.Rows[0]["Municipality"]) : "") + (PostalCode != "" && PostalCode != "null" ? (", " + PostalCode) : "") + (Convert.ToString(dt.Rows[0]["province"]) != "null" && Convert.ToString(dt.Rows[0]["province"]) != "" ? (", " + Convert.ToString(dt.Rows[0]["province"])) : ""));
                lblPropertyDescription.Text = Convert.ToString(dt.Rows[0]["remarksforclients"]);
                string extras;
                if (dt.Rows[0]["extras"].ToString().Length > 5)
                    extras = "<b style='float:left; width:80px;'>Extras :</b>" + "<div style='margin:0 0 0 96px;'>" + Convert.ToString(dt.Rows[0]["extras"]) + "</div>";
                else
                    extras = "";

                //lblExtraInformation.Text = extras;
                //lblCommunity.Text = Convert.ToString(dt.Rows[0]["Community"]) + "" + Convert.ToString(dt.Rows[0]["Map"]) + "-" + Convert.ToString(dt.Rows[0]["MapColumn"]) + "-" + Convert.ToString(dt.Rows[0]["MapRow"]);
                //// lblCommunityCode.Text = Convert.ToString(dt.Rows[0]["CommunityCode"]);
                //lblLegalDescription.Text = Convert.ToString(dt.Rows[0]["LegalDescription"]);
                lbladdrss.Text = Convert.ToString(dt.Rows[0]["Address"]) != "" && Convert.ToString(dt.Rows[0]["Address"]) != "null" ? (Convert.ToString(dt.Rows[0]["Address"])) : "";
                //  lblArea.Text = Convert.ToString(dt.Rows[0]["Area"]) != "" && Convert.ToString(dt.Rows[0]["Area"]) != "null" ? (Convert.ToString(dt.Rows[0]["Area"])) : "";
                lblprovince.Text = Convert.ToString(dt.Rows[0]["province"]) != "" && Convert.ToString(dt.Rows[0]["province"]) != "null" ? (Convert.ToString(dt.Rows[0]["province"])) : "";
                lblPostalCode.Text = Convert.ToString(dt.Rows[0]["PostalCode"]) != "" && Convert.ToString(dt.Rows[0]["PostalCode"]) != "null" ? (Convert.ToString(dt.Rows[0]["PostalCode"])) : "";
                lblMunicipality.Text = Convert.ToString(dt.Rows[0]["Municipality"]) != "" && Convert.ToString(dt.Rows[0]["Municipality"]) != "null" ? (Convert.ToString(dt.Rows[0]["Municipality"])) : "";
                if (dt.Rows[0]["Taxes"].ToString() != "null" && dt.Rows[0]["Taxes"].ToString() != "")
                {
                    lblTaxes.Text = Convert.ToString(dt.Rows[0]["Taxes"]);
                }
                else
                {
                    lblTaxes.Text = "0";
                }
                lblSale.Text = Convert.ToString(dt.Rows[0]["SaleLease"]) != "" && Convert.ToString(dt.Rows[0]["SaleLease"]) != "null" ? (Convert.ToString(dt.Rows[0]["SaleLease"])) : "";
                if (dt.Rows[0]["TaxYear"].ToString() != "null" && dt.Rows[0]["TaxYear"].ToString() != "")
                {
                    lblTaxesYr.Text = Convert.ToString(dt.Rows[0]["TaxYear"]);
                }
                else
                {
                    lblTaxesYr.Text = "0";
                }
                lblTaxesYr.Text = Convert.ToString(dt.Rows[0]["TaxYear"]);
                lblStorey.Text = Convert.ToString(dt.Rows[0]["Style"]) != "" && Convert.ToString(dt.Rows[0]["Style"]) != "null" ? (Convert.ToString(dt.Rows[0]["Style"])) : "";
                //lblSPIS.Text = "<b>SPIS:</b>" + Convert.ToString(dt.Rows[0]["SellerPropertyInfoStatement"]);
                lblSubTypeofhome.Text = Convert.ToString(dt.Rows[0]["typeown1out"]) != "" && Convert.ToString(dt.Rows[0]["typeown1out"]) != "null" ? (Convert.ToString(dt.Rows[0]["typeown1out"])) : "";
                string frontONNsew = Convert.ToString(dt.Rows[0]["FrontingOnNSEW"]) != "" && Convert.ToString(dt.Rows[0]["FrontingOnNSEW"]) != "null" ? (Convert.ToString(dt.Rows[0]["FrontingOnNSEW"])) : "";
                if (frontONNsew.ToString() == "E")
                    lblfronting.Text = "<b>Fronting On: </b>" + "East";
                else if (frontONNsew.ToString() == "W")
                    lblfronting.Text = "<b>Fronting On: </b>" + "West";
                else if (frontONNsew.ToString() == "N")
                    lblfronting.Text = "<b>Fronting On: </b>" + "North";
                else if (frontONNsew.ToString() == "S")
                    lblfronting.Text = "<b>Fronting On: </b>" + "South";
                lblroom.Text = Convert.ToString(dt.Rows[0]["Rooms"]) != "" && Convert.ToString(dt.Rows[0]["Rooms"]) != "null" ? (Convert.ToString(dt.Rows[0]["Rooms"])) : "";
                lblBedroom.Text = Convert.ToString(dt.Rows[0]["Bedrooms"]) != "" && Convert.ToString(dt.Rows[0]["Bedrooms"]) != "null" ? (Convert.ToString(dt.Rows[0]["Bedrooms"])) : "";
                lblWashRooms.Text = Convert.ToString(dt.Rows[0]["Washrooms"]) != "" && Convert.ToString(dt.Rows[0]["typeown1out"]) != "null" ? (Convert.ToString(dt.Rows[0]["typeown1out"])) : "";
                lblMLS1.Text = Convert.ToString(dt.Rows[0]["MLS"]) != "" && Convert.ToString(dt.Rows[0]["MLS"]) != "null" ? (Convert.ToString(dt.Rows[0]["MLS"])) : "";

                lblDirCrossSt.Text = Convert.ToString(dt.Rows[0]["DirectionsCrossStreets"]) != "" && Convert.ToString(dt.Rows[0]["DirectionsCrossStreets"]) != "null" ? (Convert.ToString(dt.Rows[0]["DirectionsCrossStreets"])) : "";
                lblLot.Text = "<b>Lots: </b>" + ((Convert.ToString(dt.Rows[0]["LotFront"]) != "null" && (Convert.ToString(dt.Rows[0]["LotFront"]) != "") ? (Convert.ToString(dt.Rows[0]["LotFront"])) : "") + (Convert.ToString(dt.Rows[0]["LotDepth"]) != "null" && (Convert.ToString(dt.Rows[0]["LotDepth"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["LotDepth"])) : "") + " " + (Convert.ToString(dt.Rows[0]["LotSizeCode"]) != "null" && (Convert.ToString(dt.Rows[0]["LotSizeCode"]) != "") ? (Convert.ToString(dt.Rows[0]["LotSizeCode"])) : ""));
                lblKitchen.Text = Convert.ToString(dt.Rows[0]["Kitchens"]) != "null" && (Convert.ToString(dt.Rows[0]["Kitchens"]) != "") ? (Convert.ToString(dt.Rows[0]["Kitchens"])) : "" + "+" + Convert.ToString(dt.Rows[0]["KitchensPlus"]) != "null" && (Convert.ToString(dt.Rows[0]["KitchensPlus"]) != "") ? (Convert.ToString(dt.Rows[0]["KitchensPlus"])) : "";
                lblfamilyrm.Text = Convert.ToString(dt.Rows[0]["FamilyRoom"]) != "null" && (Convert.ToString(dt.Rows[0]["FamilyRoom"]) != "") ? (Convert.ToString(dt.Rows[0]["FamilyRoom"])) : "";
                lblBasement.Text = Convert.ToString(dt.Rows[0]["Basement1"]) != "null" && (Convert.ToString(dt.Rows[0]["Basement1"]) != "") ? (Convert.ToString(dt.Rows[0]["Basement1"])) : "" + " " + Convert.ToString(dt.Rows[0]["Basement2"]) != "null" && (Convert.ToString(dt.Rows[0]["Basement2"]) != "") ? (Convert.ToString(dt.Rows[0]["Basement2"])) : "";
                lblFireplaces.Text = Convert.ToString(dt.Rows[0]["FireplaceStove"]) != "null" && (Convert.ToString(dt.Rows[0]["FireplaceStove"]) != "") ? (Convert.ToString(dt.Rows[0]["FireplaceStove"])) : "";
                lblHeat.Text = Convert.ToString(dt.Rows[0]["HeatSource"]) != "null" && (Convert.ToString(dt.Rows[0]["HeatSource"]) != "") ? (Convert.ToString(dt.Rows[0]["HeatSource"])) : "" + " " + Convert.ToString(dt.Rows[0]["HeatType"]) != "null" && (Convert.ToString(dt.Rows[0]["HeatType"]) != "") ? (Convert.ToString(dt.Rows[0]["HeatType"])) : "";
                lblApxAge.Text = Convert.ToString(dt.Rows[0]["ApproxAge"]) != "null" && (Convert.ToString(dt.Rows[0]["ApproxAge"]) != "") ? (Convert.ToString(dt.Rows[0]["ApproxAge"])) : "0";
                // lblApxSqft.Text = Convert.ToString(dt.Rows[0]["ApproxSquareFootage"]);
                // lblAirConditioning.Text = Convert.ToString(dt.Rows[0]["AirConditioning"]);
                lblExterior.Text = Convert.ToString(dt.Rows[0]["Exterior1"]) != "null" && (Convert.ToString(dt.Rows[0]["Exterior1"]) != "") ? (Convert.ToString(dt.Rows[0]["Exterior1"])) : "";
                string drive = Convert.ToString(dt.Rows[0]["Drive"]) != "null" && (Convert.ToString(dt.Rows[0]["Drive"]) != "") ? (Convert.ToString(dt.Rows[0]["Drive"])) : "";
                lblDrive.Text = "<b>Drive: </b>" + drive;
                lblGarageType.Text = Convert.ToString(dt.Rows[0]["GarageType"]) != "null" && (Convert.ToString(dt.Rows[0]["GarageType"]) != "") ? (Convert.ToString(dt.Rows[0]["GarageType"])) : "" + "/" + Convert.ToString(dt.Rows[0]["GarageSpaces"]) != "null" && (Convert.ToString(dt.Rows[0]["GarageSpaces"]) != "") ? (Convert.ToString(dt.Rows[0]["GarageSpaces"])) : "";
                lblParking.Text = Convert.ToString(dt.Rows[0]["ParkingSpaces"]) != "null" && (Convert.ToString(dt.Rows[0]["ParkingSpaces"]) != "") ? (Convert.ToString(dt.Rows[0]["ParkingSpaces"])) : "";
                string pool = Convert.ToString(dt.Rows[0]["pool"]) != "null" && (Convert.ToString(dt.Rows[0]["pool"]) != "") ? (Convert.ToString(dt.Rows[0]["pool"])) : "";
                lblPool.Text = "<b>Pool: </b>" + pool;
                //  lblCabelTV.Text = Convert.ToString(dt.Rows[0]["CableTVIncluded"]);
                //lblHydro.Text = Convert.ToString(dt.Rows[0]["HydroIncluded"]);
                lblWater.Text = Convert.ToString(dt.Rows[0]["water"]) != "null" && (Convert.ToString(dt.Rows[0]["water"]) != "") ? (Convert.ToString(dt.Rows[0]["water"])) : "";
                //lblWaterSupply.Text = Convert.ToString(dt.Rows[0]["WaterSupplyTypes"]);
                string Sewers = Convert.ToString(dt.Rows[0]["Sewers"]) != "null" && (Convert.ToString(dt.Rows[0]["Sewers"]) != "") ? (Convert.ToString(dt.Rows[0]["Sewers"])) : "";
                if (Sewers.ToLower() == "Sewers".ToLower())
                    lblSewers.Text = "<b>Sewer: </b>" + "Yes";
                else
                    lblSewers.Text = "<b>Sewer: </b>" + "No";
                lblSpecificDesignation.Text = Convert.ToString(dt.Rows[0]["SpecialDesignation1"]) != "null" && (Convert.ToString(dt.Rows[0]["SpecialDesignation1"]) != "") ? (Convert.ToString(dt.Rows[0]["SpecialDesignation1"])) : "";


                if (Convert.ToString(dt.Rows[0]["PropertyFeatures1"]) != "null")
                {
                    PropertyFeature1.Visible = true;
                    lblPropertyFeature1.Text = Convert.ToString(dt.Rows[0]["PropertyFeatures1"]);
                }
                if (Convert.ToString(dt.Rows[0]["PropertyFeatures2"]) != "null")
                {
                    PropertyFeature2.Visible = true;
                    lblPropertyFeature2.Text = Convert.ToString(dt.Rows[0]["PropertyFeatures2"]);
                }
                if (Convert.ToString(dt.Rows[0]["PropertyFeatures3"]) != "null")
                {
                    PropertyFeature3.Visible = true;
                    lblPropertyFeature3.Text = Convert.ToString(dt.Rows[0]["PropertyFeatures3"]);
                }
                if (Convert.ToString(dt.Rows[0]["PropertyFeatures4"]) != "null")
                {
                    PropertyFeature4.Visible = true;
                    lblPropertyFeature4.Text = Convert.ToString(dt.Rows[0]["PropertyFeatures4"]);
                }
                if (Convert.ToString(dt.Rows[0]["PropertyFeatures5"]) != "null")
                {
                    PropertyFeature5.Visible = true;
                    lblPropertyFeature5.Text = Convert.ToString(dt.Rows[0]["PropertyFeatures5"]);
                }
                if (Convert.ToString(dt.Rows[0]["PropertyFeatures6"]) != "null")
                {
                    PropertyFeature6.Visible = true;
                    lblPropertyFeature6.Text = Convert.ToString(dt.Rows[0]["PropertyFeatures6"]);
                }
                int NoOfRoom = Convert.ToInt32(lblroom.Text);
                DataTable dtRooms = new DataTable();
                dtRooms.Columns.Add("Room", typeof(string));
                dtRooms.Columns.Add("Level", typeof(string));
                dtRooms.Columns.Add("RoomDim", typeof(string));
                dtRooms.Columns.Add("RoomDesc", typeof(string));

                for (int i = 0; i < NoOfRoom; i++)
                {
                    int RowIndex = i + 1;
                    string vRoom = Convert.ToString(dt.Rows[0]["Room" + RowIndex + ""]) != "null" && (Convert.ToString(dt.Rows[0]["Room" + RowIndex + ""]) != "") ? (Convert.ToString(dt.Rows[0]["Room" + RowIndex + ""])) : "";
                    string vLevel = Convert.ToString(dt.Rows[0]["Level" + RowIndex + ""]) != "null" && (Convert.ToString(dt.Rows[0]["Level" + RowIndex + ""]) != "") ? (Convert.ToString(dt.Rows[0]["Level" + RowIndex + ""])) : "0";
                    string vRoomDim = (Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Width"])) : "");// Convert.ToString(dt.Rows[0]["Room1Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room1Width"]);
                    string vRoomDesc = (Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room" + RowIndex + "Desc2"])) : "");

                    DataRow dr = dtRooms.NewRow();
                    dr["Room"] = vRoom;
                    dr["Level"] = vLevel;
                    dr["RoomDim"] = vRoomDim;
                    dr["RoomDesc"] = vRoomDesc;
                    dtRooms.Rows.Add(dr);
                }

                LVroom.DataSource = dtRooms;
                LVroom.DataBind();
                //lblRoom1.Text = Convert.ToString(dt.Rows[0]["Room1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room1"])) : "";
                //lblLevel1.Text = Convert.ToString(dt.Rows[0]["Level1"]) != "null" && (Convert.ToString(dt.Rows[0]["Level1"]) != "") ? (Convert.ToString(dt.Rows[0]["Level1"])) : "0";
                //lblRoom1Dim.Text = (Convert.ToString(dt.Rows[0]["Room1Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room1Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room1Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room1Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room1Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room1Width"])) : "");// Convert.ToString(dt.Rows[0]["Room1Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room1Width"]);
                //lblRoom1Desc.Text = (Convert.ToString(dt.Rows[0]["Room1Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room1Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room1Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room1Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room1Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room1Desc2"])) : "");

                //lblRoom2.Text = Convert.ToString(dt.Rows[0]["Room2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room2"]) != "") ? (Convert.ToString(dt.Rows[0]["Room2"])) : "";
                //lblLevel2.Text = Convert.ToString(dt.Rows[0]["Level2"]) != "null" && (Convert.ToString(dt.Rows[0]["Level2"]) != "") ? (Convert.ToString(dt.Rows[0]["Level2"])) : "0";
                //lblRoom2Dim.Text = (Convert.ToString(dt.Rows[0]["Room2Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room2Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room2Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room2Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room2Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room2Width"])) : "");
                //lblRoom2Desc.Text = (Convert.ToString(dt.Rows[0]["Room2Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room2Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room2Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room2Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room2Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room2Desc2"])) : "");

                //lblRoom3.Text = Convert.ToString(dt.Rows[0]["Room3"]) != "null" && (Convert.ToString(dt.Rows[0]["Room3"]) != "") ? (Convert.ToString(dt.Rows[0]["Room3"])) : "";
                //lblLevel3.Text = Convert.ToString(dt.Rows[0]["Level3"]) != "null" && (Convert.ToString(dt.Rows[0]["Level3"]) != "") ? (Convert.ToString(dt.Rows[0]["Level3"])) : "0";
                //lblRoom3Dim.Text = (Convert.ToString(dt.Rows[0]["Room3Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room3Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room3Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room3Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room3Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room3Width"])) : "");
                //lblRoom3Desc.Text = (Convert.ToString(dt.Rows[0]["Room3Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room3Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room3Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room3Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room3Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room3Desc2"])) : "");

                //lblRoom4.Text = Convert.ToString(dt.Rows[0]["Room4"]) != "null" && (Convert.ToString(dt.Rows[0]["Room4"]) != "") ? (Convert.ToString(dt.Rows[0]["Room4"])) : "";
                //lblLevel4.Text = Convert.ToString(dt.Rows[0]["Level4"]) != "null" && (Convert.ToString(dt.Rows[0]["Level4"]) != "") ? (Convert.ToString(dt.Rows[0]["Level4"])) : "0";
                //lblRoom4Dim.Text = (Convert.ToString(dt.Rows[0]["Room4Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room4Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room4Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room4Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room4Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room4Width"])) : "");// Convert.ToString(dt.Rows[0]["Room4Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room4Width"]);
                //lblRoom4Desc.Text = (Convert.ToString(dt.Rows[0]["Room4Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room4Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room4Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room4Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room4Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room4Desc2"])) : "");// Convert.ToString(dt.Rows[0]["Room4Desc1"]) + "," + Convert.ToString(dt.Rows[0]["Room4Desc2"]);

                //lblRoom5.Text = Convert.ToString(dt.Rows[0]["Room5"]) != "null" && (Convert.ToString(dt.Rows[0]["Room5"]) != "") ? (Convert.ToString(dt.Rows[0]["Room5"])) : "";
                //lblLevel5.Text = Convert.ToString(dt.Rows[0]["Level5"]) != "null" && (Convert.ToString(dt.Rows[0]["Level5"]) != "") ? (Convert.ToString(dt.Rows[0]["Level5"])) : "0";
                //lblRoom5Dim.Text = (Convert.ToString(dt.Rows[0]["Room5Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room5Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room5Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room5Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room5Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room5Width"])) : "");// Convert.ToString(dt.Rows[0]["Room4Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room4Width"]);
                //lblRoom5Desc.Text = (Convert.ToString(dt.Rows[0]["Room5Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room5Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room5Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room5Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room5Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room5Desc2"])) : "");


                //lblRoom6.Text = Convert.ToString(dt.Rows[0]["Room6"]) != "null" && (Convert.ToString(dt.Rows[0]["Room6"]) != "") ? (Convert.ToString(dt.Rows[0]["Room6"])) : "";
                //lblLevel6.Text = Convert.ToString(dt.Rows[0]["Level6"]) != "null" && (Convert.ToString(dt.Rows[0]["Level6"]) != "") ? (Convert.ToString(dt.Rows[0]["Level6"])) : "0";
                //lblRoom6Dim.Text = (Convert.ToString(dt.Rows[0]["Room6Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room6Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room6Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room6Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room6Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room6Width"])) : ""); //Convert.ToString(dt.Rows[0]["Room6Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room6Width"]);
                //lblRoom6Desc.Text = (Convert.ToString(dt.Rows[0]["Room6Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room6Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room6Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room6Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room6Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room6Desc2"])) : ""); //Convert.ToString(dt.Rows[0]["Room6Desc1"]) + "," + Convert.ToString(dt.Rows[0]["Room6Desc2"]);

                //lblRoom7.Text = Convert.ToString(dt.Rows[0]["Room7"]) != "null" && (Convert.ToString(dt.Rows[0]["Room7"]) != "") ? (Convert.ToString(dt.Rows[0]["Room7"])) : "";
                //lblLevel7.Text = Convert.ToString(dt.Rows[0]["Level7"]) != "null" && (Convert.ToString(dt.Rows[0]["Level7"]) != "") ? (Convert.ToString(dt.Rows[0]["Level7"])) : "0";
                //lblRoom7Dim.Text = (Convert.ToString(dt.Rows[0]["Room7Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room7Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room7Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room7Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room7Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room7Width"])) : ""); //Convert.ToString(dt.Rows[0]["Room7Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room7Width"]);
                //lblRoom7Desc.Text = (Convert.ToString(dt.Rows[0]["Room7Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room7Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room7Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room7Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room7Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room7Desc2"])) : ""); //Convert.ToString(dt.Rows[0]["Room7Desc1"]) + "," + Convert.ToString(dt.Rows[0]["Room7Desc2"]); ;

                //lblRoom8.Text = Convert.ToString(dt.Rows[0]["Room8"]) != "null" && (Convert.ToString(dt.Rows[0]["Room8"]) != "") ? (Convert.ToString(dt.Rows[0]["Room8"])) : "";
                //lblLevel8.Text = Convert.ToString(dt.Rows[0]["Level8"]) != "null" && (Convert.ToString(dt.Rows[0]["Level8"]) != "") ? (Convert.ToString(dt.Rows[0]["Level8"])) : "0";
                //lblRoom8Dim.Text = (Convert.ToString(dt.Rows[0]["Room8Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room8Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room8Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room8Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room8Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room8Width"])) : ""); //Convert.ToString(dt.Rows[0]["Room8Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room8Width"]);
                //lblRoom8Desc.Text = (Convert.ToString(dt.Rows[0]["Room8Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room8Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room8Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room8Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room8Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room8Desc2"])) : "");// Convert.ToString(dt.Rows[0]["Room8Desc1"]) + "," + Convert.ToString(dt.Rows[0]["Room8Desc2"]); ;

                //lblRoom9.Text = Convert.ToString(dt.Rows[0]["Room9"]) != "null" && (Convert.ToString(dt.Rows[0]["Room9"]) != "") ? (Convert.ToString(dt.Rows[0]["Room9"])) : "";
                //lblLevel9.Text = Convert.ToString(dt.Rows[0]["Level9"]) != "null" && (Convert.ToString(dt.Rows[0]["Level9"]) != "") ? (Convert.ToString(dt.Rows[0]["Level9"])) : "0";
                //lblRoom9Dim.Text = (Convert.ToString(dt.Rows[0]["Room9Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room9Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room9Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room9Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room9Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room9Width"])) : ""); //Convert.ToString(dt.Rows[0]["Room9Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room9Width"]);
                //lblRoom9Desc.Text = (Convert.ToString(dt.Rows[0]["Room9Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room9Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room9Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room9Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room9Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room9Desc2"])) : "");// Convert.ToString(dt.Rows[0]["Room9Desc1"]) + "," + Convert.ToString(dt.Rows[0]["Room9Desc2"]); ;

                //lblRoom10.Text = Convert.ToString(dt.Rows[0]["Room10"]) != "null" && (Convert.ToString(dt.Rows[0]["Room10"]) != "") ? (Convert.ToString(dt.Rows[0]["Room10"])) : "";
                //lblLevel10.Text = Convert.ToString(dt.Rows[0]["Level10"]) != "null" && (Convert.ToString(dt.Rows[0]["Level10"]) != "") ? (Convert.ToString(dt.Rows[0]["Level10"])) : "0";
                //lblRoom10Dim.Text = (Convert.ToString(dt.Rows[0]["Room10Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room10Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room10Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room10Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room10Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room10Width"])) : ""); //Convert.ToString(dt.Rows[0]["Room10Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room10Width"]);
                //lblRoom10Desc.Text = (Convert.ToString(dt.Rows[0]["Room10Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room10Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room10Desc1"])) : "----" + Convert.ToString(dt.Rows[0]["Room10Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room10Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room10Desc2"])) : "");// Convert.ToString(dt.Rows[0]["Room10Desc1"]) + "," + Convert.ToString(dt.Rows[0]["Room10Desc2"]); ;

                //lblRoom11.Text = Convert.ToString(dt.Rows[0]["Room11"]) != "null" && (Convert.ToString(dt.Rows[0]["Room11"]) != "") ? (Convert.ToString(dt.Rows[0]["Room11"])) : "";
                //lblLevel11.Text = Convert.ToString(dt.Rows[0]["Level11"]) != "null" && (Convert.ToString(dt.Rows[0]["Level11"]) != "") ? (Convert.ToString(dt.Rows[0]["Level11"])) : "0";
                //lblRoom11Dim.Text = (Convert.ToString(dt.Rows[0]["Room11Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room11Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room11Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room11Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room11Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room11Width"])) : ""); //Convert.ToString(dt.Rows[0]["Room11Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room11Width"]);
                //lblRoom11Desc.Text = (Convert.ToString(dt.Rows[0]["Room11Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room11Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room11Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room11Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room11Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room11Desc2"])) : ""); //Convert.ToString(dt.Rows[0]["Room11Desc1"]) + "," + Convert.ToString(dt.Rows[0]["Room11Desc2"]); ;

                if (lblroom.Text == "1")
                {
                    //Room1.Visible = true;
                }

                if (lblroom.Text == "2")
                {
                    //    Room1.Visible = true;
                    //    Room2.Visible = true;
                }

                if (lblroom.Text == "3")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;

                }
                if (lblroom.Text == "4")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;
                    //Room4.Visible = true;

                }
                if (lblroom.Text == "5")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;
                    //Room4.Visible = true;
                    //Room5.Visible = true;
                }
                if (lblroom.Text == "6")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;
                    //Room4.Visible = true;
                    //Room5.Visible = true;
                    //Room6.Visible = true;

                }
                if (lblroom.Text == "7")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;
                    //Room4.Visible = true;
                    //Room5.Visible = true;
                    //Room6.Visible = true;
                    //Room7.Visible = true;

                }
                if (lblroom.Text == "8")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;
                    //Room4.Visible = true;
                    //Room5.Visible = true;
                    //Room6.Visible = true;
                    //Room7.Visible = true;
                    //Room8.Visible = true;

                }
                if (lblroom.Text == "9")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;
                    //Room4.Visible = true;
                    //Room5.Visible = true;
                    //Room6.Visible = true;
                    //Room7.Visible = true;
                    //Room8.Visible = true;
                    //Room9.Visible = true;

                }
                if (lblroom.Text == "10")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;
                    //Room4.Visible = true;
                    //Room5.Visible = true;
                    //Room6.Visible = true;
                    //Room7.Visible = true;
                    //Room8.Visible = true;
                    //Room9.Visible = true;
                    //Room10.Visible = true;

                }
                if (lblroom.Text == "11")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;
                    //Room4.Visible = true;
                    //Room5.Visible = true;
                    //Room6.Visible = true;
                    //Room7.Visible = true;
                    //Room8.Visible = true;
                    //Room9.Visible = true;
                    //Room10.Visible = true;
                    //Room11.Visible = true;

                }
                if (Convert.ToInt16(lblroom.Text) > 11)
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;
                    //Room4.Visible = true;
                    //Room5.Visible = true;
                    //Room6.Visible = true;
                    //Room7.Visible = true;
                    //Room8.Visible = true;
                    //Room9.Visible = true;
                    //Room10.Visible = true;
                    //Room11.Visible = true;

                }
                condo.Visible = false;
                condo_gen.Visible = false;
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

                rptPropertyImages.DataSource = dt;
                rptPropertyImages.DataBind();

                mlsClient = null;
            }
            catch (Exception ex)
            { }
        }

        void GetCommercialPropertyDetails()
        {
            try
            {


                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                DataTable dt = mlsClient.GetAllCommercialProperties(Request.QueryString["MLSID"].ToString(), "0", "0", "0", "0", "0");
                lblPrice.Text = "$" + Convert.ToString(dt.Rows[0]["ListPrice"]);
                lblListPrice.Text = "$" + Convert.ToString(dt.Rows[0]["ListPrice"]);
                lblStyle.Text = Convert.ToString(dt.Rows[0]["TypeOwn1Out"]);
                lblMLS.Text = Convert.ToString(dt.Rows[0]["MLS"]);
                //lblPageH1.Text = Convert.ToString(dt.Rows[0]["address"]) + ", " + Convert.ToString(dt.Rows[0]["province"]) + ", " + Convert.ToString(dt.Rows[0]["PostalCode"]);
                //lblPageh2.Text = lblPageH1.Text;
                string PostalCode = Convert.ToString(dt.Rows[0]["PostalCode"]);
                PostalCode = PostalCode.Insert(3, " ");
                Session["Address"] = ((Convert.ToString(dt.Rows[0]["address"]) != "null" && (Convert.ToString(dt.Rows[0]["address"])) != "" ? (Convert.ToString(dt.Rows[0]["address"])) : "") + ", " + (Convert.ToString(dt.Rows[0]["province"]) != "null" && Convert.ToString(dt.Rows[0]["province"]) != "" ? Convert.ToString(dt.Rows[0]["province"]) : "") + ", " + (PostalCode != "null" && PostalCode != "" ? PostalCode : ""));
                lblPropertyDescription.Text = (Convert.ToString(dt.Rows[0]["remarksforclients"]));
                lblAddressBar1.Text = ((Convert.ToString(dt.Rows[0]["address"]) != "" && Convert.ToString(dt.Rows[0]["address"]) != "null" ? Convert.ToString(dt.Rows[0]["address"]) : "") + (Convert.ToString(dt.Rows[0]["Municipality"]) != "" && Convert.ToString(dt.Rows[0]["Municipality"]) != "null" ? "," + Convert.ToString(dt.Rows[0]["Municipality"]) : "") + (PostalCode != "" && PostalCode != "null" ? (", " + PostalCode) : "") + (Convert.ToString(dt.Rows[0]["province"]) != "null" && Convert.ToString(dt.Rows[0]["province"]) != "" ? (", " + Convert.ToString(dt.Rows[0]["province"])) : ""));
                string extras;
                if (dt.Rows[0]["extras"].ToString().Length > 5)
                    extras = "<b style='float:left; width:60px;'>Extras :</b>" + "<div style='margin:0 0 0 70px;'>" + (Convert.ToString(dt.Rows[0]["extras"]) != "null" && (Convert.ToString(dt.Rows[0]["extras"]) != "") ? (Convert.ToString(dt.Rows[0]["extras"])) : "") + "</div>";
                else
                    extras = "";
                lblMLS1.Text = Convert.ToString(dt.Rows[0]["MLS"]);
                //lblExtraInformation.Text = extras;
                RoomDescription.Style.Add("display", "none");
                //lblCommunity.Text = Convert.ToString(dt.Rows[0]["Community"]) + "" + Convert.ToString(dt.Rows[0]["Map"]) + "-" + Convert.ToString(dt.Rows[0]["MapColumn"]) + "-" + Convert.ToString(dt.Rows[0]["MapRow"]);
                ////lblCommunityCode.Text = Convert.ToString(dt.Rows[0]["CommunityCode"]);
                //lblLegalDescription.Text = Convert.ToString(dt.Rows[0]["LegalDescription"]);
                lbladdrss.Text = Convert.ToString(dt.Rows[0]["Address"]) != "null" && (Convert.ToString(dt.Rows[0]["Address"]) != " ") ? Convert.ToString(dt.Rows[0]["Address"]) : "";
                //lblArea.Text = Convert.ToString(dt.Rows[0]["Area"]) != "null" && Convert.ToString(dt.Rows[0]["Area"]) != " "? (Convert.ToString(dt.Rows[0]["Area"])):"";
                lblprovince.Text = Convert.ToString(dt.Rows[0]["Province"]) != "null" && Convert.ToString(dt.Rows[0]["Province"]) != " " ? (Convert.ToString(dt.Rows[0]["Province"])) : "";
                lblPostalCode.Text = Convert.ToString(dt.Rows[0]["PostalCode"]) != "null" && Convert.ToString(dt.Rows[0]["PostalCode"]) != " " ? Convert.ToString(dt.Rows[0]["PostalCode"]) : "";
                lblMunicipality.Text = Convert.ToString(dt.Rows[0]["Municipality"]) != "" && Convert.ToString(dt.Rows[0]["Municipality"]) != "null" ? (Convert.ToString(dt.Rows[0]["Municipality"])) : "";
                if (dt.Rows[0]["TaxYear"].ToString() != "null" && dt.Rows[0]["TaxYear"].ToString() != "")
                {
                    lblTaxesYr.Text = Convert.ToString(dt.Rows[0]["TaxYear"]);
                }
                else
                {
                    lblTaxesYr.Text = "0";
                }

                lblSale.Text = Convert.ToString(dt.Rows[0]["SaleLease"]) != "null" && Convert.ToString(dt.Rows[0]["SaleLease"]) != "" ? Convert.ToString(dt.Rows[0]["SaleLease"]) : "";
                if (dt.Rows[0]["Taxes"].ToString() != "null" && dt.Rows[0]["Taxes"].ToString() != "")
                {
                    lblTaxes.Text = Convert.ToString(dt.Rows[0]["Taxes"]);
                }
                else
                {
                    lblTaxes.Text = "0";
                }

                //lblSPIS.Text = Convert.ToString(dt.Rows[0]["SellerPropertyInfoStatement"]);
                lblSubTypeofhome.Text = Convert.ToString(dt.Rows[0]["typeown1out"]) != "null" && Convert.ToString(dt.Rows[0]["typeown1out"]) != "" ? Convert.ToString(dt.Rows[0]["typeown1out"]) : "";

                lblWashRooms.Text = Convert.ToString(dt.Rows[0]["Washrooms"]) != "null" && Convert.ToString(dt.Rows[0]["Washrooms"]) != "" ? Convert.ToString(dt.Rows[0]["Washrooms"]) : "";

                //lblAcreage.Text = "None";

                lblDirCrossSt.Text = Convert.ToString(dt.Rows[0]["DirectionsCrossStreets"]) != "null" && Convert.ToString(dt.Rows[0]["DirectionsCrossStreets"]) != "" ? Convert.ToString(dt.Rows[0]["DirectionsCrossStreets"]) : "";
                lblLot.Text = "<b>Lots</b>" + (Convert.ToString(dt.Rows[0]["LotFront"]) != "null" && Convert.ToString(dt.Rows[0]["LotFront"]) != "" ? Convert.ToString(dt.Rows[0]["LotFront"]) : "") + (Convert.ToString(dt.Rows[0]["LotDepth"]) != "null" && Convert.ToString(dt.Rows[0]["LotDepth"]) != "" ? ("x" + Convert.ToString(dt.Rows[0]["LotDepth"])) : "") + " " + (Convert.ToString(dt.Rows[0]["LotSizeCode"]) != "null" && Convert.ToString(dt.Rows[0]["LotSizeCode"]) != "" ? Convert.ToString(dt.Rows[0]["LotSizeCode"]) : "");

                lblBasement1.Text = Convert.ToString(dt.Rows[0]["Basement1"]) != "null" && Convert.ToString(dt.Rows[0]["Basement1"]) != "" ? Convert.ToString(dt.Rows[0]["Basement1"]) : "";

                lblHeat1.Text = Convert.ToString(dt.Rows[0]["HeatType"]) != "null" && Convert.ToString(dt.Rows[0]["HeatType"]) != "" ? Convert.ToString(dt.Rows[0]["HeatType"]) : "";
                lblApxAge1.Text = Convert.ToString(dt.Rows[0]["ApproxAge"]) != "null" && Convert.ToString(dt.Rows[0]["ApproxAge"]) != "" ? Convert.ToString(dt.Rows[0]["ApproxAge"]) : "";


                lblGarageTypes1.Text = Convert.ToString(dt.Rows[0]["GarageType"]) != "null" && Convert.ToString(dt.Rows[0]["GarageType"]) != "" ? Convert.ToString(dt.Rows[0]["GarageType"]) : "";
                lblParking1.Text = Convert.ToString(dt.Rows[0]["ParkingSpaces"]) != "null" && Convert.ToString(dt.Rows[0]["ParkingSpaces"]) != "" ? Convert.ToString(dt.Rows[0]["ParkingSpaces"]) : "";


                lblWater1.Text = Convert.ToString(dt.Rows[0]["water"]) != "null" && Convert.ToString(dt.Rows[0]["water"]) != "" ? Convert.ToString(dt.Rows[0]["water"]) : "";

                lblSewers1.Text = Convert.ToString(dt.Rows[0]["Sewers"]) != "null" && Convert.ToString(dt.Rows[0]["Sewers"]) != "" ? Convert.ToString(dt.Rows[0]["Sewers"]) : "";

                lblListBrokerage.Text = "Listing Contracted with: " + Convert.ToString(dt.Rows[0]["ListBrokerage"]);

                room.Visible = false;
                AdditionFeatures.Visible = false;
                condo.Visible = false;
            }
            catch (Exception ex)
            {
            }
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

            rptPropertyImages.DataSource = dt;
            rptPropertyImages.DataBind();

            mlsClient = null;
        }

        void GetCondoPropertyDetails()
        {
            try
            {
                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                DataTable dt = mlsClient.GetProperties_Condo(Convert.ToString(Request.QueryString["MLSID"]), "0", "0", "0", "0", "0", "0");
                lblPrice.Text = "$" + Convert.ToString(dt.Rows[0]["ListPrice"]);
                lblListPrice.Text = "$" + Convert.ToString(dt.Rows[0]["ListPrice"]);
                lblStyle.Text = Convert.ToString(dt.Rows[0]["TypeOwn1Out"]) + " " + Convert.ToString(dt.Rows[0]["Style"]);
                lblMLS.Text = Convert.ToString(dt.Rows[0]["MLS"]);
                //lblPageH1.Text = Convert.ToString(dt.Rows[0]["address"].ToString() + ", " + Convert.ToString(dt.Rows[0]["province"]) + ", " + Convert.ToString(dt.Rows[0]["PostalCode"]));
                //lblPageh2.Text = lblPageH1.Text;
                string PostalCode = Convert.ToString(dt.Rows[0]["PostalCode"]);
                PostalCode = PostalCode.Insert(3, " ");
                Session["Address"] = Convert.ToString(dt.Rows[0]["address"].ToString() + ", " + Convert.ToString(dt.Rows[0]["province"]) + ", " + PostalCode);
                lblAddressBar1.Text = ((Convert.ToString(dt.Rows[0]["address"]) != "" && Convert.ToString(dt.Rows[0]["address"]) != "null" ? Convert.ToString(dt.Rows[0]["address"]) : "") + (Convert.ToString(dt.Rows[0]["Municipality"]) != "" && Convert.ToString(dt.Rows[0]["Municipality"]) != "null" ? "," + Convert.ToString(dt.Rows[0]["Municipality"]) : "") + (PostalCode != "" && PostalCode != "null" ? (", " + PostalCode) : "") + (Convert.ToString(dt.Rows[0]["province"]) != "null" && Convert.ToString(dt.Rows[0]["province"]) != "" ? (", " + Convert.ToString(dt.Rows[0]["province"])) : ""));
                lblPropertyDescription.Text = Convert.ToString(dt.Rows[0]["remarksforclients"]);
                string extras;
                if (dt.Rows[0]["extras"].ToString().Length > 5)
                    extras = "<b style='float:left; width:60px;';>Extras :</b>" + "<div style='margin:0 0 0 70px;'>" + Convert.ToString(dt.Rows[0]["extras"]) + "</div>";
                else
                    extras = "";

                //lblExtraInformation.Text = extras;
                //lblCommunity.Text = Convert.ToString(dt.Rows[0]["Community"]) + "" + Convert.ToString(dt.Rows[0]["Map"]) + "-" + Convert.ToString(dt.Rows[0]["MapColumn"]) + "-" + Convert.ToString(dt.Rows[0]["MapRow"]);
                //lblCommunityCode.Text = Convert.ToString(dt.Rows[0]["CommunityCode"]);

                lbladdrss.Text = Convert.ToString(dt.Rows[0]["Address"]) != "null" && Convert.ToString(dt.Rows[0]["Address"]) != "" ? Convert.ToString(dt.Rows[0]["Address"]) : "";
                //lblArea.Text = Convert.ToString(dt.Rows[0]["Area"]) != "null" && Convert.ToString(dt.Rows[0]["Area"])!="" ?Convert.ToString(dt.Rows[0]["Area"]):"";
                lblprovince.Text = Convert.ToString(dt.Rows[0]["province"]) != "null" && Convert.ToString(dt.Rows[0]["province"]) != "" ? Convert.ToString(dt.Rows[0]["province"]) : "";
                lblPostalCode.Text = Convert.ToString(dt.Rows[0]["PostalCode"]) != "null" && Convert.ToString(dt.Rows[0]["PostalCode"]) != "" ? Convert.ToString(dt.Rows[0]["PostalCode"]) : "";
                lblMunicipality.Text = Convert.ToString(dt.Rows[0]["Municipality"]) != "" && Convert.ToString(dt.Rows[0]["Municipality"]) != "null" ? (Convert.ToString(dt.Rows[0]["Municipality"])) : "";
                if (dt.Rows[0]["TaxYear"].ToString() != "null" && dt.Rows[0]["TaxYear"].ToString() != "")
                {
                    lblTaxesYr.Text = Convert.ToString(dt.Rows[0]["TaxYear"]);
                }
                else
                {
                    lblTaxesYr.Text = "0";
                }

                lblSale.Text = Convert.ToString(dt.Rows[0]["SaleLease"]);
                if (dt.Rows[0]["Taxes"].ToString() != "null" && dt.Rows[0]["Taxes"].ToString() != "")
                {
                    lblTaxes.Text = Convert.ToString(dt.Rows[0]["Taxes"]);
                }
                else
                {
                    lblTaxes.Text = "0";
                }
                lblSale.Text = Convert.ToString(dt.Rows[0]["SaleLease"]) != "null" && (Convert.ToString(dt.Rows[0]["SaleLease"]) != "") ? (Convert.ToString(dt.Rows[0]["SaleLease"])) : "";
                //lblSPIS.Visible = false;
                lblSubTypeofhome.Text = Convert.ToString(dt.Rows[0]["typeown1out"]) != "null" && (Convert.ToString(dt.Rows[0]["typeown1out"]) != "") ? (Convert.ToString(dt.Rows[0]["typeown1out"])) : "";
                lblStorey.Text = Convert.ToString(dt.Rows[0]["Style"]) != "null" && (Convert.ToString(dt.Rows[0]["Style"]) != "") ? (Convert.ToString(dt.Rows[0]["Style"])) : "";
                //lblfronting.Text = "None";
                lblroom.Text = Convert.ToString(dt.Rows[0]["Rooms"]) != "null" && (Convert.ToString(dt.Rows[0]["Rooms"]) != "") ? (Convert.ToString(dt.Rows[0]["Rooms"])) : "";
                lblMLS1.Text = Convert.ToString(dt.Rows[0]["MLS"]) != "null" && (Convert.ToString(dt.Rows[0]["MLS"]) != "") ? (Convert.ToString(dt.Rows[0]["MLS"])) : "";
                lblBedroom.Text = Convert.ToString(dt.Rows[0]["BedRooms"]) != "null" && (Convert.ToString(dt.Rows[0]["BedRooms"]) != "") ? (Convert.ToString(dt.Rows[0]["BedRooms"])) : "";
                lblWashRooms.Text = Convert.ToString(dt.Rows[0]["WashRooms"]) != "null" && (Convert.ToString(dt.Rows[0]["WashRooms"]) != "") ? (Convert.ToString(dt.Rows[0]["WashRooms"])) : "";

                lblDirCrossSt.Text = Convert.ToString(dt.Rows[0]["DirectionsCrossStreets"]) != "null" && (Convert.ToString(dt.Rows[0]["DirectionsCrossStreets"]) != "") ? (Convert.ToString(dt.Rows[0]["DirectionsCrossStreets"])) : "";
                lblLot.Text = "<b>Maint:</b> $" + (Convert.ToString(dt.Rows[0]["Maintenance"]) != "null" && (Convert.ToString(dt.Rows[0]["Maintenance"]) != "") ? (Convert.ToString(dt.Rows[0]["Maintenance"])) : "");
                lblKitchen.Text = (Convert.ToString(dt.Rows[0]["Kitchens"]) != "null" && (Convert.ToString(dt.Rows[0]["Kitchens"]) != "") ? (Convert.ToString(dt.Rows[0]["Kitchens"])) : "") + (Convert.ToString(dt.Rows[0]["KitchensPlus"]) != "null" && (Convert.ToString(dt.Rows[0]["KitchensPlus"]) != "") ? ("+" + Convert.ToString(dt.Rows[0]["KitchensPlus"])) : "");
                lblfamilyrm.Text = Convert.ToString(dt.Rows[0]["FamilyRoom"]) != "null" && (Convert.ToString(dt.Rows[0]["FamilyRoom"]) != "") ? (Convert.ToString(dt.Rows[0]["FamilyRoom"])) : "";
                lblBasement.Text = (Convert.ToString(dt.Rows[0]["Basement1"]) != "null" && (Convert.ToString(dt.Rows[0]["Basement1"]) != "") ? (Convert.ToString(dt.Rows[0]["Basement1"])) : "") + " " + (Convert.ToString(dt.Rows[0]["Basement2"]) != "null" && (Convert.ToString(dt.Rows[0]["Basement2"]) != "") ? (Convert.ToString(dt.Rows[0]["Basement2"])) : "");
                lblFireplaces.Text = Convert.ToString(dt.Rows[0]["FireplaceStove"]) != "null" && (Convert.ToString(dt.Rows[0]["FireplaceStove"]) != "") ? (Convert.ToString(dt.Rows[0]["FireplaceStove"])) : "";
                lblHeat.Text = (Convert.ToString(dt.Rows[0]["HeatSource"]) != "null" && (Convert.ToString(dt.Rows[0]["HeatSource"]) != "") ? (Convert.ToString(dt.Rows[0]["HeatSource"])) : "") + " " + (Convert.ToString(dt.Rows[0]["HeatType"]) != "null" && (Convert.ToString(dt.Rows[0]["HeatType"]) != "") ? (Convert.ToString(dt.Rows[0]["HeatType"])) : "");
                lblApxAge.Text = Convert.ToString(dt.Rows[0]["ApproxAge"]) != "null" && (Convert.ToString(dt.Rows[0]["ApproxAge"]) != "") ? (Convert.ToString(dt.Rows[0]["ApproxAge"])) : "";

                lblUnit.Text = "<b>Unit#:</b> " + (Convert.ToString(dt.Rows[0]["Unit"]) != "null" && (Convert.ToString(dt.Rows[0]["Unit"]) != "") ? (Convert.ToString(dt.Rows[0]["Unit"])) : "");
                lblCorp.Text = "<br/><b>Corp:</b> " + Convert.ToString(dt.Rows[0]["CondoRegistryOffice"]) + "/" + Convert.ToString(dt.Rows[0]["CondoCorp"]);
                lblLevel.Text = "<br/><b>Level:</b> " + Convert.ToString(dt.Rows[0]["Level"]);
                lblParkingType.Text = Convert.ToString(dt.Rows[0]["ParkingType"]);

                lblListBrokerage.Text = "Listing Contracted with: " + Convert.ToString(dt.Rows[0]["ListBrokerage"]);

                if (Convert.ToString(dt.Rows[0]["BuildingAmenities1"]) != "null")
                {
                    PropertyFeature1.Visible = true;
                    lblPropertyFeature1.Text = "<b>Bldg Amen:</b>" + Convert.ToString(dt.Rows[0]["BuildingAmenities1"]);
                }
                if (Convert.ToString(dt.Rows[0]["BuildingAmenities2"]) != "null")
                {
                    PropertyFeature2.Visible = true;
                    lblPropertyFeature2.Text = Convert.ToString(dt.Rows[0]["BuildingAmenities2"]);
                }
                if (Convert.ToString(dt.Rows[0]["BuildingAmenties3"]) != "null")
                {
                    PropertyFeature3.Visible = true;
                    lblPropertyFeature3.Text = Convert.ToString(dt.Rows[0]["BuildingAmenties3"]);
                }
                if (Convert.ToString(dt.Rows[0]["BuildingAmenities4"]) != "null")
                {
                    PropertyFeature4.Visible = true;
                    lblPropertyFeature4.Text = Convert.ToString(dt.Rows[0]["BuildingAmenities4"]);
                }
                if (Convert.ToString(dt.Rows[0]["BuildingAmenities5"]) != "null")
                {
                    PropertyFeature5.Visible = true;
                    lblPropertyFeature5.Text = Convert.ToString(dt.Rows[0]["BuildingAmenities5"]);
                }
                if (Convert.ToString(dt.Rows[0]["BuildingAmenities6"]) != "null")
                {
                    PropertyFeature6.Visible = true;
                    lblPropertyFeature6.Text = Convert.ToString(dt.Rows[0]["BuildingAmenities6"]);
                }
                //lblApxSqft.Text = Convert.ToString(dt.Rows[0]["ApproxSquareFootage"]);
                //   lblAirConditioning.Text = Convert.ToString(dt.Rows[0]["AirConditioning"]);
                lblExterior.Text = Convert.ToString(dt.Rows[0]["Exterior1"]) != "null" && Convert.ToString(dt.Rows[0]["Exterior1"]) != "" ? Convert.ToString(dt.Rows[0]["Exterior1"]) : "";
                lblDrive.Text = "<b>Parking Drive: </b>" + Convert.ToString(dt.Rows[0]["ParkingDrive"]) != "null" && Convert.ToString(dt.Rows[0]["ParkingDrive"]) != "" ? Convert.ToString(dt.Rows[0]["ParkingDrive"]) : "";
                lblGarageType.Text = (Convert.ToString(dt.Rows[0]["GarageType"]) != "null" && Convert.ToString(dt.Rows[0]["GarageType"]) != "" ? Convert.ToString(dt.Rows[0]["GarageType"]) : "") + (Convert.ToString(dt.Rows[0]["GarageParkSpaces"]) != "" && Convert.ToString(dt.Rows[0]["GarageParkSpaces"]) != "null" ? ("/" + Convert.ToString(dt.Rows[0]["GarageParkSpaces"])) : "");
                lblParking.Text = Convert.ToString(dt.Rows[0]["ParkingSpaces"]) != "null" && Convert.ToString(dt.Rows[0]["ParkingSpaces"]) != "" ? Convert.ToString(dt.Rows[0]["ParkingSpaces"]) : "";
                lblPool.Text = "<b>Pets Permitted:</b>" + (Convert.ToString(dt.Rows[0]["PetsPermitted"]) != "null" && Convert.ToString(dt.Rows[0]["PetsPermitted"]) != "" ? Convert.ToString(dt.Rows[0]["PetsPermitted"]) : "");

                lblWater.Text = Convert.ToString(dt.Rows[0]["WaterIncluded"]) != "null" && Convert.ToString(dt.Rows[0]["WaterIncluded"]) != "" ? Convert.ToString(dt.Rows[0]["WaterIncluded"]) : "";
                //lblWaterSupply.Text = "None";
                lblSewers.Text = "<b>Bldg Insur Incl:</b>" + (Convert.ToString(dt.Rows[0]["BuildingInsuranceIncluded"]) != "" && Convert.ToString(dt.Rows[0]["WaterIncluded"]) != "null" ? Convert.ToString(dt.Rows[0]["WaterIncluded"]) : "");
                lblSpecificDesignation.Text = Convert.ToString(dt.Rows[0]["SpecialDesignation1"]) != "" && Convert.ToString(dt.Rows[0]["SpecialDesignation1"]) != "null" ? Convert.ToString(dt.Rows[0]["SpecialDesignation1"]) : "";

                lblBalcony.Text = Convert.ToString(dt.Rows[0]["Balcony"]) != "" && Convert.ToString(dt.Rows[0]["Balcony"]) != "null" ? Convert.ToString(dt.Rows[0]["Balcony"]) : "";
                lblEnsLaundry.Text = Convert.ToString(dt.Rows[0]["EnsuiteLaundry"]) != "" && Convert.ToString(dt.Rows[0]["EnsuiteLaundry"]) != "null" ? Convert.ToString(dt.Rows[0]["EnsuiteLaundry"]) : "";
                lblLaundryLevel.Text = Convert.ToString(dt.Rows[0]["LaundryLevel"]) != "" && Convert.ToString(dt.Rows[0]["LaundryLevel"]) != "null" ? Convert.ToString(dt.Rows[0]["LaundryLevel"]) : "";
                LblParkingInc.Text = Convert.ToString(dt.Rows[0]["ParkingIncluded"]) != "" && Convert.ToString(dt.Rows[0]["ParkingIncluded"]) != "null" ? Convert.ToString(dt.Rows[0]["ParkingIncluded"]) : "";

                //lblRoom1.Text = Convert.ToString(dt.Rows[0]["Room1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room1"])) : "";
                //lblLevel1.Text = Convert.ToString(dt.Rows[0]["Level1"]) != "null" && (Convert.ToString(dt.Rows[0]["Level1"]) != "") ? (Convert.ToString(dt.Rows[0]["Level1"])) : "0";
                //lblRoom1Dim.Text = (Convert.ToString(dt.Rows[0]["Room1Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room1Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room1Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room1Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room1Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room1Width"])) : "");// Convert.ToString(dt.Rows[0]["Room1Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room1Width"]);
                //lblRoom1Desc.Text = (Convert.ToString(dt.Rows[0]["Room1Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room1Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room1Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room1Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room1Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room1Desc2"])) : "");

                //lblRoom2.Text = Convert.ToString(dt.Rows[0]["Room2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room2"]) != "") ? (Convert.ToString(dt.Rows[0]["Room2"])) : "";
                //lblLevel2.Text = Convert.ToString(dt.Rows[0]["Level2"]) != "null" && (Convert.ToString(dt.Rows[0]["Level2"]) != "") ? (Convert.ToString(dt.Rows[0]["Level2"])) : "0";
                //lblRoom2Dim.Text = (Convert.ToString(dt.Rows[0]["Room2Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room2Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room2Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room2Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room2Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room2Width"])) : "");
                //lblRoom2Desc.Text = (Convert.ToString(dt.Rows[0]["Room2Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room2Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room2Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room2Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room2Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room2Desc2"])) : "");

                //lblRoom3.Text = Convert.ToString(dt.Rows[0]["Room3"]) != "null" && (Convert.ToString(dt.Rows[0]["Room3"]) != "") ? (Convert.ToString(dt.Rows[0]["Room3"])) : "";
                //lblLevel3.Text = Convert.ToString(dt.Rows[0]["Level3"]) != "null" && (Convert.ToString(dt.Rows[0]["Level3"]) != "") ? (Convert.ToString(dt.Rows[0]["Level3"])) : "0";
                //lblRoom3Dim.Text = (Convert.ToString(dt.Rows[0]["Room3Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room3Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room3Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room3Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room3Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room3Width"])) : "");
                //lblRoom3Desc.Text = (Convert.ToString(dt.Rows[0]["Room3Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room3Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room3Desc1"])) + "," : "") + (Convert.ToString(dt.Rows[0]["Room3Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room3Desc2"]) != "") ? (Convert.ToString(dt.Rows[0]["Room3Desc2"])) : "---");

                //lblRoom4.Text = Convert.ToString(dt.Rows[0]["Room4"]) != "null" && (Convert.ToString(dt.Rows[0]["Room4"]) != "") ? (Convert.ToString(dt.Rows[0]["Room4"])) : "";
                //lblLevel4.Text = Convert.ToString(dt.Rows[0]["Level4"]) != "null" && (Convert.ToString(dt.Rows[0]["Level4"]) != "") ? (Convert.ToString(dt.Rows[0]["Level4"])) : "0";
                //lblRoom4Dim.Text = (Convert.ToString(dt.Rows[0]["Room4Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room4Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room4Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room4Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room4Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room4Width"])) : "");// Convert.ToString(dt.Rows[0]["Room4Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room4Width"]);
                //lblRoom4Desc.Text = (Convert.ToString(dt.Rows[0]["Room4Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room4Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room4Desc1"])) + "," : "") + (Convert.ToString(dt.Rows[0]["Room4Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room4Desc2"]) != "") ? (Convert.ToString(dt.Rows[0]["Room4Desc2"])) : "---");// Convert.ToString(dt.Rows[0]["Room4Desc1"]) + "," + Convert.ToString(dt.Rows[0]["Room4Desc2"]);

                //lblRoom5.Text = Convert.ToString(dt.Rows[0]["Room5"]) != "null" && (Convert.ToString(dt.Rows[0]["Room5"]) != "") ? (Convert.ToString(dt.Rows[0]["Room5"])) : "";
                //lblLevel5.Text = Convert.ToString(dt.Rows[0]["Level5"]) != "null" && (Convert.ToString(dt.Rows[0]["Level5"]) != "") ? (Convert.ToString(dt.Rows[0]["Level5"])) : "0";
                //lblRoom5Dim.Text = (Convert.ToString(dt.Rows[0]["Room5Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room5Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room5Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room5Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room5Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room5Width"])) : "");// Convert.ToString(dt.Rows[0]["Room4Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room4Width"]);
                //lblRoom5Desc.Text = (Convert.ToString(dt.Rows[0]["Room5Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room5Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room5Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room5Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room5Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room5Desc2"])) : "");


                //lblRoom6.Text = Convert.ToString(dt.Rows[0]["Room6"]) != "null" && (Convert.ToString(dt.Rows[0]["Room6"]) != "") ? (Convert.ToString(dt.Rows[0]["Room6"])) : "";
                //lblLevel6.Text = Convert.ToString(dt.Rows[0]["Level6"]) != "null" && (Convert.ToString(dt.Rows[0]["Level6"]) != "") ? (Convert.ToString(dt.Rows[0]["Level6"])) : "0";
                //lblRoom6Dim.Text = (Convert.ToString(dt.Rows[0]["Room6Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room6Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room6Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room6Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room6Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room6Width"])) : ""); //Convert.ToString(dt.Rows[0]["Room6Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room6Width"]);
                //lblRoom6Desc.Text = (Convert.ToString(dt.Rows[0]["Room6Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room6Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room6Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room6Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room6Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room6Desc2"])) : ""); //Convert.ToString(dt.Rows[0]["Room6Desc1"]) + "," + Convert.ToString(dt.Rows[0]["Room6Desc2"]);

                //lblRoom7.Text = Convert.ToString(dt.Rows[0]["Room7"]) != "null" && (Convert.ToString(dt.Rows[0]["Room7"]) != "") ? (Convert.ToString(dt.Rows[0]["Room7"])) : "";
                //lblLevel7.Text = Convert.ToString(dt.Rows[0]["Level7"]) != "null" && (Convert.ToString(dt.Rows[0]["Level7"]) != "") ? (Convert.ToString(dt.Rows[0]["Level7"])) : "0";
                //lblRoom7Dim.Text = (Convert.ToString(dt.Rows[0]["Room7Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room7Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room7Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room7Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room7Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room7Width"])) : ""); //Convert.ToString(dt.Rows[0]["Room7Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room7Width"]);
                //lblRoom7Desc.Text = (Convert.ToString(dt.Rows[0]["Room7Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room7Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room7Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room7Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room7Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room7Desc2"])) : ""); //Convert.ToString(dt.Rows[0]["Room7Desc1"]) + "," + Convert.ToString(dt.Rows[0]["Room7Desc2"]); ;

                //lblRoom8.Text = Convert.ToString(dt.Rows[0]["Room8"]) != "null" && (Convert.ToString(dt.Rows[0]["Room8"]) != "") ? (Convert.ToString(dt.Rows[0]["Room8"])) : "";
                //lblLevel8.Text = Convert.ToString(dt.Rows[0]["Level8"]) != "null" && (Convert.ToString(dt.Rows[0]["Level8"]) != "") ? (Convert.ToString(dt.Rows[0]["Level8"])) : "0";
                //lblRoom8Dim.Text = (Convert.ToString(dt.Rows[0]["Room8Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room8Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room8Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room8Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room8Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room8Width"])) : ""); //Convert.ToString(dt.Rows[0]["Room8Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room8Width"]);
                //lblRoom8Desc.Text = (Convert.ToString(dt.Rows[0]["Room8Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room8Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room8Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room8Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room8Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room8Desc2"])) : "");// Convert.ToString(dt.Rows[0]["Room8Desc1"]) + "," + Convert.ToString(dt.Rows[0]["Room8Desc2"]); ;

                //lblRoom9.Text = Convert.ToString(dt.Rows[0]["Room9"]) != "null" && (Convert.ToString(dt.Rows[0]["Room9"]) != "") ? (Convert.ToString(dt.Rows[0]["Room9"])) : "";
                //lblLevel9.Text = Convert.ToString(dt.Rows[0]["Level9"]) != "null" && (Convert.ToString(dt.Rows[0]["Level9"]) != "") ? (Convert.ToString(dt.Rows[0]["Level9"])) : "0";
                //lblRoom9Dim.Text = (Convert.ToString(dt.Rows[0]["Room9Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room9Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room9Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room9Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room9Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room9Width"])) : ""); //Convert.ToString(dt.Rows[0]["Room9Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room9Width"]);
                //lblRoom9Desc.Text = (Convert.ToString(dt.Rows[0]["Room9Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room9Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room9Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room9Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room9Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room9Desc2"])) : "");// Convert.ToString(dt.Rows[0]["Room9Desc1"]) + "," + Convert.ToString(dt.Rows[0]["Room9Desc2"]); ;

                //lblRoom10.Text = Convert.ToString(dt.Rows[0]["Room10"]) != "null" && (Convert.ToString(dt.Rows[0]["Room10"]) != "") ? (Convert.ToString(dt.Rows[0]["Room10"])) : "";
                //lblLevel10.Text = Convert.ToString(dt.Rows[0]["Level10"]) != "null" && (Convert.ToString(dt.Rows[0]["Level10"]) != "") ? (Convert.ToString(dt.Rows[0]["Level10"])) : "0";
                //lblRoom10Dim.Text = (Convert.ToString(dt.Rows[0]["Room10Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room10Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room10Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room10Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room10Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room10Width"])) : ""); //Convert.ToString(dt.Rows[0]["Room10Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room10Width"]);
                //lblRoom10Desc.Text = (Convert.ToString(dt.Rows[0]["Room10Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room10Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room10Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room10Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room10Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room10Desc2"])) : "");// Convert.ToString(dt.Rows[0]["Room10Desc1"]) + "," + Convert.ToString(dt.Rows[0]["Room10Desc2"]); ;

                //lblRoom11.Text = Convert.ToString(dt.Rows[0]["Room11"]) != "null" && (Convert.ToString(dt.Rows[0]["Room11"]) != "") ? (Convert.ToString(dt.Rows[0]["Room11"])) : "";
                //lblLevel11.Text = Convert.ToString(dt.Rows[0]["Level11"]) != "null" && (Convert.ToString(dt.Rows[0]["Level11"]) != "") ? (Convert.ToString(dt.Rows[0]["Level11"])) : "0";
                //lblRoom11Dim.Text = (Convert.ToString(dt.Rows[0]["Room11Length"]) != "null" && (Convert.ToString(dt.Rows[0]["Room11Length"]) != "") ? (Convert.ToString(dt.Rows[0]["Room11Length"])) : "0") + (Convert.ToString(dt.Rows[0]["Room11Width"]) != "null" && (Convert.ToString(dt.Rows[0]["Room11Width"]) != "") ? ("x" + Convert.ToString(dt.Rows[0]["Room11Width"])) : ""); //Convert.ToString(dt.Rows[0]["Room11Length"]) + "x" + Convert.ToString(dt.Rows[0]["Room11Width"]);
                //lblRoom11Desc.Text = (Convert.ToString(dt.Rows[0]["Room11Desc1"]) != "null" && (Convert.ToString(dt.Rows[0]["Room11Desc1"]) != "") ? (Convert.ToString(dt.Rows[0]["Room11Desc1"])) : "----") + (Convert.ToString(dt.Rows[0]["Room11Desc2"]) != "null" && (Convert.ToString(dt.Rows[0]["Room11Desc2"]) != "") ? ("," + Convert.ToString(dt.Rows[0]["Room11Desc2"])) : ""); //Convert.ToString(dt.Rows[0]["Room11Desc1"]) + "," + Convert.ToString(dt.Rows[0]["Room11Desc2"]); ;

                if (lblroom.Text == "1")
                {
                    //Room1.Visible = true;
                }

                if (lblroom.Text == "2")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                }

                if (lblroom.Text == "3")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;

                }
                if (lblroom.Text == "4")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;
                    //Room4.Visible = true;

                }
                if (lblroom.Text == "5")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;
                    //Room4.Visible = true;
                    //Room5.Visible = true;
                }
                if (lblroom.Text == "6")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;
                    //Room4.Visible = true;
                    //Room5.Visible = true;
                    //Room6.Visible = true;

                }
                if (lblroom.Text == "7")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;
                    //Room4.Visible = true;
                    //Room5.Visible = true;
                    //Room6.Visible = true;
                    //Room7.Visible = true;

                }
                if (lblroom.Text == "8")
                {
                    //    Room1.Visible = true;
                    //    Room2.Visible = true;
                    //    Room3.Visible = true;
                    //    Room4.Visible = true;
                    //    Room5.Visible = true;
                    //    Room6.Visible = true;
                    //    Room7.Visible = true;
                    //    Room8.Visible = true;

                }
                if (lblroom.Text == "9")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;
                    //Room4.Visible = true;
                    //Room5.Visible = true;
                    //Room6.Visible = true;
                    //Room7.Visible = true;
                    //Room8.Visible = true;
                    //Room9.Visible = true;

                }
                if (lblroom.Text == "10")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;
                    //Room4.Visible = true;
                    //Room5.Visible = true;
                    //Room6.Visible = true;
                    //Room7.Visible = true;
                    //Room8.Visible = true;
                    //Room9.Visible = true;
                    //Room10.Visible = true;

                }
                if (lblroom.Text == "11")
                {
                    //Room1.Visible = true;
                    //Room2.Visible = true;
                    //Room3.Visible = true;
                    //Room4.Visible = true;
                    //Room5.Visible = true;
                    //Room6.Visible = true;
                    //Room7.Visible = true;
                    //Room8.Visible = true;
                    //Room9.Visible = true;
                    //Room10.Visible = true;
                    //Room11.Visible = true;
                }

                Commercial.Visible = false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion Condo Methods

        protected void btnEmail_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Email_Listing.aspx?MLSID=" + lblMLS.Text + "&PropertyType=" + Convert.ToString(Session["PropertySearchType"]), false);
        }

        //protected void btnPrint_Click(object sender, EventArgs e)

        //    {

        //        Session["ctrl"] = pnl1;

        //        ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=300px,width=300px,scrollbars=1');</script>");

        //    }

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
                FavouriteSpan.InnerText = "Favourite Property";
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