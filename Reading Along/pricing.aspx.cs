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
                string str = "Select * from SubscriptionPlans_DB where SubscriptionType = 'Monthly';";
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
                string str = "Select * from SubscriptionPlans_DB where SubscriptionType = 'Quarterly';";
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
                string str = "Select * from SubscriptionPlans_DB where SubscriptionType = 'Yearly';";
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