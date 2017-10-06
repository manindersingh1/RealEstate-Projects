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
    public partial class Features : System.Web.UI.Page
    {

        #region Global
        #region Global
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        cls_Property clsobj = new cls_Property();
        int findex, lindex;
   
        #endregion Global
        public int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] != null)
                {
                    return Convert.ToInt32(ViewState["CurrentPage"]);
                }
                else
                {
                    return 0;
                }
            }
            set { ViewState["CurrentPage"] = value; }
        }
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
            //if (Session["FirstName"] == null)
            //{
            //    Response.Redirect("AdminLogin.aspx");
            //}
            if (!IsPostBack)
            {
                FillGridData();
            }
        }

        #endregion Page_Load
        protected string GetHiddenValue()
        {
            string Rslt = "";
            foreach (GridViewRow gvrow in grdFeatures.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)grdFeatures.HeaderRow.FindControl("chkdeleteAll");
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
            if (dt.Rows.Count > 0)
            {
                    grdFeatures.DataSource = dt;
                    grdFeatures.DataBind();
                    grdFeatures.PageIndex = intPageIndex;
                    //doPaging();
            }
            else
            {
                grdFeatures.EmptyDataText = "no feature property added yet! Click to create feature";
            }
           
           
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
             if (e.CommandName == "remove")
             {
               //int rowValue = Convert.ToInt32(e.CommandArgument.ToString());
                    Button lb = (Button)e.CommandSource;
                    GridViewRow gvr = (GridViewRow)lb.NamingContainer;
                    string id = (string)grdFeatures.DataKeys[gvr.RowIndex].Value;
                    SqlCommand cmd = new SqlCommand("update [dbo].[Tbl_Featured] set IsActive = 0 where mlsid ='" + id + "'  ");
                    cmd.Connection = conn;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    FillGridData();
             }
             if (e.CommandName == "Add")
                {   
                    Button lb = (Button)e.CommandSource;
                    GridViewRow gvr = (GridViewRow)lb.NamingContainer;
                    string id = (string)grdFeatures.DataKeys[gvr.RowIndex].Value;
                    SqlCommand cmd = new SqlCommand("update [dbo].[Tbl_Featured] set IsActive = 1 where mlsid ='" + id + "'  ");
                    cmd.Connection = conn;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    FillGridData();
                }
              
             }
      

        #endregion Grid_Method and Grid's Event
        #region Button Click
        protected void lnkPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            FillGridData();
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            FillGridData();
          
        }

        protected void lnkFirst_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            FillGridData();
        }

        protected void lnkLast_Click(object sender, EventArgs e)
        {
            CurrentPage = (Convert.ToInt32(ViewState["totpage"]) - 1);
            FillGridData();
        }
        protected void btnCreate_Click(object sender, EventArgs e)
        {
           
            HiddenField HiddenField = (HiddenField)grdFeatures.HeaderRow.FindControl("hdnID");
            //string SelectedIds = GetHiddenValue();
            SqlCommand cmd = new SqlCommand("update [dbo].[Tbl_Featured] set IsActive = 1 where mlsid ='" + HiddenField + "'", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            FillGridData();
        }


        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashBoard.aspx");
        }

        #endregion Button Click

        #region Pagination Repeater Events

        protected void RepeaterPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("newpage"))
            {
                CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
                FillGridData();
            }
        }
        protected void RepeaterPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            LinkButton lnkPage = (LinkButton)e.Item.FindControl("Pagingbtn");
            if (lnkPage.CommandArgument.ToString() == CurrentPage.ToString())
            {
                lnkPage.Enabled = false;
                lnkPage.BackColor = System.Drawing.Color.FromName("#1e707e");
                lnkPage.ForeColor = System.Drawing.Color.FromName("#FFFFFF");
            }
        }

        #endregion Pagination Repeater Events

        protected void chkdeleteAll_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdFeatures.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)grdFeatures.HeaderRow.FindControl("chkdeleteAll");
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkdelete");
                ChkBoxRows.Checked = ChkBoxHeader.Checked;
            }
        }

        protected void chkdelete_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdFeatures.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)grdFeatures.HeaderRow.FindControl("chkdeleteAll");
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkdelete");
                if (ChkBoxRows.Checked == false)
                {
                    ChkBoxHeader.Checked = false;
                }
            }
        }
        private void doPaging()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("PageIndex");
            dt.Columns.Add("PageText");
            findex = CurrentPage - 5;
            if (CurrentPage > 5)
            {
                lindex = CurrentPage + 5;
            }
            else
            {
                lindex = 10;
            }
            if (lindex > Convert.ToInt32(ViewState["totpage"]))
            {
                lindex = Convert.ToInt32(ViewState["totpage"]);
                findex = lindex - 10;
            }

            if (findex < 0)
            {
                findex = 0;
            }
            for (int i = findex; i < lindex; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }
            grdFeatures.DataSource = dt;
            grdFeatures.DataBind();
        }
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
            if(dt.Rows.Count >0)
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