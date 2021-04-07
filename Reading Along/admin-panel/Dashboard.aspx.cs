using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along.Admin_Panel
{
    public partial class Dashboard1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Reading_Along_DB"].ConnectionString);
            if (Session["Admin_Login"] == null)
            {
                Response.Redirect("Login.aspx");

            }
            else
            {

            }
        }
    }
}