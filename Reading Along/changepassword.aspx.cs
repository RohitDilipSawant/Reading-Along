using System;
using System.Timers;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using Reading_Along.Helper;

namespace Reading_Along
{
    public partial class changepassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_Login"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string user_unique_value = Session["User_Login"].ToString();
                SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
                con.Open();
                string user_query = "select * from User_DB WHERE Email_ID = '" + user_unique_value + "';";
                SqlCommand user_cmd = new SqlCommand(user_query, con);
                SqlDataReader user_read = user_cmd.ExecuteReader();
                user_read.Read();
                lbl_user_name.Text = user_read["F_Name"].ToString() + " " + user_read["L_Name"].ToString();
                user_read.Close();
                con.Close();
            }
        }

        protected void session_timer_Tick(object sender, EventArgs e)
        {
            Response.Write(@"<script language='javascript'>alert('Session Expired');</script>");
            Response.Write(@"<script language='javascript'>window.open('myaccount.aspx','_self');</script>");
        }

        protected void btn_change_pass_Click(object sender, EventArgs e)
        {
            string user_unique_value = Session["User_Login"].ToString();
            string user_entered_old_pass = PasswordHelper.Encrypt(txt_old_pass.Text);
            string user_new_pass = PasswordHelper.Encrypt(txt_new_pass.Text);
            SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
            con.Open();
            string user_old_password_query = "select * from User_DB WHERE Email_ID = '" + user_unique_value + "';";
            SqlCommand user_old_password_cmd = new SqlCommand(user_old_password_query, con);
            SqlDataReader user_old_password_read = user_old_password_cmd.ExecuteReader();
            user_old_password_read.Read();
            string user_old_pass = user_old_password_read["Password"].ToString();
            user_old_password_read.Close();
            con.Close();
            if (user_old_pass == user_entered_old_pass)
            {
                con.Open();
                string user_details_save_query = "UPDATE User_DB SET Password = '" + user_new_pass + "' WHERE Email_ID = '" + user_unique_value + "';";
                SqlCommand user_details_cmd = new SqlCommand(user_details_save_query, con);
                SqlDataReader user_details_read = user_details_cmd.ExecuteReader();
                con.Close();
                Response.Write(@"<script language='javascript'>alert('Password Changed Succesfully');</script>");
                Response.Write(@"<script language='javascript'>window.open('myaccount.aspx','_self');</script>");
            }
            else
            {
                lbl_old_pass_error.Text = "Incorrect Old Password!";
            }
        }
    }
}