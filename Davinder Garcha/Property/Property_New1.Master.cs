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


namespace Property
{
    public partial class Property_New1 : System.Web.UI.MasterPage
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
                StrMenu.Append("<li class='test' style='background:none;'><a href='../Home.aspx' title='Home'><span>H</span>ome</a></li>");

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    clsobj.PageID = Convert.ToInt32(dt.Rows[i]["ID"]);
                    dtSubmenu = clsobj.GetSubMenuBy_PageID();
                    //check if it has submenu 
                    if (dtSubmenu.Rows.Count > 0)
                    {
                        string firstletter = dt.Rows[i]["PageName"].ToString()[0].ToString();
                        string lastlettes = dt.Rows[i]["PageName"].ToString().Remove(0, 1);

                        StrMenu.Append("<li class='test'><a href='#'><span>" + firstletter + "</span>" + lastlettes + "</a>");//</li>
                        StrMenu.Append("<ul>");
                        for (int j = 0; j < dtSubmenu.Rows.Count; j++)
                        {
                            StrMenu.Append("<li><a href='../StaticPages.aspx?PageID=" + dtSubmenu.Rows[j]["id"] + "' title='" + dtSubmenu.Rows[j]["PageName"] + "'>" + dtSubmenu.Rows[j]["PageName"] + "</a> </li>");
                        }
                        StrMenu.Append("</ul>");
                        StrMenu.Append("</li>");
                    }
                    else
                    {
                        StrMenu.Append("<li><a href='../StaticPages.aspx?PageID=" + dt.Rows[i]["id"] + "' title='" + dt.Rows[i]["PageName"] + "'>" + dt.Rows[i]["PageName"] + "</a>");//</li>
                     }
                }
                StrMenu.Append("<li class='test'>");
                StrMenu.Append("<a href='../RealEstateNews.aspx' title='Real Estate News'><span>R</span>eal Estate News</a>");
                StrMenu.Append("</li>");
                StrMenu.Append("<li class='test' style='background:none;'><a href='Home_worth.aspx' title='Home Evaluation'><span>F</span>ree Market Evaluation</a></li>");
                StrMenu.Append("<li class='test'>");
                StrMenu.Append("<a  href='../propertyvideos.aspx' title='Videos'><span>V</span>ideos</a>");
                StrMenu.Append("</li>");
                StrMenu.Append("<li class='test' style='background:none;'><a href='View_Testimonials.aspx' title='Virtual Tour'><span>T</span>estimonials</a></li>");
                StrMenu.Append("<li class='test' style='background:none;'><a style='border:none' href='ContactUs.aspx' title='Contact Us'><span>C</span>ontact Us</a></li>");
                StrMenu.Append("</ul>");


            }


            dynamicmenus.Text = StrMenu.ToString();

        }

        protected void SiteSetting()
        { 
            try
            {
                DataTable dt = clsobj.GetSiteSettings();
                DataTable dt1 = clsobj.GetUserInfo();
                if (dt.Rows.Count > 0)
                {
                   // lblemailid.Text = Convert.ToString(dt.Rows[0]["Email"]);
                    siteTitle.Text = Convert.ToString(dt.Rows[0]["Title"]);
                   lblemail.Text = Convert.ToString(dt.Rows[0]["Email"]);

                    lblmobile.Text = Convert.ToString(dt.Rows[0]["Mobile"]);
                    lblBrkrOneName.Text = Convert.ToString(dt1.Rows[0]["FirstName"]) + " " + Convert.ToString(dt1.Rows[0]["LastName"]);
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