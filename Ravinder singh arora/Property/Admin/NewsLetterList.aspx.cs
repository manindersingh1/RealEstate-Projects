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
using System.Web.Configuration;
using System.IO;
using Property.Models;

namespace Property.Admin
{
    public partial class NewsLetterList : System.Web.UI.Page
    {

        #region Global

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        Cryptography crpt = new Cryptography();
        cls_Property clsprop = new cls_Property();
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
        int NewsLetterId = 0;
        #endregion Global
        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Id"].ToString() != null)
            {
                NewsLetterId = Convert.ToInt32(Request.QueryString["Id"].ToString());
            }
            if (Session["FirstName"] != null)
            {
                if (!IsPostBack)
                {
                    if (NewsLetterId != 0)
                    {
                        DeleteNewsLetter(NewsLetterId);
                    }
                   
                    FillGridNewsLetter();
                    FillGridUsers();
                    if (Session["alertmessage"] != null)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + Session["alertmessage"].ToString() + "')", true);
                    }
                }
            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx", false);
            }
        }

        #endregion Page Load

        #region Grid Events & Methods

        protected void FillGridNewsLetter()
        {
            DataView dv = new DataView();
            dv.Table = GetNewsLetter();

            if (strSortExpression != "" && strSortDirection != "")
            {
                dv.Sort = strSortExpression + " " + strSortDirection;
            }
            if (dv.Count > 0)
            {
                //btnDelete.Visible = true;
                Newsletters.DataSource = dv;
                Newsletters.DataBind();
            }
            else
            {
                Newsletters.DataSource = dv;
                Newsletters.DataBind();
                alertMSG.Visible = true;
                //btnDelete.Visible = false;
            }


            if (intPageIndex != 0)
                Newsletters.PageIndex = intPageIndex;

        }
        protected void FillGridUsers()
        {
            DataView dv = new DataView();
            dv.Table = GetAdminClients();

            if (strSortExpression != "" && strSortDirection != "")
            {
                dv.Sort = strSortExpression + " " + strSortDirection;
            }
            if (dv.Count > 0)
            {
                //btnDelete.Visible = true;
                gridusrs.DataSource = dv;
                gridusrs.DataBind();
            }
            else
            {
                gridusrs.DataSource = dv;
                gridusrs.DataBind();
                alertMSG.Visible = true;
                //btnDelete.Visible = false;
            }


            if (intPageIndex != 0)
                gridusrs.PageIndex = intPageIndex;

        }




        protected DataTable GetNewsLetter()
        {
            DataTable dt = new DataTable();
            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string str = "select * from [NewsLetter]  order by OrderNo asc";

                SqlDataAdapter adp = new SqlDataAdapter(str, conn);
                adp.Fill(dt);
                dt.TableName = "NewsLetter";
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
            }

            foreach (GridViewRow gvrow in Newsletters.Rows)
            {
                HiddenField secondimg = gvrow.FindControl("secondimage") as HiddenField;
                if (secondimg == null)
                {
                    ImageButton btn = gvrow.FindControl("second_Image") as ImageButton;
                    btn.Visible = false;
                }
            }
            return dt;
        }

        protected void gridusrs_Sorting(object sender, GridViewSortEventArgs e)
        {
            try
            {
                strSortExpression = e.SortExpression;
                strSortDirection = GetSortDirection();
                intPageIndex = gridusrs.PageIndex;
                FillGridUsers();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void gridusrs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gridusrs.PageIndex = e.NewPageIndex;
                FillGridUsers();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void gridusrs_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Label lblPassword = (Label)e.Row.FindControl("lblPassword");
                //lblPassword.Text = crpt.Decrypt(lblPassword.Text);
            }
        }

        protected void gridusrs_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandArgument == "delete")
            {
                foreach (GridViewRow gvrow in gridusrs.Rows)
                {
                    HiddenField ID = gvrow.FindControl("hdnID") as HiddenField;
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "delete from  [dbo].[AdminClient] where user id ='" + ID + "'";
                }
            }
        }


        protected void Newsletters_Sorting(object sender, GridViewSortEventArgs e)
        {
            try
            {
                strSortExpression = e.SortExpression;
                strSortDirection = GetSortDirection();
                intPageIndex = Newsletters.PageIndex;
                FillGridNewsLetter();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void Newsletters_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                Newsletters.PageIndex = e.NewPageIndex;
                FillGridNewsLetter();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void Newsletters_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Label lblPassword = (Label)e.Row.FindControl("lblPassword");
                //lblPassword.Text = crpt.Decrypt(lblPassword.Text);
            }
        }

        protected void Newsletters_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandArgument == "delete")
            {
                foreach (GridViewRow gvrow in Newsletters.Rows)
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

        #endregion Button Click

        protected void btnaddusers_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewsLetterNew.aspx");
        }

        protected void btnsendNewsLetter_Click(object sender, EventArgs e)
        {

            var PhotoPath = GetPhotoPath();
            var Users = GetHiddenValue();
            NewsLetterModel model = new NewsLetterModel();
            if(Users!=null && Users!="")
            {
                DataTable dt = new DataTable();
                string str = "select EmailId from [AdminClient] where ID in(" + Users + ")";
                SqlDataAdapter adp = new SqlDataAdapter(str, conn);
                adp.Fill(dt);

                foreach (DataRow row in dt.Rows)
                {
                    var Email = row["EmailId"].ToString();
                    model.Email = Email;
                    model.PropertyPhoto = PhotoPath;            
                    bool status=  SendNewsLetter(model);
                    string message = "Mail send successfully.";
                    if (status)
                    {
                        Session["alertmessage"] = message;
                    }
                    else
                    {
                        Session["alertmessage"] = "Mail not send properly.";
                    }
                }

               

            }
            
            Response.Redirect("NewsLetterList.aspx?Id=0");
        }

        protected string GetHiddenValue()
        {
            string Rslt = "";


            foreach (GridViewRow gvrow in gridusrs.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)gridusrs.HeaderRow.FindControl("chkdeleteAll");
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
        protected string GetPhotoPath()
        {
            string PhotoPath = "";

            foreach (GridViewRow gvrow in Newsletters.Rows)
            {
                //CheckBox ChkBoxHeader = (CheckBox)Newsletters.HeaderRow.FindControl("chkdeleteAll");
                CheckBox chkdelete = (CheckBox)gvrow.FindControl("chkdelete");
                if (chkdelete.Checked)
                {
                    HiddenField firstimg = gvrow.FindControl("firstimage") as HiddenField;
                    HiddenField secondimg = gvrow.FindControl("secondimage") as HiddenField;
                    if (firstimg != null)
                    {
                        PhotoPath += firstimg.Value;
                    }
                    if (secondimg != null)
                    {
                        PhotoPath += "," + secondimg.Value;
                    }
                    

                }
            }

            PhotoPath = PhotoPath.TrimEnd(',');

            return PhotoPath;
        }

        protected void chkdeleteAll_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gridusrs.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)gridusrs.HeaderRow.FindControl("chkdeleteAll");
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkdelete");
                ChkBoxRows.Checked = ChkBoxHeader.Checked;
                
            }
        }

        protected void chkdelete_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gridusrs.Rows)
            {
                CheckBox ChkBoxHeader = (CheckBox)gridusrs.HeaderRow.FindControl("chkdeleteAll");
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
            SqlCommand cmd = new SqlCommand("Delete from NewsLetter where NewsLetterId in(" + SelectedIds + ")", conn);
            // SqlCommand cmd = new SqlCommand("delete from tblContactUs where Name='';", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            FillGridUsers();

        }

        protected void DeleteNewsLetter(int id)
        {
            SqlCommand cmd = new SqlCommand("Delete from NewsLetter where NewsLetterId in(" + id + ")", conn);
            // SqlCommand cmd = new SqlCommand("delete from tblContactUs where Name='';", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            FillGridNewsLetter();
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
                dt.TableName = "AdminClient";
                string str = "select * from [AdminClient]";
                SqlDataAdapter adp = new SqlDataAdapter(str, conn);
                adp.Fill(dt);
                
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
            }
            return dt;
        }

        public bool SendNewsLetter(NewsLetterModel model)
        {


            bool Status = false;
            // string EmailId = "only4agentss@gmail.com";
            var FirstImage = "";
            var SecondImage = "";
            var Images = model.PropertyPhoto.Split(',');
            if(Images.Count()>0)
            {
                FirstImage = Images[0];
                if (Images.Count() > 1)
                {
                    SecondImage = Images[1];
                }
            }
            else
            {
                FirstImage = model.PropertyPhoto;
            }
            string msgbody = "";
            var Template = "";
            Template = "Templates/Double_Image_NewsLetter.html";

            using (StreamReader reader = new StreamReader(Path.Combine(HttpRuntime.AppDomainAppPath, Template)))
            {
                msgbody = reader.ReadToEnd();
                //Replace UserName and Other variables available in body Stream
                msgbody = msgbody.Replace("{firstimage}", FirstImage);
                msgbody = msgbody.Replace("{secondimage}", SecondImage);
                
            }

            try
            {
                //Send mail
                MailMessage mail = new MailMessage();

                string FromEmailID = WebConfigurationManager.AppSettings["RegFromMailAddress"];
                string FromEmailPassword = WebConfigurationManager.AppSettings["RegPassword"];

                SmtpClient smtpClient = new SmtpClient(ConfigurationManager.AppSettings["SmtpServer"]);
                int _Port = Convert.ToInt32(WebConfigurationManager.AppSettings["Port"].ToString());
                Boolean _UseDefaultCredentials = Convert.ToBoolean(WebConfigurationManager.AppSettings["UseDefaultCredentials"].ToString());
                Boolean _EnableSsl = Convert.ToBoolean(WebConfigurationManager.AppSettings["EnableSsl"].ToString());
                mail.To.Add(new MailAddress(model.Email));
                mail.From = new MailAddress(FromEmailID);
                mail.Subject = "News Letter";
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

                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
            
        }

        public void altertmessage(string message)
        {            

            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            sb.Append("<script type = 'text/javascript'>");

            sb.Append("window.onload=function(){");

            sb.Append("alert('");

            sb.Append(message);

            sb.Append("')};");

            sb.Append("</script>");

            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }
    }
}
