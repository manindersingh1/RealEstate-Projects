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
using System.Net;
using System.IO;
using System.Xml;
using System.Text;

namespace Property
{
    public partial class RealEstateNews : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                getxmldata();
                //StringBuilder html = new StringBuilder();

                //XmlDocument doc = new XmlDocument();
                //doc.Load("http://www.torontorealestateboard.com/rss/TREB_News_PUBLIC.xml");

                ////Display all the book titles.
                //XmlNodeList elemList = doc.GetElementsByTagName("link");
                //for (int i = 0; i < elemList.Count; i++)
                //{
                // html.AppendLine("<li style='color:black;'><a href=" + elemList[i].InnerXml + ">" + elemList[i].InnerXml + "</a></li>");
                //}
                //ltrLink.Text = html.ToString();
            }
        }
        #endregion PageLoad

        public void getxmldata()
        {

            DataTable dtable = new DataTable();
            dtable.Columns.Add(new DataColumn("title"));
            dtable.Columns.Add(new DataColumn("description"));
            dtable.Columns.Add(new DataColumn("link"));
            dtable.Columns.Add(new DataColumn("guid"));
            dtable.Columns.Add(new DataColumn("pubDate"));


            // fetch webrequest. Here, give the path of the location where rss feed is stored.
            //WebRequest WebReq = WebRequest.Create("http://www.mondaq.com/canada/x/470720/real%2Bestate/Legal%2BTrends%2B2016%2BComm");
            WebRequest WebReq = WebRequest.Create("http://www.trebhome.com/rss/TREB_News_PUBLIC.xml");

            // get webresponse from the webrequset 
            WebResponse webRes = WebReq.GetResponse();

            // use stream to stremline the input from from webresponse.
            Stream rssStream = webRes.GetResponseStream();

            // Create new xml document and load a XML Document
            // with the strem.
            XmlDocument xmlDoc = new XmlDocument();

            // loads the url from the stream
            xmlDoc.Load(rssStream);

            // use XmlNodeList to get the matching xmlnodes from the xmldocument
            XmlNodeList xmlNodeList = xmlDoc.SelectNodes("rss/channel/item");

            // create array of the object for creating the row
            object[] RowValues = { "", "", "", "", "" };

            // Make a Loop through RSS Feed items
            for (int i = 0; i < xmlNodeList.Count; i++)
            {
                XmlNode xmlNode;

                xmlNode = xmlNodeList.Item(i).SelectSingleNode("title");
                if (xmlNode != null)
                {
                    RowValues[0] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[0] = "";
                }

                xmlNode = xmlNodeList.Item(i).SelectSingleNode("description");
                if (xmlNode != null)
                {
                    RowValues[1] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[1] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("link");
                if (xmlNode != null)
                {
                    RowValues[2] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[2] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("guid");
                if (xmlNode != null)
                {
                    RowValues[3] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[3] = "";
                }
                xmlNode = xmlNodeList.Item(i).SelectSingleNode("pubDate");
                if (xmlNode != null)
                {
                    RowValues[4] = xmlNode.InnerText;
                }
                else
                {
                    RowValues[4] = "";
                }
                // creating datarow and add it to the datatable
                DataRow dRow;
                dRow = dtable.Rows.Add(RowValues);
                dtable.AcceptChanges();
            }
            // finally bind the grid....
            grvRSS.DataSource = dtable;
            grvRSS.DataBind();
        }
        #region Button Click's

        protected void lnkPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            getxmldata();

        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            getxmldata();

        }

        protected void lnkFirst_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            getxmldata();

        }

        protected void lnkLast_Click(object sender, EventArgs e)
        {
            CurrentPage = (Convert.ToInt32(ViewState["totpage"]) - 1);
            getxmldata();

        }

        #endregion Button Click's
        protected void RepeaterPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            LinkButton lnkPage = (LinkButton)e.Item.FindControl("Pagingbtn");

            if (lnkPage.CommandArgument.ToString() == CurrentPage.ToString())
            {
                lnkPage.Enabled = false;
                lnkPage.BackColor = System.Drawing.Color.FromName("#1e707e");
                lnkPage.ForeColor = System.Drawing.Color.FromName("#FFFFFF");
            }
        }
        protected void RepeaterPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("newpage"))
            {
                CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
                getxmldata();
            }
        }

        protected void grvRSS_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("view"))
            {
            }
        }
    }
}
