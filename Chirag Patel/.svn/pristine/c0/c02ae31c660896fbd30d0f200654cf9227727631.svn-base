using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Property_cls;

namespace Property.Admin
{
    public partial class Createfeature : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FirstName"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }

        protected void btnCreateFeature_Click(object sender, EventArgs e)
        {
            if (txtFeature.Text == "")
            {
                lblError.Text = "MLS-ID required";
                return;
            }
            cls_Property objprp = new cls_Property();
            objprp.MLSID = txtFeature.Text;
            int result = objprp.Insert_FeatureProperty();
            if (result > 0)
                lblError.Text = "Feature property successfully created!";
            else
                lblError.Text = "An error has occurred!!";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Features.aspx");
        }
    }
}