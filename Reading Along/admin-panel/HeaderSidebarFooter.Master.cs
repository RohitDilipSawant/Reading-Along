using Reading_Along.Helper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along.admin_panel
{
    public partial class HeaderSidebarFooter : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
            if (Session["Admin_Login"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string Amdin_Session = Session["Admin_Login"].ToString();
                con.Open();
                string str = "select * from Admin where Username ='" + Amdin_Session + "'";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                reader.Read();
                Admin_Name_Display_3.InnerText = reader["Name"].ToString();
                reader.Close();
                con.Close();
            }
            if (Request.QueryString["AdminLogout"] == "logoff")
            {
                Session.Clear();
                Session.Abandon();
                Session["Admin_Login"] = null;
                Response.Redirect("Login.aspx", false);
            }
        }
    }
}