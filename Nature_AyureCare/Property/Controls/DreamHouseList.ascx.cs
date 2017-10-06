using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Property_cls;
using System.Xml.Linq;
using System.Configuration;

namespace Property.Controls
{
    public partial class DreamHouseList : System.Web.UI.UserControl
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
        #region PageLoad
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                GetDreamHouseList();

            }
            if (Session["ListView"] == null )
            {
                Session["ListView"] = "ShowGrid";
            }
            if (Session["ListView"] == "ShowGrid")
            {
                //DivListSearch.Style.Add("display", "block");
                DivGridSearch.Style.Add("display", "none");
            }
             
        }
        #endregion PageLoad
        #region Pagination Repeater Events

        protected void RepeaterPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("newpage"))
            {
                CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
                if (Convert.ToString(Session["SearchType"])== "Residential" || Convert.ToString(Session["QueryString"]) == "Residential")
                {
                    //SearchResidentialProperties();
                }
                else if (Convert.ToString(Session["SearchType"]) == "Commercial" || Convert.ToString(Session["QueryString"]) == "Commercial")
                {
                  //  SearchCommercialProperties();
                }
                else if (Convert.ToString(Session["SearchType"]) == "Condo" || Convert.ToString(Session["QueryString"]) == "Condo")
                {
                   // SearchCondoProperties();
                }
                else
                {
                   // SearchResidentialPropertiesListing();
                }
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

        //#region Residential Repeater Events

        //protected void rptSearchResults_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    try
        //    {
        //        HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");
        //        HiddenField hdnVOX = (HiddenField)e.Item.FindControl("hdnVOX");
        //        LinkButton lnkAddToFavourite = (LinkButton)e.Item.FindControl("lnkAddToFavourite");

        //        if (e.CommandName == "LockButton")
        //        {
        //            if (Session["LoginUser"] == null)
        //            {
        //                Session["MLSID"] = e.CommandArgument;
        //                Session["Type"] = hdnType.Value;
        //                Response.Redirect("~/Login.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //            }
        //            else
        //            {
        //                Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //            }
        //        }
        //        else if (e.CommandName == "Details")
        //        {
        //            if (hdnVOX.Value == "True")
        //            {
        //                if (Session["LoginUser"] == null)
        //                {
        //                    Session["MLSID"] = e.CommandArgument;
        //                    Session["Type"] = hdnType.Value;
        //                    Response.Redirect("~/Login.aspx", false);
        //                }
        //                else
        //                {
        //                    Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //                }
        //            }
        //            else
        //            {
        //                Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //protected void rptSearchResults_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    try
        //    {
        //        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //        {
        //            HiddenField hdnMLSID = (HiddenField)e.Item.FindControl("hdnMLSID");
        //            HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");
        //            HiddenField hdnVOX = (HiddenField)e.Item.FindControl("hdnVOX");
        //            HiddenField hdnShowAddress = (HiddenField)e.Item.FindControl("hdnShowAddress");
        //            HiddenField hdnAddress = (HiddenField)e.Item.FindControl("hdnAddress");
        //            HiddenField hdnprovince = (HiddenField)e.Item.FindControl("hdnprovince");
        //            HiddenField hdnPostalCode = (HiddenField)e.Item.FindControl("hdnPostalCode");

        //            HyperLink hypBoxDetail = (HyperLink)e.Item.FindControl("hypBoxDetail");

        //            if (hdnVOX.Value == "True")
        //            {
        //                if (Session["LoginUser"] == null)
        //                {
        //                    Session["MLSID"] = hdnMLSID.Value;
        //                    Session["Type"] = hdnType.Value;
        //                    hypBoxDetail.NavigateUrl = "~/Login.aspx";
        //                }
        //                else
        //                {
        //                    hypBoxDetail.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                }
        //            }
        //            else
        //            {
        //                hypBoxDetail.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //protected void rptSearchResultList_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    try
        //    {
        //        HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");
        //        HiddenField hdnVOX = (HiddenField)e.Item.FindControl("hdnVOX");

        //        HtmlGenericControl FavouriteSpan = (HtmlGenericControl)e.Item.FindControl("FavouriteSpan");

        //        if (e.CommandName == "LockButton")
        //        {
        //            if (Session["LoginUser"] == null)
        //            {
        //                Session["MLSID"] = e.CommandArgument;
        //                Session["Type"] = hdnType.Value;
        //                Response.Redirect("~/Admin/AdminLogin.aspx", false);
        //            }
        //            else
        //            {
        //                Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //            }
        //        }
        //        else if (e.CommandName == "AddFavourite")
        //        {
        //            Session["MLSID"] = e.CommandArgument;
        //            Session["Type"] = hdnType.Value;
        //            if (Session["LoginUser"] == null)
        //            {
        //                Session["Favourite"] = e.CommandArgument.ToString();
        //                Response.Redirect("~/Login.aspx", false);
        //            }
        //            else
        //            {

        //                int UserID = Convert.ToInt32(Session["UserId"]);
        //                string MLSID = e.CommandArgument.ToString();
        //                int result = clsobj.Insert_Favourite(UserID, MLSID);
        //                FavouriteSpan.InnerText = "Favourite Property";
        //            }
        //        }
        //        else if (e.CommandName == "Appointment")
        //        {
        //            Session["Type"] = hdnType.Value;
        //            Response.Redirect("~/ScheduleAppointment.aspx", false);
        //        }
        //        else if (e.CommandName == "Email")
        //        {
        //            Response.Redirect("~/Email_Listing.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //        }
        //        else if (e.CommandName == "Details")
        //        {
        //            if (hdnVOX.Value == "True")
        //            {
        //                if (Session["LoginUser"] == null)
        //                {
        //                    Session["MLSID"] = e.CommandArgument;
        //                    Session["Type"] = hdnType.Value;
        //                    Response.Redirect("~/Login.aspx", false);
        //                }
        //                else
        //                {
        //                    Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //                }
        //            }
        //            else
        //            {
        //                Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //protected void rptSearchResultList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    try
        //    {
        //        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //        {
        //            HiddenField hdnMLSID = (HiddenField)e.Item.FindControl("hdnMLSID");
        //            HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");
        //            HiddenField hdnVOX = (HiddenField)e.Item.FindControl("hdnVOX");
        //            HiddenField hdnShowAddress = (HiddenField)e.Item.FindControl("hdnShowAddress");
        //            HiddenField hdnAddress = (HiddenField)e.Item.FindControl("hdnAddress");
        //            HiddenField hdnprovince = (HiddenField)e.Item.FindControl("hdnprovince");
        //            HyperLink hypImage = (HyperLink)e.Item.FindControl("hypImage");
        //            HyperLink hypBoxreadmore = (HyperLink)e.Item.FindControl("hypBoxreadmore");
        //            HyperLink hypAddress = (HyperLink)e.Item.FindControl("hypAddress");

        //            HtmlGenericControl FavouriteSpan = (HtmlGenericControl)e.Item.FindControl("FavouriteSpan");
        //            DataTable dtresult = clsobj.SelectFavourite(Convert.ToString(hdnMLSID.Value));
        //            if (dtresult.Rows.Count > 0)
        //            {
        //                if (Session["LoginUser"] != null)
        //                    FavouriteSpan.InnerText = "Favourite Property";
        //            }

        //            if (hdnVOX.Value == "True")
        //            {
        //                if (Session["LoginUser"] == null)
        //                {
        //                    Session["MLSID"] = hdnMLSID.Value;
        //                    Session["Type"] = hdnType.Value;
        //                    hypBoxreadmore.NavigateUrl = "~/Login.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                    hypImage.NavigateUrl = "~/Login.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                    hypAddress.NavigateUrl = "~/Login.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                }
        //                else
        //                {
        //                    hypBoxreadmore.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                    hypImage.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                    hypAddress.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                }
        //            }
        //            else
        //            {
        //                hypBoxreadmore.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                hypImage.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                hypAddress.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //#endregion Residential Repeater Events

        //#region Commercial Repeater Events

        //protected void rptSearchCommercialResult_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    try
        //    {
        //        HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");
        //        HiddenField hdnVOX = (HiddenField)e.Item.FindControl("hdnVOX");
        //        LinkButton lnkAddToFavourite = (LinkButton)e.Item.FindControl("lnkAddToFavourite");

        //        if (e.CommandName == "LockButton")
        //        {
        //            if (Session["LoginUser"] == null)
        //            {
        //                Session["MLSID"] = e.CommandArgument;
        //                Session["Type"] = hdnType.Value;
        //                Response.Redirect("~/Login.aspx", false);
        //            }
        //            else
        //            {
        //                Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //            }
        //        }
        //        else if (e.CommandName == "Details")
        //        {
        //            if (hdnVOX.Value == "True")
        //            {
        //                if (Session["LoginUser"] == null)
        //                {
        //                    Session["MLSID"] = e.CommandArgument;
        //                    Session["Type"] = hdnType.Value;
        //                    Response.Redirect("~/Login.aspx", false);
        //                }
        //                else
        //                {
        //                    Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //                }
        //            }
        //            else
        //            {
        //                Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //protected void rptSearchCommercialResult_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    try
        //    {
        //        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //        {
        //            HiddenField hdnMLSID = (HiddenField)e.Item.FindControl("hdnMLSID");
        //            HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");
        //            HiddenField hdnVOX = (HiddenField)e.Item.FindControl("hdnVOX");
        //            HiddenField hdnShowAddress = (HiddenField)e.Item.FindControl("hdnShowAddress");
        //            HiddenField hdnAddress = (HiddenField)e.Item.FindControl("hdnAddress");
        //            HiddenField hdnprovince = (HiddenField)e.Item.FindControl("hdnprovince");
        //            HiddenField hdnPostalCode = (HiddenField)e.Item.FindControl("hdnPostalCode");

        //            HyperLink hypBoxDetail = (HyperLink)e.Item.FindControl("hypBoxDetail");

        //            if (hdnVOX.Value == "True")
        //            {
        //                if (Session["LoginUser"] == null)
        //                {
        //                    Session["MLSID"] = hdnMLSID.Value;
        //                    Session["Type"] = hdnType.Value;
        //                    hypBoxDetail.NavigateUrl = "~/Login.aspx";
        //                }
        //                else
        //                {
        //                    hypBoxDetail.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                }
        //            }
        //            else
        //            {
        //                hypBoxDetail.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //protected void rptCommercialResultList_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    try
        //    {
        //        HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");
        //        HiddenField hdnVOX = (HiddenField)e.Item.FindControl("hdnVOX");
        //        HtmlGenericControl FavouriteSpan = (HtmlGenericControl)e.Item.FindControl("FavouriteSpan");

        //        if (e.CommandName == "LockButton")
        //        {
        //            if (Session["LoginUser"] == null)
        //            {
        //                Session["MLSID"] = e.CommandArgument;
        //                Session["Type"] = hdnType.Value;
        //                Response.Redirect("~/Admin/AdminLogin.aspx", false);
        //            }
        //            else
        //            {
        //                Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //            }
        //        }
        //        else if (e.CommandName == "AddFavourite")
        //        {
        //            Session["MLSID"] = e.CommandArgument;
        //            Session["Type"] = hdnType.Value;
        //            if (Session["LoginUser"] == null)
        //            {
        //                Session["Favourite"] = e.CommandArgument.ToString();
        //                Response.Redirect("~/Login.aspx", false);
        //            }
        //            else
        //            {
        //                int UserID = Convert.ToInt32(Session["UserId"]);
        //                string MLSID = e.CommandArgument.ToString();
        //                int result = clsobj.Insert_Favourite(UserID, MLSID);
        //                FavouriteSpan.InnerText = "Favourite Property";
        //            }
        //        }
        //        else if (e.CommandName == "Appointment")
        //        {
        //            Session["Type"] = hdnType.Value;
        //            Response.Redirect("~/ScheduleAppointment.aspx", false);
        //        }
        //        else if (e.CommandName == "Email")
        //        {
        //            Response.Redirect("~/Email_Listing.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //        }
        //        else if (e.CommandName == "Details")
        //        {
        //            if (hdnVOX.Value == "True")
        //            {
        //                if (Session["LoginUser"] == null)
        //                {
        //                    Session["MLSID"] = e.CommandArgument;
        //                    Session["Type"] = hdnType.Value;
        //                    Response.Redirect("~/Login.aspx", false);
        //                }
        //                else
        //                {
        //                    Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //                }
        //            }
        //            else
        //            {
        //                Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //protected void rptCommercialResultList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    try
        //    {
        //        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //        {
        //            HiddenField hdnMLSID = (HiddenField)e.Item.FindControl("hdnMLSID");
        //            HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");
        //            HiddenField hdnVOX = (HiddenField)e.Item.FindControl("hdnVOX");
        //            HiddenField hdnShowAddress = (HiddenField)e.Item.FindControl("hdnShowAddress");
        //            HiddenField hdnAddress = (HiddenField)e.Item.FindControl("hdnAddress");
        //            HiddenField hdnprovince = (HiddenField)e.Item.FindControl("hdnprovince");
        //            HiddenField hdnPostalCode = (HiddenField)e.Item.FindControl("hdnPostalCode");
        //            HyperLink hypImage = (HyperLink)e.Item.FindControl("hypImage");
        //            HyperLink hypBoxreadmore = (HyperLink)e.Item.FindControl("hypBoxreadmore");
        //            HyperLink hypAddress = (HyperLink)e.Item.FindControl("hypAddress");

        //            HtmlGenericControl FavouriteSpan = (HtmlGenericControl)e.Item.FindControl("FavouriteSpan");
        //            DataTable dtresult = clsobj.SelectFavourite(Convert.ToString(hdnMLSID.Value));
        //            if (dtresult.Rows.Count > 0)
        //            {
        //                if (Session["LoginUser"] != null)
        //                    FavouriteSpan.InnerText = "Favourite Property";
        //            }

        //            if (hdnVOX.Value == "True")
        //            {
        //                if (Session["LoginUser"] == null)
        //                {
        //                    Session["MLSID"] = hdnMLSID.Value;
        //                    Session["Type"] = hdnType.Value;
        //                    hypBoxreadmore.NavigateUrl = "~/Login.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                    hypImage.NavigateUrl = "~/Login.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                    hypAddress.NavigateUrl = "~/Login.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                }
        //                else
        //                {
        //                    hypBoxreadmore.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                    hypImage.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                    hypAddress.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                }
        //            }
        //            else
        //            {
        //                hypBoxreadmore.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                hypImage.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                hypAddress.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //            }

        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //#endregion Commercial Repeater Events

        //#region Condo Repeater Events

        //protected void rptSearchCondoResult_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    try
        //    {
        //        HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");
        //        HiddenField hdnVOX = (HiddenField)e.Item.FindControl("hdnVOX");
        //        //LinkButton lnkAddToFavourite = (LinkButton)e.Item.FindControl("lnkAddToFavourite");

        //        if (e.CommandName == "LockButton")
        //        {
        //            if (Session["LoginUser"] == null)
        //            {
        //                Session["MLSID"] = e.CommandArgument;
        //                Session["Type"] = hdnType.Value;
        //                Response.Redirect("~/Login.aspx", false);
        //            }
        //            else
        //            {
        //                Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //            }
        //        }
        //        else if (e.CommandName == "Details")
        //        {
        //            if (hdnVOX.Value == "True")
        //            {
        //                if (Session["LoginUser"] == null)
        //                {
        //                    Session["MLSID"] = e.CommandArgument;
        //                    Session["Type"] = hdnType.Value;
        //                    Response.Redirect("~/Login.aspx", false);
        //                }
        //                else
        //                {
        //                    Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //                }
        //            }
        //            else
        //            {
        //                Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //protected void rptSearchCondoResult_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    try
        //    {
        //        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //        {
        //            HiddenField hdnMLSID = (HiddenField)e.Item.FindControl("hdnMLSID");
        //            HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");
        //            HiddenField hdnVOX = (HiddenField)e.Item.FindControl("hdnVOX");
        //            HiddenField hdnShowAddress = (HiddenField)e.Item.FindControl("hdnShowAddress");
        //            HiddenField hdnAddress = (HiddenField)e.Item.FindControl("hdnAddress");
        //            HiddenField hdnprovince = (HiddenField)e.Item.FindControl("hdnprovince");
        //            HiddenField hdnPostalCode = (HiddenField)e.Item.FindControl("hdnPostalCode");

        //            HyperLink hypBoxDetail = (HyperLink)e.Item.FindControl("hypBoxDetail");

        //            if (hdnVOX.Value == "True")
        //            {
        //                if (Session["LoginUser"] == null)
        //                {
        //                    Session["MLSID"] = hdnMLSID.Value;
        //                    Session["Type"] = hdnType.Value;
        //                    hypBoxDetail.NavigateUrl = "~/Login.aspx";
        //                }
        //                else
        //                {
        //                    hypBoxDetail.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                }
        //            }
        //            else
        //            {
        //                hypBoxDetail.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //protected void rptCondoResultList_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    try
        //    {
        //        HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");
        //        HiddenField hdnVOX = (HiddenField)e.Item.FindControl("hdnVOX");

        //        HtmlGenericControl FavouriteSpan = (HtmlGenericControl)e.Item.FindControl("FavouriteSpan");

        //        if (e.CommandName == "LockButton")
        //        {
        //            if (Session["LoginUser"] == null)
        //            {
        //                Session["MLSID"] = e.CommandArgument;
        //                Session["Type"] = hdnType.Value;
        //                Response.Redirect("~/Admin/AdminLogin.aspx", false);
        //            }
        //            else
        //            {
        //                Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //            }
        //        }
        //        else if (e.CommandName == "AddFavourite")
        //        {
        //            Session["MLSID"] = e.CommandArgument;
        //            Session["Type"] = hdnType.Value;
        //            if (Session["LoginUser"] == null)
        //            {
        //                Session["Favourite"] = e.CommandArgument.ToString();
        //                Response.Redirect("~/Login.aspx", false);
        //            }
        //            else
        //            {
        //                int UserID = Convert.ToInt32(Session["UserId"]);
        //                string MLSID = e.CommandArgument.ToString();
        //                int result = clsobj.Insert_Favourite(UserID, MLSID);
        //                FavouriteSpan.InnerText = "Favourite Property";
        //            }
        //        }
        //        else if (e.CommandName == "Appointment")
        //        {
        //            Session["Type"] = hdnType.Value;
        //            Response.Redirect("~/ScheduleAppointment.aspx", false);
        //        }
        //        else if (e.CommandName == "Email")
        //        {
        //            Response.Redirect("~/Email_Listing.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //        }
        //        else if (e.CommandName == "Details")
        //        {
        //            if (hdnVOX.Value == "True")
        //            {
        //                if (Session["LoginUser"] == null)
        //                {
        //                    Session["MLSID"] = e.CommandArgument;
        //                    Session["Type"] = hdnType.Value;
        //                    Response.Redirect("~/Login.aspx", false);
        //                }
        //                else
        //                {
        //                    Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //                }
        //            }
        //            else
        //            {
        //                Response.Redirect("~/PropertyDetails.aspx?MLSID=" + e.CommandArgument + "&PropertyType=" + hdnType.Value, false);
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //protected void rptCondoResultList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    try
        //    {
        //        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //        {
        //            HiddenField hdnMLSID = (HiddenField)e.Item.FindControl("hdnMLSID");
        //            HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");
        //            HiddenField hdnVOX = (HiddenField)e.Item.FindControl("hdnVOX");
        //            HiddenField hdnShowAddress = (HiddenField)e.Item.FindControl("hdnShowAddress");
        //            HiddenField hdnAddress = (HiddenField)e.Item.FindControl("hdnAddress");
        //            HiddenField hdnprovince = (HiddenField)e.Item.FindControl("hdnprovince");
                    
        //            HyperLink hypImage = (HyperLink)e.Item.FindControl("hypImage");
        //            HyperLink hypAddress = (HyperLink)e.Item.FindControl("hypAddress");
        //            HyperLink hypBoxreadmore = (HyperLink)e.Item.FindControl("hypBoxreadmore");

        //            HtmlGenericControl FavouriteSpan = (HtmlGenericControl)e.Item.FindControl("FavouriteSpan");
        //            DataTable dtresult = clsobj.SelectFavourite(Convert.ToString(hdnMLSID.Value));
        //            if (dtresult.Rows.Count > 0)
        //            {
        //                if (Session["LoginUser"] != null)
        //                    FavouriteSpan.InnerText = "Favourite Property";
        //            }

        //            if (hdnVOX.Value == "True")
        //            {
        //                if (Session["LoginUser"] == null)
        //                {
        //                    Session["MLSID"] = hdnMLSID.Value;
        //                    Session["Type"] = hdnType.Value;
        //                    hypBoxreadmore.NavigateUrl = "~/Login.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                    hypImage.NavigateUrl = "~/Login.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                    hypAddress.NavigateUrl = "~/Login.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                }
        //                else
        //                {
        //                    hypBoxreadmore.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                    hypImage.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                    hypAddress.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                }
        //            }
        //            else
        //            {
        //                hypBoxreadmore.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                hypImage.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //                hypAddress.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //#endregion Condo Repeater Events

        #region Button Click's

        protected void lnkPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;

            if (Convert.ToString(Session["SearchType"]) == "Residential" || Convert.ToString(Session["QueryString"]) == "Residential")
            {
                //SearchResidentialProperties();
            }
            else if (Convert.ToString(Session["SearchType"]) == "Commercial" || Convert.ToString(Session["QueryString"]) == "Commercial")
            {
               // SearchCommercialProperties();
            }
            else if (Convert.ToString(Session["SearchType"]) == "Condo" || Convert.ToString(Session["QueryString"]) == "Condo")
            {
                //SearchCondoProperties();
            }
            else
            {
                //SearchResidentialPropertiesListing();
            }
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            if (Convert.ToString(Session["SearchType"]) == "Residential" || Convert.ToString(Session["QueryString"]) == "Residential")
            {
                //SearchResidentialProperties();
            }
            else if (Convert.ToString(Session["SearchType"]) == "Commercial" || Convert.ToString(Session["QueryString"]) == "Commercial")
            {
               // SearchCommercialProperties();
            }
            else if (Convert.ToString(Session["SearchType"]) == "Condo" || Convert.ToString(Session["QueryString"]) == "Condo")
            {
                //SearchCondoProperties();
            }
            else
            {
                //SearchResidentialPropertiesListing();
            }
        }

        protected void lnkFirst_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;

            if (Convert.ToString(Session["SearchType"]) == "Residential" || Convert.ToString(Session["QueryString"]) == "Residential")
            {
                //SearchResidentialProperties();
            }
            else if (Convert.ToString(Session["SearchType"]) == "Commercial" || Convert.ToString(Session["QueryString"]) == "Commercial")
            {
               // SearchCommercialProperties();
            }
            else if (Convert.ToString(Session["SearchType"]) == "Condo" || Convert.ToString(Session["QueryString"]) == "Condo")
            {
               // SearchCondoProperties();
            }
            else
            {
                // Session["Municipality"] = Request.QueryString["Municipality"];
                //SearchResidentialPropertiesListing();
            }
        }

        protected void lnkLast_Click(object sender, EventArgs e)
        {
            CurrentPage = (Convert.ToInt32(ViewState["totpage"]) - 1);

            if (Convert.ToString(Session["SearchType"]) == "Residential" || Convert.ToString(Session["QueryString"]) == "Residential")
            {
                //SearchResidentialProperties();
            }
            else if (Convert.ToString(Session["SearchType"]) == "Commercial" || Convert.ToString(Session["QueryString"]) == "Commercial")
            {
               // SearchCommercialProperties();
            }
            else if (Convert.ToString(Session["SearchType"]) == "Condo" || Convert.ToString(Session["QueryString"]) == "Condo")
            {
                //SearchCondoProperties();
            }
            else
            {
                //SearchResidentialPropertiesListing();
            }
        }

        protected void btnGridView_Click(object sender, EventArgs e)
        {
            Session["ListView"] = "ShowGrid";
            //DivGridSearch.Style.Add("display", "block");
            //DivListSearch.Style.Add("display", "none");
        }

        protected void btnListView_Click(object sender, EventArgs e)
        {
            Session["ListView"] = "ShowList";
            //DivListSearch.Style.Add("display", "block");
            //DivGridSearch.Style.Add("display", "none");
        }
        #endregion Button Click's

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
            RepeaterPaging.DataSource = dt;
            RepeaterPaging.DataBind();
        }

        #endregion Pagination Method

        #region Search methods
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
                

              }
              else
              {
                  resultSearch.Visible = true;
                  pagesLink.Visible = false;
                  resultSearch.Text = "Property is not available ";
                  btnGridView.Visible = false;
                  btnListView.Visible = false;
              }

          }
          catch (Exception ex)
          {

          }
          finally
          {

          }
        }
        


        //void SearchResidentialProperties()
        //{
        //    try
        //    {
        //        var data = Convert.ToString(Session["QueryString"]);
        //            Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
        //            DataTable dt = new DataTable();

        //            if (Convert.ToString(Session["QueryString"]) == "Residential" && Session["Municipality"] == null)
        //            {
        //                    dt = mlsClient.GetResidentialProperties("0", "0", "0", "0", "0", "0", "0");
        //            }
        //            else if (Convert.ToString(Session["QueryString"]) == "Residential" && Session["Municipality"] != "")
        //            {
        //                dt = mlsClient.GetResidentialProperties(Session["Municipality"].ToString(), "0", "0", "0", "0", "0", "0");
        //            }
        //        else if ((Convert.ToString(Session["SearchType"]).ToString() == "Residential"))
                   
        //            {
        //                dt = mlsClient.GetResidentialProperties(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Beds"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());
        //            }
                   
                  

        //            if (dt.Rows.Count > 0)
        //            {
        //                string str = "select * from [TblLastUpdated]";
        //                SqlDataAdapter adp = new SqlDataAdapter(str, con);
        //                DataTable dtt = new DataTable();
        //                adp.Fill(dtt);
        //                dt.TableName = "ContactedUsers";
        //                if (dtt.Rows.Count > 0)
        //                {
        //                    DateTime datetime = Convert.ToDateTime(dtt.Rows[0]["LastUpdated"].ToString());
        //                    string date = datetime.ToShortDateString();
        //                    lbldate.Text = ("Last Updated On") + " " + date;
        //                }
        //                count.Text = ("Total Record Found") + " " + dt.Rows.Count;
        //                upSearch.Visible = true;
        //                PagedDataSource pagedData = new PagedDataSource();
        //                pagedData.DataSource = dt.DefaultView;
        //                pagedData.AllowPaging = true;
        //                pagedData.PageSize = 8;
        //                pagedData.CurrentPageIndex = CurrentPage;
        //                ViewState["totpage"] = pagedData.PageCount;
        //                lnkPrevious.Visible = !pagedData.IsFirstPage;
        //                lnkNext.Visible = !pagedData.IsLastPage;
        //                lnkFirst.Visible = !pagedData.IsFirstPage;
        //                lnkLast.Visible = !pagedData.IsLastPage;

        //                rptSearchResults.DataSource = pagedData;
        //                rptSearchResults.DataBind();
        //                rptSearchResultList.DataSource = pagedData;
        //                rptSearchResultList.DataBind();

        //                doPaging();
        //                RepeaterPaging.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
        //                mlsClient = null;
                        
        //            }
        //            else
        //            {
        //                resultSearch.Visible = true;
        //                pagesLink.Visible = false;
        //                resultSearch.Text = "Property is not available ";
        //                btnGridView.Visible = false;
        //                btnListView.Visible = false;
        //            }

        //        }
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
        //        else if (Convert.ToString(Session["QueryString"]) == "Commercial" && Session["Municipality"] != null)
                
        //        {
        //            dt = mlsClient.GetAllCommercialProperties(Session["Municipality"].ToString(), "0", "0", "0", "0", "0");
        //        }
        //        else if ((Convert.ToString(Session["SearchType"]).ToString() == "Commercial"))
        //        {
        //            dt = mlsClient.GetAllCommercialProperties(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());
        //        }
               
        //        //if (Convert.ToString(Session["QueryString"]) == "Commercial")
        //        //    dt = mlsClient.GetAllCommercialProperties("0", "0", "0", "0", "0", "0");
        //        //else
        //        //    dt = mlsClient.GetAllCommercialProperties(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());
        //        if (dt.Rows.Count > 0)
        //        {
        //            string str = "select * from [TblLastUpdated]";
        //            SqlDataAdapter adp = new SqlDataAdapter(str, con);
        //            DataTable dtt = new DataTable();
        //            adp.Fill(dtt);
        //            dt.TableName = "ContactedUsers";
        //            if (dtt.Rows.Count > 0)
        //            {
        //                DateTime datetime = Convert.ToDateTime(dtt.Rows[0]["LastUpdated"].ToString());
        //                string date = datetime.ToShortDateString();
        //                lbldate.Text = ("Last Updated On") + " " + date;
        //            }
        //            count.Text = ("Total Record Found") + " " + dt.Rows.Count;
        //            upSearch.Visible = true;
        //            PagedDataSource pagedData = new PagedDataSource();
        //            pagedData.DataSource = dt.DefaultView;
        //            pagedData.AllowPaging = true;
        //            pagedData.PageSize = 8;
        //            pagedData.CurrentPageIndex = CurrentPage;
        //            ViewState["totpage"] = pagedData.PageCount;

        //            lnkPrevious.Visible = !pagedData.IsFirstPage;
        //            lnkNext.Visible = !pagedData.IsLastPage;
        //            lnkFirst.Visible = !pagedData.IsFirstPage;
        //            lnkLast.Visible = !pagedData.IsLastPage;

        //            rptSearchCommercialResult.DataSource = pagedData;
        //            rptSearchCommercialResult.DataBind();

        //            rptCommercialResultList.DataSource = pagedData;
        //            rptCommercialResultList.DataBind();

        //            doPaging();
        //            RepeaterPaging.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
        //            mlsClient = null;
        //        }
        //        else
        //        {
        //            resultSearch.Visible = true;
        //            pagesLink.Visible = false;
        //            resultSearch.Text = "Property is not available ";
        //            btnGridView.Visible = false;
        //            btnListView.Visible = false;
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
        //        else if(Convert.ToString(Session["QueryString"]) == "Condo" && Session["Municipality"] != null)
        //        //else if (Session["Municipality"] != null)
        //        {
        //            dt = mlsClient.GetProperties_Condo(Session["Municipality"].ToString(), "0", "0", "0", "0", "0", "0");
        //        }
        //        else if ((Convert.ToString(Session["SearchType"]).ToString() == "Condo"))
        //            dt = mlsClient.GetProperties_Condo(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Beds"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());
              
        //        if (dt.Rows.Count > 0)
        //        {
        //            string str = "select * from [TblLastUpdated]";
        //            SqlDataAdapter adp = new SqlDataAdapter(str, con);
        //            DataTable dtt = new DataTable();
        //            adp.Fill(dtt);
        //            dt.TableName = "ContactedUsers";
        //            if (dtt.Rows.Count > 0)
        //            {
        //                DateTime datetime = Convert.ToDateTime(dtt.Rows[0]["LastUpdated"].ToString());
        //                string date = datetime.ToShortDateString();
        //                lbldate.Text = ("Last Updated On") + " " + date;
        //            }
        //            count.Text = ("Total Record Found") + " " + dt.Rows.Count;
        //            upSearch.Visible = true;
        //            PagedDataSource pagedData = new PagedDataSource();
        //            pagedData.DataSource = dt.DefaultView;
        //            pagedData.AllowPaging = true;
        //            pagedData.PageSize = 8;
        //            pagedData.CurrentPageIndex = CurrentPage;
        //            ViewState["totpage"] = pagedData.PageCount;

        //            lnkPrevious.Visible = !pagedData.IsFirstPage;
        //            lnkNext.Visible = !pagedData.IsLastPage;
        //            lnkFirst.Visible = !pagedData.IsFirstPage;
        //            lnkLast.Visible = !pagedData.IsLastPage;

        //            rptSearchCondoResult.DataSource = pagedData;
        //            rptSearchCondoResult.DataBind();

        //            rptCondoResultList.DataSource = pagedData;
        //            rptCondoResultList.DataBind();

        //            doPaging();
        //            RepeaterPaging.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
        //            mlsClient = null;
        //        }
        //        else
        //        {
        //            pagesLink.Visible = false;
        //            resultSearch.Visible = true;
        //            resultSearch.Text = "Property is not available ";
        //            btnGridView.Visible = false;
        //            btnListView.Visible = false;
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    finally
        //    {

        //    }
        //}

        //void SearchResidentialPropertiesSearch()
        //{
        //    try
        //    {
        //        Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
        //        DataTable dt = new DataTable();
        //        if (Convert.ToString(Session["QueryString"]) == "Residential" || Convert.ToString(Session["QueryString"]) == "IDXImagesResidential")
        //            dt = mlsClient.GetResidentialProperties("0", "0", "0", "0", "0", "0", "0");
        //        else
        //            dt = mlsClient.GetResidentialProperties(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Beds"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());
              
        //        if (dt.Rows.Count > 0)
        //        {
        //            string str = "select * from [TblLastUpdated]";
        //            SqlDataAdapter adp = new SqlDataAdapter(str, con);
        //            DataTable dtt = new DataTable();
        //            adp.Fill(dtt);
        //            dt.TableName = "ContactedUsers";
        //            if (dtt.Rows.Count > 0)
        //            {
        //                DateTime datetime = Convert.ToDateTime(dtt.Rows[0]["LastUpdated"].ToString());
        //                string date = datetime.ToShortDateString();
        //                lbldate.Text = ("Last Updated On") + " " + date;
        //            }
        //            count.Text = ("Total Record Found") + " " + dt.Rows.Count;
        //            upSearch.Visible = true;
        //            PagedDataSource pagedData = new PagedDataSource();
        //            pagedData.DataSource = dt.DefaultView;
        //            pagedData.AllowPaging = true;
        //            pagedData.PageSize = 8;
        //            pagedData.CurrentPageIndex = CurrentPage;
        //            ViewState["totpage"] = pagedData.PageCount;

        //            lnkPrevious.Visible = !pagedData.IsFirstPage;
        //            lnkNext.Visible = !pagedData.IsLastPage;
        //            lnkFirst.Visible = !pagedData.IsFirstPage;
        //            lnkLast.Visible = !pagedData.IsLastPage;

        //            rptSearchResults.DataSource = pagedData;
        //            rptSearchResults.DataBind();

        //            rptSearchResultList.DataSource = pagedData;
        //            rptSearchResultList.DataBind();

        //            doPaging();
        //            RepeaterPaging.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
        //            mlsClient = null;
        //        }
        //        else
        //        {
        //            resultSearch.Visible = true;
        //            pagesLink.Visible = false;
        //            resultSearch.Text = "Property is not available ";
        //            btnGridView.Visible = false;
        //            btnListView.Visible = false;
        //        }

        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    finally
        //    {

        //    }
        //}

        //void SearchCommercialPropertiesSearch()
        //{
        //    try
        //    {
        //        Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();

        //        DataTable dt = new DataTable();
        //        if (Convert.ToString(Session["QueryString"]) == "Commercial")
        //            dt = mlsClient.GetAllCommercialProperties("0", "0", "0", "0", "0", "0");
        //        else
        //            dt = mlsClient.GetAllCommercialProperties(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());
             
        //        if(dt.Rows.Count >0)
        //        {
        //            string str = "select * from [TblLastUpdated]";
        //            SqlDataAdapter adp = new SqlDataAdapter(str, con);
        //            DataTable dtt = new DataTable();
        //            adp.Fill(dtt);
        //            dt.TableName = "ContactedUsers";
        //            if (dtt.Rows.Count > 0)
        //            {
        //                DateTime datetime = Convert.ToDateTime(dtt.Rows[0]["LastUpdated"].ToString());
        //                string date = datetime.ToShortDateString();
        //                lbldate.Text = ("Last Updated On") + " " + date;
        //            }
        //            count.Text = ("Total Record Found") + " " + dt.Rows.Count;
        //            upSearch.Visible = true;
        //            PagedDataSource pagedData = new PagedDataSource();
        //            pagedData.DataSource = dt.DefaultView;
        //            pagedData.AllowPaging = true;
        //            pagedData.PageSize = 8;
        //            pagedData.CurrentPageIndex = CurrentPage;
        //            ViewState["totpage"] = pagedData.PageCount;

        //            lnkPrevious.Visible = !pagedData.IsFirstPage;
        //            lnkNext.Visible = !pagedData.IsLastPage;
        //            lnkFirst.Visible = !pagedData.IsFirstPage;
        //            lnkLast.Visible = !pagedData.IsLastPage;

        //            rptSearchCommercialResult.DataSource = pagedData;
        //            rptSearchCommercialResult.DataBind();

        //            rptCommercialResultList.DataSource = pagedData;
        //            rptCommercialResultList.DataBind();

        //            doPaging();
        //            RepeaterPaging.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
        //            mlsClient = null;
        //        }
        //        else
        //        {
        //            resultSearch.Visible = true;
        //            pagesLink.Visible = false;
        //            resultSearch.Text = "Property is not available ";
        //            btnGridView.Visible = false;
        //            btnListView.Visible = false;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    {
        //    }
        //}

        //void SearchCondoPropertiesSearch()
        //{
        //    try
        //    {
        //        Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();

        //        DataTable dt = new DataTable();
        //        if (Convert.ToString(Session["QueryString"]) == "Condo")
        //            dt = mlsClient.GetProperties_Condo("0", "0", "0", "0", "0", "0", "0");
        //        else
        //            dt = mlsClient.GetProperties_Condo(Session["SearchText"].ToString(), Session["HomeType"].ToString(), Session["MinPrice"].ToString(), Session["MaxPrice"].ToString(), Session["Beds"].ToString(), Session["Baths"].ToString(), Session["SaleLease"].ToString());
             
        //        if (dt.Rows.Count > 0)
        //        {
        //            string str = "select * from [TblLastUpdated]";
        //            SqlDataAdapter adp = new SqlDataAdapter(str, con);
        //            DataTable dtt = new DataTable();
        //            adp.Fill(dtt);
        //            dt.TableName = "ContactedUsers";
        //            if (dtt.Rows.Count > 0)
        //            {
        //                DateTime datetime = Convert.ToDateTime(dtt.Rows[0]["LastUpdated"].ToString());
        //                string date = datetime.ToShortDateString();
        //                lbldate.Text = ("Last Updated On") + " " + date;
        //            }
        //            count.Text = ("Total Record Found") + " " + dt.Rows.Count;
        //            upSearch.Visible = true;
        //            PagedDataSource pagedData = new PagedDataSource();
        //            pagedData.DataSource = dt.DefaultView;
        //            pagedData.AllowPaging = true;
        //            pagedData.PageSize = 8;
        //            pagedData.CurrentPageIndex = CurrentPage;
        //            ViewState["totpage"] = pagedData.PageCount;

        //            lnkPrevious.Visible = !pagedData.IsFirstPage;
        //            lnkNext.Visible = !pagedData.IsLastPage;
        //            lnkFirst.Visible = !pagedData.IsFirstPage;
        //            lnkLast.Visible = !pagedData.IsLastPage;

        //            rptSearchCondoResult.DataSource = pagedData;
        //            rptSearchCondoResult.DataBind();

        //            rptCondoResultList.DataSource = pagedData;
        //            rptCondoResultList.DataBind();

        //            doPaging();
        //            RepeaterPaging.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
        //            mlsClient = null;
        //        }
        //        else
        //        {
        //            pagesLink.Visible = false;
        //            resultSearch.Visible = true;
        //            resultSearch.Text = "Property is not available ";
        //            btnGridView.Visible = false;
        //            btnListView.Visible = false;
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
        //       DataTable dt = mlsClient.GetResidentialProperties(Session["Municipality"].ToString(), "0", "0", "0", "0", "0", "0");
                
        //        if (dt.Rows.Count > 0)
        //        {
        //            string str = "select * from [TblLastUpdated]";
        //            SqlDataAdapter adp = new SqlDataAdapter(str, con);
        //            DataTable dtt = new DataTable();
        //            adp.Fill(dtt);
        //            dt.TableName = "ContactedUsers";
        //            if (dtt.Rows.Count > 0)
        //            {
        //                DateTime datetime = Convert.ToDateTime(dtt.Rows[0]["LastUpdated"].ToString());
        //                string date = datetime.ToShortDateString();
        //                lbldate.Text = ("Last Updated On") + " " + date;
        //            }
        //            count.Text = ("Total Record Found") + " " + dt.Rows.Count;
        //            upSearch.Visible = true;
        //            PagedDataSource pagedData = new PagedDataSource();
        //            pagedData.DataSource = dt.DefaultView;
        //            pagedData.AllowPaging = true;
        //            pagedData.PageSize = 8;
        //            pagedData.CurrentPageIndex = CurrentPage;
        //            ViewState["totpage"] = pagedData.PageCount;
        //            lnkPrevious.Visible = !pagedData.IsFirstPage;
        //            lnkNext.Visible = !pagedData.IsLastPage;
        //            lnkFirst.Visible = !pagedData.IsFirstPage;
        //            lnkLast.Visible = !pagedData.IsLastPage;
        //            rptSearchResults.DataSource = pagedData;
        //            rptSearchResults.DataBind();
        //            rptSearchResultList.DataSource = pagedData;
        //            rptSearchResultList.DataBind();
        //            doPaging();
        //            RepeaterPaging.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
        //            mlsClient = null;
        //        }
        //    }
        //    catch (Exception ex)
        //    {   
        //    }
        //    finally
        //    {
        //    }
        //}
        #endregion Search Methods

    
    }
}