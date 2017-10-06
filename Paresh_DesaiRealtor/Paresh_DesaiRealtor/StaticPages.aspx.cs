using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property
{
    public partial class StaticPages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["FirstName"] != null)
            {
                this.MasterPageFile = "~/Admin/AdminMaster.master";
            }
        }
    }
}