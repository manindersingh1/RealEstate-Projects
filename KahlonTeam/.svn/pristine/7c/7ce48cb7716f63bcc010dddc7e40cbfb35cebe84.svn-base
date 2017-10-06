using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Property_cls;

namespace Property
{
    public partial class Detail : System.Web.UI.Page
    {
        #region Properties

        String _SearchText;
        public String SearchText
        {
            get { return _SearchText; }
            set { _SearchText = value; }
        }
        String _MinPrice;
        public String MinPrice
        {
            get { return _MinPrice; }
            set { _MinPrice = value; }
        }
        String _MaxPrice;
        public String MaxPrice
        {
            get { return _MaxPrice; }
            set { _MaxPrice = value; }
        }
        String _Beds;
        public String Beds
        {
            get { return _Beds; }
            set { _Beds = value; }
        }
        String _Baths;
        public String Baths
        {
            get { return _Baths; }
            set { _Baths = value; }
        }

        #endregion Properties
        #region PageLoad
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Title = "Kahlonteam Properties : Home";
            Session["FirstName"] = null;
            Session["SearchType"] = null;
            Session["PropertySearchType"] = null;
            if (!IsPostBack)
            {
                Session["PropertyType"] = Request.QueryString["PropertyType"];
                SearchResidentialProperties(Session["PropertyType"].ToString());
                //if (Convert.ToString(Session["PropertyType"]) == "Residential")
                //{
                    divresidential.Visible = true;
                //    SearchResidentialProperties();
                //}
                //else if (Convert.ToString(Session["PropertyType"]) == "Commercial")
                //{
                //    divcommercial.Visible = true;
                //    SearchCommercialProperties();
                    
                //}
                //else if (Convert.ToString(Session["PropertyType"]) == "Condo")
                //{
                //    divcondo.Visible = true;
                //    SearchCondoProperties();
                //}

                //((HtmlGenericControl)this.Page.Master.FindControl("Homebanner")).Style.Add("display", "block");
            }
        }
        #endregion PageLoad
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
        void SearchResidentialProperties(string ptype)
        {
            try
            {
                Session["QueryString"] = ptype;
                //Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                //DataTable dt = new DataTable();
                //if (Convert.ToString(Session["QueryString"]) == "Residential" || Convert.ToString(Session["QueryString"]) == "IDXImagesResidential")
                //    dt = mlsClient.GetResidentialPropertiesTop3("0", "0", "0", "0", "0", "0", "0");
                //else
                //    dt = mlsClient.GetResidentialPropertiesTop3(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Beds"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());
                lblresi.Text = ptype + " Listings";
                    imgresi1.ImageUrl = "images/toronto.png";
                    //string s = dt.Rows[0]["RemarksForClients"].ToString();
                     
                    hlresi1.NavigateUrl = "../Search.aspx?Municipality=Toronto &PropertyType=" + ptype;
                    
                    //string s1 = dt.Rows[1]["RemarksForClients"].ToString();
                    
                    imgresi2.ImageUrl =  "images/Mississauga.jpg";
                    hlresi2.NavigateUrl = "../Search.aspx?Municipality=" + "Mississauga &PropertyType=" + ptype;
                    //string s2 = dt.Rows[2]["RemarksForClients"].ToString();
                    
                    imgresi3.ImageUrl = "images/brampton.jpg" ;
                    hlresi3.NavigateUrl = "../Search.aspx?Municipality=" + "Brampton &PropertyType=" + ptype;
                    //string s3 = dt.Rows[3]["RemarksForClients"].ToString();
                     
                    imgresi4.ImageUrl = "images/markham.jpg";
                    hlresi4.NavigateUrl = "../Search.aspx?Municipality=" + "Markham &PropertyType=" + ptype;
                 
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        //void SearchCommercialProperties()
        //{
        //    try
        //    {
        //        Session["QueryString"] = "Commercial";
        //        Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
        //        DataTable dt = new DataTable();
        //        if (Convert.ToString(Session["QueryString"]) == "Commercial")
        //            dt = mlsClient.GetAllCommercialPropertiesTop3("0", "0", "0", "0", "0", "0");
        //        else
        //            dt = mlsClient.GetAllCommercialPropertiesTop3(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());
        //        if (dt.Rows.Count > 0)
        //        {
        //            string s = dt.Rows[0]["RemarksForClients"].ToString();
        //            if (s.Length > 100)
        //            {
        //            }
        //            imgcomm1.ImageUrl = dt.Rows[0]["pImage"].ToString();
        //            hlcom1.NavigateUrl = "../Search.aspx?Municipality=" + "Toronto&PropertyType=Commercial";
        //            string s1 = dt.Rows[1]["RemarksForClients"].ToString();
        //            if (s1.Length > 100)
        //            {
        //            }
        //            imgcomm2.ImageUrl = dt.Rows[1]["pImage"].ToString();
        //            hlcom2.NavigateUrl = "../Search.aspx?Municipality=" + "Mississauga&PropertyType=Commercial";
        //            string s2 = dt.Rows[2]["RemarksForClients"].ToString();
        //            if (s2.Length > 100)
        //            {
        //            }
        //            imgcomm3.ImageUrl = dt.Rows[2]["pImage"].ToString();
        //            hlcom3.NavigateUrl = "../Search.aspx?Municipality=" + "Brampton&PropertyType=Commercial";
        //            string s3 = dt.Rows[3]["RemarksForClients"].ToString();
        //            if (s3.Length > 100)
        //            {
        //            }
        //            imgcomm4.ImageUrl = dt.Rows[3]["pImage"].ToString();
        //            hlcom4.NavigateUrl = "../Search.aspx?Municipality=" + "Markham&PropertyType=Commercial";
        //        }
        //        else
        //        {
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    {
        //    }
        //}
        //void SearchCondoProperties()
        //{
        //    try
        //    {
        //        Session["QueryString"] = "Condo";
        //        Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
        //        DataTable dt = new DataTable();
        //        if (Convert.ToString(Session["QueryString"]) == "Condo")
        //            dt = mlsClient.GetProperties_CondoTop3("0", "0", "0", "0", "0", "0", "0", "0");
        //        else
        //            dt = mlsClient.GetProperties_CondoTop3(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Beds"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString(), "0");
        //        if (dt.Rows.Count > 0)
        //        {
        //            string s = dt.Rows[0]["RemarksForClients"].ToString();
        //            if (s.Length > 100)
        //            {
        //            }
        //            imgcondo1.ImageUrl = dt.Rows[0]["pImage"].ToString();
        //            hlcon1.NavigateUrl = "../Search.aspx?Municipality=" + "Toronto&PropertyType=Condo";
        //            string s1 = dt.Rows[1]["RemarksForClients"].ToString();
        //            if (s1.Length > 100)
        //            {
        //            }
        //            imgcondo2.ImageUrl = dt.Rows[1]["pImage"].ToString();
        //            hlcon2.NavigateUrl = "../Search.aspx?Municipality=" + "Mississauga&PropertyType=Condo";
        //            string s2 = dt.Rows[2]["RemarksForClients"].ToString();
        //            if (s2.Length > 100)
        //            {
        //            }
        //            imgcondo3.ImageUrl = dt.Rows[2]["pImage"].ToString();
        //            hlcon3.NavigateUrl = "../Search.aspx?Municipality=" + "Brampton&PropertyType=Condo";
        //            string s3 = dt.Rows[3]["RemarksForClients"].ToString();
        //            if (s3.Length > 100)
        //            {
        //            }
        //            //  imgcondo4.ImageUrl = dt.Rows[3]["pImage"].ToString();
        //            // hlcon4.NavigateUrl = "../Search.aspx?Municipality=" + "Markham&PropertyType=Condo";
        //        }
        //        else
        //        {
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    finally
        //    {

        //    }
        //}


    }
}
