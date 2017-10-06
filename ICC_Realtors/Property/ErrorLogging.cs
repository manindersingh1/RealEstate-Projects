using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Property
{
   public static class ErrorLogging 
    {
       public static void WriteLog(string Message)
       {
           StringBuilder sb = new StringBuilder();
           sb.Append("==============================================================================" + Environment.NewLine);
           sb.Append("Error occurred on : " + DateTime.Now + Environment.NewLine);
           sb.Append(Message + Environment.NewLine);
           sb.Append("==============================================================================" + Environment.NewLine);

           string path = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase) + "\\ErrorLog.txt";

           System.IO.File.AppendAllText(path.Replace("file:\\", ""), sb.ToString());
       } 
    }
    
     
}