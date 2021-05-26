using System;
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
    public partial class myaccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string strConnString = ConfigurationManager.ConnectionStrings["Reading_Along_DB"].ConnectionString;
                string str;
                SqlCommand com;
                if (Session["User_Login"] != null)
                {
                    if (!Page.IsPostBack)
                    {
                        string User_Session = Session["User_Login"].ToString();
                        SqlConnection con = new SqlConnection(strConnString);
                        con.Open();
                        str = "select * from User_DB where Email_ID='" + User_Session + "'";
                        com = new SqlCommand(str, con);
                        SqlDataReader reader = com.ExecuteReader();
                        reader.Read();
                        lbl_user_name.Text = reader["F_Name"].ToString() + " " + reader["L_Name"].ToString();
                        lbl_user_name_2.Text = reader["F_Name"].ToString() + " " + reader["L_Name"].ToString();
                        txt_my_Username.Text = reader["Username"].ToString();
                        txt_my_email.Text = reader["Email_ID"].ToString();
                        txt_f_name.Text = reader["F_Name"].ToString();
                        txt_l_name.Text = reader["L_Name"].ToString();
                        txt_phone.Text = reader["Phone_no"].ToString();
                        txt_address.Text = reader["Address"].ToString();
                        txt_city.Text = reader["City"].ToString();
                        txt_state.Text = reader["State"].ToString();
                        txt_country.Text = reader["Country"].ToString();
                        txt_pin_code.Text = reader["Postal_Code"].ToString();
                        txt_about_user.Text = reader["About_Us"].ToString();
                        txt_designation.Text = reader["User_Designation"].ToString();
                        txt_qulification.Text = reader["User_Qulification"].ToString();
                        lbl_location.Text = reader["City"].ToString() + ", " + reader["State"].ToString() + ", " + reader["Country"].ToString();
                        lbl_designation.Text = reader["User_Designation"].ToString();
                        lbl_qulification.Text = reader["User_Qulification"].ToString();
                        lbl_books_access.Text = reader["books_access"].ToString();
                        string start_User_Subscription_Date = reader["User_Subscription_Date"].ToString();
                        string start_User_Subscription_validity_Date = reader["User_Subscription_validity_Date"].ToString();
                        reader.Close();
                        con.Close();
                        string start_User_Subscription_Date_str = DateTime.Now.ToString("yyyy/MM/dd");
                        DateTime start_date = Convert.ToDateTime(start_User_Subscription_Date_str);
                        DateTime end_date = Convert.ToDateTime(start_User_Subscription_validity_Date);
                        double valid_days = (end_date - start_date).TotalDays;
                        user_book_count.InnerText = valid_days.ToString();
                        img_profile.ImageUrl = randomProfileGenerator.getProfileGenerator().ToString();
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                    lbl_user_name.Text = "Name";
                    lbl_user_name_2.Text = "Name";
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btn_save_details_Click(object sender, EventArgs e)
        {
            string user_unique_value = Session["User_Login"].ToString();
            string user_f_name = txt_f_name.Text;
            string user_l_name = txt_l_name.Text;
            string user_Adress = txt_address.Text;
            string user_city = txt_city.Text;
            string user_pin_code = txt_pin_code.Text;
            string user_country = txt_country.Text;
            string user_state = txt_state.Text;
            string user_phone = txt_phone.Text;
            string user_About_Us = txt_about_user.Text;
            string user_deignation = txt_designation.Text;
            string user_qulification = txt_qulification.Text;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
            con.Open();
            string user_details_save_query = "UPDATE User_DB SET F_Name = '" + user_f_name + "', L_Name = '" + user_l_name + "', [Address] = '" + user_Adress + "', City = '" + user_city + "', Postal_Code = '" + user_pin_code + "', Country = '" + user_country + "', State = '" + user_state + "', Phone_no = '" + user_phone + "', About_Us = '" + user_About_Us + "', User_Designation = '" + user_deignation + "', User_Qulification ='" + user_qulification + "' WHERE Email_ID = '" + user_unique_value + "';";
            SqlCommand user_details_cmd = new SqlCommand(user_details_save_query, con);
            SqlDataReader user_details_read = user_details_cmd.ExecuteReader();
            con.Close();
            Response.Write(@"<script language='javascript'>alert('Details Saved Succesfully');</script>");
            Response.Write(@"<script language='javascript'>window.open('myaccount.aspx');</script>");
            Response.Redirect("myaccount.aspx");
        }
    }
}