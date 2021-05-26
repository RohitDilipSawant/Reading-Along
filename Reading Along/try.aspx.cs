using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along
{
    public partial class _try : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime todays_date = Convert.ToDateTime(DateTime.Now.ToString("yyyy/MM/dd"));
            DateTime selected_date = Convert.ToDateTime(DateTime.Now.ToString("2021/06/09"));
            if (todays_date > selected_date) 
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Subscription Expired!!!');location.href='Index.aspx';", true);
            }
            if (todays_date < selected_date)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Subscription Valid!!!');location.href='Index.aspx';", true);
            }

        }

    }
}