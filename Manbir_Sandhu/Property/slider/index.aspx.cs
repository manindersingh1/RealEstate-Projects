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

        //public string GetText(string txtDescription)
        //{
        //    if (txtDescription.Length > 200)
        //    {
        //        int i = txtDescription.IndexOf(" ", 185);
        //        if (i > 0)
        //            txtDescription = txtDescription.Substring(0, i).Trim();
        //        else
        //            return txtDescription;

        //    }
        //    else
        //    {
        //        return txtDescription;

        //    }
        //    return txtDescription;
        //}

        //public string GetAddress(string address)
        //{
        //    DataTable dt = new DataTable();
        //    dt = (DataTable)ViewState["dts"];
        //    if (dt.Rows.Count > 0)
        //    {
        //        address = ((Convert.ToString(dt.Rows[0]["address"]) != "" && Convert.ToString(dt.Rows[0]["address"]) != "null" ? Convert.ToString(dt.Rows[0]["address"]) : "") + (Convert.ToString(dt.Rows[0]["Municipality"]) != "" && Convert.ToString(dt.Rows[0]["Municipality"]) != "null" ? "," + Convert.ToString(dt.Rows[0]["Municipality"]) : "") + (Convert.ToString(dt.Rows[0]["PostalCode"]) != "" && Convert.ToString(dt.Rows[0]["PostalCode"]) != "null" ? (", " + Convert.ToString(dt.Rows[0]["PostalCode"])) : "") + (Convert.ToString(dt.Rows[0]["province"]) != "null" && Convert.ToString(dt.Rows[0]["province"]) != "" ? (", " + Convert.ToString(dt.Rows[0]["province"])) : ""));

        //    }
        //    return address;
        //}

        public void SearchResidentialProperties()
        {
            try
            {
                //Session["QueryString112 "] = "Residential";
                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                DataTable dt = new DataTable();
                //if (Convert.ToString(Session["QueryString112"]) == "Residential" || Convert.ToString(Session["QueryString"]) == "IDXImagesResidential")


                dt = mlsClient.GetResidentialPropertiesTop3("0", "0", "0", "0", "0", "0", "0");
                //else
                //    dt = mlsClient.GetResidentialPropertiesTop3(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Beds"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());

                if (dt.Rows.Count > 0)
                {
                    // imgresi.ImageUrl = dt.Rows[2]["pImage"].ToString();
                    DataTable dts = new DataTable("MyTab");
                    dts.Columns.Add("MLS", typeof(System.String));
                    dts.Columns.Add("address", typeof(System.String));
                    dts.Columns.Add("RemarksForClients", typeof(System.String));
                    dts.Columns.Add("ListPrice", typeof(System.String));
                    dts.Columns.Add("style", typeof(System.String));
                    dts.Columns.Add("Municipality", typeof(System.String));

                    dts.Columns.Add("PostalCode", typeof(System.String));
                    dts.Columns.Add("Province", typeof(System.String));
                    dts.Columns.Add("TypeOwn1Out", typeof(System.String));
                    dts.Columns.Add("bimage", typeof(System.String));
                    int i = 1;
                    foreach (DataRow drow in dt.Rows)
                    {
                        DataRow d = dts.NewRow();
                        d["mls"] = drow["mls"];
                        d["address"] = drow["address"];
                        d["remarksForClients"] = drow["remarksforclients"];
                        d["listprice"] = drow["listprice"];
                        d["typeown1out"] = drow["typeown1out"];
                        d["style"] = drow["style"];
                        d["bImage"] = "images/Banner" + i + ".png";
                        d["Municipality"] = drow["Municipality"];
                        d["PostalCode"] = drow["postalcode"];

                        d["Province"] = drow["province"];

                        dts.Rows.Add(d);
                        i += 1;

                    }
                    dts.AcceptChanges();




                    ViewState["dts"] = dts;

                    //repeater1.DataSource = dts;
                    //repeater1.DataBind();
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

        public void getstyle(string style)
        {

        }

        //protected void repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item)
        //    {
        //        Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
        //        DataTable dt = new DataTable();
        //        //dt = mlsClient.GetResidentialPropertiesTop3("0", "0", "0", "0", "0", "0", "0");
        //        dt = (DataTable)ViewState["dts"];
        //        if (dt.Rows.Count > 0)
        //        {
        //            Label lblStyle = (Label)e.Item.FindControl("lblStyle");

        //            lblStyle.Text = Convert.ToString(dt.Rows[0]["TypeOwn1Out"]) + " " + Convert.ToString(dt.Rows[0]["Style"]);
        //        }

        //    }
        //}
    }
}
