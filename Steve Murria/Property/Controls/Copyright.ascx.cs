using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Property_cls;

namespace Property.Controls
{
    public partial class Copyright : System.Web.UI.UserControl
    {

        #region Global

        cls_Property clsobj = new cls_Property();       

        #endregion Global

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            GetCopyright();
        }

        #endregion Page Load

        #region Other Method

        protected void GetCopyright()
        {
            try
            {
                DataTable dt = clsobj.GetSiteSettings();

                if (dt.Rows.Count > 0)
                {
                    lblCopyright.Text = "©" + Convert.ToString(dt.Rows[0]["Copyright"]);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion Other Method

    }
}