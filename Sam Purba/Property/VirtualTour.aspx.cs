using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Property_cls;

namespace Property
{
    public partial class VirtualTour : System.Web.UI.Page
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
            DataTable dt = new DataTable();
            dt = clsobj.GetVirtualTour();
            //          DataTable dt = mlsClient.GetAllFeatures();
            DataView dv = dt.DefaultView;
            if (strSortExpression != "" && strSortDirection != "")
            {
                dv.Sort = strSortExpression + " " + strSortDirection;
            }
         
            if(dt.Rows.Count>0)
            {
                grdvirtual.DataSource = dt;
                grdvirtual.DataBind();
                cmnsoon.Visible = false;
                repeater.Visible = true;
            }
            else
            {
                grdvirtual.DataSource = dt;
                grdvirtual.DataBind();
                cmnsoon.Visible = true;
                repeater.Visible = false;
            }
            //grdvirtual.EmptyDataText = "no Virtual link added yet! Click to create Virtual Link";
          
            //if (intPageIndex != 0)
                //grdvirtual.PageIndex = intPageIndex;
        }

        protected void grdFeatures_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "create")
            {
                Response.Redirect("CreateVirtualTour.aspx");
            }
        }

        #endregion Grid_Method and Grid's Event
    }
}