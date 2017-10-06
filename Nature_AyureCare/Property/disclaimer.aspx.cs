using Property_cls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property
{
    public partial class disclaimer : System.Web.UI.Page
    {
        cls_Property clsobj = new cls_Property();

        void bindmenulist()
        {
            StringBuilder StrMenu = new StringBuilder();
            DataTable dt = new DataTable();
            DataTable dtSubmenu = new DataTable();
            dt = clsobj.GetDreamHouse();
            if (dt.Rows.Count > 0)
            {
                StrMenu.Append("<ul class='dropdown-menu'>");

                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    StrMenu.Append("<li><a href='../service.aspx?Id=" + dt.Rows[j]["Id"] + "' title='Home'>" + dt.Rows[j]["Title"] + "</a></li>");
                }
                StrMenu.Append("</ul>");
            }
            dynamicmenus.Text = StrMenu.ToString();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            bindmenulist();

        }
    }
}