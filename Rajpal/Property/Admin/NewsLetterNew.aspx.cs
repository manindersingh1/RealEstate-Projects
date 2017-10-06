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
    public partial class NewsLetterNew : System.Web.UI.Page
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
                var FirstImage = "";
                var SecondImage = "";

                if (FirstImg.PostedFile != null && FirstImg.PostedFile.FileName != "")
                {

                    //Save the photo in Folder
                    var fileExt = Path.GetExtension(FirstImg.FileName);
                    string fileName = Guid.NewGuid() + fileExt;
                    var subPath = Server.MapPath("~/uploadfiles");

                    //Check SubPath Exist or Not
                    if (!Directory.Exists(subPath))
                    {
                        Directory.CreateDirectory(subPath);
                    }
                    //End : Check SubPath Exist or Not

                    var path = Path.Combine(subPath, fileName);
                    FirstImg.SaveAs(path);

                    FirstImage = clsobj.GetURL() + "/uploadfiles/" + fileName;
                }
                if (SecondImg.PostedFile != null && SecondImg.PostedFile.FileName != "")
                {

                    //Save the photo in Folder
                    var fileExt = Path.GetExtension(SecondImg.FileName);
                    string fileName = Guid.NewGuid() + fileExt;
                    var subPath = Server.MapPath("~/uploadfiles");

                    //Check SubPath Exist or Not
                    if (!Directory.Exists(subPath))
                    {
                        Directory.CreateDirectory(subPath);
                    }
                    //End : Check SubPath Exist or Not

                    var path = Path.Combine(subPath, fileName);
                    SecondImg.SaveAs(path);

                    SecondImage =  clsobj.GetURL() + "/uploadfiles/" + fileName;
                }
               
                var source = OrderNo.SelectedValue;
                int AdminClientId = clsobj.InsertNewsLetter(txtName.Text, source, FirstImage, SecondImage);

               

                txtName.Text = "";               

                Response.Redirect("~/Admin/NewsLetterList.aspx?Id=0", false);
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
           
            
        }
    }
}