using Property_cls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property
{
    public partial class View_Testimonials : System.Web.UI.Page
    {
        #region Global
        #region Global
        cls_Property clsobj = new cls_Property();
        #endregion Global

        Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();

        String strSortExpression = "", strSortDirection = "";
        int intPageIndex = 0;

        public String GridViewSortDirection
        {
            get
            {
                if (ViewState["GridViewSortDirection"] == null)
                {
                    return "DESC";
                }
                else
                {
                    return ViewState["GridViewSortDirection"].ToString();
                }
            }

            set
            {
                ViewState["GridViewSortDirection"] = value;
            }

        }

        String GetSortDirection()
        {
            String GridViewSortDirectionNew;

            switch (GridViewSortDirection)
            {
                case "DESC":
                    GridViewSortDirectionNew = "ASC";
                    break;
                case "ASC":
                    GridViewSortDirectionNew = "DESC";
                    break;
                default:
                    GridViewSortDirectionNew = "DESC";
                    break;

            }
            GridViewSortDirection = GridViewSortDirectionNew;
            return GridViewSortDirectionNew;

        }

        #endregion Global

        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridData();
        }
        #region Grid_Method and Grid's Event

        protected void FillGridData()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = clsobj.GetTestimonials();
                if (dt.Rows.Count > 0)
                {
                    grdBanfdsfsnerShow.DataSource = dt;
                    grdBanfdsfsnerShow.DataBind();
                    divcominr.Visible = false;
                }
                else
                {
                    divcominr.Visible = true;
                }


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //protected void GrdBlogList_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    int id = 0;
        //    if (e.CommandName == "Deleterec")
        //    {
        //        id = Convert.ToInt32(e.CommandArgument);
        //        int result = clsobj.DeleteBanners(id);
        //        FillGridData();
        //    }
        //    else if (e.CommandName == "Editrec")
        //    {
        //        id = Convert.ToInt32(e.CommandArgument);
        //        DataTable dt = new DataTable();
        //        dt = clsobj.GetBannerbyID(id);
        //        //txtName.Text = dt.Rows[0]["Name"].ToString();
        //        //hdnImg.Value = dt.Rows[0]["FileName"].ToString();
        //        //imgbanner.ImageUrl = "/admin/uploadfiles/" + dt.Rows[0]["FileName"].ToString();
        //        //itemOrder.Value = dt.Rows[0]["ItemOrder"].ToString();
        //        //imgbanner.Visible = true;
        //        FillGridData();
        //    }
        //    else
        //    {
        //        FillGridData();
        //    }
        //}

        protected void grdTestimonials_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataTable dt = new DataTable();
                dt = clsobj.GetTestimonials();
                Label label = (Label)e.Item.FindControl("lblname");
                label.Text = dt.Rows[0]["FirstName"].ToString() + " " + (dt.Rows[0]["LastName"].ToString());

            }
        }
        #endregion Grid_Method and Grid's Event
    }
}