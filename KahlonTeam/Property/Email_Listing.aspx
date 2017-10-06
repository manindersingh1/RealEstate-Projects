﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Property_New.Master" ValidateRequest="false" AutoEventWireup="true"
    CodeBehind="Email_Listing.aspx.cs" Inherits="Property.Email_Listing" %>

<%--<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="slider/css/style.css" rel="stylesheet" />
     <div class="container">
    <div id="Property" runat="server" class="email_head">
    </div>
    <div class="Free-Home">
        <div class="Infomation">
            <asp:Label ID="lblFriendEmail" runat="server" Text="Friend's Email:"></asp:Label><label style="color: red">*</label>
            <asp:TextBox ID="txtFriendEmail" runat="server" PlaceHolder=" Email"></asp:TextBox>
            <div class="Email_ErrorMessege">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ErrorMessage="Email is Required " ForeColor="Red"
                    ControlToValidate="txtFriendEmail" ValidationGroup="css"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="txtFriendEmail" Display="Dynamic" ErrorMessage="Invalid email!" ValidationGroup="SaveContactInfo">  
                </asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblSubject" runat="server" Text="Subject:"></asp:Label><label style="color: red">*</label>
            <asp:TextBox ID="txtSubject" runat="server" PlaceHolder="Subject"></asp:TextBox>
            <div class="Email_ErrorMessege">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ErrorMessage="Subject is Required"  ForeColor="Red"
                    ControlToValidate="txtSubject" ValidationGroup="css"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblComments" runat="server" Text="Comments: "></asp:Label>
            <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" PlaceHolder="Comments"></asp:TextBox>
           <p class="eml_lstng_p"><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtComments"
                ID="RegularExpressionValidator3" ValidationExpression="^[\s\S]{0,150}$"  runat="server"
                ErrorMessage="Maximum 150 characters required."></asp:RegularExpressionValidator></p>

        </div> 
        <div class="Infomation_1_email">
        
            <asp:Label ID="lblFormSubmission" runat="server" Text="Form Submission: "></asp:Label>
            <p>
                Type the characters from the picture In the box below, type the characters that
                you see in the picture. This helps ensure that a person, not an automated program,
                is submitting the form
            </p>
        </div>
      
        <div class="Infomation">
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            <div class="new_email_list">
                <asp:ScriptManager ID="SM1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UP1" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td class="Captcha">
                                    <asp:Label ID="imgCaptcha" runat="server" Text=""></asp:Label>
                                    <%--    <asp:Image ID="imgCaptcha" runat="server" />--%>
                                </td>
                                <td valign="middle">
                                    <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>  
        <div class="Infomation">
            <asp:Label ID="Label2" runat="server" Text="Enter Captcha: "></asp:Label><label style="color: red">*</label>
            <asp:TextBox ID="txtCaptcha" runat="server" class="email_text" PlaceHolder="Captcha"></asp:TextBox>
            <div class="Email_ErrorMessege">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ErrorMessage="*Required"  ForeColor="Red"
                    ControlToValidate="txtCaptcha" ValidationGroup="css"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="btn_email">
            <p>
                <asp:Label ID="lblErrorMessage" runat="server" Font-Names="Arial" Text=""></asp:Label></p>
            <asp:Button ID="btnVerify" runat="server" Text="Send Mail" OnClick="btnVerify_Click"
                ValidationGroup="css" />
        </div>      
    </div>
    <asp:Literal ID="literal" runat="server"></asp:Literal>
    <%--<div  visible="false" id="divEmail" runat="server" style="width:100%; float:left;">
 <h2 style="font-weight:bold; font-size:16px;">pwalia@gmail.com for Property ID 101100363</h2>
 <h2 style="font-weight:bold; font-size:16px;">Message Received From:</h2>
 <p style="float:left; margin:0 103px 0 0;">Name:</p><span style="float:left;">Parampreet Walia</span><br/>
 <p style="float:left; margin:0 40px 0 0;">E-mail Address:</p><span style="float:left;">pwalia@gmail.com</span><br/>
 <p style="float:left; margin:0 40px 0 0;">Phone Number:</p><span style="float:left;">416-800-5007</span><br/>
 <h2 style="font-weight:bold; font-size:16px;">Message:</h2>
 <p>Please take a look at Property ID# 101100363 located at 16 Bretton Circle, Markham, ON.</p>
 <h2 style="font-weight:bold; font-size:16px;">Referring Page:</h2>
 <p>leila.khan/property/101100363</p>
 <h2 style="font-weight:bold; font-size:16px;">Property Information:</h2>
 <div style="float:left; width:30%;">
  <h2 style="font-weight:bold; font-size:16px; margin:0px;">$1,119,000<br />
16 Bretton Circle<br/>
Markham, ON L3S 3P9<br/>
Property ID: 101100363</h2>
 </div>
 <div style="float:left;">
  <p style="float:left; margin:0 12px 0 0; font-weight:bold;">Beds:</p><span style="float:left; margin:0 30px 0 0;">4</span>
  <p style="float:left; margin:0 12px 0 0; font-weight:bold;">Beds:</p><span style="float:left;">4</span><br/>
  <p style="float:left; margin:0 12px 0 0; font-weight:bold;">Square Feet:</p><span style="float:left;">0</span><br/>
  <p style="float:left; margin:0 12px 0 0; font-weight:bold;">Year Built:</p><span style="float:left;"></span><br/>
  <p style="float:left; margin:0 12px 0 0; font-weight:bold;">Style:</p><span style="float:left;">Residential</span><br/>
 </div>
 <p style="float:left; width:100%;">For more information on this property, <a href="#">click HERE.</a></p>


<div style="float:left; width:100%;">  
<div style="float:left; margin:0 0 0 250px; border-right:1px solid grey; padding-right:7px; width:400px;">
    <div style="float:left; margin:0 56px 0 0;">
       <p style="margin:0px;">16 Bretton Circle<br/>
         Markham, ON L3S 3P9
       </p>
</div>
<div style="float:left;">
<p style="margin:0px;">$1,119,000</p>
 <p style="float:left; margin:0 40px 0 0; font-size:12px;">Property ID:</p><span style="float:left; font-size:12px;">101100363</span><br/>
</div>
   <p style="float:left; width:100%;">ELEGANT EXECUTIVE GREENPARK HOME IN PRESTIGIOUS ROUGE FAIRWAYS</p>
   <p>Welcome to this Immaculate home situated In the highly sought after community of Rouge Fairways. Nestled between two golf courses, this stunner offers your Family over  3,300 Sq Ft of luxurious living space.  This Premium Corner Lot features a wrap-around porch with an interlocking pathway leading to the main entrance. This home has a multitude of upgrades including a newly designed Chef's kitchen with Quartz counter top, Crown Moldings, modern design cabinetry, Stainless Steel Appliances , gleaming hardwood flooring throughout and upgraded California Shutters.  The spacious eat-in-kitchen has direct access to your private backyard Oasis and fully landscaped yard. <br/>
   This home is ideal for entertaining, as you are immediately greeted by the Grand Foyer leading into a spacious and bright living space.  Convenient Main Floor Office and laundry room with direct access to the garage.   The spiral oak staircase leads you to the second floor where you are greeted by a Divine Master Retreat with a large walk-in closet and a 5-piece bathroom. <br/>
   The meticulously finished basement offers an open concept Living combined with Dining area.  Potlights, wall sconces and a fully equipped second kitchen, finish off this space quite nicely.  With two additional Bedrooms and an upgraded Three Piece Bathroom, this home truly has it all.<br/>
   Conveniently located, this home is just steps to the public school, minutes from the parks and public transit. Come and see why this home shows as a Perfect Ten.  This can be your next home.<br/>   
   </p>
   <br/>
   <br/>
   <p>For more information visit <a href="#">www.century21.ca/leila.khan/Property/ON/L3S_3P9/Markham/16_Bretton_Circle.</a> </p> 
</div>
  <div style="float:left; padding-left:12px;">
  <p style="margin:0px;">Listed By</p>
  <br/>
  <p>Leila Khan<br/>
  Sales Representative 
  </p>
  <h2 style="font-size:16px;">Leading Edge Realty Inc.</h2>
  <p style="margin:0px;">165 Main Street North<br/>
Markham, ON L3P 1Y2</p>
  <p style="float:left; margin:0 40px 0 0; font-weight:bold;">Cell::</p><span style="float:left;">416-300-3453</span><br/>
  <p style="float:left; margin:0 40px 0 0; font-weight:bold;">Office:</p><span style="float:left;">905-471-2121</span><br/>
  <p style="float:left; margin:0 40px 0 0; font-weight:bold;">Office Fax:</p><span style="float:left;">905-471-0832</span><br/>
   <p style="float:left; margin:0 40px 0 0; font-weight:bold;">E-mail:</p><span style="float:left;"> 	leila.khan@century21.ca</span><br/>
    <p style="float:left; margin:0 40px 0 0; font-weight:bold;">Website:</p><span style="float:left;">www.century21.ca/leila.khan</span><br/>
  
  </div>
</div>  
<div style="float:left; width:100%;">
 <div style="float:left; margin:0 0 0 250px; border-right:1px solid grey; padding-right:7px; width:400px; border-top:1px solid grey;">
 
 <h2 style="font-size:16px;">Property Details</h2>
 <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">ID:</p><span style="float:left;">N3339145</span></div>
  <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Style:</p><span style="float:left;">Residential</span></div>
  <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Beds:</p><span style="float:left;">4</span></div>
  <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Baths:</p><span style="float:left;">4   (Full: 2   3/4: 1   1/2: 1   Other: 0)</span></div>
  <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Washrooms:</p><span style="float:left;">4</span></div>
  <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Status:</p><span style="float:left;">Active</span></div>
  <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Total Rooms:</p><span style="float:left;">9</span></div>
  <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Storeys:</p><span style="float:left;">2</span></div>
  <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Fireplaces:</p><span style="float:left;">1</span></div>
  <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">New Construction:</p><span style="float:left;">No</span></div>
   <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Financial Considerations Estimated Annual Taxes:</p><span style="float:left;">$5,663</span></div>
    <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Locale County:</p><span style="float:left;">York</span></div>
     <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">High School:</p><span style="float:left;">Markham District Highschool</span></div>
      <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Elementary School:</p><span style="float:left;">Boxwood Public School</span></div> 
      <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Neighbourhood:</p><span style="float:left;">Rouge Fairways Community</span></div>
          <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">School District:</p><span style="float:left;"> 	York Region</span></div>
         
           <h2 style="font-size:16px;">Property Details</h2>
            <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Bedroom 5</p><span style="float:left;">Lower Level 	4.27 M X 3.22 M</span></div>
              <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Kitchen</p><span style="float:left;">Lower Level 	4.27 M X 3.22 M</span></div>
              <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Living / Dining Room</p><span style="float:left;">Lower Level 	4.27 M X 3.22 M</span></div>
              <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Den / Office</p><span style="float:left;">Lower Level 	4.27 M X 3.22 M</span></div>
              <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Dining Room</p><span style="float:left;">Lower Level 	4.27 M X 3.22 M</span></div>
              <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Family Room</p><span style="float:left;">Lower Level 	4.27 M X 3.22 M</span></div>
              <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Kitchen</p><span style="float:left;">Lower Level 	4.27 M X 3.22 M</span></div>
              <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Living Room</p><span style="float:left;">Lower Level 	4.27 M X 3.22 M</span></div>
              <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Bathroom 2</p><span style="float:left;">Lower Level 	4.27 M X 3.22 M</span></div>
              <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Bathroom 3</p><span style="float:left;">Lower Level 	4.27 M X 3.22 M</span></div>
              <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Bathroom 4</p><span style="float:left;">Lower Level 	4.27 M X 3.22 M</span></div>
              <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Master Bedroom</p><span style="float:left;">Lower Level 	4.27 M X 3.22 M</span></div>
 </div>
   <div style="float:left; padding-left:12px; width:500px; border-top:1px solid grey;">
   <h2 style="font-size:16px;">Features</h2>
   <p style="float:left; width:100%; margin:0px;">Air Conditioning</p>
   <p style="float:left; width:100%;" margin:0px;>Central Air</p>
   <p style="float:left; width:100%; margin:0px;">Basement</p>
    <div style="float:left; width:100%;"><p style="float:left; margin:0 80px 0 0; width:20%;">Full</p><span style="float:left;">Finished</span></div>
   <p style="float:left; width:100%; margin:0px;">Shingle - Newer Roof 2009 (40 Year Shingles) 	Other - Wrap Around</p>
   <p style="float:left; width:100%; margin:0px;">Brick</p>
   <p style="float:left; width:100%; margin:0px;">Family Room</p>
   <p style="float:left; width:100%; margin:0px;">Y - Main Floor Family Room With</p>
   <p style="float:left; width:100%; margin:0px;">Fireplace</p>
   <p style="float:left; width:100%; margin:0px;">Garage Type</p>
   <p style="float:left; width:100%; margin:0px;">Attached</p>
   <p style="float:left; width:100%; margin:0px;">Laundry Access</p>
   <p style="float:left; width:100%; margin:0px;">In Area - Main Floor Laundry</p>
   <p style="float:left; width:100%; margin:0px;">Parking/Drive</p>
      <p style="float:left; width:100%; margin:0px;">Private - Parking For 4 Cars on </p>
         <p style="float:left; width:100%; margin:0px;">Driveway</p>
   </div>
 </div>



</div>--%>

  
         </div>
</asp:Content>
