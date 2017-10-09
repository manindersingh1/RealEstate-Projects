using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Property_cls;

namespace Property.Controls
{
    public partial class ContactInfo : System.Web.UI.UserControl
    {
        #region Global
        cls_Property clsp = new cls_Property();
        #endregion Global
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            GetDealerNumber();
        }
        #endregion PageLoad
        #region Other Method
        void GetDealerNumber()
        {
            DataTable dt = new DataTable();
            dt = clsp.GetUserInfo();
            if (dt.Rows.Count > 0)
            {
                lblContactNo.Text = dt.Rows[0]["PhoneNo"].ToString();
            }
        }
        #endregion Other Method
    }
}