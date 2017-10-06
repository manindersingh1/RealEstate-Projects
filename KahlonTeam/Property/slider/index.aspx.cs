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

namespace Property.slider
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SearchResidentialProperties();
        }

        public string GetText(string txtDescription)
        {
            if (txtDescription.Length > 200)
            {
                int i = txtDescription.IndexOf(" ", 185);
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



        public string GetAddress(string address)
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
                address = ((Convert.ToString(dt.Rows[0]["address"]) != "" && Convert.ToString(dt.Rows[0]["address"]) != "null" ? Convert.ToString(dt.Rows[0]["address"]) : "") + (Convert.ToString(dt.Rows[0]["Municipality"]) != "" && Convert.ToString(dt.Rows[0]["Municipality"]) != "null" ? "," + Convert.ToString(dt.Rows[0]["Municipality"]) : "") + (Convert.ToString(dt.Rows[0]["PostalCode"]) != "" && Convert.ToString(dt.Rows[0]["PostalCode"]) != "null" ? (", " + Convert.ToString(dt.Rows[0]["PostalCode"])) : "") + (Convert.ToString(dt.Rows[0]["province"]) != "null" && Convert.ToString(dt.Rows[0]["province"]) != "" ? (", " + Convert.ToString(dt.Rows[0]["province"])) : ""));
                
            }
            return address;
        }
       public void SearchResidentialProperties()
        
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
                    
                 //  Label1.Text = ((Convert.ToString(dt.Rows[0]["address"]) != "" && Convert.ToString(dt.Rows[0]["address"]) != "null" ? Convert.ToString(dt.Rows[0]["address"]) : "") + (Convert.ToString(dt.Rows[0]["Municipality"]) != "" && Convert.ToString(dt.Rows[0]["Municipality"]) != "null" ? "," + Convert.ToString(dt.Rows[0]["Municipality"]) : "") + (Convert.ToString(dt.Rows[0]["PostalCode"]) != "" && Convert.ToString(dt.Rows[0]["PostalCode"]) != "null" ? (", " + Convert.ToString(dt.Rows[0]["PostalCode"])) : "") + (Convert.ToString(dt.Rows[0]["province"]) != "null" && Convert.ToString(dt.Rows[0]["province"]) != "" ? (", " + Convert.ToString(dt.Rows[0]["province"])) : ""));
                   // imgresi.ImageUrl = dt.Rows[2]["pImage"].ToString();
                    repeater1.DataSource = dt;
                    repeater1.DataBind();
                }
                else
                {
                    //resultSearch.Visible = true;
                    //pagesLink.Visible = false;
                    //resultSearch.Text = "Property is not available ";
                }

            }
            catch (Exception ex)
            {

            }
            finally
            {

            }
        }

       protected void repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
       {
           if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
           {
               int BannerID = e.Item.ItemIndex+1;
               String imageIndex = "images/img-"+BannerID.ToString()+".png";
               Image imgBanner = e.Item.FindControl("imgresi") as Image;
               imgBanner.ImageUrl = imageIndex;
               
               //Session["QueryString"] = "Residential";
               //Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
               //DataTable dt = new DataTable();
               //if (Convert.ToString(Session["QueryString"]) == "Residential" || Convert.ToString(Session["QueryString"]) == "IDXImagesResidential")


               //    dt = mlsClient.GetResidentialPropertiesTop3("0", "0", "0", "0", "0", "0", "0");
               //else
               //    dt = mlsClient.GetResidentialPropertiesTop3(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Beds"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());

               //if (dt.Rows.Count > 0)
               //{
               //    Label lblA = (Label)repeater1.Items[0].FindControl("Label1");

               //    lblA.Text = ((Convert.ToString(dt.Rows[0]["address"]) != "" && Convert.ToString(dt.Rows[0]["address"]) != "null" ? Convert.ToString(dt.Rows[0]["address"]) : "") + (Convert.ToString(dt.Rows[0]["Municipality"]) != "" && Convert.ToString(dt.Rows[0]["Municipality"]) != "null" ? "," + Convert.ToString(dt.Rows[0]["Municipality"]) : "") + (Convert.ToString(dt.Rows[0]["PostalCode"]) != "" && Convert.ToString(dt.Rows[0]["PostalCode"]) != "null" ? (", " + Convert.ToString(dt.Rows[0]["PostalCode"])) : "") + (Convert.ToString(dt.Rows[0]["province"]) != "null" && Convert.ToString(dt.Rows[0]["province"]) != "" ? (", " + Convert.ToString(dt.Rows[0]["province"])) : ""));
               //}
           }
       }
    }
}