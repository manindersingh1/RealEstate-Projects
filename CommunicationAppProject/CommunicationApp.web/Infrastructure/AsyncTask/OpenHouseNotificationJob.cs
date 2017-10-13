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
    public class OpenHouseNotificationJob : IJob
    {
       
        public void Execute(IJobExecutionContext context)
        {

            JobDataMap dataMap = context.JobDetail.JobDataMap;

            int AgentId = Convert.ToInt32(dataMap.GetString("AgentId"));          
            string Flag = dataMap.GetString("Flag");
            string Message = dataMap.GetString("Message");
            CommonClass CommonClass=new Services.CommonClass();
            string QStr = "";
            DataTable dt = new DataTable();
            QStr = "Select CustomerId,ParentId From Agent where AgentId= " + AgentId;
            dt = CommonClass.GetDataSet(QStr).Tables[0];

           if(dt.Rows.Count>0)
           {
               SendNotificationsToUsers(Convert.ToInt32(dt.Rows[0]["CustomerId"]), Convert.ToInt32(dt.Rows[0]["ParentId"]), Flag);
           }
          
                   
               
           
          
        }


        public void SendNotificationsToUsers(int CustomerId,int ParentId,string Flag)
        {
           
            string Message = "";
            //send notification
           // var Customers = _CustomerService.GetCustomers().Where(c => c.CustomerId != CustomerId && c.IsActive == true).ToList();
            CommonClass CommonClass = new Services.CommonClass();
            string QStr = "";
            DataTable dt = new DataTable();
            QStr = "Select * From Customer where CustomerId <> " + CustomerId + " and ParentId=" + ParentId + "  and IsActive=1";
            dt = CommonClass.GetDataSet(QStr).Tables[0];
            try
            {
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        var ApplicationId = dr["ApplicationId"].ToString();
                        var DeviceType = dr["DeviceType"].ToString();
                        var Trebid = dr["Trebid"].ToString();
                        //var IsNotificationSoundOn = Convert.ToBoolean(dr["IsNotificationSoundOn"]);
                        if (ApplicationId != null && ApplicationId != "")
                        {

                            bool NotificationStatus = true;

                            string JsonMessage = "{\"Flag\":\"" + Flag + "\",\"Message\":\"" + Message + "\"}";

                            if (DeviceType == EnumValue.GetEnumDescription(EnumValue.DeviceType.Android))
                            {
                                CommonCls.SendGCM_Notifications(ApplicationId, JsonMessage, true);
                            }
                            else
                            {

                                Dictionary<string, object> Dictionary = new Dictionary<string, object>();
                                Dictionary.Add("Flag", Flag);
                                Dictionary.Add("Message", Message);
                                NotificationStatus = PushNotificatinAlert.SendPushNotification(ApplicationId, Message, Flag.ToString(), JsonMessage, Dictionary, 1, Convert.ToBoolean(true));

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