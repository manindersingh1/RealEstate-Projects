using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using Property_cls;
using System.Data.SqlClient;

namespace Property
{
    public partial class Property2 : System.Web.UI.MasterPage
    {
        #region Global

        cls_Property clsobj = new cls_Property();

        #endregion Global

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMenusList();
            }
        }

        private void BindMenusList()
        {
            StringBuilder StrMenu = new StringBuilder();
            DataTable dt = new DataTable();
            DataTable dtSubmenu = new DataTable();
            dt = clsobj.GetMenuList();

            string PageName = dt.Rows[0]["PageName"].ToString();

            if (dt.Rows.Count > 0)
            {
                StrMenu.Append("<a class='toggleMenu' href='#'></a>");
                StrMenu.Append("<ul class='nav'>");
                StrMenu.Append("<li class='test' style='background:none;'><a href='../Default.aspx' title='Home' class='active'>Home</a></li>");
                StrMenu.Append("<li ><a href='../Featured_Properties.aspx' title='Featured Properties'>Featured Properties</a></li>");

                //seller submenu
                StrMenu.Append("<li ><a href='#' title='Sellers'>Sellers</a>");
                StrMenu.Append("<ul>");
                StrMenu.Append("<li><a href='../sellerinformation.aspx'>Seller information</a></li>");
                StrMenu.Append("<li><a href='../Free-home-evaluation.aspx'>Free Evaluation</a></li>");
                StrMenu.Append("<li><a href='http://www.torontorealestateboard.com/about_GTA/Neighbourhood/index.html' target='_blank'>Neighborhood Sold Report</a></li>");
                StrMenu.Append("</ul>");
                StrMenu.Append("</li>");
                //end seller menu

                StrMenu.Append("<li ><a href='#' title='Buyers'>Buyers</a>");
                StrMenu.Append("<ul>");
                StrMenu.Append("<li><a href='../BuyingAHouse.aspx'>Buying A House</a></li>");
                StrMenu.Append("<li><a href='../ChoosingAMortgageTerm.aspx'>Choosing A Mortgage Term</a></li>");
                StrMenu.Append("<li><a href='../GlossaryOfTerms.aspx'>Glossary Of Terms</a></li>");
                StrMenu.Append("<li><a href='../HelpfulMovingTips.aspx'>Helpful MovingTips</a></li>");
                StrMenu.Append("<li><a href='../MortgageApplicaitonTips.aspx'>Mortgage Applicaiton Tips</a></li>");
                StrMenu.Append("<li><a href='../MortgageApplicationSteps.aspx'>Mortgage Application Steps</a></li>");
                StrMenu.Append("<li><a href='../MortgageGlossary.aspx'>Mortgage Glossary</a></li>");
                StrMenu.Append("<li><a href='../RentingVSBuyingWhichisbetter.aspx'>Renting VS Buying Which is better</a></li>");
                StrMenu.Append("<li><a href='../SaveYourMoneyEveryDay.aspx'>Save Your Money EveryDay</a></li>");
                StrMenu.Append("<li><a href='../SelectingAndWorkingWithARealtor.aspx'>Selecting And Working With A Realtor</a></li>");
                StrMenu.Append("<li><a href='../TheCostofHomeBuyer.aspx'>The Cost of HomeBuyer</a></li>");
                StrMenu.Append("<li><a href='../TheElementsOfAnOffer.aspx'>The Elements Of An Offer</a></li>");
                StrMenu.Append("<li><a href='../TipsforChoosingARealtor.aspx'>Tips for Choosing A Realtor</a></li>");
                StrMenu.Append("<li><a href='../TypesofMortgages.aspx'>Types of Mortgages</a></li>");
                StrMenu.Append("<li><a href='../UnderstandingMarketConditions.aspx'>Understanding Market Conditions</a></li>");
                StrMenu.Append("<li><a href='../WhatIsAMortgage.aspx'>What Is A Mortgage</a></li>");
                StrMenu.Append("<li><a href='../WhyDoINeedHomeInspection.aspx'>Why Do I Need Home Inspection</a></li>");
                StrMenu.Append("<li><a href='../WhyDoYouWantToMove.aspx'>Why Do You Want To Move</a></li>");
                StrMenu.Append("</ul>");
                StrMenu.Append("</li>");
                //submenu
                StrMenu.Append("<li>");
                StrMenu.Append("<a href='#' title='Links'>Links</a>");
                StrMenu.Append("<ul>");
                StrMenu.Append("<li><a href='../UsefulSearchTools.aspx'>Search Tools</a></li>");
                StrMenu.Append("<li><a href='../RealEstateandHousings.aspx'>Real Estate & Housings</a></li>");
                StrMenu.Append("<li><a href='../Utilities.aspx'>Utilities</a></li>");
                StrMenu.Append("<li><a href='../SchoolBoardsUniversities.aspx'>School Boards, Universities, Colleges</a></li>");
                StrMenu.Append("<li><a href='../BanksandFinancialInstitutions.aspx'>Banks and Financial Institutions</a></li>");
                StrMenu.Append("<li><a href='../Transportation.aspx'>Transportation</a></li>");
                StrMenu.Append("<li><a href='../HospitalsandHealthCentres.aspx'>Hospitals and Health Centres</a></li>");
                StrMenu.Append("<li><a href='../Government.aspx'>Government</a></li>");
                StrMenu.Append("</ul>");
                StrMenu.Append("</li>");
                //end submenu
                //StrMenu.Append("<li ><a href='../Blog.aspx' title='Blogs'>Blogs</a></li>");

                //for (int i = 0; i < dt.Rows.Count; i++)
                //{
                //    clsobj.PageID = Convert.ToInt32(dt.Rows[i]["ID"]);
                //    dtSubmenu = clsobj.GetSubMenuBy_PageID();
                //    //check if it has submenu 
                //    if (dtSubmenu.Rows.Count > 0)
                //    {
                //        StrMenu.Append("<li><a href=../Default.aspx>" + dt.Rows[i]["PageName"] + "</a>");//</li>
                //        StrMenu.Append("<ul>");
                //        for (int j = 0; j < dtSubmenu.Rows.Count; j++)
                //        {
                //            StrMenu.Append("<li><a href='../StaticPages.aspx?PageID=" + dtSubmenu.Rows[j]["id"] + "' title='" + dtSubmenu.Rows[j]["PageName"] + "'>" + dtSubmenu.Rows[j]["PageName"] + "</a> </li>");
                //        }
                //        StrMenu.Append("</ul>");
                //        StrMenu.Append("</li>");
                //    }
                //    else
                //    {
                //        StrMenu.Append("<li><a href='../StaticPages.aspx?PageID=" + dt.Rows[i]["id"] + "' title='" + dt.Rows[i]["PageName"] + "'>" + dt.Rows[i]["PageName"] + "</a>");//</li>
                //    }
                //}

                StrMenu.Append("</ul>");

            }

            Div_menu_bg.InnerHtml = StrMenu.ToString();

        }
    }
}