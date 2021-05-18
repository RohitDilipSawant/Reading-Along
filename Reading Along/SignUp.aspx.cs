using Reading_Along.Helper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_Login"] != null)
            {
                Response.Redirect("Index.aspx");
            }
        }

        protected void btn_Sign_In_Click(object sender, EventArgs e)
        {
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
            try
            {
                string User_Name = txt_User_Name.Text;
                string First_Name = txt_fname.Text;
                string Last_Name = txt_lname.Text;
                string uemail = txt_email.Text;
                string upass = PasswordHelper.Encrypt(txt_Pwd.Text);
                string uphone = txt_phone.Text;
                string OTP_code = Helper.RandomNumberGenerator.getRandomNumber().ToString();
                con.Open();
                string qry2 = "select * from User_DB where Email_ID = '" + uemail + "';";
                SqlCommand cmd2 = new SqlCommand(qry2, con);
                SqlDataReader sdr2 = cmd2.ExecuteReader();
                if (sdr2.Read())
                {
                    string error_msg = "Email Already Exist..!!!";
                    lbl_error_msg.Text = error_msg;
                    con.Close();
                }
                else
                {
                    con.Close();
                    con.Open();
                    string retrive_username = "select * from User_DB where Username = '" + User_Name + "';";
                    SqlCommand cmd_username = new SqlCommand(retrive_username, con);
                    SqlDataReader read_username = cmd_username.ExecuteReader();
                    if (read_username.Read())
                    {
                        string error_msg = "Username Already Exist..!!!";
                        lbl_error_msg.Text = error_msg;
                        con.Close();
                    }
                    else
                    {
                        con.Close();
                        try
                        {
                            //EmailHealper.SendOtpMail(uemail, OTP_code);
                            con.Open();
                            string qry1 = "insert into User_DB (Username, Email_ID, F_Name, L_Name, [Password], [Role], Phone_no, books_access, Verification_Code, Verification_Status) Values ('" + User_Name + "','" + uemail + "','" + First_Name + "','" + Last_Name + "','" + upass + "','Coustomer','" + uphone + "','0','" + OTP_code + "','Verified');";
                            SqlCommand cmd1 = new SqlCommand(qry1, con);
                            SqlDataReader sdr1 = cmd1.ExecuteReader();
                            con.Close();
                            Session["User_Login"] = txt_email.Text;
                            //Session["UserLoginVerify"] = txt_email.Text;
                            //string error_msg = "Verification Mail Succesfully Send..!!!";
                            string error_msg = "Succesfully Sign Up..!!!";
                            Response.Write(@"<script language='javascript'>alert('"+ error_msg + "');</script>");
                            Response.Write(@"<script language='javascript'>window.open('Index.aspx','_self');</script>");
                        }
                        catch (Exception ex)
                        {
                            //string error_msg = "Verification Mail was unable to Send..!!!";
                            string error_msg = "Something went wrong..!!!";
                            lbl_error_msg.Text = error_msg;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}