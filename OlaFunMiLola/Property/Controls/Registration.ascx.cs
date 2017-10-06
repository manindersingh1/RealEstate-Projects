using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;
using Property_Cryptography;
using Property_cls;

namespace Property.Controls
{
    public partial class Registration : System.Web.UI.UserControl
    {

        #region Global

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Constr"].ToString());
        Cryptography crpt = new Cryptography();
        cls_Property clsobj = new cls_Property();

        #endregion Global

        #region PageLoad

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["FirstName"] != null)
                {
                    //Page.MasterPageFile = "../AdminMaster.Master";
                    GetDealerInfo();
                    //if (Request.QueryString["new"] != null)
                    //{
                    //    GetDealerInfo();
                    //}
                    //else if (Request.QueryString["edit"] != null)
                    //{
                    //    GetDealerInfo();
                    //}
                }
            }
        }

        #endregion PageLoad

        #region GetDealerInfo Method

        protected void GetDealerInfo()
        {
            try
            {
                DataTable dt = new DataTable();
                int eid = Convert.ToInt32(Request.QueryString["edit"]);
                int nid = Convert.ToInt32(Request.QueryString["new"]);
                if (eid > 0)
                {
                    dt = clsobj.GetUserInfoByID(eid);

                    txtFirstName.Text = Convert.ToString(dt.Rows[0]["FirstName"]);
                    // txtLastName.Text = Convert.ToString(dt.Rows[0]["LastName"]);
                    //txtCompanyName.Text = Convert.ToString(dt.Rows[0]["CompanyName"]);
                    txtAddress.Text = Convert.ToString(dt.Rows[0]["Address"]);
                    txtCity.Text = Convert.ToString(dt.Rows[0]["City"]);
                    txtState.Text = Convert.ToString(dt.Rows[0]["State"]);
                    txtPhoneNo.Text = Convert.ToString(dt.Rows[0]["PhoneNumber"]);
                    //txtWebsite.Text = Convert.ToString(dt.Rows[0]["WebsiteURL"]);

                    txtUsername.Text = Convert.ToString(dt.Rows[0]["UserName"]);
                    txtPassword.Text = crpt.Decrypt(Convert.ToString(dt.Rows[0]["Password"]));
                    txtConfirm.Text = crpt.Decrypt(Convert.ToString(dt.Rows[0]["Password"]));
                    txtPassword.TextMode = TextBoxMode.SingleLine;
                    txtConfirm.TextMode = TextBoxMode.SingleLine;
                    //ImageUpload.Enabled = false;
                    return;
                }
                else if (nid>1)
                {
                    dt = clsobj.GetUserInfo();
                }

                if (dt.Rows.Count > 0)
                {
                    txtFirstName.Text = Convert.ToString(dt.Rows[0]["FirstName"]);
                    //txtLastName.Text = Convert.ToString(dt.Rows[0]["LastName"]);
                    //txtCompanyName.Text = Convert.ToString(dt.Rows[0]["CompanyName"]);
                    txtAddress.Text = Convert.ToString(dt.Rows[0]["Address"]);
                    txtCity.Text = Convert.ToString(dt.Rows[0]["City"]);
                    txtState.Text = Convert.ToString(dt.Rows[0]["State"]);
                    txtPhoneNo.Text = Convert.ToString(dt.Rows[0]["PhoneNo"]);
                    //txtWebsite.Text = Convert.ToString(dt.Rows[0]["WebsiteURL"]);
                    txtUsername.Text = Convert.ToString(dt.Rows[0]["UserName"]);
                    txtPassword.Text = crpt.Decrypt(Convert.ToString(dt.Rows[0]["Password"]));
                    txtConfirm.Text = crpt.Decrypt(Convert.ToString(dt.Rows[0]["Password"]));
                    txtPassword.TextMode = TextBoxMode.SingleLine;
                    txtConfirm.TextMode = TextBoxMode.SingleLine;

                    //byte[] Profileimage = (byte[])dt.Rows[0]["Image"];
                    //ViewState["ProfileImage"] = Profileimage;
                    //if (Profileimage.Length > 0)
                    //{
                    //    Session["ContactImage"] = Profileimage;
                    //    imgProfile.Visible = true;
                    //    imgProfile.ImageUrl = "~/ShowImage.aspx";

                    //}
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion GetDealerInfo Method

        #region Button Click's

        protected void btnSaveInfo_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.CommandText = "usp_UserInfoExist";
                cmd1.Parameters.AddWithValue("@Username", txtUsername.Text);
                cmd1.Connection = conn;

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                DataTable dt = new DataTable();
                SqlDataAdapter sda = new SqlDataAdapter(cmd1);
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    lblUsernamemsg.Text = "Username already Exist";
                }
                else
                {
                    lblUsernamemsg.Text = "";
                }
                if (Request.QueryString["edit"] != null)
                {
                    updInfo(Convert.ToInt32(Request.QueryString["edit"]));
                    Response.Redirect("RegisteredUsers.aspx");                    
                }

                if (Session["FirstName"] == null || Request.QueryString["new"] != null)
                {


                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "usp_UserInfoInsert";
                    cmd.Connection = conn;

                    cmd.Parameters.AddWithValue("@UserID", 0);
                    cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                    //cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                    //cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@City", txtCity.Text);
                    cmd.Parameters.AddWithValue("@State", txtState.Text);
                    cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNo.Text);
                    //cmd.Parameters.AddWithValue("@Image", Image);
                    //cmd.Parameters.AddWithValue("@WebsiteURL", txtWebsite.Text);
                    cmd.Parameters.AddWithValue("@UserName", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@Password", crpt.Encrypt(txtPassword.Text));
                    if (rdbrthday.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@Birthday_Greeting", true);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Birthday_Greeting", false);
                    }
                    if (rdseasonel.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@seasonal_Greeting", true);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@seasonal_Greeting", false);
                    }
                    

                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Clear();
                    Response.Redirect("RegisteredUsers.aspx");
                }
                else
                {

                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "usp_UserInfoEdit";
                    cmd.Connection = conn;

                    cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                    //cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                    //cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@City", txtCity.Text);
                    cmd.Parameters.AddWithValue("@State", txtState.Text);
                    cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNo.Text);
                    //cmd.Parameters.AddWithValue("@Image", Image);
                    //cmd.Parameters.AddWithValue("@WebsiteURL", txtWebsite.Text);
                    cmd.Parameters.AddWithValue("@UserName", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@Password", crpt.Encrypt(txtPassword.Text));
                    if (rdbrthday.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@Birthday_Greeting", true);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Birthday_Greeting", false);
                    }
                    if (rdseasonel.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@seasonal_Greeting", true);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@seasonal_Greeting", false);
                    }
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Clear();
                    Response.Redirect("RegisteredUsers.aspx");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
        }

        #endregion Button Click's

        #region TextBox Events

        //protected void txtUsername_TextChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        SqlCommand cmd = new SqlCommand();
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.CommandText = "usp_UserInfoExist";
        //        cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
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
        //            lblUsernamemsg.Text = "Username already Exist";
        //        }
        //        else
        //        {
        //            lblUsernamemsg.Text = "";
        //        }
        //        cmd.ExecuteNonQuery();
        //        conn.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        #endregion TextBox Events

        #region Other Methods

        protected void Clear()
        {
            txtFirstName.Text = "";
          
            txtAddress.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtPhoneNo.Text = "";
            //txtWebsite.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtPassword.TextMode = TextBoxMode.Password;
            txtConfirm.TextMode = TextBoxMode.Password;
            //imgProfile.Visible = false;
        }

        private void updInfo(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "update registration set FirstName=@FirstName,Address=@Address,city=@City,State=@State,PhoneNumber=@PhoneNo,UserName=@UserName,Password=@Password where id=@id;";
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@id",id);
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);   
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@City", txtCity.Text);
            cmd.Parameters.AddWithValue("@State", txtState.Text);
            cmd.Parameters.AddWithValue("@PhoneNo", txtPhoneNo.Text);  
            cmd.Parameters.AddWithValue("@UserName", txtUsername.Text);
            cmd.Parameters.AddWithValue("@Password", crpt.Encrypt(txtPassword.Text));
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.ExecuteNonQuery();
            conn.Close();
            Clear();
          
        }

        #endregion Other Methods

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisteredUsers.aspx");
        }



    }
}