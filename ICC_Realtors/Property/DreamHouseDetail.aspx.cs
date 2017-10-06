using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Property_cls;
using System.Net;
using System.Net.Mail;
using System.Web.Services;
using System.Configuration;

namespace Property
{
    public partial class DreamHouseDetail : System.Web.UI.Page
    {

        #region PageLoad
        cls_Property clsobj = new cls_Property();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
           
            }
            //Session["Municipality"] = null ;
            if (Page.IsPostBack == false)
            {
              
            }
        }
        protected void btnModal_Clicked(object sender, EventArgs e)
        {
 
        }
        protected void btnSaveUserInfo_Clicked(object sender, EventArgs e)
        {
           
           
        }

        #endregion Page Load

     
    }
}