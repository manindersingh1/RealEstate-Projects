using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace SendNewsLetters
{
    class Program
    {
        static SqlConnection con = new SqlConnection("Data Source=74.208.69.145;Initial Catalog=CommunicationAppCopy;User ID=sa;Password=!nd!@123");
        static string qry = "";
        static string NewsLetterPath = "";
        static string NewsLetterDate = "";
        static string NewsLetterSendDate = "";
        static string SelectedUsers = "";
        static string OrderNo = "";
        static string Email = "";
        static string Name = "";
        static int UserId = 0;
        static bool IsNewsLetterSendOrNOt = true;
        static bool IsNewsLetterDateEmpty = false;
        static bool IsReadyToNextNewsLetter = false;
        static string Receivers = "";
        static int Emailcount = 0;
        static void Main(string[] args)
        {



            //get newsletter which is send today.
            qry = "";
            qry = "select *  from NewsLetter where IsActive=1";
            DataTable NewsLetter_dt = GetdataTable(qry);
            if (NewsLetter_dt.Rows.Count > 0)
            {
                foreach (DataRow NewsLetter in NewsLetter_dt.Rows)
                {
                    NewsLetterPath = NewsLetter["Image"].ToString();
                    NewsLetterDate = NewsLetter["fwd_date"].ToString();
                    NewsLetterSendDate = NewsLetter["NewsLetterSendDate"].ToString();
                    SelectedUsers = NewsLetter["SelectedUsers"].ToString();
                    OrderNo = NewsLetter["OrderNo"].ToString();
                }
            }
            else
            {
                qry = "";
                qry = "UPDATE top(1) newsletter SET IsActive=1 , NewsLetterSendDate=getdate()";
                ExecuteNonQuery(qry);
            }
            //End


            //Get the list of all available users.
            qry = "";
            qry = "select top(100) *  from Users where IsNewsLetterSend is null or IsNewsLetterSend=0 and userid !=0";
            DataTable dt = GetdataTable(qry);
            //End


            if (dt.Rows.Count == 0 && SelectedUsers == "")
            {
                IsNewsLetterSendOrNOt = false;
                qry = "";
                qry = "Update Users set IsNewsLetterSend=0";
                ExecuteNonQuery(qry);
                CommonFunction();


            }

            if (IsNewsLetterSendOrNOt)
            {
                try
                {
                    //Check if Choosed users are available.
                    if (SelectedUsers != "")
                    {
                        qry = "";
                        qry = "select UserId  from Customer where   CustomerId in(" + SelectedUsers + ")";
                        DataTable UsersIds_dt = GetdataTable(qry);

                        string UserIds = String.Join(",", UsersIds_dt.AsEnumerable().Select(row => row.Field<int>("UserId")));

                        qry = "";
                        qry = "select *  from Users where   UserId in(" + UserIds + ") and (IsNewsLetterSend is null or IsNewsLetterSend=0)";
                        DataTable SelectedUser_dt = GetdataTable(qry);
                        foreach (DataRow row in SelectedUser_dt.Rows)
                        {
                            if (row["UserEmailAddress"] != System.DBNull.Value && row["UserEmailAddress"] != "")
                            {

                                Name = "";
                                Email = row["UserEmailAddress"].ToString();
                                Name = row["FirstName"].ToString();
                                Name += " " + row["LastName"].ToString();
                                UserId = Convert.ToInt32(row["UserId"]);

                                CommonFunction();
                            }


                        }


                        //set IsNewsLetterSend of all user 0 after selected users sending mail. escape from daily for loop.
                        if (SelectedUsers != "")
                        {
                            qry = "";
                            qry = "Update Users set IsNewsLetterSend=0";
                            ExecuteNonQuery(qry);


                            //Change the order of newsletter after selected user email.
                            ReadyToNextNewsLetter(14);
                            //End
                        }
                        //end

                    }
                    //Other wise newsletter send to all users
                    else
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            if (row["UserEmailAddress"] != System.DBNull.Value && row["UserEmailAddress"] != "")
                            {
                                Name = "";
                                Email = row["UserEmailAddress"].ToString();
                                Name = row["FirstName"].ToString();
                                Name += " " + row["LastName"].ToString();
                                UserId = Convert.ToInt32(row["UserId"]);
                                CommonFunction();
                            }

                        }

                    }
                    //End
                }
                catch
                {

                }
               


                //Email to Admin
                SendNewsLetter("Only4agentss@gmail.com", "MailToAdmin");


                //End
            }

        }


        public static void SendNewsLetter(string Email, string Path)
        {
            //Email = "Only4agentss@gmail.com";
            var subject = "";

            //Send mail
            MailMessage mail = new MailMessage();
            var FirstImg = "";
            var SecondImg = "";
            if (Path.IndexOf(',') > -1)
            {
                var splitedpath = Path.Split(',');
                FirstImg = splitedpath[0].ToString();
                SecondImg = splitedpath[1].ToString();
            }
            else
            {
                FirstImg = Path;
            }
            if (Path == "MailToAdmin")
            {
                subject = "Today Email Receivers";
            }
            else
            {
                subject = "NewsLetter";
            }


            string FromEmailID = ConfigurationManager.AppSettings["FromEmailID"];
            string FromEmailPassword = ConfigurationManager.AppSettings["FromEmailPassword"];

            SmtpClient smtpClient = new SmtpClient(ConfigurationManager.AppSettings["SmtpServer"]);
            int _Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());
            Boolean _UseDefaultCredentials = Convert.ToBoolean(ConfigurationManager.AppSettings["UseDefaultCredentials"].ToString());
            Boolean _EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"].ToString());
            mail.To.Add(new MailAddress(Email));
            mail.From = new MailAddress(FromEmailID);
            mail.Subject = subject;
            string msgbody = "";

            if (Path == "MailToAdmin")
            {
                msgbody = Receivers;
            }
            else
            {
                using (StreamReader reader = new StreamReader(@"C:\sites\SendNewsLetters\SendNewsLetters\SendNewsLetters\Templates\SixNewLetter.html"))
                {
                    msgbody = reader.ReadToEnd();
                    msgbody = msgbody.Replace("{FirstImg}", FirstImg);
                    msgbody = msgbody.Replace("{SecondImg}", SecondImg);
                    Receivers += "<b>" + Name + "<b/><br>";
                }
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
            smtp.Host = "smtp.gmail.com";
            smtp.Port = _Port;
            smtp.Credentials = new System.Net.NetworkCredential(FromEmailID, FromEmailPassword);// Enter senders User name and password
            smtp.EnableSsl = _EnableSsl;
            smtp.Send(mail);
            Emailcount++;
            Console.WriteLine("Total mails " + Emailcount);
        }

        public static void CommonFunction()
        {
            qry = "";
            qry = "select *  from NewsLetter where fwd_date is null";
            DataTable fwdDate_dt = GetdataTable(qry);

            qry = "";
            qry = "select *  from NewsLetter";
            DataTable Allrec_dt = GetdataTable(qry);

            if (fwdDate_dt.Rows.Count == Allrec_dt.Rows.Count)
            {
                IsNewsLetterDateEmpty = true;
            }
            TimeSpan diffi = new TimeSpan();
            if (NewsLetterDate != "")
            {
                diffi = DateDiffi(NewsLetterDate);
            }
            else if (NewsLetterSendDate != null)
            {
                diffi = DateDiffi(NewsLetterSendDate);
            }

            if (NewsLetterDate != "" || NewsLetterSendDate != "")
            {
                //this functionality set bqs gmail provide only 100 emails free in one day. 
                if (diffi.Days < 15 && diffi.Days >= 0)
                {
                    SendNewsLetter(Email, NewsLetterPath);
                    //Update in Users table for send conform emails.
                    if (UserId != 0 && UserId != null)
                    {
                        qry = "";
                        qry = "Update Users set IsNewsLetterSend=1 where UserId=" + UserId + " ";
                        ExecuteNonQuery(qry);
                    }
                    //End
                    if (!IsReadyToNextNewsLetter)
                    {
                        ReadyToNextNewsLetter(diffi.Days);
                    }


                }
                else
                {
                    if (!IsReadyToNextNewsLetter)
                    {
                        ReadyToNextNewsLetter(diffi.Days);
                    }
                }
            }
            else if (NewsLetterDate == "" && IsNewsLetterDateEmpty)
            {

                SendNewsLetter(Email, NewsLetterPath);
                //Update in Users table for send conform emails.
                if (UserId != 0 && UserId != null)
                {
                    qry = "";
                    qry = "Update Users set IsNewsLetterSend=1 where UserId=" + UserId + " ";
                    ExecuteNonQuery(qry);
                }
                //End
                if (!IsReadyToNextNewsLetter)
                {
                    ReadyToNextNewsLetter(1);
                }

            }

        }

        public static void ReadyToNextNewsLetter(int days)
        {
            IsReadyToNextNewsLetter = true;
            if (days == 14 || days>14)
            {
                int OdrNo = 0;
                if (OrderNo != "")
                {
                    OdrNo = Convert.ToInt32(OrderNo);
                    OdrNo++;
                }
                //update the old orderNo.
                qry = "";
                qry = "Update NewsLetter set IsActive=null,fwd_date=null,NewsLetterSendDate=null where IsActive=1";
                ExecuteNonQuery(qry);

                //Set the new orderNo.
                qry = "";
                qry = "Update NewsLetter set IsActive=1,NewsLetterSendDate=getdate() where OrderNo=" + OdrNo + "";
                ExecuteNonQuery(qry);
            }
        }
        public static DataTable GetdataTable(string qry)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter NewsLetter_Adp = new SqlDataAdapter(qry, con);
            NewsLetter_Adp.Fill(dt);

            return dt;

        }

        public static string ExecuteNonQuery(string QStr)
        {
            string ErrorMessage = "";
            SqlCommand cmd = null;
            try
            {

                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                con.Open();
                cmd = new SqlCommand(QStr, con);
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                con.Close();

                ErrorMessage = "";
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("The DELETE statement conflicted with the REFERENCE constraint"))
                {
                    ErrorMessage = "FK";
                }
            }
            finally
            {
                if (cmd != null)
                {
                    cmd.Dispose();
                }
                if (con != null)
                {
                    con.Close();
                }

            }

            return ErrorMessage;
        }
        public static TimeSpan DateDiffi(string NewsletterDate)
        {

            var todayDate = DateTime.Now;
            var diffi = todayDate - Convert.ToDateTime(NewsletterDate);
            return diffi;
        }
    }
}
