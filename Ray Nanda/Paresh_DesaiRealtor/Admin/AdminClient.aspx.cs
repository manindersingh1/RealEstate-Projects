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
                //FillGridData();
            }
            //}
            //else
            //{
            //    Response.Redirect("~/Admin/AdminLogin.aspx", false);
            //}
        }

        #endregion Page Load

        #region PageListGrid Events & Method


        //protected void GrdBlogList_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    int id = 0;
        //    if (e.CommandName == "Deleterec")
        //    {
        //        id = Convert.ToInt32(e.CommandArgument);
        //        int result = clsobj.DeleteDreamHouse(id);
        //        //FillGridData();
        //    }
        //    else if (e.CommandName == "Editrec")
        //    {
        //        id = Convert.ToInt32(e.CommandArgument);
        //        DataTable dt = new DataTable();
        //        dt = clsobj.GetDreamHousebyID(id);
        //        txtName.Text = dt.Rows[0]["Title"].ToString();


        //    }
        //    else
        //    {

        //    }
        //}

        #endregion PageListGrid Events & Method

        #region Button Click
        protected void btnUploadImage_Click(object sender, EventArgs e)
        {
            try
            {
                var photopath = "";

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
    }
}