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
    public partial class ListOfBlogs : System.Web.UI.Page
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
                dv.Table = clsobj.GetAllBlogs();

                if (strSortExpression != "" && strSortDirection != "")
                {
                    dv.Sort = strSortExpression + " " + strSortDirection;
                }
                GrdBlogList.DataSource = dv;
                GrdBlogList.DataBind();

                if (intPageIndex != 0)
                    GrdBlogList.PageIndex = intPageIndex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void GrdBlogList_Sorting(object sender, GridViewSortEventArgs e)
        {
            try
            {
                strSortExpression = e.SortExpression;
                strSortDirection = GetSortDirection();
                intPageIndex = GrdBlogList.PageIndex;
                FillGridData();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void GrdBlogList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                GrdBlogList.PageIndex = e.NewPageIndex;
                FillGridData();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void GrdBlogList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                clsobj.PageID = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("~/Admin/CreateBlog.aspx?pageid=" + clsobj.PageID);
            }
            else if (e.CommandName == "Delete")
            {
                clsobj.PageID = Convert.ToInt32(e.CommandArgument);
                int result = clsobj.Delete_PageBlog();
                FillGridData();
            }
        }

        protected void GrdBlogList_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GrdBlogList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GrdBlogList_RowCreated(object sender, GridViewRowEventArgs e)
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

        protected void btnCreateBlog_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/CreateBlog.aspx", false);
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashBoard.aspx");
        }

        #endregion Button Click
    }
}