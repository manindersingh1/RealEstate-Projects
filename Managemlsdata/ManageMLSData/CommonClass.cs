using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace ManageMLSData
{
    public class CommonClass
    {
        string ConnectionString = "";
        public CommonClass()
        {
            string path = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase) + "\\Data.txt";
            string connStr = File.ReadAllText(path.Replace("file:\\", ""));
            //ConnectionString = @"Data Source=GAGANWIN8\SQLEXPRESS;Initial Catalog=MLSdatanew;Persist Security Info=True;User ID=sa;pwd=admin@123";
            ConnectionString = connStr;
        }
        //Execute Non Scalar
        public string ExecuteNonQuery(string QStr)
        {
            string ErrorMessage = "";
            SqlConnection conn = null;
            SqlCommand cmd = null;
            //if (ConnectionString == string.Empty)
            //{
            //    ConnectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            //}

            try
            {
                conn = new SqlConnection(ConnectionString);
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
                conn.Open();
                cmd = new SqlCommand(QStr, conn);
                cmd.CommandType = CommandType.Text;
                cmd.CommandTimeout = 99999999;
                cmd.ExecuteNonQuery();
                conn.Close();

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
                if (conn != null)
                {
                    conn.Close();
                }

            }

            return ErrorMessage;
        }
        public Object GetSingleValue(string QStr)
        {
            SqlConnection conn = null;
            SqlCommand cmd = null;
            //if (ConnectionString == string.Empty)
            //{
            //    ConnectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            //}
            try
            {
                conn = new SqlConnection(ConnectionString);
                cmd = new SqlCommand();
                Object returnValue;

                cmd.CommandText = QStr;
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;

                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
                conn.Open();
                returnValue = cmd.ExecuteScalar();
                conn.Close();

                return returnValue;

            }
            catch (Exception)
            {
                //HttpContext.Current.Response.Redirect("~/ErrorRedirect.aspx", false);
                return '0';
            }
            finally
            {
                if (cmd != null)
                {
                    cmd.Dispose();
                }
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }
        public byte[] GetImageValue(string QStr)
        {
            SqlConnection conn = null;
            SqlCommand cmd = null;
            //if (ConnectionString == string.Empty)
            //{
            //    ConnectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            //}
            try
            {
                conn = new SqlConnection(ConnectionString);
                cmd = new SqlCommand();
                byte[] returnValue;

                cmd.CommandText = QStr;
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;

                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
                conn.Open();
                returnValue = (byte[])cmd.ExecuteScalar();
                conn.Close();

                return returnValue;

            }
            catch (Exception)
            {
                //HttpContext.Current.Response.Redirect("~/ErrorRedirect.aspx", false);
                return null;
            }
            finally
            {
                if (cmd != null)
                {
                    cmd.Dispose();
                }
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }
        public DataSet GetDataSet(String queryString)
        {
            //if (ConnectionString == string.Empty)
            //{
            //    ConnectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            //}

            DataSet ds = new DataSet();

            try
            {
                // Connect to the database and run the query.
                SqlConnection connection = new SqlConnection(ConnectionString);
                SqlDataAdapter adapter = new SqlDataAdapter(queryString, connection);

                // Fill the DataSet.
                adapter.Fill(ds);

            }
            catch (Exception)
            {

                // The connection failed. Display an error message.
                //Message.Text = "Unable to connect to the database.";

            }

            return ds;

        }
        public static string ErrorLog(string ErrorMessage)
        {
            if (ErrorMessage.Contains("The DELETE statement conflicted with the REFERENCE constraint"))
            {
                return "fk";
            }
            else
            {
                return "";
            }
        }

        public SqlParameter[] InsertData(object[] SqlObj, SqlParameter[] outputParameter, string ProcedureName)
        {
            SqlConnection conn = null;
            SqlCommand cmd = null;

            try
            {
                // Create Object to get store procedure parameters
                object[] SqlParam = new object[SqlObj.Length + outputParameter.Length];

                conn = new SqlConnection(ConnectionString);
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
                conn.Open();

                // Start Code to get SQL parameter from Stored Procedure
                SqlCommand myCommand = new SqlCommand();
                myCommand.Connection = conn;
                myCommand.CommandText = ProcedureName;
                myCommand.CommandType = CommandType.StoredProcedure;

                SqlCommandBuilder.DeriveParameters(myCommand);

                for (int i = 0; i < myCommand.Parameters.Count - 1; i++)
                {
                    SqlParam[i] = myCommand.Parameters[i + 1].ParameterName.ToString();
                }

                // End code to get SQL parameter from Stored Procedure

                // Start Code to Insert data into table using Stored Procedure
                cmd = new SqlCommand(ProcedureName, conn);

                for (int i = 0; i < SqlObj.Length; i++)
                {
                    SqlParameter sp = new SqlParameter();
                    sp.ParameterName = SqlParam[i].ToString();
                    sp.Value = SqlObj[i];
                    cmd.Parameters.Add(sp);
                }
                //add the output parameters
                for (int i = 0; i < outputParameter.Length; i++)
                {
                    cmd.Parameters.Add(outputParameter[i]);
                }
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();

                //End Code to Insert data into table using stored procedure 
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return outputParameter;
        }
    }
}