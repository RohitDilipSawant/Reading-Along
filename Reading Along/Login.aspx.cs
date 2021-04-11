using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Reading_Along_DB"].ConnectionString);
        protected void btn_Sign_In_Click(object sender, EventArgs e)
        {
            try
            {
                string uid = txt_Uname.Text;
                string pass = txt_Pwd.Text;
                con.Open();
                string qry = "select * from User_DB where Email_ID='" + uid + "' and Password='" + pass + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    Session["User_Login"] = txt_Uname.Text;
                    Response.Redirect("Index.aspx");
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