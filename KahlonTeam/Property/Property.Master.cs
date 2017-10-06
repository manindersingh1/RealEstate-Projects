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

namespace Property
{
    public partial class Property : System.Web.UI.MasterPage
    {
        #region Global

        cls_Property clsobj = new cls_Property();

        #endregion Global
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindBnanners();
                BindMenusList();
                SiteSetting();
                string BuyerPageId = ConfigurationManager.AppSettings["BuyerPageId"].ToString();
                //buyer.HRef = "StaticPages.aspx?PageID=" + BuyerPageId;
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
                StrMenu.Append("<a class='toggleMenu' href='#'></a>");
                StrMenu.Append("<ul class='nav'>");
                StrMenu.Append("<li class='test' style='background:none;'><a href='../Default.aspx' title='Home' class='active'>Home</a></li>");
                StrMenu.Append("<li ><a href='../Featured_Properties.aspx' title='Featured Properties'>Featured Properties</a></li>");

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    clsobj.PageID = Convert.ToInt32(dt.Rows[i]["ID"]);
                    dtSubmenu = clsobj.GetSubMenuBy_PageID();
                    //check if it has submenu 
                    if (dtSubmenu.Rows.Count > 0)
                    {

                        string firstletter = dt.Rows[i]["PageName"].ToString()[0].ToString();
                        string lastlettes = dt.Rows[i]["PageName"].ToString().Remove(0, 1);

                        StrMenu.Append("<li><a href=../Default.aspx><span>" + firstletter + "</span>" + lastlettes + "</a>");//</li>
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

                //StrMenu.Append("<li ><a href='../Blog.aspx' title='Blogs'>Blogs</a></li>");



                StrMenu.Append("</ul>");

            }

            dynamicmenus.Text = StrMenu.ToString();
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
                        //user.Visible = true;
                        //username.Text = Session["FirstName"].ToString();
                    }
                    //string var = Convert.ToString(dt.Rows[0]["BannerImage"]);
                    //imginfo.ImageUrl = var;
                    siteTitle.Text = Convert.ToString(dt.Rows[0]["Title"]);
                    //string virtual_link = dt.Rows[0]["Virtual_link"].ToString();
                    //if (virtual_link != "")
                    //{
                    //    anvirtual.HRef = virtual_link;
                    //}
                    //mobile.InnerHtml = Convert.ToString(dt.Rows[0]["Mobile"]);
                    //sms.InnerText = Convert.ToString(dt.Rows[0]["PhoneNumber"]);
                    //headerlogo.ImageUrl = Convert.ToString(dt.Rows[0]["BannerImage"]);
                    //lblphone.Text = Convert.ToString(dt.Rows[0]["PhoneNumber"]);
                   // lblphone1.Text = Convert.ToString(dt.Rows[0]["PhoneNumber"]);
                    //lblphone2.Text = Convert.ToString(dt.Rows[0]["PhoneNumber"]);
                    //lblmobile.Text = Convert.ToString(dt.Rows[0]["Mobile"]);
                    //lblemail.Text = Convert.ToString(dt.Rows[0]["Email"]);
                    //byte[] headerimage = (byte[])dt.Rows[0]["BannerImage"];
                    //if (headerimage.Length > 0)
                    //{
                    //    Session["headerimage"] = headerimage;
                    //    //headerlogo.ImageUrl = "~/ShowImage.aspx";

                    //}
                    //else
                    //{
                    //    favicon.Visible = false;
                    //}
                    //lblfax.Text = Convert.ToString(dt.Rows[0]["Fax"]);
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


        protected void bindBnanners()
        {
           StringBuilder html = new StringBuilder();
           DataTable dt = clsobj.GetAllBanner();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string Images;
                Images = "/admin/uploadfiles/"+dt.Rows[i]["FileName"].ToString();
                if (Images != "")
                {
                    html.AppendLine("<img src='"+Images+"'  data-thumb='"+Images+"'  alt='banner"+i+"' />");         
                }
            }
            ltrImgs.Text = html.ToString();   
        }
        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["FirstName"] = null;
          Response.Redirect("Default.aspx");
        }
    }
}