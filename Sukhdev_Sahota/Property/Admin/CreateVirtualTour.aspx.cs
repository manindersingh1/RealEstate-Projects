using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Property_cls;

namespace Property.Admin
{
    public partial class CreateVirtualTour : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FirstName"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }

        protected void btnCreateVirtualLink_Click(object sender, EventArgs e)
        {
            if (txtLink.Text == "")
            {
                lblError.Text = "Virtual Tour required";
                return;
            }
            cls_Property objprp = new cls_Property();
            objprp.Name = txtName.Text;
            objprp.Link = txtLink.Text;
            int result = objprp.Insert_VirtualLink();
            if (result > 0)
            {
                //lblError.Text = "Virtual Tour successfully created!";
                txtName.Text = string.Empty;
                txtLink.Text=string.Empty;
            }
            else
            {
                lblError.Text = "An error has occurred!!";
            }
            Response.Redirect("~/admin/Virtual.aspx");
                
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateVirtualTour.aspx");
        }
    }
}