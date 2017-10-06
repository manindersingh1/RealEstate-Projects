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
                //GetSiteData();
                string BuyerPageId = ConfigurationManager.AppSettings["BuyerPageId"].ToString();                
            }
        }

        //protected void GetSiteData()
        //{
        //    try
        //    {
        //        DataTable dt = new DataTable();
        //        dt = clsobj.GetSiteSettings();
        //        if (dt.Rows.Count > 0)
        //        {

        //            byte[] Logoimage = (byte[])dt.Rows[0]["BannerImage"];

        //            if (Logoimage.Length > 0)
        //            {
        //                string base64String = Convert.ToBase64String(Logoimage, 0, Logoimage.Length);
        //                //Adminlogo.Src = "data:image/png;base64," + base64String;
        //            }
                   
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}


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
                //StrMenu.Append("<li class='test' style='background:none;'><a  href='../StaticPages.aspx?PageID=39' title='Free Market Evaluation'> <img src='images/4.png' /><div><span>F</span>ree Market Evaluation</div></a></li>");
                ////StrMenu.Append("<li class='test' style='background:none;'><a  href='Calculators.aspx' title='calculators'> <img src='images/2.png' /><div><span>C</span>alculators</div></a></li>");
                //StrMenu.Append("<li class='test' style='background:none;'><a  href='#' title='Testimonial'> <img src='images/2.png' /><div><span>T</span>estimonial</div></a></li>");
                //StrMenu.Append("<li class='test' style='background:none;'><a  href='#' title='Property looking for'> <img src='images/3.png' /><div><span>P</span>roperty Looking for</div></a></li>");
                //StrMenu.Append("<li class='test' style='background:none;'><a  href='ContactUs.aspx' title='contact us'> <img src='images/1.png' /><div><span>C</span>ontact us</div></a></li>");
                //StrMenu.Append("<li class='test' style='background:none;'><a href='../Free-home-evaluation.aspx' title='Home Evaluation'>Home Evaluation</a></li>");
                //StrMenu.Append("<li class='test' style='background:none;'><a  href='Calculators.aspx' title='Calculators'>Calculators</a></li>");
                //StrMenu.Append("<li class='test' style='background:none;'><a Target='blank' href='http://www.torontorealestateboard.com/about_GTA/Neighbourhood/index.html' title='Neighbourhood Sold Report'>Neighbourhood Sold Report</a></li>");
                //StrMenu.Append("<li class='test' style='background:none;'><a href='../ContactUs.aspx' title='Contact Us'>Contact Us</a></li>");
                //StrMenu.Append("<li class='test' style='background:none;'><a href='../Admin/Adminlogin.aspx' title='Login'>Login</a></li>");
                StrMenu.Append("</ul>");
            }
           // dynamicmenus.Text = StrMenu.ToString();
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
                    lblCopyRight.Text = dt.Rows[0]["Copyright"].ToString();
                    //string var = Convert.ToString(dt.Rows[0]["BannerImage"]);
                    //imginfo.ImageUrl = var;
                    siteTitle.Text = Convert.ToString(dt.Rows[0]["Title"]);
                    //lblphone.Text = Convert.ToString(dt.Rows[0]["PhoneNumber"]);
                   // lblphone1.Text = Convert.ToString(dt.Rows[0]["PhoneNumber"]);
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
    }
}