using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Property.Models;
using Property_cls;

namespace Property
{
    public partial class Home : System.Web.UI.Page
    {
        #region Global

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        cls_Property clsobj = new cls_Property();

        #endregion Global
        protected void Page_Load(object sender, EventArgs e)
        {
            TrackUsers();
        }

        public void TrackUsers()
        {

            var locationService = new GoogleLocationService();
            var ip = Request.ServerVariables["REMOTE_ADDR"]; ;
            IpInfo ipinfo = GetUserCountryByIp(ip);
            if (ipinfo.Loc != null)
            {

                string[] latlong = ipinfo.Loc.Split(',');
                ipinfo.Loc = clsobj.GetAddressFromLatLong(Convert.ToDouble(latlong[0]), Convert.ToDouble(latlong[1]));

            }

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_InsertTrackRecord";
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@Ip", ipinfo.Ip == null ? "" : ipinfo.Ip);
            cmd.Parameters.AddWithValue("@Hostname", ipinfo.Hostname == null ? "" : ipinfo.Hostname);
            cmd.Parameters.AddWithValue("@City", ipinfo.City == null ? "" : ipinfo.City);
            cmd.Parameters.AddWithValue("@Region", ipinfo.Region == null ? "" : ipinfo.Region);
            cmd.Parameters.AddWithValue("@Country", ipinfo.Country == null ? "" : ipinfo.Country);
            cmd.Parameters.AddWithValue("@Loc", ipinfo.Loc == null ? "" : ipinfo.Loc);
            cmd.Parameters.AddWithValue("@Org", ipinfo.Org == null ? "" : ipinfo.Org);
            cmd.Parameters.AddWithValue("@Postal", ipinfo.Postal == null ? "" : ipinfo.Postal);

            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.ExecuteNonQuery();
        }
        public static IpInfo GetUserCountryByIp(string ip)
        {
            IpInfo ipInfo = new IpInfo();
            try
            {
                string info = new WebClient().DownloadString("http://ipinfo.io/" + ip);
                ipInfo = JsonConvert.DeserializeObject<IpInfo>(info);
                RegionInfo myRI1 = new RegionInfo(ipInfo.Country);
                ipInfo.Country = myRI1.EnglishName;
            }
            catch (Exception)
            {
                ipInfo.Country = null;
            }

            return ipInfo;
        }
        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] GetAutoCompleteData(string prefixText, int count, string contextKey)
        {
            List<String> itemNames = new List<String>();
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = ml.GetAutoCompleteData(prefixText);
            foreach
                (DataRow dr in dt.Rows)
            {
                String item = dr["Province"].ToString();
                itemNames.Add(item);
            }
            string[] prefixTextArray = itemNames.ToArray();
            return prefixTextArray;
        }
    }
}