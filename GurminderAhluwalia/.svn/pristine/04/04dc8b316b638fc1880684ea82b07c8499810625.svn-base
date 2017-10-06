using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Property_cls;

namespace Property.Admin
{
    public partial class Features : System.Web.UI.Page
    {

        #region Global
        #region Global
        cls_Property clsobj = new cls_Property();
        #endregion Global

        Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();

        String strSortExpression = "", strSortDirection = "";
        int intPageIndex = 0;

        public String GridViewSortDirection
        {
            get
            {
                if (ViewState["GridViewSortDirection"] == null)
                {
                    return "DESC";
                }
                else
                {
                    return ViewState["GridViewSortDirection"].ToString();
                }
            }

            set
            {
                ViewState["GridViewSortDirection"] = value;
            }

        }

        String GetSortDirection()
        {
            String GridViewSortDirectionNew;

            switch (GridViewSortDirection)
            {
                case "DESC":
                    GridViewSortDirectionNew = "ASC";
                    break;
                case "ASC":
                    GridViewSortDirectionNew = "DESC";
                    break;
                default:
                    GridViewSortDirectionNew = "DESC";
                    break;

            }
            GridViewSortDirection = GridViewSortDirectionNew;
            return GridViewSortDirectionNew;

        }

        #endregion Global

        #region Page_Load

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FirstName"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
            if (!IsPostBack)
            {
                FillGridData();
            }
        }

        #endregion Page_Load

        #region Grid_Method and Grid's Event

        protected void FillGridData()
        {
            DataTable dt = new DataTable();
            dt = clsobj.GetFeaturedProperties();
//          DataTable dt = mlsClient.GetAllFeatures();
            DataView dv = dt.DefaultView;
            if (strSortExpression != "" && strSortDirection != "")
            {
                dv.Sort = strSortExpression + " " + strSortDirection;
            }
            grdFeatures.DataSource = dt;
            grdFeatures.EmptyDataText = "no feature property added yet! Click to create feature";
            grdFeatures.DataBind();
            if (intPageIndex != 0)
            grdFeatures.PageIndex = intPageIndex;
        }
        protected void grdFeatures_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grdFeatures.PageIndex = e.NewPageIndex;
                FillGridData();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void grdFeatures_Sorting(object sender, GridViewSortEventArgs e)
        {
            try
            {
                strSortExpression = e.SortExpression;
                strSortDirection = GetSortDirection();
                intPageIndex = grdFeatures.PageIndex;
                FillGridData();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void grdFeatures_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
        protected void grdFeatures_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           if (e.CommandName == "Delete")
            {
                 string PageID =Convert.ToString(e.CommandArgument);
                string result  = Convert.ToString(mlsClient.DeleteFeatures(PageID));
                FillGridData();
            }
             if (e.CommandName == "create")
             {
                 Response.Redirect("CreateFeature.aspx");
             }
        }

        #endregion Grid_Method and Grid's Event
        #region Button Click

        //protected void btnCreate_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("CreateFeature.aspx");
        //}

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashBoard.aspx");
        }

        #endregion Button Click
        protected void btnCreateFeature_Click(object sender, EventArgs e)
        {
            if (txtFeature.Text == "")
            {
                lblError.Text = "MLS-ID required";
                return;
            }
            cls_Property objprp = new cls_Property();
            string mls = txtFeature.Text;
            DataTable dt = objprp.GetFeaturedPropertiesByMlsId(mls);
            if (dt.Rows.Count > 0)
            {
                grdFeatures.DataSource = dt;
                grdFeatures.DataBind();
                lblError.Visible = false;
            }
            else
            {
                lblError.Text = "No Property Found!!";
            }
        }
    }
}