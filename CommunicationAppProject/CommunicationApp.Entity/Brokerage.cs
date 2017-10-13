using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CommunicationApp.Entity
{
   public class Brokerage
    {
        public int BrokerageId { get; set; }
        public int? CustomerId { get; set; }
        public string BrokerageDate { get; set; }
        public string Office { get; set; }
        public string Completedby { get; set; }
        public string BrokerVerification { get; set; }
        public string VerificationDate { get; set; }
        public string BrokerageOverallRiskLevel { get; set; }
        public string Explanation { get; set; }
        public virtual ICollection<BrokerageDetail> BrokerageDetails { get; set; }
        public virtual Customer Customers { get; set; }

    }
}
