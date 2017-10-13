using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Data.Entity;
using System.Web.Configuration;
using System.Configuration;
//using System.Net;
//using System.Text;
//using Newtonsoft.Json.Linq;


using Quartz;
using CommunicationApp.Infrastructure;
using CommunicationApp.Web.Models;
using CommunicationApp.Services;
using AutoMapper;
using CommunicationApp.Entity;
using CommunicationApp.Core.Infrastructure;
using CommunicationApp.Web.Infrastructure.PushNotificationFile;
using System.Data;

namespace CommunicationApp.Web.Infrastructure.AsyncTask
{
    public class SendMessageJob : IJob
    {
       
        public void Execute(IJobExecutionContext context)
        {

            JobDataMap dataMap = context.JobDetail.JobDataMap;
            int Admin = Convert.ToInt32(dataMap.GetString("AdminId"));
            string CustomerIds = dataMap.GetString("CustomerIds");
            string Heading = dataMap.GetString("Heading");
            string Message = dataMap.GetString("Message");//
            string ImageUrl = dataMap.GetString("ImageUrl");
            string IsWithImage = dataMap.GetString("IsWithImage");
            CommonClass CommonClass=new Services.CommonClass();
            string QStr = "";
            DataTable dt = new DataTable();
            QStr = "select CustomerId from Customer where ParentId=" + Admin;
            dt = CommonClass.GetDataSet(QStr).Tables[0];
            var Ids = CustomerIds.Split(',');
            if (Ids!=null)
            {
               foreach(var CustomerId in Ids )
               {
                   SendNotificationsToUsers(Convert.ToInt32(CustomerId), Heading, Message, ImageUrl, IsWithImage);
               }
            }
            else
            {
                if (dt.Rows.Count > 0)
                {
                    SendNotificationsToUsers(Convert.ToInt32(dt.Rows[0]["CustomerId"]), Heading, Message, ImageUrl, IsWithImage);
                }
            }
           
        }
        public void SendNotificationsToUsers(int CustomerId, string Heading, string Message, string ImageUrl, string IsWithImage)
        {
            string Flag = "15";
            
            //send notification
           // var Customers = _CustomerService.GetCustomers().Where(c => c.CustomerId != CustomerId && c.IsActive == true).ToList();
            CommonClass CommonClass = new Services.CommonClass();
            string QStr = "";
            DataTable dt = new DataTable();
            QStr = "Select * From Customer where CustomerId = " +CustomerId + " and IsActive=1";
            dt = CommonClass.GetDataSet(QStr).Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    var ApplicationId = dr["ApplicationId"].ToString();
                    var DeviceType = dr["DeviceType"].ToString();
                    //var IsNotificationSoundOn = Convert.ToBoolean(dr["IsNotificationSoundOn"]);
                    var IsNotificationSoundOn = true;
                    if(ApplicationId != null && ApplicationId != "")
                    {

                        bool NotificationStatus = true;

                        string JsonMessage = "{\"Flag\":\"" + Flag + "\",\"Message\":\"" + Message + "\",\"Heading\":\"" + Heading + "\",\"ImageUrl\":\"" + ImageUrl + "\",\"IsWithImage\":\"" + IsWithImage + "\"}";
                        if (DeviceType == EnumValue.GetEnumDescription(EnumValue.DeviceType.Android))
                        {
                            CommonCls.SendGCM_Notifications(ApplicationId, JsonMessage, true);
                        }
                        else
                        {

                            Dictionary<string, object> Dictionary = new Dictionary<string, object>();
                            Dictionary.Add("Flag", Flag);
                            Dictionary.Add("Message", Message);
                            NotificationStatus = PushNotificatinAlert.SendPushNotification(ApplicationId, Message, Flag.ToString(), JsonMessage, Dictionary, 1, Convert.ToBoolean(IsNotificationSoundOn));

                        }

                    }
                }
            }
          
        }
    }
}