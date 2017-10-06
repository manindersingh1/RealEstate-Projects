using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property.Admin
{
    public partial class ShowFavicon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Byte[] bytes = (Byte[])Session["MyFavicon"];
                Response.Buffer = true;
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.ContentType = "PNG";
                Response.AddHeader("content-disposition", "attachment;filename=MyLogo");
                Response.BinaryWrite(bytes);
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Login.aspx", false);
            }
        }
    }
}