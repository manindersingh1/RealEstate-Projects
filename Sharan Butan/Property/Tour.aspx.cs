using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property
{
    public partial class Tour : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            GetTestimonials();
        }
        protected void GetTestimonials()
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                DataTable dt = new DataTable();
                cmd.CommandText = "GetResidentialProperties";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                    if (dt.Rows.Count > 0)
                    {
                        grdslider.DataSource = dt;
                        grdslider.DataBind();
                    }
                    else
                    {
                    }
            }
            catch (Exception ex)
            { 
            }
            finally
            {
                conn.Close();
            }
        }
    }
}