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
    public class SendNotification : IJob
    {
       
        public void Execute(IJobExecutionContext context)
        {

            JobDataMap dataMap = context.JobDetail.JobDataMap;
            
            int PropertyId = Convert.ToInt32(dataMap.GetString("PropertyId"));          
            string Flag = dataMap.GetString("Flag");
            string Message = dataMap.GetString("Message");
            CommonClass CommonClass=new Services.CommonClass();
            string QStr = "";
            DataTable dt = new DataTable();
            QStr = "Select CustomerId From Property where PropertyId= " + PropertyId;
            dt = CommonClass.GetDataSet(QStr).Tables[0];

           if(dt.Rows.Count>0)
           {
               SendNotificationsToUsers(Convert.ToInt32(dt.Rows[0]["CustomerId"]), Message, Flag);
           }
          
        }
        public void SendNotificationsToUsers(int CustomerId,string message,string flag   )
        {
            int Flag = flag!="" ?Convert.ToInt32(flag):0;
            var ParentId = "16466";
            string Message = message;
            //send notification
           // var Customers = _CustomerService.GetCustomers().Where(c => c.CustomerId != CustomerId && c.IsActive == true).ToList();
            CommonClass CommonClass = new Services.CommonClass();
            string QStr = "";
            
            DataTable dt = new DataTable();
            QStr = "Select ParentId From Customer where CustomerId = " + CustomerId + " and IsActive=1";
            dt = CommonClass.GetDataSet(QStr).Tables[0];
            if (dt.Rows.Count > 0)
            {
                ParentId = dt.Rows[0]["ParentId"].ToString();
            }
            QStr = "";
            QStr = "Select * From Customer where CustomerId != " + CustomerId + " and IsActive=1";
            dt = CommonClass.GetDataSet(QStr).Tables[0];

            try
            {
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        var ApplicationId = dr["ApplicationId"].ToString();
                        var DeviceType = dr["DeviceType"].ToString();
                        var name = dr["FirstName"].ToString();
                        var Trebid = dr["Trebid"].ToString();

                        //var IsNotificationSoundOn = Convert.ToBoolean(dr["IsNotificationSoundOn"]);
                        if (ApplicationId != null && ApplicationId != "" && DeviceType != null && DeviceType != "")
                        {
                            bool NotificationStatus = true;

                            string JsonMessage = "{\"Flag\":\"" + Flag + "\",\"Message\":\"" + Message + "\",\"ParentId\":\"" + ParentId + "\"}";

                            if (DeviceType == EnumValue.GetEnumDescription(EnumValue.DeviceType.Android))
                            {
                                CommonCls.SendGCM_Notifications(ApplicationId, JsonMessage, true);
                            }
                            else
                            {
                                Dictionary<string, object> Dictionary = new Dictionary<string, object>();
                                Dictionary.Add("Flag", Flag);
                                Dictionary.Add("Message", Message);
                                Dictionary.Add("ParentId", ParentId);
                                NotificationStatus = PushNotificatinAlert.SendPushNotification(ApplicationId, message, flag.ToString(), JsonMessage, Dictionary, 1, Convert.ToBoolean(true));
                            }


                        }
                    }
                }
            }
            catch (Exception ex)
            {
                CommonCls.ErrorLog(ex.ToString());
            }
           
          
        }
    }
}