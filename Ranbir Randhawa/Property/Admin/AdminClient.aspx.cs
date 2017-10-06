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
using Property;
using Property_cls;

namespace Property.Admin
{
    public partial class AdminClient : System.Web.UI.Page
    {
        #region Global
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        cls_Property clsobj = new cls_Property();

        #endregion Global

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["FirstName"] != null)
            //{
            if (!IsPostBack)
            {
                string Id = Request.QueryString["edit"];
                if (Id != null && Id != "")
                {
                    GetSiteData(Convert.ToInt32(Id));
                }
                var subPath = Server.MapPath("~/uploadfiles");
                 string[] pdfFiles = GetFileNames(subPath, "*.pdf");
            }
            //}
            //else
            //{
            //    Response.Redirect("~/Admin/AdminLogin.aspx", false);
            //}
        }

        #endregion Page Load

        #region PageListGrid Events & Method



        #endregion PageListGrid Events & Method

        #region Button Click

        protected void btnUploadImage_Click(object sender, EventArgs e)
        {
            try
            {
                var photopath = "";
                var Id = hdnId.Value;
                if (ClientPhoto.PostedFile != null && ClientPhoto.PostedFile.FileName != "")
                {

                    //Save the photo in Folder
                    var fileExt = Path.GetExtension(ClientPhoto.FileName);
                    string fileName = Guid.NewGuid() + fileExt;
                    var subPath = Server.MapPath("~/uploadfiles");

                    //Check SubPath Exist or Not
                    if (!Directory.Exists(subPath))
                    {
                        Directory.CreateDirectory(subPath);
                    }
                    //End : Check SubPath Exist or Not

                    var path = Path.Combine(subPath, fileName);
                    ClientPhoto.SaveAs(path);

                    photopath = clsobj.GetURL() + "/uploadfiles/" + fileName;
                }

                var Status = rblList.SelectedValue;
                var gender = Gender.SelectedValue;
                var source = Source.SelectedValue;


                int AdminClientId = clsobj.InsertAdminClient(txtName.Text, txtDob.Text, txtEmail.Text, txtPhoneNo.Text, txtAddress.Text, source, Status, gender, photopath, Remarks.Text);

                txtName.Text = "";
                txtPhoneNo.Text = "";
                txtDob.Text = "";
                txtEmail.Text = "";
                txtAddress.Text = "";

                Response.Redirect("~/Admin/AdminClientList.aspx", false);
            }

            catch (Exception ex)
            {
                // ErrorLogging.WriteLog(ex.ToString());
            }

        }
        protected void btnfavdelete_Click(object sender, EventArgs e)
        {

            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("update AdminClient set Photopath='" + "" + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            btnfavdelete.Visible = false;
            Response.Redirect("AdminClient.aspx");
        }
        #endregion Button Click

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtPhoneNo.Text = "";
            txtDob.Text = "";
            txtEmail.Text = "";
            txtAddress.Text = "";

        }

        protected void GetSiteData(int Id)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = clsobj.GetAdminClientbyID(Id);
                if (dt.Rows.Count > 0)
                {

                    txtName.Text = dt.Rows[0]["Name"].ToString();
                    txtDob.Text = Convert.ToString(dt.Rows[0]["DOB"]);
                    txtEmail.Text = Convert.ToString(dt.Rows[0]["EmailId"]);
                    txtPhoneNo.Text = Convert.ToString(dt.Rows[0]["PhoneNo"]);
                    txtAddress.Text = Convert.ToString(dt.Rows[0]["Address"]);
                    Remarks.Text = Convert.ToString(dt.Rows[0]["Remarks"]);
                    imgfavicon.ImageUrl = Convert.ToString(dt.Rows[0]["Photopath"]);
                    imgfavicon.Visible = true;
                    Source.DataTextField = Convert.ToString(dt.Rows[0]["source"]);
                    Source.DataValueField = Convert.ToString(dt.Rows[0]["source"]);
                    Gender.DataTextField = Convert.ToString(dt.Rows[0]["Gender"]);
                    Gender.DataValueField = Convert.ToString(dt.Rows[0]["Gender"]);
                    rblList.DataTextField = Convert.ToString(dt.Rows[0]["Status"]);
                    rblList.DataValueField = Convert.ToString(dt.Rows[0]["Status"]);
                    hdnId.Value = Id.ToString();
                    btnUploadImage.Text = "Update";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

      private static string[] GetFileNames(string path, string filter)
        {
            string[] files = Directory.GetFiles(path, filter);
            for(int i = 0; i < files.Length; i++)
                files[i] = Path.GetFileName(files[i]);
            return files;
            }

    }
}