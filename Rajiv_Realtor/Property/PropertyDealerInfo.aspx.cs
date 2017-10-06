using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Property
{
    public partial class PropertyDealerInfo : System.Web.UI.Page
    {

        #region PageLoad

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #endregion PageLoad

        #region Button Click's

        protected void btnSaveInfo_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AdminConStr"].ToString());
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PropertyDealer_Insert";
                cmd.Connection = conn;

                cmd.Parameters.AddWithValue("@GUID", 0);
                cmd.Parameters.AddWithValue("@DealerName", txtName.Text);
                cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@City", txtCity.Text);
                cmd.Parameters.AddWithValue("@State", txtState.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNo.Text);
                cmd.Parameters.AddWithValue("@WebsiteURL", txtWebsite.Text);
                cmd.Parameters.AddWithValue("@EmailId",txtEmail.Text);
                cmd.Parameters.AddWithValue("@AllowVOX", chkVOX.Checked == true ? true : false);
                cmd.Parameters.AddWithValue("@AllowBanner", chkBanner.Checked == true ? true : false);
                cmd.Parameters.AddWithValue("@AllowFeaturedProperties", chkFeatured.Checked == true ? true : false);
                cmd.Parameters.AddWithValue("@AllowSiteSearch", chkSiteSearch.Checked == true ? true : false);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                cmd.ExecuteNonQuery();
                conn.Close();
                Clear();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion Button Click's

        #region Other Methods

        protected void Clear()
        {
            txtName.Text = "";
            txtCompanyName.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtPhoneNo.Text = "";
            txtWebsite.Text = "";
            txtEmail.Text = "";
            chkVOX.Checked = false;
            chkBanner.Checked = false;
            chkFeatured.Checked = false;
            chkSiteSearch.Checked = false;
        }

        #endregion Other Methods

    }
}