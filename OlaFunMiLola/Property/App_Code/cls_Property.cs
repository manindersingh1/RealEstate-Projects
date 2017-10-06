using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Property.App_Code
{
    public class cls_Property
    {
        SqlConnection conn = new SqlConnection();//ConfigurationManager.ConnectionStrings["ConStr"].ToString());

        //properties
        public int PageID
        {
            get;
            set;
        }
        public string PageName
        {
            get;
            set;
        }
        public string PageTitle
        {
            get;
            set;
        }
        public string PageDescription
        {
            get;
            set;
        }
        public string PageType
        {
            get;
            set;
        }
        public string SubMenuPageName
        {
            get;
            set;
        }
        public string CreatedBy
        {
            get;
            set;
        }
        public Boolean IncludeInMenu
        {
            get;
            set;
        }
        public Boolean IncludeInSubMenu
        {
            get;
            set;
        }
        public int SubMenuPageID
        {
            get;
            set;
        }
        public int DisplayIndex
        {
            get;
            set;
        }
        public string PageLocation
        {
            get;
            set;
        }
        public int Insert_PageBlog()
        {
            int result = 0;
            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_InsertPageBlog";
                cmd.Parameters.AddWithValue("@PageName", PageName);
                cmd.Parameters.AddWithValue("@PageTitle", PageTitle);
                cmd.Parameters.AddWithValue("@PageDescription", PageDescription);
                cmd.Parameters.AddWithValue("@PageType", PageType);
                cmd.Parameters.AddWithValue("@CreatedBy", CreatedBy);
                cmd.Parameters.AddWithValue("@IncludeInMenu", IncludeInMenu);
                cmd.Parameters.AddWithValue("@IncludeInSubMenu", IncludeInSubMenu);
                cmd.Parameters.AddWithValue("@SubMenuPageID", SubMenuPageID);
                cmd.Parameters.AddWithValue("@DisplayIndex", DisplayIndex);
                cmd.Parameters.AddWithValue("@SubMenuPageName", SubMenuPageName);
                cmd.Parameters.AddWithValue("@PageLocation", PageLocation);
                cmd.Connection = conn;
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                result = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return result;
        }

        public int Update_PageBlog()
        {
            int result = 0;
            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_UpdatePageBlog";
                cmd.Parameters.AddWithValue("@PageID", PageID);
                cmd.Parameters.AddWithValue("@PageName", PageName);
                cmd.Parameters.AddWithValue("@PageTitle", PageTitle);
                cmd.Parameters.AddWithValue("@PageDescription", PageDescription);
                cmd.Parameters.AddWithValue("@PageType", PageType);
                cmd.Parameters.AddWithValue("@CreatedBy", CreatedBy);
                cmd.Parameters.AddWithValue("@IncludeInMenu", IncludeInMenu);
                cmd.Parameters.AddWithValue("@IncludeInSubMenu", IncludeInSubMenu);
                cmd.Parameters.AddWithValue("@SubMenuPageID", SubMenuPageID);
                cmd.Parameters.AddWithValue("@DisplayIndex", DisplayIndex);
                cmd.Parameters.AddWithValue("@SubMenuPageName", SubMenuPageName);
                cmd.Parameters.AddWithValue("@PageLocation", PageLocation);
                cmd.Connection = conn;
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                result = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return result;
        }

        public int Delete_PageBlog()
        {
            int result = 0;
            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_DeletePageBlog";
                cmd.Parameters.AddWithValue("@PageID", PageID);
                cmd.Connection = conn;
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                result = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return result;
        }

        public int Insert_ContactUS(string firstname, string lastname, string emailid, string phoneno, string message)
        {
            int result = 0;
            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_AddContactUS";
                cmd.Parameters.AddWithValue("@firstname", firstname);
                cmd.Parameters.AddWithValue("@lastname", lastname);
                cmd.Parameters.AddWithValue("@emailid", emailid);
                cmd.Parameters.AddWithValue("@phonenumber", phoneno);
                cmd.Parameters.AddWithValue("@message", message);
                cmd.Connection = conn;
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                result = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return result;
        }

        public DataTable GetAllBlogs()
        {
            DataTable dt = new DataTable();
            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string str = "usp_GetAllBlog";
                SqlDataAdapter adp = new SqlDataAdapter(str, conn);
                adp.Fill(dt);
                dt.TableName = "BlogList";
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return dt;
        }

        public DataTable GetPageBlogs_ByID()
        {
            DataTable dt = new DataTable();
            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());
                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                cmd = conn.CreateCommand();
                cmd.CommandText = "usp_GetPageBlogsByID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", PageID);
                reader = cmd.ExecuteReader();
                dt.Load(reader);
                dt.TableName = "PageBlog";
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return dt;
        }

        public DataTable GetUserInfo()
        {
            DataTable dt = new DataTable();
            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                };
                string str = "usp_UserInfoSelectAll";
                SqlDataAdapter adp = new SqlDataAdapter(str, conn);
                adp.Fill(dt);
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return dt;
        }
        public DataTable GetAllPages()
        {
            DataTable dt = new DataTable();
            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string str = "usp_GetAllPages";
                SqlDataAdapter adp = new SqlDataAdapter(str, conn);
                adp.Fill(dt);
                dt.TableName = "PageList";
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return dt;
        }

        public DataTable GetSiteSettings()
        {
            DataTable dt = new DataTable();
            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string str = "usp_SelectSiteSettings";
                SqlDataAdapter adp = new SqlDataAdapter(str, conn);
                adp.Fill(dt);
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return dt;
        }


        public DataTable GetMenuList()
        {
            DataTable dt = new DataTable();
            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                string str = "usp_GetMenuList";
                SqlDataAdapter adp = new SqlDataAdapter(str, conn);
                adp.Fill(dt);
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return dt;
        }

        public DataTable GetSubMenuBy_PageID()
        {
            DataTable dt = new DataTable();
            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());
                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                cmd = conn.CreateCommand();
                cmd.CommandText = "usp_GetSubMenuListBy_PageID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SubMenuPageID", PageID);
                reader = cmd.ExecuteReader();
                dt.Load(reader);
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return dt;
        }

        public int Insert_Favourite(int UserId, string MLSID)
        {
            int result = 0;
            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_InsertFavourite";
                cmd.Parameters.AddWithValue("@UserID", UserId);
                cmd.Parameters.AddWithValue("@MLSID", MLSID);
                cmd.Connection = conn;
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                result = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return result;
        }

        public DataTable SelectFavourite(string MLSID)
        {
            DataTable dt = new DataTable();
            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());
                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_SelectFavourite";
                cmd.Parameters.AddWithValue("@MLSID", MLSID);
                cmd.Connection = conn;
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                reader = cmd.ExecuteReader();
                dt.Load(reader);
                dt.TableName = "Favourite";
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return dt;
        }


        public DataTable GetScheduledAppointments()
        {
            DataTable dt = new DataTable();
            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());
                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_GetAppointment";
                cmd.Connection = conn;
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                reader = cmd.ExecuteReader();
                dt.Load(reader);
                dt.TableName = "Appointment";
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return dt;
        }

        public DataTable GetFeatures()
        {
            DataTable dt = new DataTable();
            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());
                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from AllData ";
                cmd.Connection = conn;
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                reader = cmd.ExecuteReader();
                dt.Load(reader);
                dt.TableName = "Features";
            }
            catch (Exception ex)
            { }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return dt;
        }
    }

}