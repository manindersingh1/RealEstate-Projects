using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using Property_cls;
using System.Data.SqlClient;
using System.Configuration;

namespace Property.Admin
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        #region Global
        cls_Property clsobj = new cls_Property();
        #endregion Global

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMenusList();
                SiteSetting();
                GetSiteData();
                string BuyerPageId = ConfigurationManager.AppSettings["BuyerPageId"].ToString();                
            }
        }

        protected void GetSiteData()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = clsobj.GetSiteSettings();
                if (dt.Rows.Count > 0)
                {
                    
                    byte[] Logoimage = (byte[])dt.Rows[0]["BannerImage"];
                   
                    if (Logoimage.Length > 0)
                    {
                        string base64String = Convert.ToBase64String(Logoimage, 0, Logoimage.Length);
                        Adminlogo.Src = "data:image/png;base64," + base64String;
                    }
                    lblCopyRight.Text = dt.Rows[0]["Copyright"].ToString();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        private void BindMenusList()  
        {
            StringBuilder StrMenu = new StringBuilder();
            DataTable dt = new DataTable();
            DataTable dtSubmenu = new DataTable();
            dt = clsobj.GetMenuList();
            if (dt.Rows.Count > 0)
            {
                string PageName = dt.Rows[0]["PageName"].ToString();
                StrMenu.Append("<a class='toggleMenu' href='#'></a>");
                StrMenu.Append("<ul class='nav'>");
                StrMenu.Append("</ul>");
            }
        }
        protected void SiteSetting()
        {
            try
            {
                DataTable dt = clsobj.GetSiteSettings();
                if (dt.Rows.Count > 0)
                {
                    if (Session["FirstName"] != null)
                    {
                       
                        username.Text = Session["FirstName"].ToString();
                    }
                    siteTitle.Text = Convert.ToString(dt.Rows[0]["Title"]);
                    byte[] favimage = (byte[])dt.Rows[0]["Favicon.ico"];
                    if (favimage.Length > 0)
                    {
                        Session["MyFavicon"] = favimage;
                        favicon.Visible = true;
                        favicon.Href = "~/ShowFavicon.aspx";
                    }
                    else
                    {
                        favicon.Visible = false;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}