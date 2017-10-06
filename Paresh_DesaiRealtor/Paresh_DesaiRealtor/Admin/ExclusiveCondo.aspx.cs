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
    public partial class ExclusiveCondo : System.Web.UI.Page
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
                dt = clsobj.GetExclusiveListing();
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
                int result = clsobj.DeleteExclusive(id);
                FillGridData();
            }
            else if (e.CommandName == "Editrec")
            {
                id = Convert.ToInt32(e.CommandArgument);
                DataTable dt = new DataTable();
                dt = clsobj.GetExclusiveDetail(id);
                txtName.Text = dt.Rows[0]["Title"].ToString();
                hdnImg.Value = dt.Rows[0]["ImageUrl"].ToString();
                imgbanner.ImageUrl = "/admin/uploadfiles/" + dt.Rows[0]["ImageUrl"].ToString();
                txtDescription.Text = dt.Rows[0]["Description"].ToString();
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
                string fileNameForFirstImage = Path.GetFileName(uploadfileSingle.FileName);
                int DreamHouseId = clsobj.InsertExclusiveData(txtName.Text, fileNameForFirstImage, txtDescription.Text, txtAddress.Text, txtPrice.Text,statustxt.Text,Typetxt.Text,Bedstxt.Text,Bathtxt.Text,Taxtxt.Text,Mlstxt.Text,Areatxt.Text);
                for (int i = 0; i < fileCollection.Count; i++)
                {
                    HttpPostedFile uploadfile = fileCollection[i];
                    string fileName = Path.GetFileName(uploadfile.FileName);
                    if (uploadfile.ContentLength > 0)
                    {
                        System.Drawing.Image img = System.Drawing.Image.FromStream(uploadfile.InputStream);
                        int height = img.Height;
                        int width = img.Width;
                        decimal size = Math.Round(((decimal)uploadfile.ContentLength / (decimal)1024), 2);
                      
                        string fname = System.IO.Path.GetFileName(uploadfile.FileName);
                        uploadfile.SaveAs(Server.MapPath("UploadFiles") + "\\" + System.IO.Path.GetFileName(uploadfile.FileName));
                        clsobj.InsertExclusiveImage(DreamHouseId, fileName);

                        FillGridData();
                        txtName.Text = "";
                        txtDescription.Text = "";
                        imgbanner.Visible = false;
                       
                       
                    }
                }
                clear();
            }
            catch (Exception ex)
            {
                clear();  //ErrorLogging.WriteLog(ex.ToString());
            }

        }

        #endregion Button Click

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtDescription.Text = "";
            imgbanner.Visible = false;
        }

        public void clear()
        {
            txtPrice.Text = "";
            txtName.Text = "";
            Mlstxt.Text = "";
            Typetxt.Text = "";
            Bedstxt.Text = "";
            Bathtxt.Text = "";
            Areatxt.Text = "";
            Taxtxt.Text = "";
            statustxt.Text = "";
        }
    }
}