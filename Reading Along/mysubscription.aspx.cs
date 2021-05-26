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
    public partial class mysubscription : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_Login"] != null)
            {
                string User_Session = Session["User_Login"].ToString();
                con.Open();
                string get_user_sub_details_str = "select * from [User_DB] where Email_ID = '" + User_Session + "';";
                SqlCommand get_user_sub_details_com = new SqlCommand(get_user_sub_details_str, con);
                SqlDataReader get_user_sub_details_reader = get_user_sub_details_com.ExecuteReader();
                get_user_sub_details_reader.Read();
                subscription_name_label.InnerText = get_user_sub_details_reader["User_Subscription"].ToString();
                accessible_book_count.InnerText = get_user_sub_details_reader["User_Subscription_accesible_book"].ToString();
                string start_User_Subscription_Date = get_user_sub_details_reader["User_Subscription_Date"].ToString();
                string start_User_Subscription_validity_Date = get_user_sub_details_reader["User_Subscription_validity_Date"].ToString();
                purchase_date.InnerText = Convert.ToDateTime(get_user_sub_details_reader["User_Subscription_Date"]).ToString("yyyy/MM/dd");
                validity_date.InnerText = Convert.ToDateTime(get_user_sub_details_reader["User_Subscription_validity_Date"]).ToString("yyyy/MM/dd");
                string user_subscription_id = get_user_sub_details_reader["User_Subscription_ID"].ToString();
                get_user_sub_details_reader.Close();
                con.Close();
                DateTime start_date = Convert.ToDateTime(start_User_Subscription_Date); 
                DateTime end_date = Convert.ToDateTime(start_User_Subscription_validity_Date); 
                double valid_days = (end_date - start_date).TotalDays;
                validity_days.InnerText = valid_days.ToString();
                con.Open();
                string get_user_sub_price_str = "select * from [SubscriptionPlans_DB] where ID = '" + user_subscription_id + "';";
                SqlCommand get_user_sub_price_com = new SqlCommand(get_user_sub_price_str, con);
                SqlDataReader get_user_sub_price_reader = get_user_sub_price_com.ExecuteReader();
                get_user_sub_price_reader.Read();
                sub_price.InnerText = get_user_sub_price_reader["SubscriptionPrice"].ToString();
                string sub_price_var = get_user_sub_price_reader["SubscriptionType"].ToString();
                get_user_sub_price_reader.Close();
                con.Close();
                if (sub_price_var == "Free")
                {
                    sub_period.InnerText = "Free";
                }
                if (sub_price_var == "Monthly")
                {
                    sub_period.InnerText = "/MOS";
                }
                if (sub_price_var == "Quarterly")
                {
                    sub_period.InnerText = "/QTR";
                }
                if (sub_price_var == "Yearly")
                {
                    sub_period.InnerText = "/YRS";
                }
            }
            else
            {
                Response.Write(@"<script language='javascript'>alert('Please Login!!!');</script>");
                Response.Write(@"<script language='javascript'>window.open('Login.aspx','_self');</script>");
            }
            //try
            //{
                
            //}
            //catch
            //{
            //    Response.Write(@"<script language='javascript'>alert('Something Went Wrong!!!');</script>");
            //    Response.Write(@"<script language='javascript'>window.open('mysubscription.aspx','_self');</script>");
            //}
        }
    }
}