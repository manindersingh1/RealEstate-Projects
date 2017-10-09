using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace rpl_registrations.Models
{
    public class PersonModel
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string PhoneNo { get; set; }
        public string Brokerage { get; set; }
        public int Adults { get; set; }
        public int Kids { get; set; }
        public string AdminEmail { get; set; }
        public int TotalKids { get; set; }
        public int TotalAdults { get; set; }
        public string TypeOfBussiness { get; set; }
        public string IntrestedIn { get; set; }
        public string Remarks { get; set; }
        public string EmailType { get; set; }
        
        
    }
}