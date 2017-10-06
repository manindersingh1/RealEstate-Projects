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
    public partial class PropertyVideo : System.Web.UI.Page
    {
        #region Global
        cls_Property clsobj = new cls_Property();
        #endregion Global

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["FirstName"] != null)
            //{
            if (!IsPostBack)
            {
                FillGridData();
            }
            //}
            //else
            //{
            //    Response.Redirect("~/Admin/AdminLogin.aspx", false);
            //}
        }

        #endregion Page Load

        #region PageListGrid Events & Method

        protected void FillGridData()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = clsobj.GetVideoList();
                grdBannerShow.DataSource = dt;
                grdBannerShow.DataBind();
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }




        protected void GrdBlogList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = 0;
            if (e.CommandName == "Deleterec")
            {
                id = Convert.ToInt32(e.CommandArgument);
                int result = clsobj.DeleteVideo(id);
                FillGridData();
            }
            else if (e.CommandName == "Editrec")
            {
                id = Convert.ToInt32(e.CommandArgument);
                clsobj.ChangeVideo(id);
                
                //imgbanner.Visible = true;
                FillGridData();
            }
            
            else
            {
                FillGridData();
            }
        }





        #endregion PageListGrid Events & Method

        #region Button Click

        protected void btnUploadImage_Click(object sender, EventArgs e)
        {
            try
            {
                byte[] bytes = null;
                
                imgbanner.Visible = false;
                HttpFileCollection fileCollection = Request.Files;
                HttpPostedFile uploadfileSingle = fileCollection[0];
                var videoLink=  SaveFile(uploadfileSingle);
                if (videoLink != null)
                {
                    clsobj.InsertPropertyVideo(videoLink, "video/mp4", bytes, videoLink);
                }
                FillGridData();
            }
            catch (Exception ex)
            {
                //ErrorLogging.WriteLog(ex.ToString());
            }

        }
        public string SaveFile(HttpPostedFile file)
        {
            //if (PhotoPath != "")
            //{   //Delete Old Image
            //    string pathDel = Server.MapPath("~/CustomerPhoto");

            //    FileInfo objfile = new FileInfo(pathDel);
            //    if (objfile.Exists) //check file exsit or not
            //    {
            //        objfile.Delete();
            //    }
            //    //End :Delete Old Image
            //}

            //Save the photo in Folder
            var fileExt = Path.GetExtension(file.FileName);
            string fileName = Guid.NewGuid() + fileExt;
            var subPath = Server.MapPath("~/uploadfiles");

            //Check SubPath Exist or Not
            if (!Directory.Exists(subPath))
            {
                Directory.CreateDirectory(subPath);
            }
            //End : Check SubPath Exist or Not

            var path = Path.Combine(subPath, fileName);
            file.SaveAs(path);

            return "http://localhost:61760/uploadfiles/" + fileName;
        }
        #endregion Button Click

        protected void btnCancel_Click(object sender, EventArgs e)
        {
           // txtutube.Text = "";
            //txtDescription.Text = "";
            //imgbanner.Visible = false;
        }
    }
}