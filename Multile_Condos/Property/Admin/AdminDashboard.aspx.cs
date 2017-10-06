using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using Property_cls;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

namespace Property.Admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        #region Global
        cls_Property clsobj = new cls_Property();
        #endregion Global

        protected void Page_Load(object sender, EventArgs e)
        {
           // ((HtmlGenericControl)this.Page.Master.FindControl("sidebarmenuadmin")).Style.Add("display", "none");
            if (Session["FirstName"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }         
                
        }
    }
}
     