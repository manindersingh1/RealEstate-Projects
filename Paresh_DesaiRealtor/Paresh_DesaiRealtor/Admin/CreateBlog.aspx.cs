using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Property_cls;

namespace Property.Admin
{
    public partial class CreateBlog : System.Web.UI.Page
    {

        #region Global

        cls_Property objPage = new cls_Property();

        #endregion Global

        #region PageLoad

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FirstName"] != null)
            {
                if (!IsPostBack)
                {
                    if (Request.QueryString["pageid"] != null)
                    {
                        objPage.PageID = Convert.ToInt32(Request.QueryString["pageid"]);
                        DataTable dt = objPage.GetPageBlogs_ByID();
                        if (dt.Rows.Count > 0)
                        {
                            txtBlogName.Text = Convert.ToString(dt.Rows[0]["PageName"]);
                            txtBlogTitle.Text = Convert.ToString(dt.Rows[0]["PageTitle"]);
                            txtBlogDescription.Value = Convert.ToString(dt.Rows[0]["PageDescription"]);
                        }
                    }
                }

                DataTable dtpage = new DataTable();
                objPage.PageID = 1;
                dtpage = objPage.GetSubMenuBy_PageID();
                if (dtpage.Rows.Count > 0)
                {
                    string PageName = dtpage.Rows[0]["PageName"].ToString();
                }
            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx");
            }
        }

        #endregion PageLoad

        #region button click

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                int result = 0;
                objPage.PageName = txtBlogName.Text;
                objPage.PageTitle = txtBlogTitle.Text;
                objPage.PageType = "Blog";
                objPage.PageDescription = txtBlogDescription.Value;
                objPage.CreatedBy = "Admin";
                objPage.IncludeInMenu = false;
                objPage.IncludeInSubMenu = false;
                objPage.SubMenuPageID = 0;
                objPage.DisplayIndex = 0;
                objPage.PageLocation = "";
                objPage.SubMenuPageName = "";
                if (Request.QueryString["pageid"] == null)
                {
                    result = objPage.Insert_PageBlog();
                    Response.Redirect("~/Admin/ListOfBlogs.aspx", false);
                }
                else
                {
                    objPage.PageID = Convert.ToInt32(Request.QueryString["pageid"]);
                    result = objPage.Update_PageBlog();
                    Response.Redirect("~/Admin/ListOfBlogs.aspx", false);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashBoard.aspx");
        }

        #endregion button click

    }
}