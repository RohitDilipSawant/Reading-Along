using Reading_Along.Helper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along
{
	public partial class Login : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_Login"] != null)
            {
                Response.Redirect("Index.aspx");
            }
        }
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void btn_Sign_In_Click(object sender, EventArgs e)
        {
            try
            {
                string uid = txt_Uname.Text;
                string pass = PasswordHelper.Encrypt(txt_Pwd.Text);
                con.Open();
                string qry = "select * from User_DB where Email_ID='" + uid + "' and Password='" + pass + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    con.Close();
                    con.Open();
                    string qry_v_code = "select * from User_DB where Email_ID='" + uid + "' and Password='" + pass + "'";
                    SqlCommand cmd_v_code = new SqlCommand(qry_v_code, con);
                    SqlDataReader sdr_v_code = cmd_v_code.ExecuteReader();
                    sdr_v_code.Read();
                    string verficationStatus = sdr_v_code["Verification_Status"].ToString();
                    sdr_v_code.Close();
                    con.Close();
                    if (verficationStatus == "Verified")
                    {
                        Session["User_Login"] = txt_Uname.Text;
                        Response.Redirect("Index.aspx");
                    }
                    else
                    {
                        string OTP_code = Helper.RandomNumberGenerator.getRandomNumber().ToString();
                        con.Open();
                        string str = "UPDATE User_DB SET Verification_Code = '" + OTP_code + "' WHERE Email_ID = '" + uid + "';";
                        SqlCommand com = new SqlCommand(str, con);
                        SqlDataReader reader = com.ExecuteReader();
                        try
                        {
                            EmailHealper.SendOtpMail(uid, OTP_code);
                            Session["UserLoginVerify"] = txt_Uname.Text;
                            string error_msg = "Verification Mail Succesfully Send";
                            Response.Write(@"<script language='javascript'>alert('" + error_msg + "');</script>");
                            Response.Write(@"<script language='javascript'>window.open('verification.aspx','_self');</script>");
                            lbl_error_msg.Text = error_msg;
                        }
                        catch
                        {
                            string error_msg = "User was not verified and Verification Mail unable to Send";
                            Response.Write(@"<script language='javascript'>alert('" + error_msg + "');</script>");
                            Response.Write(@"<script language='javascript'>window.open('verification.aspx','_self');</script>");
                            lbl_error_msg.Text = error_msg;
                        }
                        con.Close();
                    }
                    
                }
                else
                {
                    string display = "UserId or Password Is not correct Try again..!!";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
                    lbl_error_msg.Text = display;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}