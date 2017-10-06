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
    public partial class WebForm3 : System.Web.UI.Page
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
            string s = residential.Text;
            //if (s == "Residential Listings")
            //{
            //    Session["SearchType"] = "Residential";
            //}
            //else if 
            if (!IsPostBack)
            {
                SearchResidentialProperties();
                //LoadImageandName();
                ((HtmlGenericControl)this.Page.Master.FindControl("Homebanner")).Style.Add("display", "block");
                //GetPropertyType();
                //GetPropertyType_Comm();
                //GetPropertyType_Condo();
                //GetSaleLease_Residential();
                //GetSaleLease_Comm();
                //GetSaleLease_Condo();
            }
        }

        void SearchResidentialProperties()
        {
            try
            {
                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                DataTable dt = new DataTable();
                if (Convert.ToString(Session["QueryString"]) == "Residential" || Convert.ToString(Session["QueryString"]) == "IDXImagesResidential")
                    dt = mlsClient.GetResidentialProperties("0", "0", "0", "0", "0", "0", "0");
                else
                    dt = mlsClient.GetResidentialProperties(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Beds"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());

                if (dt.Rows.Count > 0)
                {

                    //upSearch.Visible = true;
                    PagedDataSource pagedData = new PagedDataSource();
                    pagedData.DataSource = dt.DefaultView;
                    pagedData.AllowPaging = true;
                    pagedData.PageSize = 8;
                    //pagedData.CurrentPageIndex = CurrentPage;
                    ViewState["totpage"] = pagedData.PageCount;

                    //lnkPrevious.Visible = !pagedData.IsFirstPage;
                    //lnkNext.Visible = !pagedData.IsLastPage;
                    //lnkFirst.Visible = !pagedData.IsFirstPage;
                    //lnkLast.Visible = !pagedData.IsLastPage;

                    ddlresidential.DataSource = pagedData;
                    ddlresidential.DataBind();

                    ddlresidential.DataSource = pagedData;
                    ddlresidential.DataBind();

                    //doPaging();
                    //RepeaterPaging.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
                    mlsClient = null;
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
        //protected void GetPropertyType()
        //{
        //    Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
        //    DataTable dt = new DataTable();
        //    dt = ml.GetPropertyTypesResidential();
        //    if (dt.Rows.Count > 0)
        //    {
        //        //lblresi1.Text = dt.Rows[0]["typeown1out"].ToString();
        //    }

        //}



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
