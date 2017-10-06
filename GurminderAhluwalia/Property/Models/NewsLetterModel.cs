using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Property.Models
{
    public class NewsLetterModel
    {
        public string NewsletterType { get; set; }

        public string FirstContent{ get; set; }
        public string SecondContent { get; set; }
        public string ThirldContent { get; set; }
        public string Logopath { get; set; }
        public string PropertyPhoto { get; set; }
        public string AdminPhoto { get; set; }
        public string Email { get; set; }
        
    }
}