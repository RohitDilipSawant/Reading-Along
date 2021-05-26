using Reading_Along.Helper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along
{
    public partial class pricing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_Login"] != null)
            {
                div_list.Visible = false;
            }
            if (Request.QueryString["subscribe_monthly_plan_ID"] != null)
            {
                if (Session["User_Login"] != null)
                {
                    string get_subscribe_monthly_plan_ID = Request.QueryString["subscribe_monthly_plan_ID"].ToString();
                    con.Open();
                    string str = "SELECT * FROM [dbo].[SubscriptionPlans_DB] where ID='" + get_subscribe_monthly_plan_ID + "';";
                    SqlCommand com = new SqlCommand(str, con);
                    SqlDataReader reader = com.ExecuteReader();
                    reader.Read();
                    string subscription_plan_name = reader["SubscriptionName"].ToString();
                    string subscription_plan_price = reader["SubscriptionPrice"].ToString();
                    reader.Close();
                    con.Close();
                    Session["user_subscription"] = get_subscribe_monthly_plan_ID;
                    Response.Redirect("checkout.aspx?SubPlanID=" + get_subscribe_monthly_plan_ID + "&SubPlanName=" + subscription_plan_name + "&SubPlanPrice=" + subscription_plan_price);
                }
                else
                {
                    Response.Write(@"<script language='javascript'>alert('Please Sign In!!!');</script>");
                    Response.Write(@"<script language='javascript'>window.open('Login.aspx','_self');</script>");
                }
            }
            free_bindData();
            monthly_bindData();
            quater_bindData();
            yearly_bindData();
        }
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void free_bindData()
        {
            try
            {
                con.Open();
                string str = "Select * from SubscriptionPlans_DB where SubscriptionType = 'Free';";
                SqlCommand com = new SqlCommand(str, con);
                list_Free.DataSource = com.ExecuteReader();
                list_Free.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
            }
        }
        protected void monthly_bindData()
        {
            try
            {
                con.Open();
                string str = "Select * from SubscriptionPlans_DB where SubscriptionType = 'Monthly' AND plan_status = 'Active';";
                SqlCommand com = new SqlCommand(str, con);
                list_monthly_plan.DataSource = com.ExecuteReader();
                list_monthly_plan.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
            }
        }
        protected void quater_bindData()
        {
            try
            {
                con.Open();
                string str = "Select * from SubscriptionPlans_DB where SubscriptionType = 'Quarterly' AND plan_status = 'Active';";
                SqlCommand com = new SqlCommand(str, con);
                list_quater_plan.DataSource = com.ExecuteReader();
                list_quater_plan.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
            }
        }
        protected void yearly_bindData()
        {
            try
            {
                con.Open();
                string str = "Select * from SubscriptionPlans_DB where SubscriptionType = 'Yearly' AND plan_status = 'Active';";
                SqlCommand com = new SqlCommand(str, con);
                list_yearly_plan.DataSource = com.ExecuteReader();
                list_yearly_plan.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
            }
        }
    }
}