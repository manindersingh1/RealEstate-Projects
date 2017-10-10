using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Property_cls;
using System.Data;

namespace Property.User
{
    public partial class UserMaster : System.Web.UI.MasterPage
    {

        cls_Property clsobj = new cls_Property();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //lblLoginUser.Text = Convert.ToString(Session["LoginUser"]);
                //GetFeaturedProperties();
                //GetFavicon();
            }
        }

        void GetFeaturedProperties()
        {

            //Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
            //DataTable dt = mlsClient.FeatureListing("E2915446,W2906348,W2836379,W2844297");

            //rptfooter.DataSource = dt;
            //rptfooter.DataBind();

            //mlsClient = null;
        }

        void GetFavicon()
        {
            //try
            //{
            //    DataTable dt = clsobj.GetSiteSettings();

            //    if (dt.Rows.Count > 0)
            //    {
            //        byte[] imagedata = (byte[])dt.Rows[0]["Favicon.ico"];
            //        Page.Title = Convert.ToString(dt.Rows[0]["Title"]);
            //        Page.MetaDescription = Convert.ToString(dt.Rows[0]["Description"]);
            //        Page.MetaKeywords = Convert.ToString(dt.Rows[0]["Keywords"]);
            //        if (imagedata.Length > 0)
            //        {
            //            Session["MyFavicon"] = imagedata;
            //            imgfavicon.Visible = true;
            //            imgfavicon.Href = "~/ShowFavicon.aspx";
            //        }
            //        else
            //        {
            //            imgfavicon.Visible = false;
            //        }
            //    }
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
    }
}