using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property.Controls
{
    public partial class GoogleMap : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            address.Value = Convert.ToString(Session["Address"]);
        }
    }
}