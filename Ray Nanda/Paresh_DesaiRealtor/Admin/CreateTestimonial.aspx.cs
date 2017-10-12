using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Property_cls;

namespace Property.Admin
{
    public partial class CreateTestimonial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FirstName"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }

        protected void btnCreateTestimonial_Click(object sender, EventArgs e)
        {
            if (txtcomment.Text == "")
            {
                lblError.Text = "Testimonial Tour required";
                return;
            }
            cls_Property objprp = new cls_Property();
            objprp.FirstName = txtName.Text;
            objprp.LastName = txtlname.Text;
            objprp.date = txtDate.Text;
            objprp.comments = txtcomment.Text;
            int result = objprp.Insert_Testimonial();
            if (result > 0)
            {
                //lblError.Text = "Virtual Tour successfully created!";
                txtName.Text = string.Empty;
                txtlname.Text = string.Empty;
                txtDate.Text = string.Empty;
                txtcomment.Text = string.Empty;
            }
            else
            {
                lblError.Text = "An error has occurred!!";
            }
            Response.Redirect("~/admin/Testimonials.aspx");

        }

        //protected void btnBack_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("CreateVirtualTour.aspx");
        //}

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Testimonials.aspx");
        }
    }
}