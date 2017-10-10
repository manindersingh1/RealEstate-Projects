using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property.Controls
{
    public partial class Landing_control : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/Search.aspx?Searchtype=" + Session["SearchType"].ToString(), false);
            }
            catch (Exception ex)
            {
            }
            finally
            { }
        }
    }
}