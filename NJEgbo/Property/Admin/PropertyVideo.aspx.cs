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
                
                imgbanner.Visible = true;
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


                HttpFileCollection fileCollection = Request.Files;
                HttpPostedFile uploadfileSingle = fileCollection[0];
                
                for (int i = 0; i < fileCollection.Count; i++)
                {
                     byte[] bytes = null ;
                    HttpPostedFile uploadfile = fileCollection[i];
                    string fileName = Path.GetFileName(uploadfile.FileName);
                    if (uploadfile.ContentLength > 0)
                    {
                                            
                        string fname = System.IO.Path.GetFileName(uploadfile.FileName);
                        uploadfile.SaveAs(Server.MapPath("UploadFiles") + "\\" + System.IO.Path.GetFileName(uploadfile.FileName));
                        clsobj.InsertPropertyVideo(fileName, "video/mp4", bytes);
                        FillGridData();                        
                        imgbanner.Visible = false;
                       
                       
                    }
                }

            }
            catch (Exception ex)
            {
                //ErrorLogging.WriteLog(ex.ToString());
            }

        }

        #endregion Button Click

        protected void btnCancel_Click(object sender, EventArgs e)
        {
           // txtName.Text = "";
            //txtDescription.Text = "";
            imgbanner.Visible = false;
        }
    }
}