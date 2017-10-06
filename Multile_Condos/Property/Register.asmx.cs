
using Property_cls;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Script.Services;
using System.Web.Security;
using System.Web.Services;
using System.Web.SessionState;
namespace Property
{
    /// <summary>
    /// Summary description for Newsletterfile
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Registerfile : System.Web.Services.WebService
    {

        #region Global

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        Cryptography crpt = new Cryptography();
        cls_Property clsobj = new cls_Property();

        #endregion Global

        [System.Web.Services.WebMethod]
        [ScriptMethod(UseHttpGet = false , ResponseFormat = ResponseFormat.Json)]
        public string test(string firstname,string lastname,string email,string phone)
        {
            string html = "";
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.CommandText = "usp_AddRegistration";
            SqlParameter sp = new SqlParameter();
            sp.ParameterName = "@ID";
            sp.SqlDbType = SqlDbType.Int;
            sp.Direction = ParameterDirection.InputOutput;
            sp.SqlValue = 0;
            cmd1.Parameters.Add(sp);
            cmd1.Parameters.AddWithValue("@FirstName", firstname + " " + lastname);
            cmd1.Parameters.AddWithValue("@Address", "");
            cmd1.Parameters.AddWithValue("@City", "");
            cmd1.Parameters.AddWithValue("@State", "");
            cmd1.Parameters.AddWithValue("@PhoneNumber", phone);
            cmd1.Parameters.AddWithValue("@UserName", email);
            cmd1.Parameters.AddWithValue("@Password","");
            cmd1.Parameters.AddWithValue("@IsDelete", false);
            cmd1.Connection = conn;
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd1.ExecuteNonQuery();
            string ID = Convert.ToString(cmd1.Parameters["@ID"].Value);
            int UserID = Convert.ToInt32(ID);
            conn.Close();

            MailMessage msg = new MailMessage();
            msg.To.Add(email);
            msg.From = new MailAddress(ConfigurationManager.AppSettings["RegFromMailAddress"].ToString());
            msg.Subject = "New user registered.";
            string body = "" + firstname +" "+lastname + " <b>has been registered.<b>";
            string EncodeUserId = (UserID.ToString());
            //string Url = Request.Url.AbsoluteUri.Replace("Registration.aspx", "Verification.aspx?UserID=" + EncodeUserId);
           // body += "<br /><a href = '" + Url + "'>Click here to verify your Email</a><br /><br />";
            msg.Body = body;

            msg.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            client.UseDefaultCredentials = false;
            client.Host = ConfigurationManager.AppSettings["SmtpServer"].ToString();//host server
            client.Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());//port
            NetworkCredential credentials = new NetworkCredential(ConfigurationManager.AppSettings["RegFromMailAddress"].ToString(), ConfigurationManager.AppSettings["RegPassword"].ToString());
            client.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
            client.Credentials = credentials;

            client.Send(msg);

           

            return html;
        }

        [System.Web.Services.WebMethod]
       // [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public string GetDropdownData()
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            try
            {
                var listdata = clsobj.GetDreamHouse();                
                foreach (DataRow dr in listdata.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in listdata.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }
                return serializer.Serialize(rows);              
            }
            catch(Exception ex)
            {

            }
            return serializer.Serialize(rows);
        }
    }
}
