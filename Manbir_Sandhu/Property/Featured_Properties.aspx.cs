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
using System.Data.SqlClient;
using System.Configuration;


namespace Property
{
    public partial class Featured_Properties : System.Web.UI.Page
    {
        #region Global
        //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ServiceDataBase"].ConnectionString.ToString());//ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Constr"].ConnectionString.ToString());//ConfigurationManager.ConnectionStrings["ConStr"].ToString());
       
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
            if (!Page.IsPostBack)
            {
                SearchResidentialPropertiesListing();
            }
            if (Session["ListView"] == null)
            {
                Session["ListView"] = "ShowGrid";
            }
            if (Session["ListView"] == "ShowGrid")
            {
                DivListSearch.Style.Add("display", "Block");
                DivGridSearch.Style.Add("display", "none");
            }

        }
        public string GetText(string txtDescription)
        {
            if (txtDescription.Length > 150)
            {
                int i = txtDescription.IndexOf(" ", 135);
                if (i > 0)
                    txtDescription = txtDescription.Substring(0, i).Trim();
                else
                    return txtDescription;

            }
            else
            {
                return txtDescription;

            }
            return txtDescription;
        }
        void SearchResidentialPropertiesListing()
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                DataTable dt = new DataTable();
                cmd.CommandText = "GetResidentialProperties";

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd.ExecuteNonQuery();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    count.Text = ("Total Record Found") + " " + dt.Rows.Count;
                    PagedDataSource pagedData = new PagedDataSource();
                    pagedData.DataSource = dt.DefaultView;
                    pagedData.AllowPaging = true;
                    pagedData.PageSize = 8;
                    pagedData.CurrentPageIndex = CurrentPage;
                    ViewState["totpage"] = pagedData.PageCount;
                    lnkPrevious.Visible = !pagedData.IsFirstPage;
                    lnkNext.Visible = !pagedData.IsLastPage;
                    lnkFirst.Visible = !pagedData.IsFirstPage;
                    lnkLast.Visible = !pagedData.IsLastPage;
                    rptSearchResults.DataSource = pagedData;
                    rptSearchResults.DataBind();
                    rptSearchResultList.DataSource = pagedData;
                    rptSearchResultList.DataBind();
                    doPaging();
                    RepeaterPaging.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
                    pagesLink.Visible = true;

                }
                else
                {
                    Response.Redirect("Default_Properties.aspx");
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {

            }
        }
        protected void rptSearchResultList_ItemDataBound1(object sender, RepeaterItemEventArgs e)
        {
           
        }
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
            RepeaterPaging.DataSource = dt;
            RepeaterPaging.DataBind();
        }
    
        protected void btnGridView_Click(object sender, EventArgs e)
        {
            DivGridSearch.Style.Add("display", "block");
            DivListSearch.Style.Add("display", "none");
        }

        protected void btnListView_Click(object sender, EventArgs e)
        {
            DivListSearch.Style.Add("display", "block");
            DivGridSearch.Style.Add("display", "none");
        }


        #region Residential Repeater Events

        protected void rptSearchResults_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");
                HiddenField hdnVOX = (HiddenField)e.Item.FindControl("hdnVOX");
                LinkButton lnkAddToFavourite = (LinkButton)e.Item.FindControl("lnkAddToFavourite");

                if (e.CommandName == "LockButton")
                {
                    if (Session["LoginUser"] == null)
                    {
                        Session["MLSID"] = e.CommandArgument;
                        Session["Type"] = hdnType.Value;
                        Response.Redirect("~/Login.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
                    }
                    else
                    {
                        Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
                    }
                }
                else if (e.CommandName == "Details")
                {
                    if (hdnVOX.Value == "True")
                    {
                        if (Session["LoginUser"] == null)
                        {
                            Session["MLSID"] = e.CommandArgument;
                            Session["Type"] = hdnType.Value;
                            Response.Redirect("~/Login.aspx", false);
                        }
                        else
                        {
                            Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
                        }
                    }
                    else
                    {
                        Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void rptSearchResults_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    HiddenField hdnMLSID = (HiddenField)e.Item.FindControl("hdnMLSID");
                    HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");
                    HiddenField hdnVOX = (HiddenField)e.Item.FindControl("hdnVOX");
                    HiddenField hdnShowAddress = (HiddenField)e.Item.FindControl("hdnShowAddress");
                    HiddenField hdnAddress = (HiddenField)e.Item.FindControl("hdnAddress");
                    HiddenField hdnprovince = (HiddenField)e.Item.FindControl("hdnprovince");
                    HiddenField hdnPostalCode = (HiddenField)e.Item.FindControl("hdnPostalCode");
                    HyperLink hypBoxDetail = (HyperLink)e.Item.FindControl("hypBoxDetail");
                  
                    if (hdnVOX.Value == "True")
                    {
                        if (Session["LoginUser"] == null)
                        {
                            Session["MLSID"] = hdnMLSID.Value;
                            Session["Type"] = hdnType.Value;
                            hypBoxDetail.NavigateUrl = "~/Login.aspx";
                        }
                        else
                        {
                           
                            hypBoxDetail.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
                        }
                    }
                    else
                    {

                        hypBoxDetail.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void rptSearchResultList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");
                HiddenField hdnVOX = (HiddenField)e.Item.FindControl("hdnVOX");

                HtmlGenericControl FavouriteSpan = (HtmlGenericControl)e.Item.FindControl("FavouriteSpan");

                if (e.CommandName == "LockButton")
                {
                    if (Session["LoginUser"] == null)
                    {
                        Session["MLSID"] = e.CommandArgument;
                        Session["Type"] = hdnType.Value;
                        Response.Redirect("~/Admin/AdminLogin.aspx", false);
                    }
                    else
                    {
                      
                        Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
                    }
                }
                else if (e.CommandName == "AddFavourite")
                {
                    Session["MLSID"] = e.CommandArgument;
                    Session["Type"] = hdnType.Value;
                    if (Session["LoginUser"] == null)
                    {
                        Session["Favourite"] = e.CommandArgument.ToString();
                        Response.Redirect("~/Login.aspx", false);
                    }
                    else
                    {

                        int UserID = Convert.ToInt32(Session["UserId"]);
                        string MLSID = e.CommandArgument.ToString();
                        int result = clsobj.Insert_Favourite(UserID, MLSID);
                        FavouriteSpan.InnerText = "Favourite Property";
                    }
                }
                else if (e.CommandName == "Appointment")
                {
                    Session["Type"] = hdnType.Value;
                    Response.Redirect("~/ScheduleAppointment.aspx", false);
                }
                else if (e.CommandName == "Email")
                {
                    Response.Redirect("~/Email_Listing.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
                }
                else if (e.CommandName == "Details")
                {
                    if (hdnVOX.Value == "True")
                    {
                        if (Session["LoginUser"] == null)
                        {
                            Session["MLSID"] = e.CommandArgument;
                            Session["Type"] = hdnType.Value;
                            Response.Redirect("~/Login.aspx", false);
                        }
                        else
                        {
                            Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
                        }
                    }
                    else
                    {
                        Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void rptSearchResultList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    HiddenField hdnMLSID = (HiddenField)e.Item.FindControl("hdnMLSID");
                    HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");
                    HiddenField hdnVOX = (HiddenField)e.Item.FindControl("hdnVOX");
                    HiddenField hdnShowAddress = (HiddenField)e.Item.FindControl("hdnShowAddress");
                    HiddenField hdnAddress = (HiddenField)e.Item.FindControl("hdnAddress");
                    HiddenField hdnprovince = (HiddenField)e.Item.FindControl("hdnprovince");

                    HyperLink hypBoxreadmore = (HyperLink)e.Item.FindControl("hypBoxreadmore");
                    HyperLink hypImage = (HyperLink)e.Item.FindControl("hypImage");
                    HyperLink hypAddress = (HyperLink)e.Item.FindControl("hypAddress");

                    HtmlGenericControl FavouriteSpan = (HtmlGenericControl)e.Item.FindControl("FavouriteSpan");
                    DataTable dtresult = clsobj.SelectFavourite(Convert.ToString(hdnMLSID.Value));
                    if (dtresult.Rows.Count > 0)
                    {
                        if (Session["LoginUser"] != null)
                            FavouriteSpan.InnerText = "Favourite Property";
                    }

                    if (hdnVOX.Value == "True")
                    {
                        if (Session["LoginUser"] == null)
                        {
                            Session["MLSID"] = hdnMLSID.Value;
                            Session["Type"] = hdnType.Value;
                            hypImage.NavigateUrl = "~/Login.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
                            hypAddress.NavigateUrl = "~/Login.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
                        }
                        else
                        {
                            hypBoxreadmore.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
                            hypImage.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
                            hypAddress.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
                        }
                    }
                    else
                    {
                        hypBoxreadmore.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
                        hypImage.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
                        hypAddress.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion Residential Repeater Events
        protected void lnkNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            SearchResidentialPropertiesListing();
        }
        protected void lnkPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            SearchResidentialPropertiesListing();
        }
        protected void lnkFirst_Click(object sender, EventArgs e)
        {
                CurrentPage = 0;
                SearchResidentialPropertiesListing();
        }

        protected void lnkLast_Click(object sender, EventArgs e)
        {
               CurrentPage = (Convert.ToInt32(ViewState["totpage"]) - 1);
                SearchResidentialPropertiesListing();
        }
        #region Pagination Repeater Events

        protected void RepeaterPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("newpage"))
            {
                CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
                SearchResidentialPropertiesListing();
            }
        }
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
        #endregion Pagination Repeater Events

       
       
    }
}