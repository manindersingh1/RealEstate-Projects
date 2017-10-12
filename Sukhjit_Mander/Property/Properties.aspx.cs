using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Property
{
    public partial class Properties : System.Web.UI.Page
    {

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
          
            GetFeaturedProperties();
            Session["SearchType"] = "Residential";
        }

        #endregion Page Load

        #region Other Methods

        void GetFeaturedProperties()
        {
            try
            {
                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                DataTable dt = mlsClient.FeatureListing("E2915446,W2906348,W2836379,W2844297,C2849402,N2869810,N2889909,N2894999");

                rptFeaturedProperties.DataSource = dt;
                rptFeaturedProperties.DataBind();
                mlsClient = null;
            }
            catch (Exception ex)
            {
                throw ex;

            }
            finally
            {

            }
        }

        public string GetPropertyDetails(string propDetail, string MLSID)
        {
            int indexof = 0;
            if (propDetail.LastIndexOf(" ") > 150)
            {
                indexof = propDetail.IndexOf(" ", 150);
                return propDetail.Substring(1, indexof) + "... <a href=PropertyDetails.aspx?MLSID=" + MLSID + ">More</a>";
            }
            else
                return propDetail;

        }

        public string CheckVirtualTour(string virtualTour)
        {
            if (virtualTour == "null")
                return "";
            else
                return "Virtual Tour Available : <a  target='_blank' href=" + virtualTour + ">Click Here</a>";
        }

        #endregion Other Methods

    }
}