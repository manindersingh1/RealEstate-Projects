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
    public partial class Appointments : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        Cryptography crpt = new Cryptography();
        #region Global

        cls_Property clsobj = new cls_Property();

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

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FirstName"] == null)
            {
                Response.Redirect("~/Admin/AdminLogin.aspx", false);
            }

            if (!IsPostBack)
                FillGridData();
        }

        #endregion Page Load

        #region Grid Events and Methods

        protected void FillGridData()
        {
            DataView dv = new DataView();
            dv.Table = clsobj.GetScheduledAppointments();

            if (strSortExpression != "" && strSortDirection != "")
            {
                dv.Sort = strSortExpression + " " + strSortDirection;
            }
            if(dv.Count>0)
            {
                btnDelete.Visible = true;
                grdAppointments.DataSource = dv;
                grdAppointments.DataBind();
            }
            else
            {
                grdAppointments.DataSource = dv;
                grdAppointments.DataBind();
                alertMSG.Visible = true;
                btnDelete.Visible = false;
            }
          

            if (intPageIndex != 0)
                grdAppointments.PageIndex = intPageIndex;
        }

        protected void grdAppointments_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grdAppointments.PageIndex = e.NewPageIndex;
                FillGridData();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void grdAppointments_Sorting(object sender, GridViewSortEventArgs e)
        {
            try
            {
                strSortExpression = e.SortExpression;
                strSortDirection = GetSortDirection();
                intPageIndex = grdAppointments.PageIndex;
                FillGridData();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion Grid Events and Methods

        #region Button Click

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashBoard.aspx");
        }

        #endregion Button Click

        protected string GetHiddenValue()
        {
            string Rslt = "";
            foreach (GridViewRow gvrow in grdAppointments.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)grdAppointments.HeaderRow.FindControl("chkdeleteAll");
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
        protected void chkdeleteAll_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdAppointments.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)grdAppointments.HeaderRow.FindControl("chkdeleteAll");
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkdelete");
                ChkBoxRows.Checked = ChkBoxHeader.Checked;
            }
        }

        protected void chkdelete_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdAppointments.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)grdAppointments.HeaderRow.FindControl("chkdeleteAll");
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkdelete");
                if (ChkBoxRows.Checked == false)
                {
                    ChkBoxHeader.Checked = false;
                }
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string SelectedIds = GetHiddenValue();
            SqlCommand cmd = new SqlCommand("delete from  [dbo].[tbl_ScheduleAppointment]  where ID in(" + SelectedIds + ")", conn);
            // SqlCommand cmd = new SqlCommand("delete from tblContactUs where Name='';", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            FillGridData();

        }
        
    }
}