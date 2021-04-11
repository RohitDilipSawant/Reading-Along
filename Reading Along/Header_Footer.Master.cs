using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along
{
    public partial class Header_Footer : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string strConnString = ConfigurationManager.ConnectionStrings["Reading_Along_DB"].ConnectionString;
                string str;
                SqlCommand com;
                User_name_block.Visible = false;
                if (Session["User_Login"] != null)
                {
                    string User_Session = Session["User_Login"].ToString();
                    SqlConnection con = new SqlConnection(strConnString);
                    con.Open();
                    str = "select * from User_DB where Email_ID='" + User_Session + "'";
                    com = new SqlCommand(str, con);
                    SqlDataReader reader = com.ExecuteReader();
                    reader.Read();
                    lbl_user_name.Text = reader["F_Name"].ToString();
                    reader.Close();
                    con.Close();
                    login_registration_links_block.Visible = false;
                    User_name_block.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}