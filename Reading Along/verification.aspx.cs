using Reading_Along.Helper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along
{
    public partial class verification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            resend_div.Visible = false;
            if (!Page.IsPostBack)
            {
                TimeSpan time = TimeSpan.FromSeconds(Convert.ToInt32(Label1.Text) * 60);
                string str = time.ToString(@"hh\:mm\:ss");
                Label1.Text = str;
            }
            if (Request.QueryString["resend_code"] != null)
            {
                string uid = Session["UserLoginVerify"].ToString();
                string OTP_code = Helper.RandomNumberGenerator.getRandomNumber().ToString();
                EmailHealper.SendOtpMail(uid, OTP_code);
            }
        }

        protected void btn_verify_btn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
            string function_user_verify_session = Session["UserLoginVerify"].ToString();
            string user_entered_otp = txt_set_otp.Text;
            try
            {
                con.Open();
                string str = "select * from User_DB where Email_ID='" + function_user_verify_session + "'";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                reader.Read();
                string get_otp = reader["Verification_Code"].ToString();
                reader.Close();
                 if (user_entered_otp == get_otp)
                {
                    con.Close();
                    con.Open();
                    string user_details_save_query = "UPDATE User_DB SET Verification_Code = NULL, Verification_Status = 'Verified' WHERE Email_ID = '" + function_user_verify_session + "';";
                    SqlCommand user_details_cmd = new SqlCommand(user_details_save_query, con);
                    SqlDataReader user_details_read = user_details_cmd.ExecuteReader();
                    con.Close(); 
                    Session["User_Login"] = function_user_verify_session;
                    Response.Redirect("Index.aspx");
                    Session["User_Login_verify"] = null;
                }
                else
                {
                    string display = "OTP is incorrect Try again..!!";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            TimeSpan result = TimeSpan.FromSeconds(TimeSpan.Parse(Label1.Text).TotalSeconds - 1);
            string fromTimeString = result.ToString(@"hh\:mm\:ss");
            Label1.Text = fromTimeString;
        }

        protected void bg_timer_Tick(object sender, EventArgs e)
        {
            timer_div.Visible = false;
            resend_div.Visible = true;
        }
    }
}