using Property_cls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property
{
    public partial class Service : System.Web.UI.Page
    {
        cls_Property clsobj = new cls_Property();
        protected void Page_Load(object sender, EventArgs e)
        {
            var DreamHouseId = Convert.ToString(Request.QueryString["Id"]);           
            GetImages(Convert.ToInt32(DreamHouseId));
            bindmenulist();
            GetDreamHouseDetail(Convert.ToInt32(DreamHouseId));
        }

        void GetImages(int DreamHouseId)
        {
            Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
           

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
        void GetDreamHouseDetail(int DreamHouseId)
        {


            DataTable dt = clsobj.GetDreamHouseDetail(DreamHouseId);
            if (dt.Rows.Count > 0)
            {
                lblTitle.Text = Convert.ToString(dt.Rows[0]["Title"]);
                //lblAddress.Text = Convert.ToString(dt.Rows[0]["Address"]);
                //lblPrice.Text = Convert.ToString(dt.Rows[0]["Price"]);
                lblDescription.Text = Convert.ToString(dt.Rows[0]["Description"]);
            }
        }
        void bindmenulist()
        {
            StringBuilder StrMenu = new StringBuilder();
            DataTable dt = new DataTable();
            DataTable dtSubmenu = new DataTable();
            dt = clsobj.GetDreamHouse();
            if (dt.Rows.Count > 0)
            {
                StrMenu.Append("<ul class='dropdown-menu'>");

                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    StrMenu.Append("<li><a href='../service.aspx?Id="+ dt.Rows[j]["Id"] +"' title='Home'>"+ dt.Rows[j]["Title"] +"</a></li>");                   
                }
                StrMenu.Append("</ul>");
            }
            dynamicmenus.Text = StrMenu.ToString();
        }
         
    }
}