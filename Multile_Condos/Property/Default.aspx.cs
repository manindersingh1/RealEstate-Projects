using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Property_cls;


namespace Property
{
    public partial class Default : System.Web.UI.Page
    {

        #region Properties

        String _SearchText;
        public String SearchText
        {
            get { return _SearchText; }
            set { _SearchText = value; }
        }
        String _MinPrice;
        public String MinPrice
        {
            get { return _MinPrice; }
            set { _MinPrice = value; }
        }
        String _MaxPrice;
        public String MaxPrice
        {
            get { return _MaxPrice; }
            set { _MaxPrice = value; }
        }
        String _Beds;
        public String Beds
        {
            get { return _Beds; }
            set { _Beds = value; }
        }
        String _Baths;
        public String Baths
        {
            get { return _Baths; }
            set { _Baths = value; }
        }

        #endregion Properties

        #region PageLoad

        protected void Page_Load(object sender, EventArgs e)
        {
            
            Session["FirstName"] = null;
            Session["SearchType"] = null;
            Session["PropertySearchType"] = null;
            //string s = residential.Text;
            //if (s == "Residential Listings")
            //{
            // Session["SearchType"] = "Residential";
            //}
            //else if 
            if (!IsPostBack)
            {
                SearchResidentialProperties();
                SearchCondoProperties();
                SearchCommercialProperties();
                //LoadImageandName();
                //((HtmlGenericControl)this.Page.Master.FindControl("Homebanner")).Style.Add("display", "block");
                //GetPropertyType();
                //GetPropertyType_Comm();
                //GetPropertyType_Condo();
                //GetSaleLease_Residential();
                //GetSaleLease_Comm();
                //GetSaleLease_Condo();
            }
        }


        public string GetText(string txtDescription)
        {
            if (txtDescription.Length > 150)
            {
                int i = txtDescription.IndexOf(" ", 135);
                if (i > 0)
                    txtDescription = txtDescription.Substring(0, i).Trim();
                else
                    return txtDescription;

            }
            else
            {
                return txtDescription;

            }
            return txtDescription;
        }


        void SearchResidentialProperties()
        {
            //Session["QueryString112"] = "Residential";
            try
            {
                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                DataTable dt = new DataTable();
                //if (Convert.ToString(Session["QueryString112"]) == "Residential" || Convert.ToString(Session["QueryString"]) == "IDXImagesResidential")
                dt = mlsClient.GetResidentialPropertiesTop3("0", "0", "0", "0", "0", "0", "0");
                //else
                    //dt = mlsClient.GetResidentialPropertiesTop3 (Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Beds"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());
                if (dt.Rows.Count > 0)
                {

                    //imgresi.ImageUrl = dt.Rows[2]["pImage"].ToString();
                    imgresi1.ImageUrl = dt.Rows[0]["pImage"].ToString();

                    string s = dt.Rows[0]["RemarksForClients"].ToString();
                    if (s.Length > 100)
                    {
                        //txtDescription = txtDescription.Substring(0, txtDescription.IndexOf(",", 100)).Trim();

                        resiRemarksForClients1.Text = GetText(s);
                    }
                    lbladdressresi1.Text = dt.Rows[0]["Address"].ToString() + ", " + dt.Rows[0]["Municipality"].ToString() + ", " + dt.Rows[0]["PostalCode"].ToString();

                    lblresimls1.Text = dt.Rows[0]["mls"].ToString();
                    lblresistatus1.Text = dt.Rows[0]["SaleLease"].ToString();
                    lblresitype1.Text = dt.Rows[0]["TypeOwn1Out"].ToString();
                    lblresiprice1.Text = dt.Rows[0]["ListPrice"].ToString();
                    btnResview1.NavigateUrl = "../Search.aspx?Municipality=Toronto";
                   // btnResview1.NavigateUrl = "../PropertyDetails.aspx?MLSID=" + dt.Rows[0]["MLS"].ToString() + "&PropertyType=" + dt.Rows[0]["pType"].ToString();
                    hlresi1.NavigateUrl = btnResview1.NavigateUrl;
                    string s1 = dt.Rows[1]["RemarksForClients"].ToString();
                    if (s1.Length > 100)
                    {
                        resiRemarksForClients2.Text = GetText(s1);
                    }
                    imgresi2.ImageUrl = dt.Rows[1]["pImage"].ToString();
                    lbladdressresi2.Text = dt.Rows[1]["Address"].ToString() + ", " + dt.Rows[1]["Municipality"].ToString() + ", " + dt.Rows[1]["PostalCode"].ToString(); 
                    lblresimls2.Text = dt.Rows[1]["mls"].ToString();
                    lblresistatus2.Text = dt.Rows[1]["SaleLease"].ToString();
                    lblresitype2.Text = dt.Rows[1]["TypeOwn1Out"].ToString();
                    lblresiprice2.Text = dt.Rows[1]["ListPrice"].ToString();
                    btnResview2.NavigateUrl = "../Search.aspx?Municipality=Mississauga";
                   // btnResview2.NavigateUrl = "../PropertyDetails.aspx?MLSID=" + dt.Rows[1]["MLS"].ToString() + "&PropertyType=" + dt.Rows[1]["pType"].ToString();
                    hlresi2.NavigateUrl = btnResview2.NavigateUrl;
                    string s2 = dt.Rows[2]["RemarksForClients"].ToString();
                    if (s2.Length > 100)
                    {

                        
                        resiRemarksForClients3.Text = GetText(s2);
                    }
                    imgresi3.ImageUrl = dt.Rows[2]["pImage"].ToString();
                    lbladdressresi3.Text = dt.Rows[2]["Address"].ToString() + ", " + dt.Rows[2]["Municipality"].ToString() + ", " + dt.Rows[2]["PostalCode"].ToString(); 
                    lblresimls3.Text = dt.Rows[2]["mls"].ToString();
                    lblresistatus3.Text = dt.Rows[2]["SaleLease"].ToString();
                    lblresitype3.Text = dt.Rows[2]["TypeOwn1Out"].ToString();
                    lblresiprice3.Text = dt.Rows[2]["ListPrice"].ToString();
                    btnResview3.NavigateUrl = "../Search.aspx?Municipality=Brampton";
                   // btnResview3.NavigateUrl = "../PropertyDetails.aspx?MLSID=" + dt.Rows[2]["MLS"].ToString() + "&PropertyType=" + dt.Rows[2]["pType"].ToString();
                    hlresi3.NavigateUrl = btnResview3.NavigateUrl;

                    string s3 = dt.Rows[3]["RemarksForClients"].ToString();
                    if (s3.Length > 100)
                    {


                        resiRemarksForClients4.Text = GetText(s3);
                    }
                    imgresi4.ImageUrl = dt.Rows[3]["pImage"].ToString();
                    lbladdressresi4.Text = dt.Rows[3]["Address"].ToString() + ", " + dt.Rows[3]["Municipality"].ToString() + ", " + dt.Rows[3]["PostalCode"].ToString(); ;
                    lblresimls4.Text = dt.Rows[3]["mls"].ToString();
                    lblresistatus4.Text = dt.Rows[3]["SaleLease"].ToString();
                    lblresitype4.Text = dt.Rows[3]["TypeOwn1Out"].ToString();
                    lblresiprice4.Text = dt.Rows[3]["ListPrice"].ToString();
                    btnResview4.NavigateUrl = "../Search.aspx?Municipality=Markham";
                   // btnResview4.NavigateUrl = "../PropertyDetails.aspx?MLSID=" + dt.Rows[3]["MLS"].ToString() + "&PropertyType=" + dt.Rows[3]["pType"].ToString();
                    hlresi4.NavigateUrl = btnResview3.NavigateUrl;
                    //DataList1.DataSource = dt;
                    //DataList1.DataBind();
                }
                else
                {
                    //resultSearch.Visible = true;
                    //pagesLink.Visible = false;
                    //resultSearch.Text = "Property is not available ";
                }

            }
            catch (Exception ex)
            {

            }
            finally
            {

            }
        }
    
        void SearchCommercialProperties()
        {
            //Session["QueryString112"] = "Commercial";
            try
            {
                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();

                DataTable dt = new DataTable();
               // if (Convert.ToString(Session["QueryString112"]) == "Commercial")
                    dt = mlsClient.GetAllCommercialPropertiesTop3  ("0", "0", "0", "0", "0", "0");
               // else
                   // dt = mlsClient.GetAllCommercialPropertiesTop3(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());
                if (dt.Rows.Count > 0)
                {
                    string s = dt.Rows[0]["RemarksForClients"].ToString();
                    if (s.Length > 100)
                    {

                        
                        commRemarksForClients1.Text =  GetText(s);
                    }
                    //imgcomm.ImageUrl = dt.Rows[2]["pImage"].ToString();
                  
                    imgcomm1.ImageUrl = dt.Rows[0]["pImage"].ToString();
                    commaddress1.Text = dt.Rows[0]["Address"].ToString() + ", " + dt.Rows[0]["Municipality"].ToString() + ", " + dt.Rows[0]["PostalCode"].ToString();
                    commmls1.Text = dt.Rows[0]["mls"].ToString();
                    commstatus1.Text = dt.Rows[0]["SaleLease"].ToString();
                    commtype1.Text = dt.Rows[0]["TypeOwn1Out"].ToString();
                    commprice1.Text = dt.Rows[0]["ListPrice"].ToString();
                    btnComview1.NavigateUrl = "../Search.aspx?Municipality=Toronto";
                    //btnComview1.NavigateUrl = "../PropertyDetails.aspx?MLSID=" + dt.Rows[0]["MLS"].ToString() + "&PropertyType=" + dt.Rows[0]["pType"].ToString();
                    hlcom1.NavigateUrl = btnComview1.NavigateUrl;
                    string s1 = dt.Rows[1]["RemarksForClients"].ToString();
                    if (s1.Length > 100)
                    {


                        commRemarksForClients2.Text = GetText(s1);
                    }
                    imgcomm2.ImageUrl = dt.Rows[1]["pImage"].ToString();

                    commaddress2.Text = dt.Rows[1]["Address"].ToString() + ", " + dt.Rows[1]["Municipality"].ToString() + ", " + dt.Rows[1]["PostalCode"].ToString();
                    commmls2.Text = dt.Rows[1]["mls"].ToString();
                    commstatus2.Text = dt.Rows[1]["SaleLease"].ToString();
                    commtype2.Text = dt.Rows[1]["TypeOwn1Out"].ToString();
                    commprice2.Text = dt.Rows[1]["ListPrice"].ToString();
                    btnComview2.NavigateUrl = "../Search.aspx?Municipality=Mississauga";
                    //btnComview2.NavigateUrl = "../PropertyDetails.aspx?MLSID=" + dt.Rows[1]["MLS"].ToString() + "&PropertyType=" + dt.Rows[1]["pType"].ToString();
                    hlcom2.NavigateUrl = btnComview2.NavigateUrl;
                    string s2 = dt.Rows[2]["RemarksForClients"].ToString();
                    if (s2.Length > 100)
                    {


                        commRemarksForClients3.Text = GetText(s2);
                    }
                    imgcomm3.ImageUrl = dt.Rows[2]["pImage"].ToString();
                    commaddress3.Text = dt.Rows[2]["Address"].ToString() + ", " + dt.Rows[2]["Municipality"].ToString() + ", " + dt.Rows[2]["PostalCode"].ToString();
                    commmls3.Text = dt.Rows[2]["mls"].ToString();
                    commstatus3.Text = dt.Rows[2]["SaleLease"].ToString();
                    commtype3.Text = dt.Rows[2]["TypeOwn1Out"].ToString();
                    commprice3.Text = dt.Rows[2]["ListPrice"].ToString();
                    btnComview3.NavigateUrl = "../Search.aspx?Municipality=Brampton";
                   // btnComview3.NavigateUrl = "../PropertyDetails.aspx?MLSID=" + dt.Rows[2]["MLS"].ToString() + "&PropertyType=" + dt.Rows[2]["pType"].ToString();
                    hlcom3.NavigateUrl = btnComview3.NavigateUrl;

                    string s3 = dt.Rows[3]["RemarksForClients"].ToString();
                    if (s3.Length > 100)
                    {


                        commRemarksForClients4.Text = GetText(s3);
                    }
                    imgcomm4.ImageUrl = dt.Rows[3]["pImage"].ToString();
                    commaddress4.Text = dt.Rows[3]["Address"].ToString() + ", " + dt.Rows[3]["Municipality"].ToString() + ", " + dt.Rows[3]["PostalCode"].ToString();
                    commmls4.Text = dt.Rows[3]["mls"].ToString();
                    commstatus4.Text = dt.Rows[3]["SaleLease"].ToString();
                    commtype4.Text = dt.Rows[3]["TypeOwn1Out"].ToString();
                    commprice4.Text = dt.Rows[3]["ListPrice"].ToString();
                    btnComview4.NavigateUrl = "../Search.aspx?Municipality=Markham";
                   // btnComview4.NavigateUrl = "../PropertyDetails.aspx?MLSID=" + dt.Rows[3]["MLS"].ToString() + "&PropertyType=" + dt.Rows[3]["pType"].ToString();
                    hlcom4.NavigateUrl = btnComview3.NavigateUrl;
                }
                else
                {
                    //resultSearch.Visible = true;
                    //pagesLink.Visible = false;
                    //resultSearch.Text = "Property is not available ";
                }
            }
            catch (Exception ex)
            {
            }
            finally
            {
            }
        }

        void SearchCondoProperties()
        {
          //  Session["QueryString112"] = "Condo";
            try
            {
                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();

                DataTable dt = new DataTable();
               // if (Convert.ToString(Session["QueryString112"]) == "Condo")
                    dt = mlsClient.GetProperties_CondoTop3("0", "0", "0", "0", "0", "0", "0", "0");
               // else
                   // dt = mlsClient.GetProperties_CondoTop3(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Beds"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString(), "0");     
               if (dt.Rows.Count > 0)
               {
                   string s = dt.Rows[0]["RemarksForClients"].ToString();
                   if (s.Length > 100)
                   {

                       
                       condoRemarksForClients1.Text = GetText(s);
                   }
                   //imgcondo.ImageUrl = dt.Rows[2]["pImage"].ToString();
                   imgcondo1.ImageUrl = dt.Rows[0]["pImage"].ToString();
                   condoaddress1.Text = dt.Rows[0]["Address"].ToString() + ", " + dt.Rows[0]["Municipality"].ToString() + ", " + dt.Rows[0]["PostalCode"].ToString();
                   condomls1.Text = dt.Rows[0]["mls"].ToString();
                   condostatus1.Text = dt.Rows[0]["SaleLease"].ToString();
                   condotype1.Text = dt.Rows[0]["TypeOwn1Out"].ToString();
                   condoprice1.Text = dt.Rows[0]["ListPrice"].ToString();
                  // btnConview1.NavigateUrl = "../PropertyDetails.aspx?MLSID=" + dt.Rows[0]["MLS"].ToString() + "&PropertyType=" + dt.Rows[0]["pType"].ToString();
                   btnConview1.NavigateUrl = "../Search.aspx?Municipality=Toronto";
                   hlcon1.NavigateUrl = btnConview1.NavigateUrl;
                   string s1 = dt.Rows[1]["RemarksForClients"].ToString();
                   if (s1.Length > 100)
                   {
                       condoRemarksForClients2.Text = GetText(s1);
                   }
                   imgcondo2.ImageUrl = dt.Rows[1]["pImage"].ToString();
                   condoaddress2.Text = dt.Rows[1]["Address"].ToString() + ", " + dt.Rows[1]["Municipality"].ToString() + ", " + dt.Rows[1]["PostalCode"].ToString();
                   condomls2.Text = dt.Rows[1]["mls"].ToString();
                   condostatus2.Text = dt.Rows[1]["SaleLease"].ToString();
                   condotype2.Text = dt.Rows[1]["TypeOwn1Out"].ToString();
                   condoprice2.Text = dt.Rows[1]["ListPrice"].ToString();
                   btnConview2.NavigateUrl = "../Search.aspx?Municipality=Mississauga";
                  // btnConview2.NavigateUrl = "../PropertyDetails.aspx?MLSID=" + dt.Rows[1]["MLS"].ToString() + "&PropertyType=" + dt.Rows[1]["pType"].ToString();
                   hlcon2.NavigateUrl = btnConview2.NavigateUrl;

                   string s2 = dt.Rows[2]["RemarksForClients"].ToString();
                   if (s2.Length > 100)
                   {
                       condoRemarksForClients3.Text = GetText(s2);
                   }
                   imgcondo3.ImageUrl = dt.Rows[2]["pImage"].ToString();
                   condoaddress3.Text = dt.Rows[2]["Address"].ToString() + ", " + dt.Rows[1]["Municipality"].ToString() + ", " + dt.Rows[1]["PostalCode"].ToString();
                   condomls3.Text = dt.Rows[2]["mls"].ToString();
                   condostatus3.Text = dt.Rows[2]["SaleLease"].ToString();
                   condotype3.Text = dt.Rows[2]["TypeOwn1Out"].ToString();
                   condoprice3.Text = dt.Rows[2]["ListPrice"].ToString();
                   hlcon3.NavigateUrl = btnConview3.NavigateUrl;
                   btnConview3.NavigateUrl = "../Search.aspx?Municipality=Brampton";
                  // btnConview3.NavigateUrl = "../PropertyDetails.aspx?MLSID=" + dt.Rows[2]["MLS"].ToString() + "&PropertyType=" + dt.Rows[2]["pType"].ToString();
                   hlcon3.NavigateUrl = btnConview3.NavigateUrl;

                   string s3 = dt.Rows[3]["RemarksForClients"].ToString();
                   if (s3.Length > 100)
                   {
                       condoRemarksForClients4.Text = GetText(s3);
                   }
                   imgcondo4.ImageUrl = dt.Rows[3]["pImage"].ToString();
                   condoaddress4.Text = dt.Rows[3]["Address"].ToString() + ", " + dt.Rows[3]["Municipality"].ToString() + ", " + dt.Rows[3]["PostalCode"].ToString();
                   condomls4.Text = dt.Rows[3]["mls"].ToString();
                   condostatus4.Text = dt.Rows[3]["SaleLease"].ToString();
                   condotype4.Text = dt.Rows[3]["TypeOwn1Out"].ToString();
                   condoprice4.Text = dt.Rows[3]["ListPrice"].ToString();
                   hlcon4.NavigateUrl = btnConview3.NavigateUrl;
                   btnConview4.NavigateUrl = "../Search.aspx?Municipality=Markham";
                 //  btnConview4.NavigateUrl = "../PropertyDetails.aspx?MLSID=" + dt.Rows[3]["MLS"].ToString() + "&PropertyType=" + dt.Rows[3]["pType"].ToString();
                   hlcon4.NavigateUrl = btnConview3.NavigateUrl;
               }
               else
               {
                   //pagesLink.Visible = false;
                   //resultSearch.Visible = true;
                   //resultSearch.Text = "Property is not available ";
               }
            }
            catch (Exception ex)
            {

            }
            finally
            {

            }
        }

        #endregion PageLoad

        #region Button Click's

        //protected void btnSearch_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        Session["SearchType"] = "Residential";
        //        Session["SearchText"] = txtSearch.Text;
        //        Session["HomeType"] = Convert.ToString(ddlPropertyType.SelectedValue);
        //        Session["MinPrice"] = Convert.ToString(ddlMinPrice.SelectedValue);
        //        Session["MaxPrice"] = Convert.ToString(ddlMaxPrice.SelectedValue);
        //        Session["Beds"] = Convert.ToString(ddlBeds.SelectedValue);
        //        Session["Baths"] = Convert.ToString(ddlBaths.SelectedValue);
        //        Session["SaleLease"] = Convert.ToString(ddlType.SelectedValue);
        //        Response.Redirect("~/Search.aspx", false);
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    { }
        //}

        //protected void btnCommSearch_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        Session["SearchType"] = "Commercial";
        //        Session["SearchText"] = txtCommSearch.Text;
        //        Session["HomeType"] = Convert.ToString(ddlCommHome.SelectedValue);
        //        Session["MinPrice"] = Convert.ToString(ddlCommMinPrice.SelectedValue);
        //        Session["MaxPrice"] = Convert.ToString(ddlCommMaxPrice.SelectedValue);
        //        Session["Baths"] = Convert.ToString(ddlCommBaths.SelectedValue);
        //        Session["SaleLease"] = Convert.ToString(ddlCommSaleRent.SelectedValue);
        //        Response.Redirect("~/Search.aspx", false);
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    { }
        //}

        //protected void btnCondoSearch_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        Session["SearchType"] = "Condo";
        //        Session["SearchText"] = txtCondoSearch.Text;
        //        Session["HomeType"] = Convert.ToString(ddlCondoHome.SelectedValue);
        //        Session["MinPrice"] = Convert.ToString(ddlCondoMinPrice.SelectedValue);
        //        Session["MaxPrice"] = Convert.ToString(ddlCondoMaxPrice.SelectedValue);
        //        Session["Beds"] = Convert.ToString(ddlCondoBeds.SelectedValue);
        //        Session["Baths"] = Convert.ToString(ddlCondoBaths.SelectedValue);
        //        Session["SaleLease"] = Convert.ToString(ddlCondoType.SelectedValue);
        //        Response.Redirect("~/Search.aspx", false);
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    { }
        //}

        #endregion Button Click's

        #region DropDownFill Method

        //protected void GetPropertyType()
        //{
        //    Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
        //    DataTable dt = new DataTable();
        //    dt = ml.GetPropertyTypesResidential();
        //    ddlPropertyType.DataSource = dt;
        //    ddlPropertyType.DataTextField = "TypeOwn1Out";
        //    ddlPropertyType.DataValueField = "TypeOwn1Out";
        //    ddlPropertyType.DataBind();
        //    ddlPropertyType.Items.Insert(0, new ListItem("Any", "0"));
        //}

        //protected void GetPropertyType_Comm()
        //{
        //    Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
        //    DataTable dt = new DataTable();
        //    dt = ml.GetPropertyTypesCommercial();
        //    ddlCommHome.DataSource = dt;
        //    ddlCommHome.DataTextField = "TypeOwn1Out";
        //    ddlCommHome.DataValueField = "TypeOwn1Out";
        //    ddlCommHome.DataBind();
        //    ddlCommHome.Items.Insert(0, new ListItem("Any", "0"));
        //}

        //protected void GetPropertyType_Condo()
        //{
        //    Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
        //    DataTable dt = new DataTable();
        //    dt = ml.GetPropertyTypesCondo();
        //    ddlCondoHome.DataSource = dt;
        //    ddlCondoHome.DataTextField = "TypeOwn1Out";
        //    ddlCondoHome.DataValueField = "TypeOwn1Out";
        //    ddlCondoHome.DataBind();
        //    ddlCondoHome.Items.Insert(0, new ListItem("Any", "0"));
        //}

        //protected void GetSaleLease_Residential()
        //{
        //    Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
        //    DataTable dt = new DataTable();
        //    dt = ml.GetSaleLeaseResidential();
        //    ddlType.DataSource = dt;
        //    ddlType.DataTextField = "SaleLease";
        //    ddlType.DataValueField = "SaleLease";
        //    ddlType.DataBind();
        //    ddlType.Items.Insert(0, new ListItem("Any", "0"));
        //}

        //protected void GetSaleLease_Comm()
        //{
        //    Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
        //    DataTable dt = new DataTable();
        //    dt = ml.GetSaleLeaseCommercial();
        //    ddlCommSaleRent.DataSource = dt;
        //    ddlCommSaleRent.DataTextField = "SaleLease";
        //    ddlCommSaleRent.DataValueField = "SaleLease";
        //    ddlCommSaleRent.DataBind();
        //    ddlCommSaleRent.Items.Insert(0, new ListItem("Any", "0"));
        //}

        //protected void GetSaleLease_Condo()
        //{
        //    Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
        //    DataTable dt = new DataTable();
        //    dt = ml.GetSaleLeaseCondo();
        //    ddlCondoType.DataSource = dt;
        //    ddlCondoType.DataTextField = "SaleLease";
        //    ddlCondoType.DataValueField = "SaleLease";
        //    ddlCondoType.DataBind();
        //    ddlCondoType.Items.Insert(0, new ListItem("Any", "0"));
        //}

        #endregion DropDownFill Method

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] GetAutoCompleteData(string prefixText, int count, string contextKey)
       {
            List<String> itemNames = new List<String>();
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = ml.GetAutoCompleteData(prefixText);
            foreach (DataRow dr in dt.Rows)
            {
                String item = dr["Province"].ToString();

                itemNames.Add(item);
            }
            string[] prefixTextArray = itemNames.ToArray();
            return prefixTextArray;
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] GetAutoCompleteData_Comm(string prefixText, int count, string contextKey)
        {
            List<String> itemNames = new List<String>();
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = ml.GetAutoCompleteData_Comm(prefixText);
            foreach (DataRow dr in dt.Rows)
            {
                String item = dr["Province"].ToString();

                itemNames.Add(item);
            }
            string[] prefixTextArray = itemNames.ToArray();
            return prefixTextArray;
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] GetAutoCompleteData_Condo(string prefixText, int count, string contextKey)
        {
            List<String> itemNames = new List<String>();
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = ml.GetAutoCompleteData_Condo(prefixText);
            foreach (DataRow dr in dt.Rows)
            {
                String item = dr["Province"].ToString();

                itemNames.Add(item);
            }
            string[] prefixTextArray = itemNames.ToArray();
            return prefixTextArray;
        }
    }
}
