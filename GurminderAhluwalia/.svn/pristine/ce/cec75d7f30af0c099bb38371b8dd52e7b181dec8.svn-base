using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property
{
    public partial class ProjectDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            string ProjectType= Request.QueryString["ProjectType"];
            if (ProjectType == "CurrentProjects")
            {
                lblTitle.InnerText = "Current Projects";
            }
            else
            {
                lblTitle.InnerText = "Upcoming Projects";
            }
            string ProjectName = Request.QueryString["ProjectName"];
           // string imagePath = "image/" + ProjectName + ".jpg";
           // img.Src = "images/Grand-Palace-Condo.jpg";
            img.Src = "images/" + ProjectName + ".jpg";
        }
    }
}
