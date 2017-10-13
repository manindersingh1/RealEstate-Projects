using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CommunicationApp.Web.Models
{
    public class BrokeragerModel
    {
        public BrokeragerModel()
        {
            this.BrokeragerDetailModelList = new List<BrokeragerDetailModel>();

        }
        public int BrokerageId { get; set; }
        public int? CustomerId { get; set; }       
        public string Brokerage { get; set; }
        public string BrokerageDate { get; set; }
        public string Office { get; set; }
        public string Completedby { get; set; }
        public string BrokerVerification { get; set; }
        public string VerificationDate { get; set; }
        public string BrokerageOverallRiskLevel { get; set; }
        public string Explanation { get; set; }
        public string PageUrl { get; set; }
        public List<BrokeragerDetailModel> BrokeragerDetailModelList { get; set; }
        public List<PDFDetailModel> PDFDetailModelModelList { get; set; }
        

    }
    
}