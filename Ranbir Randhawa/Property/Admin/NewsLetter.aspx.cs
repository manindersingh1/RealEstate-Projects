using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Property_Cryptography;
using Property_cls;
using System.Net.Mail;
using System.IO;
using System.Web.Configuration;
using Property.Models;

namespace Property.Admin
{
    public partial class NewsLetter : System.Web.UI.Page
    {

        #region Global

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        Cryptography crpt = new Cryptography();

        String strSortExpression = "", strSortDirection = "";
        int intPageIndex = 0;

        public String GridViewSortDirection
        {
            get
            {
                if (ViewState["GridViewSortDirection"] == null)
                {
                    return "DESC";
                }
                else
                {
                    return ViewState["GridViewSortDirection"].ToString();
                }
            }

            set
            {
                ViewState["GridViewSortDirection"] = value;
            }

        }

        String GetSortDirection()
        {
            String GridViewSortDirectionNew;

            switch (GridViewSortDirection)
            {
                case "DESC":
                    GridViewSortDirectionNew = "ASC";
                    break;
                case "ASC":
                    GridViewSortDirectionNew = "DESC";
                    break;
                default:
                    GridViewSortDirectionNew = "DESC";
                    break;

            }
            GridViewSortDirection = GridViewSortDirectionNew;
            return GridViewSortDirectionNew;

        }

        #endregion Global
        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FirstName"] != null)
            {
                if (!IsPostBack)
                {
                    FillGridData();
                    Session["SliderType"] = "Newsletter";
                }
            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx", false);
            }
        }

        #endregion Page Load

        #region Grid Events & Methods

        protected void FillGridData()
       {
            DataView dv = new DataView();
            dv.Table = GetAdminClients();

            if (strSortExpression != "" && strSortDirection != "")
            {
                dv.Sort = strSortExpression + " " + strSortDirection;
            }
          if(dv.Count>0)
          {
              btnDelete.Visible = true;
              grdUsers.DataSource = dv;
              grdUsers.DataBind();
          }
          else
          {
              grdUsers.DataSource = dv;
              grdUsers.DataBind();
              alertMSG.Visible = true;
              btnDelete.Visible = false;
          }
           

            if (intPageIndex != 0)
                grdUsers.PageIndex = intPageIndex;

        }
        protected string GetHiddenValue()
        {
            string Rslt = "";
            foreach (GridViewRow gvrow in grdUsers.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)grdUsers.HeaderRow.FindControl("chkdeleteAll");
                CheckBox chkdelete = (CheckBox)gvrow.FindControl("chkdelete");
                if (chkdelete.Checked)
                {
                    HiddenField ID = gvrow.FindControl("hdnID") as HiddenField;
                    Rslt += ID.Value + ",";
                }
            }
            Rslt = Rslt.TrimEnd(',');
            return Rslt;
        }
        

        protected DataTable GetAdminClients()
        {
            DataTable dt = new DataTable();
            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string str = "select * from [AdminClient]";
                SqlDataAdapter adp = new SqlDataAdapter(str, conn);
                adp.Fill(dt);
                dt.TableName = "AdminClient";
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
            }
            return dt;
        }

        protected void grdUsers_Sorting(object sender, GridViewSortEventArgs e)
        {
            try
            {
                strSortExpression = e.SortExpression;
                strSortDirection = GetSortDirection();
                intPageIndex = grdUsers.PageIndex;
                FillGridData();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void grdUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grdUsers.PageIndex = e.NewPageIndex;
                FillGridData();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void grdUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Label lblPassword = (Label)e.Row.FindControl("lblPassword");
                //lblPassword.Text = crpt.Decrypt(lblPassword.Text);
            }
        }

        protected void grdUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandArgument == "delete")
            {
                foreach (GridViewRow gvrow in grdUsers.Rows)
                {
                    HiddenField ID = gvrow.FindControl("hdnID") as HiddenField;
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "delete from  [dbo].[AdminClient] where user id ='" + ID + "'";
                }
            }
        }

        #endregion Grid Events & Methods
        #region Button Click

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashBoard.aspx");
        }

        protected void btnBack2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashBoard.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                NewsLetterModel Model = new NewsLetterModel();

                Model.FirstContent = FirstContent.Text;
                Model.SecondContent = SecondContent.Text;
                Model.ThirldContent = ThirdContent.Text;
             
                string SelectedIds = GetHiddenValue();
              
                if (Imgfile.PostedFile != null && Imgfile.PostedFile.FileName != "")
                {

                    var fileExt = Path.GetExtension(Imgfile.FileName);
                    string fileName = Guid.NewGuid() + fileExt;
                    var subPath = Server.MapPath("~/uploadfiles");

                    //Check SubPath Exist or Not
                    if (!Directory.Exists(subPath))
                    {
                        Directory.CreateDirectory(subPath);
                    }
                    //End : Check SubPath Exist or Not

                    var path = Path.Combine(subPath, fileName);
                    Imgfile.SaveAs(path);
                    var URL = ConfigurationManager.AppSettings["LocalURL"].ToString();
                    Model.PropertyPhoto = URL + "/uploadfiles/" + fileName;
                }
                else
                {
                    Model.PropertyPhoto = "../NewsLetterImages/img1F.jpg";
                }

                if (Logofile.PostedFile != null && Logofile.PostedFile.FileName != "")
                {

                    //Save the photo in Folder
                    var fileExt = Path.GetExtension(Logofile.FileName);
                    string fileName = Guid.NewGuid() + fileExt;
                    var subPath = Server.MapPath("~/uploadfiles");

                    //Check SubPath Exist or Not
                    if (!Directory.Exists(subPath))
                    {
                        Directory.CreateDirectory(subPath);
                    }
                    //End : Check SubPath Exist or Not

                    var path = Path.Combine(subPath, fileName);
                    Logofile.SaveAs(path);
                    var URL = ConfigurationManager.AppSettings["LocalURL"].ToString();
                    Model.Logopath = URL + "/uploadfiles/" + fileName;
                }
                else
                {
                    Model.Logopath = "../images/MyLogodd%20-%20Copy.png";
                }
                Model.AdminPhoto = "../images/client_img.jpg";



                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
               
                DataTable dt = new DataTable();
                string str = "select EmailId from [AdminClient] where ID in(" + SelectedIds + ")";
                SqlDataAdapter adp = new SqlDataAdapter(str, conn);
                adp.Fill(dt);

                foreach (DataRow row in dt.Rows)
                {
                    var Email = row["EmailId"].ToString();
                    Model.Email = Email;
                    SendNewsLetter(Model);
                }

                // }


                Response.Redirect("~/Admin/NewsLetter.aspx", false);
            }

            catch (Exception ex)
            {
                //throw ex;
            }
        }

        #endregion Button Click

        protected void btnaddusers_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminClient.aspx");
        }

        protected void chkdeleteAll_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdUsers.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)grdUsers.HeaderRow.FindControl("chkdeleteAll");
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkdelete");
                ChkBoxRows.Checked = ChkBoxHeader.Checked;
            }
        }

        protected void chkdelete_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdUsers.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)grdUsers.HeaderRow.FindControl("chkdeleteAll");
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkdelete");
                if (ChkBoxRows.Checked == false)
                {
                    ChkBoxHeader.Checked = false;
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string SelectedIds = GetHiddenValue();
            SqlCommand cmd = new SqlCommand("Delete from AdminClient where ID in(" + SelectedIds + ")", conn);
            // SqlCommand cmd = new SqlCommand("delete from tblContactUs where Name='';", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            FillGridData();

        }

        public string SendNewsLetter(NewsLetterModel model)
        {


            string Status = "";
            // string EmailId = "only4agentss@gmail.com";

            //Send mail
            MailMessage mail = new MailMessage();

            string FromEmailID = WebConfigurationManager.AppSettings["RegFromMailAddress"];
            string FromEmailPassword = WebConfigurationManager.AppSettings["FromEmailPassword"];

            SmtpClient smtpClient = new SmtpClient(ConfigurationManager.AppSettings["SmtpServer"]);
            int _Port = Convert.ToInt32(WebConfigurationManager.AppSettings["Port"].ToString());
            Boolean _UseDefaultCredentials = Convert.ToBoolean(WebConfigurationManager.AppSettings["UseDefaultCredentials"].ToString());
            Boolean _EnableSsl = Convert.ToBoolean(WebConfigurationManager.AppSettings["EnableSsl"].ToString());
            mail.To.Add(new MailAddress(model.Email));
            mail.From = new MailAddress(FromEmailID);
            mail.Subject = "News Letter";
            string msgbody = "";
            var Template = "Templates/ThirldTemplate.html";


            // using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath(Template)))
            using (StreamReader reader = new StreamReader(Path.Combine(HttpRuntime.AppDomainAppPath, Template)))
            {

                msgbody = reader.ReadToEnd();

                //Replace UserName and Other variables available in body Stream
                msgbody = msgbody.Replace("{PropertyPhoto}", model.PropertyPhoto);
                msgbody = msgbody.Replace("{logopath}", model.Logopath);
                msgbody = msgbody.Replace("{SecondContent}", model.SecondContent);
                msgbody = msgbody.Replace("{ThirdContent}", model.ThirldContent);

            }

            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            System.Net.Mail.AlternateView plainView = System.Net.Mail.AlternateView.CreateAlternateViewFromString(System.Text.RegularExpressions.Regex.Replace(msgbody, @"<(.|\n)*?>", string.Empty), null, "text/plain");
            System.Net.Mail.AlternateView htmlView = System.Net.Mail.AlternateView.CreateAlternateViewFromString(msgbody, null, "text/html");

            mail.AlternateViews.Add(plainView);
            mail.AlternateViews.Add(htmlView);
            // mail.Body = msgbody;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Host = "smtp.gmail.com"; //_Host;
            smtp.Port = _Port;
            //smtp.UseDefaultCredentials = _UseDefaultCredentials;
            smtp.Credentials = new System.Net.NetworkCredential(FromEmailID, FromEmailPassword);// Enter senders User name and password
            smtp.EnableSsl = _EnableSsl;
            smtp.Send(mail);

            return Status;
        }

    }
}
