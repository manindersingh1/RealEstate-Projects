using Property_cls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property
{
    public partial class SearchedProperty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                cls_Property clsp = new cls_Property();
                clsp.Insert_SearchedProperty(Name.Text, PropertyType.SelectedValue, Email.Text, PhoneNumber.Text, Convert.ToInt32(Radius.SelectedValue));

            }
            catch (Exception ex)
            {
            }
            finally
            { }
        }
    }
}