using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Property_cls;
using System.Net;
using System.Net.Mail;
using System.Web.Services;
using System.Configuration;

namespace Property
{
    public partial class DreamHouseDetail : System.Web.UI.Page
    {

        #region PageLoad
        cls_Property clsobj = new cls_Property();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                GetImages(Convert.ToInt32(1011));
            }
            //Session["Municipality"] = null ;
            if (Page.IsPostBack == false)
            {
              
            }
        }
        protected void btnModal_Clicked(object sender, EventArgs e)
        {
 
        }
        protected void btnSaveUserInfo_Clicked(object sender, EventArgs e)
        {
           
           
        }
        void GetImages(int DreamHouseId)
        {
            Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
            //DataTable dt = mlsClient.GetImageByMLSID(Convert.ToString(Request.QueryString["MLSID"]));

            DataTable dt = clsobj.GetDreamHouseForSlider(DreamHouseId);
            if (dt.Rows.Count > 0)
            {
                rptImages.DataSource = dt;
                rptImages.DataBind();
                //sliderDiv.Visible = true;
                //sliderImageEmpty.Visible = false;
            }
            else
            {
                // sliderDiv.Visible = false;
                //sliderImageEmpty.Visible = true;
            }

            mlsClient = null;
        }
        #endregion Page Load

     
    }
}