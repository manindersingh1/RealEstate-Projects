using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Property_cls;
using System.Data;

namespace Property.Admin
{
    public partial class ListOfPages : System.Web.UI.Page
    {
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
            if (Session["FirstName"] != null)
            {
                if (!IsPostBack)
                {
                    FillGridData();
                   
                }
            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx", false);
            }
        }

        #endregion Page Load

        #region PageListGrid Events & Method

        protected void FillGridData()
        {
            try
            {
                DataView dv = new DataView();
                dv.Table = clsobj.GetAllPages();

                if (strSortExpression != "" && strSortDirection != "")
                {
                    dv.Sort = strSortExpression + " " + strSortDirection;
                }
                GrdPageList.DataSource = dv;
                GrdPageList.DataBind();

                if (intPageIndex != 0)
                GrdPageList.PageIndex = intPageIndex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void GrdPageList_Sorting(object sender, GridViewSortEventArgs e)
        {
            try
            {
                strSortExpression = e.SortExpression;
                strSortDirection = GetSortDirection();
                intPageIndex = GrdPageList.PageIndex;
                FillGridData();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void GrdPageList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                GrdPageList.PageIndex = e.NewPageIndex;
                FillGridData();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void GrdPageList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                clsobj.PageID = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("~/Admin/CreatePage.aspx?pageid=" + clsobj.PageID);
            }
            else if (e.CommandName == "Delete")
            {
               
                clsobj.PageID = Convert.ToInt32(e.CommandArgument);
                int result = clsobj.Delete_PageBlog();
                FillGridData();
            }
        }

        protected void GrdPageList_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GrdPageList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GrdPageList_RowCreated(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.EmptyDataRow)
                {
                    Label tb = (Label)e.Row.FindControl("lblemptymsg");
                    if (tb != null)
                    {
                        tb.Text = "No Data Found";
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion PageListGrid Events & Method

        #region Button Click

        protected void btnCreatePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/CreatePage.aspx", false);
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashBoard.aspx");
        }

        #endregion Button Click

        protected void GrdPageList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                HiddenField title = (HiddenField)e.Row.FindControl("hdnTitle");
                HiddenField pname = (HiddenField)e.Row.FindControl("hdnPageName");
                ImageButton btndelete = (ImageButton)e.Row.FindControl("lnkDelete");

                if (title.Value.ToString().Contains("Free Market Evaluation") || pname.Value.ToString().Contains("Free Market Evaluation"))
                {
                    //alrtmsg.Visible = true;
                    btndelete.Visible = false;
                    //return;
                }
            }
            
        }
    }
}