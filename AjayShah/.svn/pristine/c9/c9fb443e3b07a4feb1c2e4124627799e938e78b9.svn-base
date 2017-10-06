using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Property_Cryptography;
using Property_cls;

namespace Property.Admin
{
    public partial class ContactedUsers : System.Web.UI.Page
    {
        #region Global

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        Cryptography crpt = new Cryptography();

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
            if (Session["FirstName"] != null)
            {
                if (!IsPostBack)
                {                  
                    ContactedUserGrid();
                }
            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx", false);
            }
        }

        #endregion Page Load

        #region Grid Events & Methods
          

           

        protected void grdUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblPassword = (Label)e.Row.FindControl("lblPassword");
                lblPassword.Text = crpt.Decrypt(lblPassword.Text);
            }
        }

        #endregion Grid Events & Methods

        #region ContactedUserGrid Events & Methods

        protected void ContactedUserGrid()
        {
            DataView dv = new DataView();
            dv.Table = GetContactedUsers();

           
            if (strSortExpression != "" && strSortDirection != "")
            {
                dv.Sort = strSortExpression + " " + strSortDirection;
            }
            if(dv.Count>0)
            {
                btnDelete.Visible = true;
                grdContactedUsers.DataSource = dv;
                grdContactedUsers.DataBind();
            }
            else
            {
                grdContactedUsers.DataSource = dv;
                grdContactedUsers.DataBind();
                btnDelete.Visible = false;
            }
           

            if (intPageIndex != 0)
                grdContactedUsers.PageIndex = intPageIndex;

        }

        protected DataTable GetContactedUsers()
        {
            DataTable dt = new DataTable();
            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string str = "select ID,FirstName,LastName,EmailId,PhoneNumber,Message,CONVERT(VARCHAR(11),Dated,6) as Dated,IsDelete,FirstName + ' ' + Lastname as Name from tblContactUs where IsDelete=0 and firstname!='' order by dated desc";
                SqlDataAdapter adp = new SqlDataAdapter(str, conn);
                adp.Fill(dt);
                dt.TableName = "ContactedUsers";
                if (dt.Rows.Count == 0)
                {
                    btnDelete.Visible = false;
                    alertMSG.Visible = true;
                }
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
            }
            return dt;
        }

        protected void grdContactedUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grdContactedUsers.PageIndex = e.NewPageIndex;
                ContactedUserGrid();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void grdContactedUsers_Sorting(object sender, GridViewSortEventArgs e)
        {
            try
            {
                strSortExpression = e.SortExpression;
                strSortDirection = GetSortDirection();
                intPageIndex = grdContactedUsers.PageIndex;
                GetContactedUsers();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion ContactedUserGrid Events & Methods

        #region GridControl Events

        protected string GetHiddenValue()
        {
            string Rslt = "";
            foreach (GridViewRow gvrow in grdContactedUsers.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)grdContactedUsers.HeaderRow.FindControl("chkdeleteAll");
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string SelectedIds = GetHiddenValue();
            SqlCommand cmd = new SqlCommand("update tblContactUs set IsDelete = 1 where ID in(" + SelectedIds + ")", conn);
           // SqlCommand cmd = new SqlCommand("delete from tblContactUs where Name='';", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            ContactedUserGrid();
        }

        protected void chkdeleteAll_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdContactedUsers.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)grdContactedUsers.HeaderRow.FindControl("chkdeleteAll");
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkdelete");
                ChkBoxRows.Checked = ChkBoxHeader.Checked;
            }
        }

        protected void chkdelete_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdContactedUsers.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)grdContactedUsers.HeaderRow.FindControl("chkdeleteAll");
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkdelete");
                if (ChkBoxRows.Checked == false)
                {
                    ChkBoxHeader.Checked = false;
                }
            }
        }

        #endregion GridControl Events

        #region Button Click

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashBoard.aspx");
        }

        protected void btnBack2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashBoard.aspx");
        }

        #endregion Button Click

        protected void btnaddusers_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminRegistration.aspx?new=1");
        }
    }
}