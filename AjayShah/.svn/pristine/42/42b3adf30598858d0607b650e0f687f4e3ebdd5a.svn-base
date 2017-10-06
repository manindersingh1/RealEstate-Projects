using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Property
{
    public partial class SearchControl : System.Web.UI.UserControl
    {

        #region PageLoad

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetPropertyType();
                GetPropertyType_Comm();
                GetPropertyType_Condo();
                GetSaleLease_Residential();
                GetSaleLease_Comm();
                GetSaleLease_Condo();
                GetData();
            }
        }

        #endregion Pageload

        #region Button Click's

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                Session["SearchType"] = "Residential";
                Session["SearchText"] = txtSearch.Text;
                Session["HomeType"] = Convert.ToString(ddlPropertyType.SelectedValue);
                Session["MinPrice"] = Convert.ToString(ddlMinPrice.SelectedValue);
                Session["MaxPrice"] = Convert.ToString(ddlMaxPrice.SelectedValue);
                Session["Beds"] = Convert.ToString(ddlBeds.SelectedValue);
                Session["Baths"] = Convert.ToString(ddlBaths.SelectedValue);
                Session["SaleLease"] = Convert.ToString(ddlType.SelectedValue);
                Response.Redirect("~/Search.aspx", false);
            }
            catch (Exception ex)
            {
            }
            finally
            { }
        }

        protected void btnCommSearch_Click(object sender, EventArgs e)
        {
            try
            {
                Session["SearchType"] = "Commercial";
                Session["SearchText"] = txtCommSearch.Text;
                Session["HomeType"] = Convert.ToString(ddlCommHome.SelectedValue);
                Session["MinPrice"] = Convert.ToString(ddlCommMinPrice.SelectedValue);
                Session["MaxPrice"] = Convert.ToString(ddlCommMaxPrice.SelectedValue);
                Session["Baths"] = Convert.ToString(ddlCommBaths.SelectedValue);
                Session["SaleLease"] = Convert.ToString(ddlCommSaleRent.SelectedValue);
                Response.Redirect("~/Search.aspx", false);
            }
            catch (Exception ex)
            {
            }
            finally
            { }
        }

        protected void btnCondoSearch_Click(object sender, EventArgs e)
        {
            try
            {
                Session["SearchType"] = "Condo";
                Session["SearchText"] = txtCondoSearch.Text;
                Session["HomeType"] = Convert.ToString(ddlCondoHome.SelectedValue);
                Session["MinPrice"] = Convert.ToString(ddlCondoMinPrice.SelectedValue);
                Session["MaxPrice"] = Convert.ToString(ddlCondoMaxPrice.SelectedValue);
                Session["Beds"] = Convert.ToString(ddlCondoBeds.SelectedValue);
                Session["Baths"] = Convert.ToString(ddlCondoBaths.SelectedValue);
                Session["SaleLease"] = Convert.ToString(ddlCondoType.SelectedValue);
                Response.Redirect("~/Search.aspx", false);
            }
            catch (Exception ex)
            {
            }
            finally
            { }
        }

        #endregion Button Click's

        #region DropDownFill Methods

        protected void GetPropertyType()
        {
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = new DataTable();
            dt = ml.GetPropertyTypesResidential();
            ddlPropertyType.DataSource = dt;
            ddlPropertyType.DataTextField = "TypeOwn1Out";
            ddlPropertyType.DataValueField = "TypeOwn1Out";
            ddlPropertyType.DataBind();
            ddlPropertyType.Items.Insert(0, new ListItem("Any", "0"));
        }

        protected void GetPropertyType_Comm()
        {
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = new DataTable();
            dt = ml.GetPropertyTypesCommercial();
            ddlCommHome.DataSource = dt;
            ddlCommHome.DataTextField = "TypeOwn1Out";
            ddlCommHome.DataValueField = "TypeOwn1Out";
            ddlCommHome.DataBind();
            ddlCommHome.Items.Insert(0, new ListItem("Any", "0"));
        }

        protected void GetPropertyType_Condo()
        {
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = new DataTable();
            dt = ml.GetPropertyTypesCondo();
            ddlCondoHome.DataSource = dt;
            ddlCondoHome.DataTextField = "TypeOwn1Out";
            ddlCondoHome.DataValueField = "TypeOwn1Out";
            ddlCondoHome.DataBind();
            ddlCondoHome.Items.Insert(0, new ListItem("Any", "0"));
        }

        protected void GetSaleLease_Residential()
        {
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = new DataTable();
            dt = ml.GetSaleLeaseResidential();
            ddlType.DataSource = dt;
            ddlType.DataTextField = "SaleLease";
            ddlType.DataValueField = "SaleLease";
            ddlType.DataBind();
            ddlType.Items.Insert(0, new ListItem("Any", "0"));
        }

        protected void GetSaleLease_Comm()
        {
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = new DataTable();
            dt = ml.GetSaleLeaseCommercial();
            ddlCommSaleRent.DataSource = dt;
            ddlCommSaleRent.DataTextField = "SaleLease";
            ddlCommSaleRent.DataValueField = "SaleLease";
            ddlCommSaleRent.DataBind();
            ddlCommSaleRent.Items.Insert(0, new ListItem("Any", "0"));
        }

        protected void GetSaleLease_Condo()
        {
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = new DataTable();
            dt = ml.GetSaleLeaseCondo();
            ddlCondoType.DataSource = dt;
            ddlCondoType.DataTextField = "SaleLease";
            ddlCondoType.DataValueField = "SaleLease";
            ddlCondoType.DataBind();
            ddlCondoType.Items.Insert(0, new ListItem("Any", "0"));
        }

        #endregion DropDownFill Methods

        #region Other Method

        protected void GetData()
        {
            if (Session["SearchType"].ToString().Contains("Residential"))
            {
                txtSearch.Text = Convert.ToString(Session["SearchText"]);
                ddlPropertyType.SelectedValue = Convert.ToString(Session["HomeType"]);
                ddlMinPrice.SelectedValue = Convert.ToString(Session["MinPrice"]);
                ddlMaxPrice.SelectedValue = Convert.ToString(Session["MaxPrice"]);
                ddlBeds.SelectedValue = Convert.ToString(Session["Beds"]);
                ddlBaths.SelectedValue = Convert.ToString(Session["Baths"]);
                ddlType.SelectedValue = Convert.ToString(Session["SaleLease"]);
            }
            else if(Session["SearchType"].ToString().Contains("Commercial"))
            {
                txtCommSearch.Text = Convert.ToString(Session["SearchText"]);
                ddlCommHome.SelectedValue = Convert.ToString(Session["HomeType"]);
                ddlCommMinPrice.SelectedValue = Convert.ToString(Session["MinPrice"]);
                ddlCommMaxPrice.SelectedValue = Convert.ToString(Session["MaxPrice"]);
                ddlCommBaths.SelectedValue = Convert.ToString(Session["Baths"]);
                ddlCommSaleRent.SelectedValue = Convert.ToString(Session["SaleLease"]);
            }
            else if (Session["SearchType"].ToString().Contains("Condo"))
            {
                txtCondoSearch.Text = Convert.ToString(Session["SearchText"]);
                ddlCondoHome.SelectedValue = Convert.ToString(Session["HomeType"]);
                ddlCondoMinPrice.SelectedValue = Convert.ToString(Session["MinPrice"]);
                ddlCondoMaxPrice.SelectedValue = Convert.ToString(Session["MaxPrice"]);
                ddlCondoBeds.SelectedValue = Convert.ToString(Session["Beds"]);
                ddlCondoBaths.SelectedValue = Convert.ToString(Session["Baths"]);
                ddlCondoType.SelectedValue = Convert.ToString(Session["SaleLease"]);
            }
        }

        #endregion Other Method


        
    }
}