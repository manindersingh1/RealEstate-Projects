using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Property_cls;
using System.Web.UI.HtmlControls;

namespace Property
{
    public partial class FeatureListing : System.Web.UI.Page
    {
        cls_Property clsobj = new cls_Property();

        protected void Page_Load(object sender, EventArgs e)
        {

           
            if (!IsPostBack)
            {
                GetFeaturedProperties();
            }
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
        void GetFeaturedProperties()
        {
            try
            {
                DataTable dtIDs = new DataTable();
                dtIDs = clsobj.GetAllFeturedIDs();
                String result = dtIDs.AsEnumerable()
                      .Select(row => row["MLSID"].ToString())
                      .Aggregate((s1, s2) => String.Concat(s1, "," + s2));
                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                DataTable dt = mlsClient.FeatureListing(result);
                dlFeatured.DataSource = dt;
                dlFeatured.DataBind();
                Session["FeatureType"] = "IDXImagesResidential";
                mlsClient = null;
                if (dt.Rows.Count > 0)
                {
                    FeatureId.Visible = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;

            }
            finally
            {

            }
        }
        //protected void AddFavourite_Click(object sender, EventArgs e)
        //{
        //    Session["MLSID"] = lblMLS.Text;
        //    Session["Type"] = Convert.ToString(Session["PropertySearchType"]);
        //    if (Session["LoginUser"] == null)
        //    {

        //        Response.Redirect("~/Login.aspx", false);
        //    }
        //    else
        //    {

        //        int UserID = Convert.ToInt32(Session["UserId"]);
        //        string MLSID = lblMLS.Text;
        //        int result = clsobj.Insert_Favourite(UserID, MLSID);
        //        FavouriteSpan.InnerText = "Favourite Property";
        //    }

        //}


        protected void dlFeatured_ItemCommand1(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "AddFavourite")
            {
                Session["MLSID"] = e.CommandArgument;
                Session["Type"] = "IDXImagesResidential";
                if (Session["LoginUser"] == null)
                {
                    Session["Favourite"] = e.CommandArgument.ToString();
                    Response.Redirect("~/Login.aspx", false);
                }
                else
                {

                    int UserID = Convert.ToInt32(Session["UserId"]);
                    string MLSID = e.CommandArgument.ToString();
                    int result = clsobj.Insert_Favourite(UserID, MLSID);
                    HtmlGenericControl span = e.Item.FindControl("favouriteSpan") as HtmlGenericControl;
                    span.InnerText = "Favourite Property";

                }
            }
            else if (e.CommandName == "Appointment")
            {
                Session["Type"] = "IDXImagesResidential";
                Response.Redirect("~/ScheduleAppointment.aspx", false);
            }
            else if (e.CommandName == "Email")
            {
                Response.Redirect("~/Email_Listing.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + Convert.ToString(Session["Type"]), false);
            }
            else if (e.CommandName == "Details")
            {

                Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + Convert.ToString(Session["Type"]), false);
            }

            else
            {
                Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + Convert.ToString(Session["Type"]), false);
            }
        }

      
        }
    }
