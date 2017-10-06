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
    public partial class CreatePage : System.Web.UI.Page
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
                    BindPages();
                    GetPageData();
                }
            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx", false);
            }
        }

        #endregion PageLoad

        #region button click

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                int result = 0;
                objPage.PageName = txtPageName.Text;
                objPage.PageTitle = txtPageTitle.Text;
                objPage.metatag = txtmetatag.Text;
                objPage.metadiscription = txtmetadiscription.Text;
                objPage.PageType = "Page";
                objPage.PageDescription = txtPageDescription.Value;
                objPage.CreatedBy = "Admin";
                objPage.IncludeInMenu = chkincludeMenu.Checked == true ? true : false;
                objPage.IncludeInSubMenu = ChkSubmenu.Checked == true ? true : false;
                objPage.SubMenuPageID = Convert.ToInt32(drpSubmenuPage.SelectedValue);
                objPage.DisplayIndex = Convert.ToInt32(drpDisplayIndex.SelectedValue);
                objPage.PageLocation = Convert.ToString(drpLocation.SelectedValue);
                if (objPage.SubMenuPageID == 0)
                    objPage.SubMenuPageName = "";
                else
                    objPage.SubMenuPageName = drpSubmenuPage.SelectedItem.Text;

                if (Request.QueryString["pageid"] == null)
                {
                    result = objPage.Insert_PageBlog();
                    Response.Redirect("~/Admin/ListOfPages.aspx", false);
                }
                else
                {
                    objPage.PageID = Convert.ToInt32(Request.QueryString["pageid"]);
                    result = objPage.Update_PageBlog();
                    Response.Redirect("~/Admin/ListOfPages.aspx", false);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListOfPages.aspx");
        }

        #endregion button click

        #region Checkbox Events

        protected void chkincludeMenu_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                if (chkincludeMenu.Checked)
                {
                    panelSubmenu.Visible = false;
                    ChkSubmenu.Checked = false;
                    drpSubmenuPage.SelectedIndex = 0;
                    drpSubmenuPage.Enabled = false;
                }
                else
                {
                    panelSubmenu.Visible = true;
                    drpSubmenuPage.SelectedIndex = 0;
                    ChkSubmenu.Checked = false;
                    drpSubmenuPage.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void ChkSubmenu_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                if (ChkSubmenu.Checked)
                {
                    drpSubmenuPage.Enabled = true;
                    drpSubmenuPage.SelectedIndex = 0;
                }
                else
                {
                    drpSubmenuPage.Enabled = false;
                    drpSubmenuPage.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion Checkbox Events

        #region Other Methods

        private void BindPages()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = objPage.GetAllPages();
                drpSubmenuPage.DataSource = dt;
                drpSubmenuPage.DataTextField = "PageName";
                drpSubmenuPage.DataValueField = "ID";
                drpSubmenuPage.DataBind();
                drpSubmenuPage.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void GetPageData()
        {
            try
            {
                if (Request.QueryString["pageid"] != null)
                {
                    objPage.PageID = Convert.ToInt32(Request.QueryString["pageid"]);
                    DataTable dt = objPage.GetPageBlogs_ByID();
                    if (dt.Rows.Count > 0)
                    {
                        txtPageName.Text = Convert.ToString(dt.Rows[0]["PageName"]);
                        txtPageTitle.Text = Convert.ToString(dt.Rows[0]["PageTitle"]);
                        txtPageDescription.Value = Convert.ToString(dt.Rows[0]["PageDescription"]);
                        txtmetadiscription.Text = dt.Rows[0]["Metadiscription"].ToString();
                        txtmetatag.Text = dt.Rows[0]["Metatag"].ToString();
                        drpLocation.SelectedValue = Convert.ToString(dt.Rows[0]["PageLocation"]);
                        chkincludeMenu.Checked = Convert.ToBoolean(dt.Rows[0]["IncludeInMenu"]);
                        drpDisplayIndex.SelectedValue = Convert.ToString(dt.Rows[0]["DisplayIndex"]);
                        if (chkincludeMenu.Checked)
                        {
                            panelSubmenu.Visible = false;
                            ChkSubmenu.Checked = false;
                            drpSubmenuPage.SelectedIndex = 0;
                            drpSubmenuPage.Enabled = false;
                        }
                        else
                        {
                            panelSubmenu.Visible = true;
                            drpSubmenuPage.SelectedIndex = 0;
                            ChkSubmenu.Checked = false;
                            drpSubmenuPage.Enabled = false;

                            ChkSubmenu.Checked = Convert.ToBoolean(dt.Rows[0]["IncludeInSubMenu"]);
                            drpSubmenuPage.SelectedValue = Convert.ToString(dt.Rows[0]["SubMenuPageID"]);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion Other Methods


    }
}