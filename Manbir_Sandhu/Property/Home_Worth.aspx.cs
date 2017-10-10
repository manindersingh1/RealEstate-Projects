using Property_cls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property
{
    public partial class Home_Worth : System.Web.UI.Page
    {
        cls_Property clsobj = new cls_Property();
        protected void Page_Load(object sender, EventArgs e)
        {
            SiteSetting();
        }
        protected void SiteSetting()
        {
            try
            {
                DataTable dt = clsobj.GetSiteSettings();
                DataTable dt1 = clsobj.GetUserInfo();
                if (dt.Rows.Count > 0)
                {

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void addre_submit_Click(object sender, EventArgs e)
        {
            string s = search.Value;
            Response.Redirect("~/Review_home_worth.aspx?address=" + search.Value, false);
         }
    }
}