using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using Property_cls;
using System.Data.SqlClient;
using System.Configuration;


namespace Property.Controls
{
    public partial class login : System.Web.UI.UserControl
    {
        #region Global

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        Cryptography crpt = new Cryptography();
        cls_Property clsobj = new cls_Property();

        #endregion Global
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
                      
           // SqlCommand cmd = new SqlCommand();
           // cmd.CommandType = CommandType.Text;
           //// cmd.CommandText = "insert into tbl_userinfo (FirstName,LastName,CompanyName,Address,City,UserName,Password) values('jasveer','jasveer','ameba','Brampton','Bramton','sale@teamkahlon.com','JV0jCk/44qo=')";
           // //cmd.CommandText = "update tbl_userinfo (FirstName,LastName,CompanyName,Address,City,UserName,Password) values('jasveer','jasveer','ameba','Brampton','Bramton','sale@teamkahlon.com','JV0jCk/44qo=')";
           // cmd.Connection = conn;
           // if (conn.State == ConnectionState.Closed)
           // {
           //     conn.Open();
           // }
           // cmd.ExecuteNonQuery();
           // conn.Close();
            GetSiteData();
            Session["FirstName"] = null;
            Session["LastName"] = null;
            Session["LoginUser"] = null;
            Session["UserId"] = null;
        }
        protected void GetSiteData()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = clsobj.GetSiteSettings();
                if (dt.Rows.Count > 0)
                {
                    lblCopyRight.Text = dt.Rows[0]["Copyright"].ToString();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion Page Load
        #region Button Click
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtUserName.Text == "")
                {
                    lblerror.Text = "Username required";
                    return;
                }
                if (txtPassword.Text == "")
                {
                    lblerror.Text = "Password required";
                    return;
                }
                DataTable dt = new DataTable();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_UserInfoLogin";
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", crpt.Encrypt(txtPassword.Text.Trim()));
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
                    Session["IsLogin"] = 1;
                    if (dt.Rows[0]["Role"].ToString() == "True")
                    {
                        Session["FirstName"] = dt.Rows[0]["FirstName"].ToString() + "  " + dt.Rows[0]["LastName"].ToString();
                        //Session["LastName"] = dt.Rows[0]["LastName"];
                        Session["LoginUser"] = dt.Rows[0]["FirstName"];
                        Session["Role"] = dt.Rows[0]["Role"];
                        Response.Redirect("~/Admin/SiteSettings.aspx", false);
                    }
                    else
                    {
                        Session["LoginUser"] = dt.Rows[0]["FirstName"];
                        Session["UserId"] = dt.Rows[0]["ID"];
                        Session["Role"] = dt.Rows[0]["Role"];
                        Response.Redirect("~/User/Favourite.aspx", false);
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