using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Property.Admin
{
    public partial class AdminPanel : System.Web.UI.Page
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
            if (Session["FirstName"] != null)
            {
                if (!IsPostBack)
                {
                    GetPropertyType();
                }
            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx", false);
            }
        }

        #endregion PageLoad

        #region Button Click's

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                Session["SearchType"] = "Residential";
                Session["SearchText"] = txtSearch.Text;
                Session["MinPrice"] = Convert.ToString(ddlMinPrice.SelectedValue);
                Session["MaxPrice"] = Convert.ToString(ddlMaxPrice.SelectedValue);
                Session["Beds"] = Convert.ToString(ddlBeds.SelectedValue);
                Session["Baths"] = Convert.ToString(ddlBaths.SelectedValue);
                Response.Redirect("Search.aspx");
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
                Session["MinPrice"] = Convert.ToString(ddlCommMinPrice.SelectedValue);
                Session["MaxPrice"] = Convert.ToString(ddlCommMaxPrice.SelectedValue);
                Session["Baths"] = Convert.ToString(ddlCommBaths.SelectedValue);
                Response.Redirect("Search.aspx");
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
                Session["MinPrice"] = Convert.ToString(ddlCondoMinPrice.SelectedValue);
                Session["MaxPrice"] = Convert.ToString(ddlCondoMaxPrice.SelectedValue);
                Session["Beds"] = Convert.ToString(ddlCondoBeds.SelectedValue);
                Session["Baths"] = Convert.ToString(ddlCondoBaths.SelectedValue);
                Response.Redirect("Search.aspx");
            }
            catch (Exception ex)
            {
            }
            finally
            { }
        }

        #endregion Button Click's

        #region DropDownFill Method

        protected void GetPropertyType()
        {
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = new DataTable();
            dt = ml.GetPropertyTypesResidential();
            ddlPropertyType.DataSource = dt;
            ddlPropertyType.DataTextField = "TypeOwn1Out";
            ddlPropertyType.DataValueField = "TypeOwn1Out";
            ddlPropertyType.DataBind();
            ddlPropertyType.Items.Insert(0, "Any");
        }

        #endregion DropDownFill Method
    }
}