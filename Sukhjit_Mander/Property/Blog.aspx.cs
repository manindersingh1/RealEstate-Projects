using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Property_cls;
using Property_Cryptography;


namespace Property
{
    public partial class Blog : System.Web.UI.Page
    {  

        #region Global

        cls_Property objBlog = new cls_Property();

        #endregion Global

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (!IsPostBack)
            {
                BindBlog();
            }
        }

        #endregion Page Load

        #region Other Methods

        private void BindBlog()
        {
            DataTable dt = new DataTable();
            dt = objBlog.GetAllBlogs();
            if (dt.Rows.Count > 0)
            {
                rptBlog.DataSource = dt;
                rptBlog.DataBind();
            }

        }

        #endregion BindBlog

    }
}