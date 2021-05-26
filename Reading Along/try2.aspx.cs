using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along
{
    public partial class try2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            subscription_plan.InnerText = "Premium";
        }
    }
}