﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using Property_cls;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Configuration;

namespace Property
{
    public partial class Property_New : System.Web.UI.MasterPage
    {
        #region Global

        cls_Property clsobj = new cls_Property();

        #endregion Global
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SiteSetting();
                BindMenusList();
                string PgNam = "";
                System.Data.SqlClient.SqlConnection conn;
                conn = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());
                conn.Open();
                System.Data.SqlClient.SqlCommand cmd;
                cmd = new System.Data.SqlClient.SqlCommand();
                cmd.Connection = conn;
                int pageid = 0;
                if (Session["pageid"] == null)
                    pageid = 17;
                else
                    pageid = Convert.ToInt32(Session["pageid"].ToString());
                cmd.CommandText = "select * from tbl_PageBlogs where id=" + pageid;
                System.Data.SqlClient.SqlDataReader dr;
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    HtmlMeta meta = new HtmlMeta();
                    meta.Name = "Meta Tag";
                    meta.Content = dr["MetaTag"].ToString();
                    Page.Header.Controls.Add(meta);
                    HtmlMeta meta1 = new HtmlMeta();
                    meta1.Name = "MetaDiscription";
                    meta1.Content = dr["MetaDiscription"].ToString();
                    Page.Header.Controls.Add(meta1);
                    Page.Title = dr["pagetitle"].ToString();
                }
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
                //StrMenu.Append("<a class='toggleMenu' href='#'></a>");//i place this before <div class="menu_bg_new"> in html page 
                StrMenu.Append("<ul class='nav'>");
                //StrMenu.Append("<li class='test' style='background:none;'><a href='../Default.aspx' title='Home' class='active'>Home</a></li>");
                //StrMenu.Append("<li>");
                //StrMenu.Append("<a href='../About.aspx' title='About Us'>About Us</a>");
                //StrMenu.Append("</li>");
                //for (int i = 0; i < dt.Rows.Count; i++)
                //{
                //    clsobj.PageID = Convert.ToInt32(dt.Rows[i]["ID"]);
                //    dtSubmenu = clsobj.GetSubMenuBy_PageID();
                //    if (dtSubmenu.Rows.Count > 0)
                //    {
                //        StrMenu.Append("<li><a href=#>" + dt.Rows[i]["PageName"] + "</a>");//</li>
                //        StrMenu.Append("<ul>");
                //        for (int j = 0; j < dtSubmenu.Rows.Count; j++)
                //        {
                //            StrMenu.Append("<li><a href='../StaticPages.aspx?PageID=" + dtSubmenu.Rows[j]["id"] + "' title='" + dtSubmenu.Rows[j]["PageName"] + "'>" + dtSubmenu.Rows[j]["PageName"] + "</a> </li>");
                //        }
                //        StrMenu.Append("</ul>");
                //        StrMenu.Append("</li>");
                //    }
                //    else
                //    {
                //        StrMenu.Append("<li><a href='../StaticPages.aspx?PageID=" + dt.Rows[i]["id"] + "' title='" + dt.Rows[i]["PageName"] + "'>" + dt.Rows[i]["PageName"] + "</a>");//</li>
                //    }
                //}
                StrMenu.Append("<li class='test' style='background:none;'><a  href='Home_Worth.aspx' title='free market evaluation'> <img alt='' src='images/4.png' /><div class='setbgmenu'><span>F</span>ree Market Evaluation</div></a></li>");
                //StrMenu.Append("<li class='test' style='background:none;'><a  href='Calculators.aspx' title='calculators'> <img src='images/2.png' /><div><span>C</span>alculators</div></a></li>");
                StrMenu.Append("<li class='test' style='background:none;'><a  href='Testimonial.aspx' title='Testimonials'> <img alt='' src='images/2.png' /><div class='setbgmenu'><span>T</span>estimonials</div></a></li>");
                StrMenu.Append("<li class='test' style='background:none;'><a  href='Property_Looking_For.aspx' title='Property looking for'> <img alt='' src='images/3.png' /><div class='setbgmenu'><span>P</span>roperty Looking for</div></a></li>");
                StrMenu.Append("<li class='test' style='background:none;'><a  href='ContactUs.aspx' title='contact us'> <img alt='' src='images/1.png' /><div class='setbgmenu'><span>C</span>ontact us</div></a></li>");
                //StrMenu.Append("<li class='test' style='background:none;'><a href='Free-home-evaluation.aspx' title='Home Evaluation'>Home Evaluation</a></li>");
                //StrMenu.Append("<li class='test' style='background:none;'><a  href='Calculators.aspx' title='Calculators'>Calculators</a></li>");
                //StrMenu.Append("<li class='test' style='background:none;'><a Target='blank' href='http://www.torontorealestateboard.com/about_GTA/Neighbourhood/index.html' title='Neighbourhood Sold Report'>Neighbourhood Sold Report</a></li>");
                //StrMenu.Append("<li class='test' style='background:none;'><a href='../ContactUs.aspx' title='Contact Us'>Contact Us</a></li>");
                //StrMenu.Append("<li class='test' style='background:none;'><a href='../Admin/Adminlogin.aspx' title='Login'>Login</a></li>");
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
                    //string var = Convert.ToString(dt.Rows[0]["BannerImage"]);
                    //imginfo.ImageUrl = var;
                    siteTitle.Text = Convert.ToString(dt.Rows[0]["Title"]);
                    //lblphone.Text = Convert.ToString(dt.Rows[0]["PhoneNumber"]);
                    //lblphone1.Text = Convert.ToString(dt.Rows[0]["PhoneNumber"]);
                    //lblmobile.Text = Convert.ToString(dt.Rows[0]["Mobile"]);
                    //lblemail.Text = Convert.ToString(dt.Rows[0]["Email"]);
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
                Images = "/admin/uploadfiles/" + dt.Rows[i]["FileName"].ToString();
                if (Images != "")
                {
                    html.AppendLine("<img src='" + Images + "'  data-thumb='" + Images + "'  alt='banner" + i + "' />");
                }
            }
            ltrImgs.Text = html.ToString();
        }
    }
}