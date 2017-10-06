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
using System.IO;

namespace Property
{
    public partial class HomeMaster : System.Web.UI.MasterPage
    {
        #region Global
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        cls_Property clsobj = new cls_Property();

        #endregion Global
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Session["FirstName"] = null;
                BindMenusList();
                SiteSetting();
                bindBnanners();
                SearchResidentialProperties();
                SearchCommercialProperties();
                SearchCondoProperties();
                GetImages();
                GetBannerVideo();
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
                    //lblemail2.Text = Convert.ToString(dt.Rows[0]["Email"]);
                    //lblmobile.Text = Convert.ToString(dt.Rows[0]["Mobile"]);
                    //lblemail.Text = Convert.ToString(dt.Rows[0]["Email"]);
                    //lblBrkrOneName.Text = Convert.ToString(dt1.Rows[0]["FirstName"]) + " " + Convert.ToString(dt1.Rows[0]["LastName"]);
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
            ltrImgsf.Text = html.ToString();
        }
        public void GetBannerVideo()
        {
            cls_Property cls = new cls_Property();
            DataTable dt = cls.GetVideoBanner();
            if (dt.Rows.Count > 0)
            {
                VideoName.Value = Convert.ToString(dt.Rows[0]["URL"]);

            }
        }

        public string GetText(string txtDescription)
        {
            if (txtDescription.Length > 150)
            {
                int i = txtDescription.IndexOf(" ", 100);
                if (i > 0)
                    txtDescription = txtDescription.Substring(0, i).Trim();
                else
                    return txtDescription;
            }
            else
            {
                return txtDescription;

            }
            return txtDescription;
        }
        void SearchResidentialProperties()
        {
            try
            {
                Session["QueryString"] = "Residential";
                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                DataTable dt = new DataTable();
                if (Convert.ToString(Session["QueryString"]) == "Residential" || Convert.ToString(Session["QueryString"]) == "IDXImagesResidential")
                    dt = mlsClient.GetResidentialPropertiesTop3("0", "0", "0", "0", "0", "0", "0");
                else
                    dt = mlsClient.GetResidentialPropertiesTop3(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Beds"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());
                if (dt.Rows.Count > 0)
                {
                    //imgresi1.ImageUrl = dt.Rows[0]["pImage"].ToString();
                    string s = dt.Rows[0]["RemarksForClients"].ToString();
                    if (s.Length > 100)
                    {
                    }
                    //hlresi1.NavigateUrl = "../Search.aspx?Municipality=Toronto &PropertyType=Residential";
                    //hlresi1.NavigateUrl = "../Search.aspx?Municipality=" + "Toronto&PropertyType=" + dt.Rows[0]["pType"].ToString();
                    string s1 = dt.Rows[1]["RemarksForClients"].ToString();
                    if (s1.Length > 100)
                    {
                    }
                    //imgresi2.ImageUrl = dt.Rows[1]["pImage"].ToString();
                    //hlresi2.NavigateUrl = "../Search.aspx?Municipality=" + "Mississauga &PropertyType=Residential";
                    string s2 = dt.Rows[2]["RemarksForClients"].ToString();
                    if (s2.Length > 100)
                    {
                    }
                    //imgresi3.ImageUrl = dt.Rows[2]["pImage"].ToString();
                    //hlresi3.NavigateUrl = "../Search.aspx?Municipality=" + "Brampton &PropertyType=Residential";
                    string s3 = dt.Rows[3]["RemarksForClients"].ToString();
                    if (s3.Length > 100)
                    {
                    }
                }
                else
                {
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {

            }
        }
        void SearchCommercialProperties()
        {
            try
            {
                Session["QueryString"] = "Commercial";
                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                DataTable dt = new DataTable();
                if (Convert.ToString(Session["QueryString"]) == "Commercial")
                    dt = mlsClient.GetAllCommercialPropertiesTop3("0", "0", "0", "0", "0", "0");
                else
                    dt = mlsClient.GetAllCommercialPropertiesTop3(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());
                if (dt.Rows.Count > 0)
                {
                    string s = dt.Rows[0]["RemarksForClients"].ToString();
                    if (s.Length > 100)
                    {
                    }
                    //imgcomm1.ImageUrl = dt.Rows[0]["pImage"].ToString();
                    //hlcom1.NavigateUrl = "../Search.aspx?Municipality=" + "Toronto&PropertyType=Commercial";
                    string s1 = dt.Rows[1]["RemarksForClients"].ToString();
                    if (s1.Length > 100)
                    {
                    }
                    //imgcomm2.ImageUrl = dt.Rows[1]["pImage"].ToString();
                    //hlcom2.NavigateUrl = "../Search.aspx?Municipality=" + "Mississauga&PropertyType=Commercial";
                    string s2 = dt.Rows[2]["RemarksForClients"].ToString();
                    if (s2.Length > 100)
                    {
                    }
                    //imgcomm3.ImageUrl = dt.Rows[2]["pImage"].ToString();
                    //hlcom3.NavigateUrl = "../Search.aspx?Municipality=" + "Brampton&PropertyType=Commercial";
                    string s3 = dt.Rows[3]["RemarksForClients"].ToString();
                    if (s3.Length > 100)
                    {
                    }
                }
                else
                {
                }
            }
            catch (Exception ex)
            {
            }
            finally
            {
            }
        }
        void SearchCondoProperties()
        {
            try
            {
                Session["QueryString"] = "Condo";
                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                DataTable dt = new DataTable();
                if (Convert.ToString(Session["QueryString"]) == "Condo")
                    dt = mlsClient.GetProperties_CondoTop3("0", "0", "0", "0", "0", "0", "0", "0");
                else
                    dt = mlsClient.GetProperties_CondoTop3(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Beds"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString(), "0");
                if (dt.Rows.Count > 0)
                {
                    string s = dt.Rows[0]["RemarksForClients"].ToString();
                    if (s.Length > 100)
                    {
                    }
                    //imgcondo1.ImageUrl = dt.Rows[0]["pImage"].ToString();
                    //hlcon1.NavigateUrl = "../Search.aspx?Municipality=" + "Toronto&PropertyType=Condo";
                    string s1 = dt.Rows[1]["RemarksForClients"].ToString();
                    if (s1.Length > 100)
                    {
                    }
                    //imgcondo2.ImageUrl = dt.Rows[1]["pImage"].ToString();
                    //hlcon2.NavigateUrl = "../Search.aspx?Municipality=" + "Mississauga&PropertyType=Condo";
                    string s2 = dt.Rows[2]["RemarksForClients"].ToString();
                    if (s2.Length > 100)
                    {
                    }
                    //imgcondo3.ImageUrl = dt.Rows[2]["pImage"].ToString();
                    //hlcon3.NavigateUrl = "../Search.aspx?Municipality=" + "Brampton&PropertyType=Condo";
                    string s3 = dt.Rows[3]["RemarksForClients"].ToString();
                    if (s3.Length > 100)
                    {
                    }

                }
                else
                {
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {

            }
        }
        public void GetImages()
        {
            Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
            //DataTable dt = mlsClient.GetImageByMLSID(Convert.ToString(Request.QueryString["MLSID"]));

            DataTable dt = clsobj.GetDreamHouseList();
            if (dt.Rows.Count > 0)
            {
                rptImages.DataSource = dt;
                rptImages.DataBind();
                //sliderDiv.Visible = true;
                //sliderImageEmpty.Visible = false;
            }
            else
            {
                //sliderDiv.Visible = false;
                //sliderImageEmpty.Visible = true;
            }

            mlsClient = null;
        }
        //void GetFeaturedProperties()
        //{
        //    try
        //    {
        //        DataTable dt = new DataTable();
        //        dt = clsobj.GetTopNFeturedProperties("4");
        //        //DataTable Innerdt = new DataTable();
        //        //foreach (DataRow dr in dt.Rows)
        //        //{
        //        //    String ImageUrl = dr["pImage"].ToString();
        //        //    var uri = new Uri(ImageUrl);
        //        //    var fileName = Path.GetFileName(uri.AbsolutePath);
        //        //    var subPath = HttpContext.Current.Server.MapPath("~/IDXResidential");
        //        //    var path = Path.Combine(subPath, fileName);

        //        //    FileInfo file = new FileInfo(path);
        //        //    if (file.Exists)
        //        //    {
        //        //        Innerdt.Rows.Add(dr);
        //        //    }

        //        //    //bool IsExist = File.Exists(ImageUrl);
        //        //    //if (File.Exists(Server.MapPath(ImageUrl)))
        //        //    //{
        //        //    //    Innerdt.Rows.Add(dr);
        //        //    //}

        //        //}

        //      //  rptFeaturedProperties.DataSource = dt;

        //       // rptFeaturedProperties.DataBind();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;

        //    }
        //    finally
        //    {

        //    }
        //}
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                Session["SearchType"] = null;
                Session["SearchType"] = "Residential";
                //string var = txtSearch.Text;
                //Response.Redirect("~/Search.aspx?SearchType=" + Session["SearchType"].ToString() + "&Municipality=" + txtSearch.Text + "", false);
                //Response.Redirect("~/Search.aspx?Municipality=" + var, false);

            }
            catch (Exception ex)
            {
            }
            finally
            { }
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] GetAutoCompleteData(string prefixText, int count, string contextKey)
        {
            List<String> itemNames = new List<String>();
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = ml.GetAutoCompleteData(prefixText);
            foreach (DataRow dr in dt.Rows)
            {
                String item = dr["Province"].ToString();
                itemNames.Add(item);
            }
            string[] prefixTextArray = itemNames.ToArray();
            return prefixTextArray;
        }
        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] GetAutoCompleteData_Comm(string prefixText, int count, string contextKey)
        {
            List<String> itemNames = new List<String>();
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = ml.GetAutoCompleteData_Comm(prefixText);
            foreach (DataRow dr in dt.Rows)
            {
                String item = dr["Province"].ToString();

                itemNames.Add(item);
            }
            string[] prefixTextArray = itemNames.ToArray();
            return prefixTextArray;
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] GetAutoCompleteData_Condo(string prefixText, int count, string contextKey)
        {
            List<String> itemNames = new List<String>();
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = ml.GetAutoCompleteData_Condo(prefixText);
            foreach (DataRow dr in dt.Rows)
            {
                String item = dr["Province"].ToString();

                itemNames.Add(item);
            }
            string[] prefixTextArray = itemNames.ToArray();
            return prefixTextArray;
        }
    }
}