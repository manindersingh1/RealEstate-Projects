using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Property_cls;
using System.Data.SqlClient;
using System.Configuration;

namespace Property
{
    public partial class FeaturedProperties : System.Web.UI.UserControl
    {
        String result;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Constr"].ConnectionString.ToString());//ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetFeaturedProperties();
            }
           

        }

        #endregion Page Load
        #region Other Method
        void GetFeaturedProperties()
        {
            try
            {

                DataTable dtIDs = new DataTable();
                cls_Property objprp = new cls_Property();
                dtIDs = objprp.GetFeturedIDsTop3();
                if (dtIDs.Rows.Count > 0)
                {
                    result = dtIDs.AsEnumerable()
                   .Select(row => row["MLSID"].ToString())
                   .Aggregate((s1, s2) => String.Concat(s1, "," + s2));

                    Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                    SqlCommand cmd = new SqlCommand();
                    DataTable dt = new DataTable();
                    cmd.CommandText = "GetResidentialPropertiesByMlsId";
                    cmd.Parameters.AddWithValue("@mls", result);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    cmd.ExecuteNonQuery();
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    adp.Fill(dt);
                    dlFeatured.DataSource = dt;
                    dlFeatured.DataBind();
                    Session["SearchType"] = "IDXImagesResidential";
                    mlsClient = null;
                    if (dt.Rows.Count > 0)
                    {
                        FeatureId.Visible = true;
                    }
                    //if(dtIDs.Rows.Count> 0)
                    //{
                    //    ImageButton imgButton = (ImageButton)dlFeatured.FindControl("btnimg");
                    //    imgButton.ImageUrl = ("../Featured_Properties.aspx");
                    //}
                    //else
                    //{
                    //    ImageButton imgButton = (ImageButton)dlFeatured.FindControl("btnimg");
                    //    imgButton.ImageUrl = ("../Default.aspx");
                    //}
                }
                else
                {
                    Div1.Visible = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }
        #endregion Other Method
        protected void dlFeatured_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl = (Label)e.Item.FindControl("lblRemarksForClients");
               
                //Label lbl = (Label)dlFeatured.FindControl("lblRemarksForClients");
                string remark = lbl.Text;
                if (remark.Length > 100)
                {
                    string discriptionresi1 = remark.Substring(0, 70);
                    lbl.Text = discriptionresi1;
                }
             
            }
        }

        //protected void dlFeatured_ItemCommand(object source, DataListCommandEventArgs e)
        //{
        //    if(e.CommandName=="image")
        //    {
        //        DataTable dtIDs = new DataTable();
        //        cls_Property objprp = new cls_Property();

        //        dtIDs = objprp.GetFeturedIDsTop3();
        //        if (dtIDs.Rows.Count > 0)
        //        {
        //            Response.Redirect("Featured_Properties.aspx");
        //        }
        //        else
        //        {
        //            Response.Redirect("Default_Properties.aspx"); 
        //        }
        //    }
        //}
    }
}