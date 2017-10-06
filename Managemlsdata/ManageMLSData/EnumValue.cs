using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace ManageMLSData
{
    public class EnumValue
    {
        public enum XmlType { [Description("vowcondo")]VowCondo = 1, [Description("voxcommercial")] VoxCommercial = 2, [Description("voxresidential")] VoxResidential = 3, [Description("idxcondo")] IDXCondo = 4, [Description("idxcommercial")] IDXCommercial = 5, [Description("idxresidential")] IDXResidential = 6 }
        public static string GetEnumDescription(Enum value)
        {
            FieldInfo fi = value.GetType().GetField(value.ToString());

            DescriptionAttribute[] attributes =
                (DescriptionAttribute[])fi.GetCustomAttributes(typeof(DescriptionAttribute), false);

            if (attributes != null && attributes.Length > 0)
                return attributes[0].Description;
            else
                return value.ToString();
        }
    }
}
