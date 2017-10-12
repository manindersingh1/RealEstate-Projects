using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Property_cls;
using System.Data.SqlClient;
using System.Configuration;

namespace Property.Admin
{
    public partial class Virtual : System.Web.UI.Page
    {

        #region Global
        #region Global
        cls_Property clsobj = new cls_Property();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
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
            dt = clsobj.GetVirtualTour();
            DataView dv = dt.DefaultView;
            if (strSortExpression != "" && strSortDirection != "")
            {
                dv.Sort = strSortExpression + " " + strSortDirection;
            }
            grdvirtualtour.DataSource = dt;
            grdvirtualtour.EmptyDataText = "No Record Found";
            grdvirtualtour.DataBind();
            if (intPageIndex != 0)
                grdvirtualtour.PageIndex = intPageIndex;
        }
        protected void grdFeatures_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grdvirtualtour.PageIndex = e.NewPageIndex;
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
                intPageIndex = grdvirtualtour.PageIndex;
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
                string PageID = Convert.ToString(e.CommandArgument);
                string result = Convert.ToString(mlsClient.DeleteFeatures(PageID));
                FillGridData();
            }
            if (e.CommandName == "create")
            {
                Response.Redirect("CreateVirtualTour.aspx");
            }
        }

        #endregion Grid_Method and Grid's Event
        protected string GetHiddenValue()
        {
            string Rslt = "";
            foreach (GridViewRow gvrow in grdvirtualtour.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)grdvirtualtour.HeaderRow.FindControl("chkdeleteAll");
                CheckBox chkdelete = (CheckBox)gvrow.FindControl("chkdelete");
                if (chkdelete.Checked)
                {
                    HiddenField ID = gvrow.FindControl("hdnID") as HiddenField;
                    Rslt += ID.Value + ",";
                }
            }
            Rslt = Rslt.TrimEnd(',');
            return Rslt;
        }

        #region Button Click
        protected void chkdeleteAll_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdvirtualtour.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)grdvirtualtour.HeaderRow.FindControl("chkdeleteAll");
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkdelete");
                ChkBoxRows.Checked = ChkBoxHeader.Checked;
            }
        }

        protected void chkdelete_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdvirtualtour.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)grdvirtualtour.HeaderRow.FindControl("chkdeleteAll");
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkdelete");
                if (ChkBoxRows.Checked == false)
                {
                    ChkBoxHeader.Checked = false;
                }
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateVirtualTour.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashBoard.aspx");
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string SelectedIds = GetHiddenValue();
            SqlCommand cmd = new SqlCommand("delete from  [dbo].[tblVirtual]  where ID in(" + SelectedIds + ")", conn);
            // SqlCommand cmd = new SqlCommand("delete from tblContactUs where Name='';", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            FillGridData();

        }

        #endregion Button Click
    }
}