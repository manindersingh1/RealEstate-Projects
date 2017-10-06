using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

namespace Property
{
    public partial class UserInfo : System.Web.UI.Page
    {

        #region Global

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Constr"].ToString());

        #endregion Global

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
                string ImageName = string.Empty;
                byte[] Image = null;
                if (ImageUpload.PostedFile != null && ImageUpload.PostedFile.FileName != "")
                {
                    ImageName = Path.GetFileName(ImageUpload.FileName);
                    Image = new byte[ImageUpload.PostedFile.ContentLength];
                    HttpPostedFile UploadedImage = ImageUpload.PostedFile;
                    UploadedImage.InputStream.Read(Image, 0, (int)ImageUpload.PostedFile.ContentLength);
                }
                else
                {
                    string path = Server.MapPath("~/images/noimage.jpg");
                    Image = File.ReadAllBytes(path);
                }
 
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "UserInfo_Insert";
                cmd.Connection = conn;

                cmd.Parameters.AddWithValue("@UserID", 0);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@City", txtCity.Text);
                cmd.Parameters.AddWithValue("@State", txtState.Text);
                cmd.Parameters.AddWithValue("@PhoneNo", txtPhoneNo.Text);
                cmd.Parameters.AddWithValue("@Image", Image);
                cmd.Parameters.AddWithValue("@WebsiteURL", txtWebsite.Text);

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
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtCompanyName.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtPhoneNo.Text = "";
            txtWebsite.Text = "";
        }

        #endregion Other Methods
    }
}