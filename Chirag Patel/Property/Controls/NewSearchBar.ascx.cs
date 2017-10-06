using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property.Controls
{
    public partial class NewSearchBar : System.Web.UI.UserControl
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
            this.Page.Title = "Raghbir Realtor:Home";
            //Session["SearchType"] = null;

            if (!IsPostBack)
            {
                //((HtmlGenericControl)this.Page.Master.FindControl("Homebanner")).Style.Add("display", "block");
                //GetPropertyType();
                //GetPropertyType_Comm();
                //GetPropertyType_Condo();
                //GetSaleLease_Residential();
                //GetSaleLease_Comm();
                //GetSaleLease_Condo();
                Session["FirstName"] = null;
                Session["PropertySearchType"] = null;
            }
        }
        #endregion PageLoad

       

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                Session["SearchType"] = null;
                Session["SearchType"] = "Residential";
                Session["SearchText"] = txtSearch.Text;

                string var = txtSearch.Text;
                Response.Redirect("~/SearchedProperty.aspx", false);
             
            }
            catch (Exception ex)
            {
            }
            finally
            { }
        }
    }
}