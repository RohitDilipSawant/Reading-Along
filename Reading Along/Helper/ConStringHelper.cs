using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Reading_Along.Helper
{
    public class ConStringHelper
    {
        public static string getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["Reading_Along_DB"].ConnectionString;
        }
    }
}