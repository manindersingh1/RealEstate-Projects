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
using System.Text;
using System.Drawing;

namespace Property.Admin
{
    public partial class SiteSettings : System.Web.UI.Page
    {
        string userid;
        #region Global
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        cls_Property clsobj = new cls_Property();
        #endregion Global
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)   
        {
            if (Session["FirstName"] != null)
            {
                if (!IsPostBack)
                {
                    GetSiteData();
                    bindddl();
                }
            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx", false);
            }
        }
        #endregion Page Load
        public void bindddl()
        {
            DataTable dt = new DataTable();
            dt = clsobj.GetListBrokerage();
            if(dt.Rows.Count > 0)
            {
                ddlbrokerage.DataSource = dt;
                //ddlbrokerage.DataValueField = "mls";
                ddlbrokerage.DataTextField = "Listbrokerage";
                ddlbrokerage.DataBind();
                ddlbrokerage.Items.Insert(0, new ListItem("HOMELIFE LIFETIME REALTY INC., BROKERAGE", "0"));
            }
        }
        #region GetSiteData Method
        protected void GetSiteData()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = clsobj.GetSiteSettings();
                if (dt.Rows.Count > 0)
                {
                    userid = dt.Rows[0]["SiteId"].ToString();
                    txtTitle.Text = Convert.ToString(dt.Rows[0]["Title"]);
                    txtDescription.Text = Convert.ToString(dt.Rows[0]["Description"]);
                    txtKeywords.Text = Convert.ToString(dt.Rows[0]["Keywords"]);
                    txtCopyright.Text = Convert.ToString(dt.Rows[0]["Copyright"]);
                    txtSiteTemplate.Text = Convert.ToString(dt.Rows[0]["SiteTemplate"]);
                    txtBanner.Text = Convert.ToString(dt.Rows[0]["BannerSettings"]);
                    txtphone.Text = Convert.ToString(dt.Rows[0]["PhoneNumber"]);
                    txtmobile.Text = Convert.ToString(dt.Rows[0]["Mobile"]);
                    txtemail.Text = Convert.ToString(dt.Rows[0]["Email"]);
                    txtfax.Text = Convert.ToString(dt.Rows[0]["Fax"]);
                    byte[] Logoimage = (byte[])dt.Rows[0]["UploadLogo"];
                    ViewState["LogoImage"] = Logoimage;
                    if (Logoimage.Length > 0)
                    {
                        Session["MyLogo"] = Logoimage;
                        imgLogo.Visible = true;
                        string base64String = Convert.ToBase64String(Logoimage, 0, Logoimage.Length);
                        imgLogo.ImageUrl = "data:image/png;base64," + base64String;
                    }
                    else
                    {
                        imgLogo.Visible = false;
                        btnlogodelete.Visible = false;
                    }
                    byte[] Faviconimage = (byte[])dt.Rows[0]["Favicon.ico"];
                    ViewState["FaviconImage"] = Faviconimage;
                    if (Faviconimage.Length > 0)
                    {
                        Session["MyFavicon"] = Faviconimage;
                        imgfavicon.Visible = true;
                        imgfavicon.ImageUrl = "~/ShowFavicon.aspx";
                    }
                    else
                    {
                        imgfavicon.Visible = false;
                        btnfavdelete.Visible = false;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion GetSiteData Method
        #region Button Click
        public Byte[] CreateThumbnail(byte[] imageData, int Width, int Height, bool maintainAspectRatio)
        {
            Byte[] imageDataNew;
            Bitmap bmp = null;
            try
            {
                MemoryStream memStream = new MemoryStream(imageData);
                System.Drawing.Image img = System.Drawing.Image.FromStream(memStream);
                if (maintainAspectRatio)
                {
                    AspectRatio aspectRatio = new AspectRatio();
                    aspectRatio.WidthAndHeight(img.Width, img.Height, Width, Height);
                    bmp = new Bitmap(img, aspectRatio.Width, aspectRatio.Height);
                }
                else
                {
                    bmp = new Bitmap(img, Width, Height);
                }
                memStream.Dispose();
                MemoryStream stream = new MemoryStream();
                bmp.Save(stream, System.Drawing.Imaging.ImageFormat.Bmp);
                imageDataNew = stream.ToArray();
            }
            catch (Exception ex)
            {
                string ErrorMsg = ex.Message.ToString();
                imageDataNew = imageData;
            }
            return imageDataNew;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string LogoImageName = string.Empty;
                byte[] LogoImage = null;
                if (updbanner.PostedFile != null && updbanner.PostedFile.FileName != "")
                {
                    LogoImageName = Path.GetFileName(updbanner.FileName);
                    LogoImage = new byte[updbanner.PostedFile.ContentLength];
                    HttpPostedFile UploadedImage = updbanner.PostedFile;
                    UploadedImage.InputStream.Read(LogoImage, 0, (int)updbanner.PostedFile.ContentLength);
                }
                else
                {
                    LogoImage = (byte[])ViewState["LogoImage"];
                }
                string FaviconImageName = string.Empty;
                byte[] FaviconImage = null;
                if (UpdFavicon.PostedFile != null && UpdFavicon.PostedFile.FileName != "")
                {
                    FaviconImageName = Path.GetFileName(UpdFavicon.FileName);
                    FaviconImage = new byte[UpdFavicon.PostedFile.ContentLength];
                    HttpPostedFile UploadedImage = UpdFavicon.PostedFile;
                    UploadedImage.InputStream.Read(FaviconImage, 0, (int)UpdFavicon.PostedFile.ContentLength);
                }
                else
                {
                    FaviconImage = (byte[])ViewState["FaviconImage"];
                }
                HttpFileCollection FileColl = Request.Files;
                for (int i = 0; i < FileColl.Count; i++)
                {
                    HttpPostedFile PostedFile = FileColl[i];
                    if (PostedFile.ContentType == "image/jpg" || PostedFile.ContentType == "image/png" || PostedFile.ContentType == "image/bmp")
                    {
                    }
                    if (PostedFile.ContentLength > 0)
                    {
                        PostedFile.SaveAs(Server.MapPath("UploadFiles") + "\\" + System.IO.Path.GetFileName(PostedFile.FileName));
                    }
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "ups_EditSiteSettings";
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                    cmd.Parameters.AddWithValue("@Keywords", txtKeywords.Text);
                    cmd.Parameters.AddWithValue("@Copyright", txtCopyright.Text);
                    cmd.Parameters.AddWithValue("@UploadLogo", LogoImage);
                    cmd.Parameters.AddWithValue("@Faviconico", FaviconImage);
                    cmd.Parameters.AddWithValue("@SiteTemplate", txtSiteTemplate.Text);
                    cmd.Parameters.AddWithValue("@BannerSettings", txtBanner.Text);
                    cmd.Parameters.AddWithValue("@PhoneNumber", txtphone.Text);
                    cmd.Parameters.AddWithValue("@Mobile", txtmobile.Text);
                    cmd.Parameters.AddWithValue("@Email", txtemail.Text);
                    cmd.Parameters.AddWithValue("@Fax", txtfax.Text);
                    cmd.Parameters.AddWithValue("@ListBrokerage", ddlbrokerage.SelectedItem.Text);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("~/Admin/SiteSettings.aspx", false);
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashBoard.aspx");
        }
        #endregion Button Click
        protected void btnlogodelete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("update tbl_SiteSettings set UploadLogo='" + "" + "'", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            btnlogodelete.Visible = false;
            GetSiteData();
        }
        protected void btnfavdelete_Click(object sender, EventArgs e)
        {

            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("update tbl_SiteSettings set [Favicon.ico]='" + "" + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            btnfavdelete.Visible = false;
            GetSiteData();
        }
        protected void btnheaderlogodelete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("update tbl_SiteSettings set BannerImage='" + "" + "'", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            GetSiteData();
        }
    }
}