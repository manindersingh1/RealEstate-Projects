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
            this.Page.Title = "Sharan Butan : Home";
            Session["FirstName"] = null;
            Session["SearchType"] = null;
            Session["PropertySearchType"] = null;
            if (!IsPostBack)
            {
                Session["PropertyType"] = Request.QueryString["PropertyType"];
                Session["Municipality"] = Request.QueryString["Municipality"];
                SearchResidentialProperties(Session["PropertyType"].ToString());              
                    divresidential.Visible = true;
             
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
               
               // lblresi.Text = ptype + " Listings";
                    imgresi1.ImageUrl = "images/toronto.jpg";
                    //string s = dt.Rows[0]["RemarksForClients"].ToString();
                     
                    hlresi1.NavigateUrl = "../PropertyType.aspx?Municipality=Toronto&PropertyType=" + ptype;
                    
                    //string s1 = dt.Rows[1]["RemarksForClients"].ToString();
                    
                    imgresi2.ImageUrl =  "images/Mississauga.jpg";
                    hlresi2.NavigateUrl = "../PropertyType.aspx?Municipality=Mississauga&PropertyType=" + ptype;
                    //string s2 = dt.Rows[2]["RemarksForClients"].ToString();
                    
                    imgresi3.ImageUrl = "images/brampton.jpg" ;
                    hlresi3.NavigateUrl = "../PropertyType.aspx?Municipality=" + "Brampton &PropertyType=" + ptype;
                    //string s3 = dt.Rows[3]["RemarksForClients"].ToString();
                     
                    imgresi4.ImageUrl = "images/markham.jpg";
                    hlresi4.NavigateUrl = "../PropertyType.aspx?Municipality=" + "Markham &PropertyType=" + ptype;
                 
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        


    }
}
