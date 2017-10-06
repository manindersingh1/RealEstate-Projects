using Property_cls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property
{
    public partial class Index : System.Web.UI.Page
    {
        cls_Property clsobj = new cls_Property();


        protected void Page_Load(object sender, EventArgs e)
        {
            bindmenulist();
            bindBnanners();
            GetDreamHouseList();
            GetLogos();
        }

        void bindmenulist()
        {
            StringBuilder StrMenu = new StringBuilder();
            DataTable dt = new DataTable();
            DataTable dtSubmenu = new DataTable();
            dt = clsobj.GetDreamHouse();


            if (dt.Rows.Count > 0)
            {
                StrMenu.Append("<ul class='dropdown-menu'>");

                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    StrMenu.Append("<li><a href='../service.aspx?Id=" + dt.Rows[j]["Id"] + "' title='Home'>" + dt.Rows[j]["Title"] + "</a></li>");
                }
                StrMenu.Append("</ul>");
            }
            dynamicmenus.Text = StrMenu.ToString();
            StrMenu.Clear();

            DataTable Resaledt = new DataTable();
            Resaledt = clsobj.GetExclusiveListing();
            if (Resaledt.Rows.Count > 0)
            {
                StrMenu.Append("<ul class='dropdown-menu'>");

                for (int j = 0; j < Resaledt.Rows.Count; j++)
                {
                    StrMenu.Append("<li><a href='../ExclusiveDetailPage.aspx?Id=" + Resaledt.Rows[j]["Id"] + "' title=''>" + Resaledt.Rows[j]["Title"] + "</a></li>");
                }
                StrMenu.Append("</ul>");
            }
            ReSaleMenus.Text = StrMenu.ToString();


        }
        void GetDreamHouseList()
        {
            try
            {
                DataTable dt = clsobj.GetDreamHouseList();
                if (dt.Rows.Count > 0)
                {

                    dt.TableName = "ContactedUsers";
                    upSearch.Visible = true;
                    PagedDataSource pagedData = new PagedDataSource();
                    pagedData.DataSource = dt.DefaultView;
                    pagedData.AllowPaging = true;
                    pagedData.PageSize = 8;
                    // pagedData.CurrentPageIndex = CurrentPage;
                    ViewState["totpage"] = pagedData.PageCount;
                    // lnkPrevious.Visible = !pagedData.IsFirstPage;
                    //lnkNext.Visible = !pagedData.IsLastPage;
                    // lnkFirst.Visible = !pagedData.IsFirstPage;
                    // lnkLast.Visible = !pagedData.IsLastPage;

                    rptSearchResults.DataSource = pagedData;
                    rptSearchResults.DataBind();
                    // rptSearchResultList.DataSource = pagedData;
                    // rptSearchResultList.DataBind();

                    //doPaging();
                    //RepeaterPaging.ItemStyle.HorizontalAlign = HorizontalAlign.Center;


                }
                else
                {
                    //resultSearch.Visible = true;
                    // pagesLink.Visible = false;
                    //resultSearch.Text = "Property is not available ";
                    //btnGridView.Visible = false;
                    //btnListView.Visible = false;
                }

            }
            catch (Exception ex)
            {

            }
            finally
            {

            }
        }
        void GetLogos()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = clsobj.GetDreamHouseList();


                rptFeaturedProperties.DataSource = dt;

                rptFeaturedProperties.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;

            }
            finally
            {

            }
        }

        protected void bindBnanners()
        {
            StringBuilder html = new StringBuilder();
            DataTable dt = clsobj.GetAllBanner();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string Images;
                Images = "Multiple_Condos/images/" + dt.Rows[i]["FileName"].ToString();
                if (Images != "")
                {
                    string id = "0";
                    if (dt.Rows[i]["ProjectId"].ToString() != "")
                    {
                        id = dt.Rows[i]["ProjectId"].ToString();
                        html.AppendLine("<a href='Service.aspx?Id=" + id + "'><img src='" + Images + "'  data-thumb='" + Images + "'  alt='banner" + i + "' /></a>");
                    }
                    else
                    {
                        html.AppendLine("<a href='#'><img src='" + Images + "'  data-thumb='" + Images + "'  alt='banner" + i + "' /></a>");
                    }

                }
            }
            ltrImgsf.Text = html.ToString();
        }
    }
}