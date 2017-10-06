using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Property_cls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Property.User
{
    public partial class Favourite : System.Web.UI.Page
    {
        #region Global

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());
        cls_Property clsobj = new cls_Property();

        int intPageIndex = 0;

        #endregion Global

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginUser"] != null)
            {
                if (!IsPostBack)
                    FillGridData();
            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx", false);
            }
        }

        #region Grid Events and Methods

        protected void FillGridData()
        {
            try
            {
                DataTable dt = GetFavouriteProperties();
                grdFavourite.DataSource = dt;
                grdFavourite.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected DataTable GetFavouriteProperties()
        {
            DataTable dt = new DataTable();
            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string str = "select * from tbl_Favourite where UserID =" + Convert.ToString(Session["UserId"]) + "";
                SqlDataAdapter adp = new SqlDataAdapter(str, conn);
                adp.Fill(dt);
                dt.TableName = "Favourite";
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
            }
            return dt;
        }

        protected void grdFavourite_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grdFavourite.PageIndex = e.NewPageIndex;
                FillGridData();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion Grid Events and Methods
    }
}