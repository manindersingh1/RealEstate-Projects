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
        protected void Page_Load(object sender, EventArgs e)
        {          
            bindmenulist();
            GetDreamHouseList();
            GetLogos();
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
                dt = clsobj.GetLogos();


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
    }
}