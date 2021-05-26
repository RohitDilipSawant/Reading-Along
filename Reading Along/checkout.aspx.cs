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
    public partial class checkout : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_subscription"] != null)
            {
                if (Request.QueryString["SubPlanID"] != null && Request.QueryString["SubPlanName"] != null && Request.QueryString["SubPlanPrice"] != null)
                {
                    string get_user_email_id = Session["User_Login"].ToString();
                    string get_sub_plan_id = Request.QueryString["SubPlanID"].ToString();
                    con.Open();
                    string get_user_sub_plan_str = "select * from User_DB where Email_ID = '" + get_user_email_id + "';";
                    SqlCommand get_user_sub_plan_com = new SqlCommand(get_user_sub_plan_str, con);
                    SqlDataReader get_user_sub_plan_reader = get_user_sub_plan_com.ExecuteReader();
                    get_user_sub_plan_reader.Read();
                    //string plan_int_str = get_user_sub_plan_reader["User_Subscription"].ToString();
                    string user_sub_plan_var = get_user_sub_plan_reader["User_Subscription"].ToString();
                    string user_sub_plan_ID = get_user_sub_plan_reader["User_Subscription_ID"].ToString();
                    get_user_sub_plan_reader.Close();
                    con.Close();
                    
                    con.Open();
                    string get_user_sub_price_str = "select * from [SubscriptionPlans_DB] where ID = '" + user_sub_plan_ID + "';";
                    SqlCommand get_user_sub_price_com = new SqlCommand(get_user_sub_price_str, con);
                    SqlDataReader get_user_sub_price_reader = get_user_sub_price_com.ExecuteReader();
                    get_user_sub_price_reader.Read();
                    string user_sub_price_string = get_user_sub_price_reader["SubscriptionPrice"].ToString();
                    int user_sub_price_var = Convert.ToInt32(user_sub_price_string);
                    get_user_sub_price_reader.Close();
                    con.Close();

                    con.Open();
                    string get_selected_user_sub_price_str = "select * from [SubscriptionPlans_DB] where ID = '" + get_sub_plan_id + "';";
                    SqlCommand get_selected_user_sub_price_com = new SqlCommand(get_selected_user_sub_price_str, con);
                    SqlDataReader get_selected_user_sub_price_reader = get_selected_user_sub_price_com.ExecuteReader();
                    get_selected_user_sub_price_reader.Read();
                    string sub_selected_price_string = get_selected_user_sub_price_reader["SubscriptionPrice"].ToString();
                    int sub_selected_price_var = Convert.ToInt32(sub_selected_price_string);
                    get_selected_user_sub_price_reader.Close();
                    con.Close();
                    if (user_sub_price_var >= sub_selected_price_var)
                    {
                        Response.Write(@"<script language='javascript'>alert('You Already Have a Better Plan!!!');</script>");
                        Response.Write(@"<script language='javascript'>window.open('pricing.aspx','_self');</script>");
                    }
                    else
                    {
                        string get_sub_plan_name = Request.QueryString["SubPlanName"].ToString();
                        string get_sub_plan_price = Request.QueryString["SubPlanPrice"].ToString();
                        subscription_plan.InnerText = get_sub_plan_name;
                        subscription_price.InnerText = get_sub_plan_price;
                    }                    
                }
                else
                {
                    Session["user_subscription"] = null;
                    Response.Write(@"<script language='javascript'>alert('Please select a plan!!!');</script>");
                    Response.Write(@"<script language='javascript'>window.open('pricing.aspx','_self');</script>");
                }
            }
            else
            {
                Response.Redirect("pricing.aspx");
            }
        }

        protected void btn_purchase_Click(object sender, EventArgs e)
        {
            string get_user_sub_plan_id = Request.QueryString["SubPlanID"].ToString();
            string get_user_sub_plan_name = Request.QueryString["SubPlanName"].ToString();
            con.Open();
            string get_sub_detail_str = "select * from SubscriptionPlans_DB where ID = '"+ get_user_sub_plan_id + "'";
            SqlCommand get_sub_detail_com = new SqlCommand(get_sub_detail_str, con);
            SqlDataReader get_sub_detail_reader = get_sub_detail_com.ExecuteReader();
            get_sub_detail_reader.Read();
            string get_accesiblebooks_sub = get_sub_detail_reader["NoOfBooksAccess"].ToString();
            int get_NoOfDays_sub = Convert.ToInt32(get_sub_detail_reader["NoOfDays"]);
            get_sub_detail_reader.Close();            
            con.Close();

            string get_user_email_id = Session["User_Login"].ToString(); 
            string get_present_Date = DateTime.Now.ToString("yyyy/MM/dd");
            string get_User_Subscription_validity_Date = DateTime.Today.AddDays(get_NoOfDays_sub).ToString("yyyy/MM/dd");
            //date format : yyyy-mm-dd
            con.Open();
            string set_user_sub_details_str = "UPDATE User_DB SET User_Subscription = '"+ get_user_sub_plan_name + "', User_Subscription_ID = '"+ get_user_sub_plan_id + "', User_Subscription_accesible_book = '"+ get_accesiblebooks_sub + "', User_Subscription_validity_Date = '"+ get_User_Subscription_validity_Date + "', User_Subscription_Date = '"+ get_present_Date + "' WHERE Email_ID = '"+ get_user_email_id + "';";
            SqlCommand set_user_sub_details_com = new SqlCommand(set_user_sub_details_str, con);
            SqlDataReader set_user_sub_details_reader = set_user_sub_details_com.ExecuteReader();
            con.Close();
            Session["user_subscription"] = null;
            Response.Write(@"<script language='javascript'>alert('Successful!!!');</script>");
            Response.Write(@"<script language='javascript'>window.open('Index.aspx','_self');</script>");

        }
    }
}