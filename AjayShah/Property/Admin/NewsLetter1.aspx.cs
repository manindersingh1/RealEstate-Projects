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
using Property.Models;
using System.Net.Mail;
using System.Web.Configuration;

namespace Property.Admin
{
    public partial class NewsLetter1 : System.Web.UI.Page
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
                    GetAdminClients();
                }
            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx", false);
            }
        }

        #endregion Page Load

        #region Button Click
     
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                NewsLetterModel Model = new NewsLetterModel();

                Model.FirstContent = FirstContent.Text;
                Model.SecondContent = SecondContent.Text;
                Model.ThirldContent = ThirdContent.Text;

                var ClientId = "";

               // ddlMultiSelect.ClearSelection();
                //foreach (ListItem li in ddlMultiSelect.Items)
                //{

                //    ClientId += li.Value + ",";

                //}

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
                    var URL = ConfigurationManager.AppSettings["LiveURL"].ToString();
                    Model.PropertyPhoto = URL + "/uploadfiles/" + fileName;
                }
                else
                {
                    Model.PropertyPhoto = "http://teamkahlon.com/NewsLetterImages/img1F.jpg";
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
                    var URL = ConfigurationManager.AppSettings["LiveURL"].ToString();
                    Model.Logopath = URL + "/uploadfiles/" + fileName;
                }
                else
                {
                    Model.Logopath = "/images/MyLogo.png";
                }
                Model.AdminPhoto = "/images/ajay_shah.jpg";

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                ClientId = ClientId.TrimEnd(',');
                DataTable dt = new DataTable();
                string str = "select EmailId from [AdminClient] where ID in(" + ClientId + ")";
                SqlDataAdapter adp = new SqlDataAdapter(str, conn);
                adp.Fill(dt);
                foreach (DataRow row in dt.Rows)
                {
                    var Email = row["EmailId"].ToString();
                    Model.Email = Email;
                    SendNewsLetter(Model);
                }
              
                Response.Redirect("~/Admin/NewsLetter.aspx", false);
            }

            catch (Exception ex)
            {
                //throw ex;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashBoard.aspx");
        }

        #endregion Button Click

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
        protected void GetAdminClients()
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
               // ddlMultiSelect.DataSource = dt;
               // ddlMultiSelect.DataValueField = "ID";
               // ddlMultiSelect.DataTextField = "Name";
                //ddlMultiSelect.SelectedValue=value
               // ddlMultiSelect.DataBind();

            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
            }

        }

    }


}
