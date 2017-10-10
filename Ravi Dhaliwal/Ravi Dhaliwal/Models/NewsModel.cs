using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Amit_Khurana.Models
{
    public class NewsModel
    {
        public string title { get; set; }
        public string description { get; set; }
        public string link { get; set; }
        public string guid { get; set; }
        public string pubDate { get; set; }


        public List<NewsModel> All_News { get; set; }
        public List<NewsModel> Latest_News { get; set; }
    }
}