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
    public partial class Login : System.Web.UI.Page
    {

        #region Global

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        Cryptography crpt = new Cryptography();
        cls_Property clsobj = new cls_Property();

        #endregion Global

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        #endregion Page Load

        #region Button Click

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_RegistrationLogin";
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                cmd.Parameters.AddWithValue("@Password", crpt.Encrypt(txtPassword.Text));
                cmd.Connection = conn;

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                conn.Close();
                if (dt.Rows.Count > 0)
                {
                    if (Convert.ToBoolean(dt.Rows[0]["IsVerified"]) == true)
                    {
                        Session["LoginUser"] = dt.Rows[0]["FirstName"];
                        Session["UserId"] = dt.Rows[0]["ID"];
                        if (Session["Favourite"] != null)
                        {
                            int UserID = Convert.ToInt32(dt.Rows[0]["ID"]);
                            string MLSID = Convert.ToString(Session["Favourite"]);
                            int result = clsobj.Insert_Favourite(UserID, MLSID);
                            if ((Session["FeatureType"]) != null)
                            {
                                Response.Redirect("~/featureListing.aspx", false);
                            }
                            else
                            {
                                Response.Redirect("~/Search.aspx?PropertyType=" + Convert.ToString(Session["Type"]), false);
                            }
                        }
                        
                        else if (Convert.ToString(Session["MLSID"]) != "" && Convert.ToString(Session["Type"]) != "")
                        {
                            Response.Redirect("PropertyDetails.aspx?MLSID=" + Convert.ToString(Session["MLSID"]) + "&PropertyType=" + Convert.ToString(Session["Type"]), false);
                        }
                        else
                        {
                            Response.Redirect("Home.aspx", false);
                        }
                    }
                    else
                    {
                        lblerror.Text = "Verify your Email to Login";
                    }
                }
                else
                {
                    txtUserName.Text = "";
                    lblerror.Text = "Incorrect Username or Password";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion Button Click

    }
}

