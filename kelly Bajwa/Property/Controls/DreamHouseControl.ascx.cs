using Property_cls;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property.Controls
{
    public partial class DreamHouseControl : System.Web.UI.UserControl
    {
        #region Global
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ServiceDataBase"].ConnectionString.ToString());
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

        protected void Page_Load(object sender, EventArgs e)
        {
            GetDreamHouseList();
            DivListSearch.Style.Add("display", "none");
            DivGridSearch.Style.Add("display", "block");
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
                    pagedData.CurrentPageIndex = CurrentPage;
                    ViewState["totpage"] = pagedData.PageCount;
                    //lnkPrevious.Visible = !pagedData.IsFirstPage;
                    //lnkNext.Visible = !pagedData.IsLastPage;
                    //lnkFirst.Visible = !pagedData.IsFirstPage;
                    //lnkLast.Visible = !pagedData.IsLastPage;

                    rptSearchResults.DataSource = pagedData;
                    rptSearchResults.DataBind();
                    rptSearchResultList.DataSource = pagedData;
                    rptSearchResultList.DataBind();

                    doPaging();
                   // RepeaterPaging.ItemStyle.HorizontalAlign = HorizontalAlign.Center;


                }
                else
                {
                    resultSearch.Visible = true;
                    //pagesLink.Visible = false;
                    resultSearch.Text = "Property is not available ";
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
        void GetDetailOfDreamHouse()
        {

        }


        protected void rptSearchResultList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                //HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");


                if (e.CommandName == "Details")
                {
                   
                        Session["Id"] = e.CommandArgument;

                        Response.Redirect("~/DreamHouseDetail.aspx?Id=" + e.CommandArgument, false);
                    
                   
                }
            
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #region Pagination Method

        private void doPaging()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("PageIndex");
            dt.Columns.Add("PageText");
            findex = CurrentPage - 5;
            if (CurrentPage > 5)
            {
                lindex = CurrentPage + 5;
            }
            else
            {
                lindex = 10;
            }
            if (lindex > Convert.ToInt32(ViewState["totpage"]))
            {
                lindex = Convert.ToInt32(ViewState["totpage"]);
                findex = lindex - 10;
            }

            if (findex < 0)
            {
                findex = 0;
            }
            for (int i = findex; i < lindex; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }
            //RepeaterPaging.DataSource = dt;
            //RepeaterPaging.DataBind();
        }

        #endregion Pagination Method
    }
}