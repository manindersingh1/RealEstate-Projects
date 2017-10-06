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
        #endregion Global
        #region PageLoad
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindmenulist();
                getxmldata();
            }
        }
        #endregion PageLoad


        void bindmenulist()
        {
            StringBuilder StrMenu = new StringBuilder();

            DataTable dtSubmenu = new DataTable();
            DataTable condos_dt = new DataTable();
            condos_dt = clsobj.GetDreamHouse();
            if (condos_dt.Rows.Count > 0)
            {
                StrMenu.Append("<ul class='dropdown-menu'>");

                for (int j = 0; j < condos_dt.Rows.Count; j++)
                {
                    StrMenu.Append("<li><a href='../service.aspx?Id=" + condos_dt.Rows[j]["Id"] + "' title='Home'>" + condos_dt.Rows[j]["Title"] + "</a></li>");
                }
                StrMenu.Append("</ul>");
            }
            dynamicmenus.Text = StrMenu.ToString();
        }
        public void getxmldata()
        {

            DataTable dtable = new DataTable();
            dtable.Columns.Add(new DataColumn("title"));
            dtable.Columns.Add(new DataColumn("description"));
            dtable.Columns.Add(new DataColumn("link"));
            dtable.Columns.Add(new DataColumn("guid"));
            dtable.Columns.Add(new DataColumn("pubDate"));
            WebRequest WebReq = WebRequest.Create("http://www.trebhome.com/rss/TREB_News_PUBLIC.xml");
            WebResponse webRes = WebReq.GetResponse();
            Stream rssStream = webRes.GetResponseStream();
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(rssStream);
            XmlNodeList xmlNodeList = xmlDoc.SelectNodes("rss/channel/item");
            object[] RowValues = { "", "", "", "", "" };
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
                DataRow dRow;
                dRow = dtable.Rows.Add(RowValues);
                dtable.AcceptChanges();
            }
            grvRSS.DataSource = dtable;
            grvRSS.DataBind();
        }
        

    }
}
