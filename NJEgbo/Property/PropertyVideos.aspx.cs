using Property_cls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property
{
    public partial class PropertyVideos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetVideoList();
        }

        void GetVideoList()
        {
            try
            {
                cls_Property cls = new cls_Property();
                DataTable dt = new DataTable();

                dt = cls.GetVideoList();



                if (dt.Rows.Count > 0)
                {
                   
                    PagedDataSource pagedData = new PagedDataSource();
                    pagedData.DataSource = dt.DefaultView;
                    pagedData.AllowPaging = true;
                    pagedData.PageSize = 8;
                    pagedData.CurrentPageIndex = 1;
                    ViewState["totpage"] = pagedData.PageCount;

                    rptSearchResults.DataSource = dt;
                    rptSearchResults.DataBind();
                    
                }
                else
                {
                    
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
    }
}