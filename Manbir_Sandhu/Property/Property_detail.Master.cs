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
    public partial class Property_detail : System.Web.UI.MasterPage
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
                GetPropertyDetails();
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
                StrMenu.Append("<li class='test' style='background:none;'><a href='../Home.aspx' title='Home' class='active'>Home</a></li>");

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    clsobj.PageID = Convert.ToInt32(dt.Rows[i]["ID"]);
                    dtSubmenu = clsobj.GetSubMenuBy_PageID();
                    //check if it has submenu 
                    if (dtSubmenu.Rows.Count > 0)
                    {
                        StrMenu.Append("<li><a href=#>" + dt.Rows[i]["PageName"] + "</a>");//</li>
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
                        //if (PageName == dt.Rows[i]["PageName"].ToString())
                        //{
                        //    StrMenu.Append("<li class='active'><a href='../StaticPages.aspx?PageID=" + dt.Rows[i]["id"] + "' title='" + dt.Rows[i]["PageName"] + "'>" + dt.Rows[i]["PageName"] + "</a>");//</li>
                        //}
                        //else
                        //{
                        StrMenu.Append("<li><a href='../StaticPages.aspx?PageID=" + dt.Rows[i]["id"] + "' title='" + dt.Rows[i]["PageName"] + "'>" + dt.Rows[i]["PageName"] + "</a>");//</li>
                        // }
                    }
                }

                //StrMenu.Append("<li class='test' style='background:none;'><a href='Admin/Adminlogin.aspx' title='Login'>Login</a></li>");
                StrMenu.Append("<li>");
                StrMenu.Append("<a href='../Search.aspx?PropertyType=Residential' title='Real Estate News'>Listings</a>");
                StrMenu.Append("</li>");
                StrMenu.Append("<li class='test' style='background:none;'><a href='Free-home-evaluation.aspx' title='Home Evaluation'>Home Evaluation</a></li>");
                StrMenu.Append("<li>");
                StrMenu.Append("<a href='../Calculators.aspx' title='Calculators'>Calculators</a>");
                StrMenu.Append("</li>");

                //StrMenu.Append("<li>");
                //StrMenu.Append("<a href='../About.aspx' title='About Us'>About Us</a>");
                //StrMenu.Append("</li>");


                //StrMenu.Append("<li class='test' style='background:none;'><a href='VirtualTour.aspx' title='Virtual Tour'>Virtual Tour</a></li>");
                StrMenu.Append("<li class='test' style='background:none;'><a href='ContactUs.aspx' title='Contact Us'>Contact Us</a></li>");
                //StrMenu.Append("<li class='test' style='background:none;'><a href='ContactUs.aspx' title='Contact Us'>Contact Us</a></li>");
                //StrMenu.Append("<li class='test' style='background:none;'><a href='admin/adminlogin.aspx' title='Login'>Login</a></li>");
                StrMenu.Append("</ul>");


            }


            //dynamicmenus.Text = StrMenu.ToString();

        }

        protected void SiteSetting()
        {
            try
            {
                DataTable dt = clsobj.GetSiteSettings();
                DataTable dt1 = clsobj.GetUserInfo();
                if (dt.Rows.Count > 0)
                {
                    //lblemailid.Text = Convert.ToString(dt.Rows[0]["Email"]);
                    siteTitle.Text = Convert.ToString(dt.Rows[0]["Title"]);
                    //lblemail.Text = Convert.ToString(dt.Rows[0]["Email"]);

                    //lblmobile.Text = Convert.ToString(dt.Rows[0]["Mobile"]);
                    //lblfax.Text = Convert.ToString(dt.Rows[0]["Fax"]);
                    //lblemail.Text = Convert.ToString(dt.Rows[0]["Email"]);
                    //lblBrkrOneName.Text = Convert.ToString(dt1.Rows[0]["FirstName"]) + " " + Convert.ToString(dt1.Rows[0]["LastName"]);
                    //lbladdress.Text = Convert.ToString(dt1.Rows[0]["Address"]);
                    //lblBrkrTwoNme.Text = Convert.ToString(dt.Rows[0]["BrokerTwoName"]);
                    //lblphn.Text = Convert.ToString(dt.Rows[0]["Mobile"]);
                    //byte[] favimage = (byte[])dt.Rows[0]["Favicon.ico"];
                    //if (favimage.Length > 0)
                    //{
                    //    Session["MyFavicon"] = favimage;
                    //    favicon.Visible = true;
                    //    favicon.Href = "~/ShowFavicon.aspx";
                    //}
                    //else
                    //{
                    //    favicon.Visible = false;
                    //}
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private string CheckNullOrEmptyvalue(string pValue)
        {
            string pval1 = "";
            if (pValue == "null" || pValue == "")
                pval1 = "";
            else
                pval1 = pValue;
            return pval1;
        }
        void GetPropertyDetails()
        {
            try
            {
                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                DataTable dt = new DataTable();
                dt = mlsClient.GetResidentialProperties(Convert.ToString(Request.QueryString["MLSID"]), "0", "0", "0", "0", "0", "0");
                if (dt.Rows.Count > 0)
                {
                    //lblPrice.Text = "$" + CheckNullOrEmptyvalue(Convert.ToString(dt.Rows[0]["ListPrice"]));
                }
            }
            catch
            { }
        }
    }
}
 



  