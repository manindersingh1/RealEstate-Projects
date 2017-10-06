using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property
{
    public partial class ShowBannerImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Byte[] bytes = (Byte[])Session["BannerImage"];
                Response.Buffer = true;
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.ContentType = "PNG";
                Response.AddHeader("content-disposition", "attachment;filename=BannerImage");
                Response.BinaryWrite(bytes);
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Login.aspx", false);
            }
        }
    }
}