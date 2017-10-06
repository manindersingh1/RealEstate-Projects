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

                StrMenu.Append("<div id='sidebar-wrapper'>");
                StrMenu.Append("<ul  class='sidebar-nav'>");
                StrMenu.Append("<a id='menu-close' href='#' class='btn btn-default btn-lg pull-right toggle'><i class='glyphicon glyphicon-remove'></i></a>");

                StrMenu.Append("<li class='sidebar-brand'> <a href='#' class='menu_heding'> Ola Funmilola</a></li>");
                StrMenu.Append("<li><a href='../Home.aspx' title='Home' class='active'>Home</a></li>");
                StrMenu.Append("<li><a href='StaticPages.aspx?PageID=22' title='Seller'>Seller</a></li>");
                StrMenu.Append("<li><a href='Buyers.aspx' title='Buyer'>Buyer</a></li>");
                StrMenu.Append("<li><a href='Home_Worth.aspx' title='Free Market Evaluation'>Free Market Evaluation </a></li>");
                StrMenu.Append("<li><a href='Landing_Page.aspx' title='Find your Dream Home'>Find your Dream Home </a></li>");
                StrMenu.Append("<li><a href='Calculators.aspx' title='Calculators'>Calculators </a></li>");
                StrMenu.Append("<li><a href='VirtualTour.aspx' title='Virtual Tour'>Virtual Tour </a></li>");
                StrMenu.Append("<li><a href='#' title='International Buyer'>International Buyer</a></li>");
                StrMenu.Append("<li><a href='RealEstateNews.aspx' title='Real Estate News'>Real Estate News </a></li>");
                StrMenu.Append("<li><a href='PropertyVideos.aspx' title=' Videos'>Videos </a></li>");
                StrMenu.Append("<li><a href='ContactUs.aspx' title='Contact Us'>Contact Us </a></li>");
                StrMenu.Append("</ul>");
                StrMenu.Append("</div>");

                

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
                   
                    siteTitle.Text = Convert.ToString(dt.Rows[0]["Title"]);
                    //lblemail.Text = Convert.ToString(dt.Rows[0]["Email"]);

                    //lblmobile.Text = Convert.ToString(dt.Rows[0]["Mobile"]);
                    //lblfax.Text = Convert.ToString(dt.Rows[0]["Fax"]);
                     //lblemail2.Text = Convert.ToString(dt.Rows[0]["Email"]);
                    //lblBrkrOneName.Text = Convert.ToString(dt1.Rows[0]["FirstName"]) + " " + Convert.ToString(dt1.Rows[0]["LastName"]);
                    //lbladdress.Text = Convert.ToString(dt1.Rows[0]["Address"]);
                    //lblBrkrTwoNme.Text = Convert.ToString(dt.Rows[0]["BrokerTwoName"]);
                    //lblphn.Text = Convert.ToString(dt.Rows[0]["Mobile"]);
                    //lblphone.Text = Convert.ToString(dt.Rows[0]["Mobile"]);
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