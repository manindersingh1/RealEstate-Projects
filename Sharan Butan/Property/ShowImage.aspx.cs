using System;
using System.Web;

namespace Milton.Administrative
{
    public partial class ShowImage : System.Web.UI.Page
    {

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                    Byte[] bytes = (Byte[])Session["ContactImage"];
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

        #endregion Page Load

    }
}