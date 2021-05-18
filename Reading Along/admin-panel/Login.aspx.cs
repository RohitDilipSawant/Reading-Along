using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along.Admin_Panel
{
	public partial class Login1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (Session["Admin_Login"] != null)
            {
                Response.Redirect("Dashboard.aspx");
            }
        }
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Reading_Along_DB"].ConnectionString);
        protected void btn_Admin_Login_Click(object sender, EventArgs e)
        {
            try
            {
                string uid = txt_Uname.Text;
                string pass = txt_Pwd.Text;
                con.Open();
                string qry = "select * from Admin where Username='" + uid + "' and Password='" + pass + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    Session["Admin_Login"] = txt_Uname.Text;
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    string display = "UserId or Password Is not correct Try again..!!";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);

                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}