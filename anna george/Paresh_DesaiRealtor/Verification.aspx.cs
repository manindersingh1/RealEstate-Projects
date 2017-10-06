using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Property_cls;
using Property_Cryptography;

namespace Property
{
    public partial class Verification : System.Web.UI.Page
    {

        #region Global

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        Cryptography crpt = new Cryptography();

        #endregion Global

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["UserID"] != null)
            {
                string UserID = (Request.QueryString["UserID"]);
                verifyMail(UserID);
            }
        }

        #endregion Page Load

        #region Other Method

        private void verifyMail(string UserID)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_EmailVerification";

                int Id = Convert.ToInt32(UserID);

                cmd.Parameters.AddWithValue("@UserId", Id);

                cmd.Connection = conn;

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                cmd.ExecuteNonQuery();
                conn.Close();

                lblverifymsg.Text = " Thanks for verification. Your email id has been successfully verified and your account has been activated.";
            }
            catch (Exception ex)
            { }
        }

        #endregion Other Method

    }
}