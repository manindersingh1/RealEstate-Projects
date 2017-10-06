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

namespace Property
{
    public partial class Change_Password : System.Web.UI.Page
    {
        Cryptography crpt = new Cryptography();
        cls_Property clsobj = new cls_Property();
        string Email;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #region TextBox Event

        //protected void txtUserName_TextChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        SqlCommand cmd = new SqlCommand();
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.CommandText = "usp_RegistrationExist";
        //        cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
        //        cmd.Connection = conn;

        //        if (conn.State == ConnectionState.Closed)
        //        {
        //            conn.Open();
        //        }

        //        DataTable dt = new DataTable();
        //        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        //        sda.Fill(dt);
        //        if (dt.Rows.Count > 0)
        //        {
        //            divpassword.Visible = true;
        //            //lblUserMsg.Text = "Email already Exist";
        //        }
        //        else
        //        {
        //            lblUserMsg.Text = "Username not Exist";
        //        }
        //        cmd.ExecuteNonQuery();
        //        conn.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        #endregion TextBox Event

        //protected void btnSubmit_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        DataTable dt = new DataTable();
        //        dt = clsobj.GetSiteSettings();
        //        if (dt.Rows.Count > 0)
        //        {
        //            Email = dt.Rows[0]["Email"].ToString();
        //            if (Email == txtUserName.Text)
        //            {
        //                divpassword.Visible = true;
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        protected void btnChange_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from tbl_UserInfo";
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
                string oldpassword = dt.Rows[0]["Password"].ToString();
                if (txtPassword.Text == txtConfirm.Text)
                {
                    string password = crpt.Encrypt(txtPassword.Text);
                    cmd.CommandText = "update  [dbo].[tbl_UserInfo] set Password = '" + password + "' ";
                    cmd.Connection = conn;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Admin/Adminlogin.aspx");
                }
            }


        }
    }
}