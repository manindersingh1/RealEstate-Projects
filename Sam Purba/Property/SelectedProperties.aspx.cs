using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Property_cls;


namespace Property
{
    public partial class SelectedProperties : System.Web.UI.Page
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
            SearchResidentialProperties();
        }
        #endregion PageLoad

        #region Pagination Repeater Events

        protected void RepeaterPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("newpage"))
            {
                CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());

                if (Session["SearchType"] == "Residential" || Convert.ToString(Session["QueryString"]) == "Residential"
                    )
                {
                    SearchResidentialProperties();
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
                        Response.Redirect("~/Login.aspx", false);
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
                            hypImage.NavigateUrl = "~/Login.aspx";
                            hypAddress.NavigateUrl = "~/Login.aspx";
                        }
                        else
                        {
                            hypImage.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
                            hypAddress.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
                        }
                    }
                    else
                    {
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

        #region Commercial Repeater Events

        protected void rptSearchCommercialResult_ItemCommand(object source, RepeaterCommandEventArgs e)
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
                        Response.Redirect("~/Login.aspx", false);
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

        protected void rptSearchCommercialResult_ItemDataBound(object sender, RepeaterItemEventArgs e)
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

        protected void rptCommercialResultList_ItemCommand(object source, RepeaterCommandEventArgs e)
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

        protected void rptCommercialResultList_ItemDataBound(object sender, RepeaterItemEventArgs e)
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
                            hypImage.NavigateUrl = "~/Login.aspx";
                            hypAddress.NavigateUrl = "~/Login.aspx";
                        }
                        else
                        {
                            hypImage.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
                            hypAddress.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
                        }
                    }
                    else
                    {
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

        #endregion Commercial Repeater Events

        #region Condo Repeater Events

        protected void rptSearchCondoResult_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                HiddenField hdnType = (HiddenField)e.Item.FindControl("hdnType");
                HiddenField hdnVOX = (HiddenField)e.Item.FindControl("hdnVOX");
                //LinkButton lnkAddToFavourite = (LinkButton)e.Item.FindControl("lnkAddToFavourite");

                if (e.CommandName == "LockButton")
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

        protected void rptSearchCondoResult_ItemDataBound(object sender, RepeaterItemEventArgs e)
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

        protected void rptCondoResultList_ItemCommand(object source, RepeaterCommandEventArgs e)
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

        protected void rptCondoResultList_ItemDataBound(object sender, RepeaterItemEventArgs e)
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
                            hypImage.NavigateUrl = "~/Login.aspx";
                            hypAddress.NavigateUrl = "~/Login.aspx";
                        }
                        else
                        {
                            hypImage.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
                            hypAddress.NavigateUrl = "~/PropertyDetails.aspx?MLSID=" + hdnMLSID.Value + "&PropertyType=" + hdnType.Value;
                        }
                    }
                    else
                    {
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

        #endregion Condo Repeater Events

        #region Button Click's

        protected void lnkPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;

            if (Session["SearchType"] == "Residential" || Convert.ToString(Session["QueryString"]) == "Residential")
            {
                SearchResidentialProperties();
            }
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            if (Session["SearchType"] == "Residential" || Convert.ToString(Session["QueryString"]) == "Residential")
            {
                SearchResidentialProperties();
            }
        }

        protected void lnkFirst_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;

            if (Session["SearchType"] == "Residential" || Convert.ToString(Session["QueryString"]) == "Residential")
            {
                SearchResidentialProperties();
            }
        }

        protected void lnkLast_Click(object sender, EventArgs e)
        {
            CurrentPage = (Convert.ToInt32(ViewState["totpage"]) - 1);

            if (Session["SearchType"] == "Residential" || Convert.ToString(Session["QueryString"]) == "Residential")
            {
                SearchResidentialProperties();
            }
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

        void SearchResidentialProperties()
        {
            try
            {
                Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
                DataTable dt = new DataTable();
                dt = mlsClient.GetResidentialPropertiesTop10("0", "0", "0", "0", "0", "0", "0");
                if (dt.Rows.Count > 0)
                {
                    lblcount.Text = "" + Convert.ToString(dt.Rows.Count) + "  Matches Found";
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
                    mlsClient = null;
                }
                else
                {
                    resultSearch.Visible = true;
                    pagesLink.Visible = false;
                    resultSearch.Text = "Property is not available ";
                }

            }
            catch (Exception ex)
            {

            }
            finally
            {

            }
        }
        #endregion Search Methods

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] GetAutoCompleteData(string prefixText, int count, string contextKey)
        {
            List<String> itemNames = new List<String>();
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = ml.GetAutoCompleteData(prefixText);
            foreach (DataRow dr in dt.Rows)
            {
                String item = dr["Province"].ToString();

                itemNames.Add(item);
            }
            string[] prefixTextArray = itemNames.ToArray();
            return prefixTextArray;
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] GetAutoCompleteData_Comm(string prefixText, int count, string contextKey)
        {
            List<String> itemNames = new List<String>();
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = ml.GetAutoCompleteData_Comm(prefixText);
            foreach (DataRow dr in dt.Rows)
            {
                String item = dr["Province"].ToString();

                itemNames.Add(item);
            }
            string[] prefixTextArray = itemNames.ToArray();
            return prefixTextArray;
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] GetAutoCompleteData_Condo(string prefixText, int count, string contextKey)
        {
            List<String> itemNames = new List<String>();
            Property1.MLSDataWebServiceSoapClient ml = new Property1.MLSDataWebServiceSoapClient();
            DataTable dt = ml.GetAutoCompleteData_Condo(prefixText);
            foreach (DataRow dr in dt.Rows)
            {
                String item = dr["Province"].ToString();

                itemNames.Add(item);
            }
            string[] prefixTextArray = itemNames.ToArray();
            return prefixTextArray;
        }
    }
}