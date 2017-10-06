using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Property_cls;
using System.Xml.Linq;


namespace Property
{
    public class GoogleDistanceDuration
    {
        public double StartLatitude { get; set; }
        public double StartLongitude { get; set; }
        public double EndLongitude { get; set; }
        public double EndLatitude { get; set; }
        public string StartAddress { get; set; }
        public string EndAddress { get; set; }
        public int Duration { get; set; }
        public decimal Distance { get; set; }
        public string Language { get; set; }
    }
    public partial class Search : System.Web.UI.Page
    {
        #region Global

        cls_Property clsobj = new cls_Property();

        int findex, lindex;
        public int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] != null)
                {
                    return Convert.ToInt32(ViewState["CurrentPage"]);
                }
                else
                {
                    return 0;
                }
            }
            set { ViewState["CurrentPage"] = value; }
        }

        #endregion Global

        #region PageLoad

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["Municipality"] = Request.QueryString["Municipality"];
            //Session["QueryString"] = Request.QueryString["PropertyType"];
            //if (Session["SearchType"] == "Residential" || Convert.ToString(Session["QueryString"]) == "Residential")
            //    SearchResidentialProperties();
            //else if (Session["SearchType"] == "Commercial" || Convert.ToString(Session["QueryString"]) == "Commercial")
            //    SearchCommercialProperties();
            //else if (Session["SearchType"] == "Condo" || Convert.ToString(Session["QueryString"]) == "Condo")
            //    SearchCondoProperties();
            //else
            //{

            //}
        }
        #endregion PageLoad
      

        //public static GoogleDistanceDuration GetDirectionByAddress(GoogleDistanceDuration googleDistanceDuration)
        //{
        //    string requesturl = "http://maps.googleapis.com/maps/api/directions/json?origin=" + googleDistanceDuration.StartAddress + "&destination=" + googleDistanceDuration.EndAddress + "&sensor=false&language=" + googleDistanceDuration.Language;
        //    string content = FileGetContents(requesturl);
        //    JObject json = JObject.Parse(content);
        //    try
        //    {
        //        googleDistanceDuration.Distance = (json.SelectToken("routes[0].legs[0].distance.value") != null ? (int)json.SelectToken("routes[0].legs[0].distance.value") : 0);
        //        googleDistanceDuration.Duration = (json.SelectToken("routes[0].legs[1].duration.value") != null ? (int)json.SelectToken("routes[0].legs[1].duration.value") : 0);

        //        googleDistanceDuration.StartLatitude = (json.SelectToken("routes[0].legs[0].start_location.lat") != null ? (double)json.SelectToken("routes[0].legs[0].start_location.lat") : 0);
        //        googleDistanceDuration.StartLongitude = (json.SelectToken("routes[0].legs[0].start_location.lng") != null ? (double)json.SelectToken("routes[0].legs[0].start_location.lng") : 0);

        //        googleDistanceDuration.EndLatitude = (json.SelectToken("routes[0].legs[0].end_location.lat") != null ? (int)json.SelectToken("routes[0].legs[0].end_location.lat") : 0);
        //        googleDistanceDuration.EndLongitude = (json.SelectToken("routes[0].legs[0].end_location.lng") != null ? (int)json.SelectToken("routes[0].legs[0].end_location.lng") : 0);

        //        return googleDistanceDuration;
        //    }
        //    catch
        //    {
        //        return googleDistanceDuration;
        //    }
        //}
        //public static string FileGetContents(string fileName)
        //{
        //    string sContents = string.Empty;
        //    string me = string.Empty;
        //    try
        //    {
        //        if (fileName.ToLower().IndexOf("http:") > -1)
        //        {
        //            System.Net.WebClient wc = new System.Net.WebClient();
        //            byte[] response = wc.DownloadData(fileName);
        //            sContents = System.Text.Encoding.ASCII.GetString(response);

        //        }
        //        else
        //        {
        //            System.IO.StreamReader sr = new System.IO.StreamReader(fileName);
        //            sContents = sr.ReadToEnd();
        //            sr.Close();
        //        }
        //    }
        //    catch { sContents = "unable to connect to server "; }
        //    return sContents;
        //}

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] GetAutoCompleteData(string prefixText, int count, string contextKey)
        {
            List<String> itemNames = new List<String>();
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = ml.GetAutoCompleteData(prefixText);
            foreach (DataRow dr in dt.Rows)
            {
                String item = dr["Province"].ToString();

                itemNames.Add(item);
            }
            string[] prefixTextArray = itemNames.ToArray();
            return prefixTextArray;
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] GetAutoCompleteData_Comm(string prefixText, int count, string contextKey)
        {
            List<String> itemNames = new List<String>();
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = ml.GetAutoCompleteData_Comm(prefixText);
            foreach (DataRow dr in dt.Rows)
            {
                String item = dr["Province"].ToString();

                itemNames.Add(item);
            }
            string[] prefixTextArray = itemNames.ToArray();
            return prefixTextArray;
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] GetAutoCompleteData_Condo(string prefixText, int count, string contextKey)
        {
            List<String> itemNames = new List<String>();
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = ml.GetAutoCompleteData_Condo(prefixText);
            foreach (DataRow dr in dt.Rows)
            {
                String item = dr["Province"].ToString();

                itemNames.Add(item);
            }
            string[] prefixTextArray = itemNames.ToArray();
            return prefixTextArray;
        }

        #region Pagination Repeater Events

        #endregion Pagination Repeater Events

        //#region Search methods
        //void SearchResidentialProperties()
        //{
        //    try
        //    {
        //        Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
        //        DataTable dt = new DataTable();
        //        if (Convert.ToString(Session["QueryString"]) == "Residential" && Session["Municipality"] == null)
        //        {
        //            dt = mlsClient.GetResidentialProperties("0", "0", "0", "0", "0", "0", "0");
        //        }
        //        else if (Session["Municipality"] != null)
        //        {
        //            dt = mlsClient.GetResidentialProperties(Session["Municipality"].ToString(), "0", "0", "0", "0", "0", "0");
        //        }
        //        else
        //        {
        //            dt = mlsClient.GetResidentialProperties(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Beds"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());
        //        }

        //        DataTable dtt = new DataTable();
        //        dtt.Columns.AddRange(new DataColumn[5] { new DataColumn("lat"), new DataColumn("long"), new DataColumn("Address"), new DataColumn("Listprice"), new DataColumn("Remarksforclients") });

        //        foreach (DataRow dCol in dt.Rows)
        //        {
        //            string address = dCol["Address"].ToString() + " " + dCol["Municipality"].ToString();
        //            string Listprice = dCol["Listprice"].ToString();
        //            string Remarksforclients = dCol["Remarksforclients"].ToString();
        //            //var url = String.Format("http://maps.google.com/maps/api/geocode/xml?address={0}&sensor=false", HttpContext.Current.Server.UrlEncode(address));

        //            //// Load the XML into an XElement object (whee, LINQ to XML!)
        //            //var results = XElement.Load(url);


        //            //var status = results.Element("status").Value;
        //            //if (status != "OK" && status != "ZERO_RESULTS")
        //            //    // Whoops, something else was wrong with the request...
        //            //    throw new ApplicationException("There was an error with Google's Geocoding Service: " + status);


        //            //if (((System.Xml.Linq.XText)(((System.Xml.Linq.XContainer)(results.Element("status"))).FirstNode)).Value == "OK")
        //            //{
        //            //    // Set the latitude and longtitude parameters based on the address being searched on
        //            //    var lat = results.Element("result").Element("geometry").Element("location").Element("lat").Value;
        //            //    var lng = results.Element("result").Element("geometry").Element("location").Element("lng").Value;
        //            //    dtt.Rows.Add(lat, lng, address, Listprice, Remarksforclients);

        //            //}
        //            GoogleDistanceDuration googleDistanceDuration = new GoogleDistanceDuration();
        //            googleDistanceDuration.StartAddress = address;
        //            googleDistanceDuration.EndAddress = address;
        //            googleDistanceDuration.Language = "en";

        //            googleDistanceDuration = GetDirectionByAddress(googleDistanceDuration);
        //            var lat = googleDistanceDuration.StartLatitude;
        //            var lng = googleDistanceDuration.StartLongitude;
        //            dtt.Rows.Add(lat, lng, address, Listprice, Remarksforclients);
        //        }

        //        if (dt.Rows.Count > 0)
        //        {
        //            //rptMarkers.DataSource = dtt;
        //            //rptMarkers.DataBind();
        //        }
        //        else
        //        {

        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    finally
        //    {

        //    }
        //}

        //void SearchCommercialProperties()
        //{
        //    try
        //    {
        //        Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
        //        DataTable dt = new DataTable();
        //        if (Convert.ToString(Session["QueryString"]) == "Commercial" && Session["Municipality"] == null)
        //        {
        //            dt = mlsClient.GetAllCommercialProperties("0", "0", "0", "0", "0", "0");
        //        }
        //        else if (Session["Municipality"] != null)
        //        {
        //            dt = mlsClient.GetAllCommercialProperties(Session["Municipality"].ToString(), "0", "0", "0", "0", "0");
        //        }
        //        else
        //        {
        //            // Session["Beds"].ToString(),
        //            dt = mlsClient.GetAllCommercialProperties(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());
        //        }

        //        DataTable dtt = new DataTable();
        //        dtt.Columns.AddRange(new DataColumn[5] { new DataColumn("lat"), new DataColumn("long"), new DataColumn("Address"), new DataColumn("Listprice"), new DataColumn("Remarksforclients") });

        //        foreach (DataRow dCol in dt.Rows)
        //        {
        //            string address = dCol["Address"].ToString() + " " + dCol["Municipality"].ToString();
        //            string Listprice = dCol["Listprice"].ToString();
        //            string Remarksforclients = dCol["Remarksforclients"].ToString();
        //            //var url = String.Format("http://maps.google.com/maps/api/geocode/xml?address={0}&sensor=false", HttpContext.Current.Server.UrlEncode(address));

        //            //// Load the XML into an XElement object (whee, LINQ to XML!)
        //            //var results = XElement.Load(url);


        //            //var status = results.Element("status").Value;
        //            //if (status != "OK" && status != "ZERO_RESULTS")
        //            //    // Whoops, something else was wrong with the request...
        //            //    throw new ApplicationException("There was an error with Google's Geocoding Service: " + status);


        //            //if (((System.Xml.Linq.XText)(((System.Xml.Linq.XContainer)(results.Element("status"))).FirstNode)).Value == "OK")
        //            //{
        //            //    // Set the latitude and longtitude parameters based on the address being searched on
        //            //    var lat = results.Element("result").Element("geometry").Element("location").Element("lat").Value;
        //            //    var lng = results.Element("result").Element("geometry").Element("location").Element("lng").Value;
        //            //    dtt.Rows.Add(lat, lng, address, Listprice, Remarksforclients);

        //            //}
        //            GoogleDistanceDuration googleDistanceDuration = new GoogleDistanceDuration();
        //            googleDistanceDuration.StartAddress = address;
        //            googleDistanceDuration.EndAddress = address;
        //            googleDistanceDuration.Language = "en";

        //            googleDistanceDuration = GetDirectionByAddress(googleDistanceDuration);
        //            var lat = googleDistanceDuration.StartLatitude;
        //            var lng = googleDistanceDuration.StartLongitude;
        //            dtt.Rows.Add(lat, lng, address, Listprice, Remarksforclients);
        //        }

        //        if (dt.Rows.Count > 0)
        //        {
        //            //rptMarkers.DataSource = dtt;
        //            //rptMarkers.DataBind();
        //        }
        //        else
        //        {

        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    finally
        //    {

        //    }

        //}

        //void SearchCondoProperties()
        //{
        //    try
        //    {
        //        Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
        //        DataTable dt = new DataTable();
        //        if (Convert.ToString(Session["QueryString"]) == "Condo" && Session["Municipality"] == null)
        //        {
        //            dt = mlsClient.GetProperties_Condo("0", "0", "0", "0", "0", "0", "0");
        //        }
        //        else if (Session["Municipality"] != null)
        //        {
        //            dt = mlsClient.GetProperties_Condo(Session["Municipality"].ToString(), "0", "0", "0", "0", "0", "0");
        //        }
        //        else
        //        {
        //            dt = mlsClient.GetProperties_Condo(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Beds"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());
        //        }

        //        DataTable dtt = new DataTable();
        //        dtt.Columns.AddRange(new DataColumn[5] { new DataColumn("lat"), new DataColumn("long"), new DataColumn("Address"), new DataColumn("Listprice"), new DataColumn("Remarksforclients") });

        //        foreach (DataRow dCol in dt.Rows)
        //        {
        //            string address = dCol["Address"].ToString() + " " + dCol["Municipality"].ToString();
        //            string Listprice = dCol["Listprice"].ToString();
        //            string Remarksforclients = dCol["Remarksforclients"].ToString();
        //            //var url = String.Format("http://maps.google.com/maps/api/geocode/xml?address={0}&sensor=false", HttpContext.Current.Server.UrlEncode(address));

        //            //// Load the XML into an XElement object (whee, LINQ to XML!)
        //            //var results = XElement.Load(url);


        //            //var status = results.Element("status").Value;
        //            //if (status != "OK" && status != "ZERO_RESULTS")
        //            //    // Whoops, something else was wrong with the request...
        //            //    throw new ApplicationException("There was an error with Google's Geocoding Service: " + status);


        //            //if (((System.Xml.Linq.XText)(((System.Xml.Linq.XContainer)(results.Element("status"))).FirstNode)).Value == "OK")
        //            //{
        //            //    // Set the latitude and longtitude parameters based on the address being searched on
        //            //    var lat = results.Element("result").Element("geometry").Element("location").Element("lat").Value;
        //            //    var lng = results.Element("result").Element("geometry").Element("location").Element("lng").Value;
        //            //    dtt.Rows.Add(lat, lng, address, Listprice, Remarksforclients);

        //            //}
        //            GoogleDistanceDuration googleDistanceDuration = new GoogleDistanceDuration();
        //            googleDistanceDuration.StartAddress = address;
        //            googleDistanceDuration.EndAddress = address;
        //            googleDistanceDuration.Language = "en";

        //            googleDistanceDuration = GetDirectionByAddress(googleDistanceDuration);
        //            var lat = googleDistanceDuration.StartLatitude;
        //            var lng = googleDistanceDuration.StartLongitude;
        //            dtt.Rows.Add(lat, lng, address, Listprice, Remarksforclients);
        //        }

        //        if (dt.Rows.Count > 0)
        //        {
        //            //rptMarkers.DataSource = dtt;
        //            //rptMarkers.DataBind();
        //        }
        //        else
        //        {

        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    finally
        //    {

        //    }
        //}

        //void SearchResidentialPropertiesListing()
        //{
        //    try
        //    {


        //        Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
        //        DataTable dt = mlsClient.GetResidentialProperties(Session["Municipality"].ToString(), "0", "0", "0", "0", "0", "0");

        //        //upSearch.Visible = true;
        //        PagedDataSource pagedData = new PagedDataSource();
        //        pagedData.DataSource = dt.DefaultView;
        //        pagedData.AllowPaging = true;
        //        pagedData.PageSize = 8;
        //        pagedData.CurrentPageIndex = CurrentPage;
        //        ViewState["totpage"] = pagedData.PageCount;

        //        //lnkPrevious.Visible = !pagedData.IsFirstPage;
        //        //lnkNext.Visible = !pagedData.IsLastPage;
        //        //lnkFirst.Visible = !pagedData.IsFirstPage;
        //        //lnkLast.Visible = !pagedData.IsLastPage;

        //        //rptSearchResults.DataSource = pagedData;
        //        //rptSearchResults.DataBind();

        //        //rptSearchResultList.DataSource = pagedData;
        //        //rptSearchResultList.DataBind();

        //        //doPaging();
        //        //RepeaterPaging.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
        //        mlsClient = null;
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    finally
        //    {

        //    }
        //}
        //#endregion Search Methods

        //#region Other Methods

        //public string GetPropertyDetails(string propDetail)
        //{
        //    int indexof = 0;
        //    if (propDetail.LastIndexOf(" ") > 145)
        //    {
        //        indexof = propDetail.IndexOf(" ", 145);
        //        ViewState["IndexOf"] = indexof;
        //        return propDetail.Substring(0, indexof) + "...";
        //    }
        //    else
        //        return propDetail;
        //}

        //public string CheckVirtualTour(string virtualTour)
        //{
        //    if (virtualTour == "null")
        //        return "";
        //    else
        //        return "Virtual Tour Available : <a  target='_blank' href=" + virtualTour + ">Click Here</a>";
        //}

        //#endregion Other Methods 


    }

}

