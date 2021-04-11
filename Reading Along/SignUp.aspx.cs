using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Sign_In_Click(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["Reading_Along_DB"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(strcon);
            try
            {
                string User_Name = txt_User_Name.Text;
                string First_Name = txt_fname.Text;
                string Last_Name = txt_lname.Text;
                string uemail = txt_email.Text;
                string upass = txt_Pwd.Text;
                string uphone = txt_phone.Text;
                con.Open();
                string qry2 = "select * from User_DB where Email_ID = '" + txt_email + "';";
                SqlCommand cmd2 = new SqlCommand(qry2, con);
                SqlDataReader sdr2 = cmd2.ExecuteReader();
                con.Close();
                if (sdr2.Read())
                {
                    Response.Write(@"<script language='javascript'>alert('Email Already Exist');</script>");
                    Response.Write(@"<script language='javascript'>window.open('SignUp.aspx');</script>");
                }
                else
                {
                    try
                    {
                        con.Open();
                        string qry1 = "insert into User_DB (Username, Email_ID, F_Name, L_Name, [Password], [Role], Phone_no) Values ('" + User_Name + "','" + uemail + "','" + First_Name + "','" + Last_Name + "','" + upass + "','Coustomer','" + uphone + "');";
                        SqlCommand cmd1 = new SqlCommand(qry1, con);
                        SqlDataReader sdr1 = cmd1.ExecuteReader();
                        con.Close();
                    }
                    catch
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Verification Code not Send Succesfully Send to your Mail ID');", true);
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