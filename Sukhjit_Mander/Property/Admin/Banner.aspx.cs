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
    public partial class Banner : System.Web.UI.Page
    {
        #region Global
        cls_Property clsobj = new cls_Property();
        #endregion Global

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FirstName"] != null)
            {
                if (!IsPostBack)
                {
                    FillGridData();
                }
            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx", false);
            }
        }

        #endregion Page Load

        #region PageListGrid Events & Method

        protected void FillGridData()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = clsobj.GetAllBanner();
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
                int result = clsobj.DeleteBanners(id);
                FillGridData();
            }
            else if (e.CommandName == "Editrec")
            {
                id = Convert.ToInt32(e.CommandArgument);
                DataTable dt = new DataTable();
                dt = clsobj.GetBannerbyID(id);
                txtName.Text = dt.Rows[0]["Name"].ToString();
                hdnImg.Value = dt.Rows[0]["FileName"].ToString();
                imgbanner.ImageUrl = "/admin/uploadfiles/" + dt.Rows[0]["FileName"].ToString();
                itemOrder.Value = dt.Rows[0]["ItemOrder"].ToString();
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
            if (updBannerImage.HasFile)
            {
                System.Drawing.Image img = System.Drawing.Image.FromStream(updBannerImage.PostedFile.InputStream);
                int height = img.Height;
                int width = img.Width;
                decimal size = Math.Round(((decimal)updBannerImage.PostedFile.ContentLength / (decimal)1024), 2);
                //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Size: " + size + "KB\\nHeight: " + height + "\\nWidth: " + width + "');", true);

                //decimal size = Math.Round(((decimal)updBannerImage.PostedFile.ContentLength / (decimal)1024), 2);
                //if (size == 732.27m && (height != 394 || width != 1170))
                //{
                    string fname = System.IO.Path.GetFileName(updBannerImage.FileName);
                    updBannerImage.SaveAs(Server.MapPath("UploadFiles") + "\\" + System.IO.Path.GetFileName(updBannerImage.FileName));
                    clsobj.InsertBanners(txtName.Text, fname, Convert.ToInt32(itemOrder.Value));
                    FillGridData();
                    txtName.Text = "";
                    itemOrder.Value = "1";
                    imgbanner.Visible = false;
                //}
                //else
                //{
                //    lblbannersize.Text = "File size must not exceed 732.27KB.";
                //}
                //if (height != 394 || width != 1170)
                //{
                //    cvFileUpload.Text = "Size Should be 394 * 1170 ";           
                //}
            }
        }

        #endregion Button Click

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            itemOrder.Value = "1";
            imgbanner.Visible = false;
        }
    }
}