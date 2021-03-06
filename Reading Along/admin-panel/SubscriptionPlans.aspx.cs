using Reading_Along.Helper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along.admin_panel
{
    public partial class SubscriptionPlans : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["edit_SubscriptionPlans_ID"] != null)
            {
                Subscription_add_div.Visible = false;
                Subscription_list_div.Visible = false;
                Subscription_edit_div.Visible = true;
                if (!Page.IsPostBack)
                {
                    bindEditSubscriptionData();
                }
            }
            if (Request.QueryString["Deactive_SubscriptionPlans_ID"] != null)
            {
                string Deactive_SubscriptionPlans_get_ID = Request.QueryString["Deactive_SubscriptionPlans_ID"].ToString();
                con.Open();
                string str = "UPDATE[SubscriptionPlans_DB] SET[plan_status] = 'Deactive' WHERE ID = '" + Deactive_SubscriptionPlans_get_ID + "';";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                con.Close();
                Response.Redirect("SubscriptionPlans.aspx");
            }
            if (Request.QueryString["Active_SubscriptionPlans_ID"] != null)
            {
                string Active_SubscriptionPlans_get_ID = Request.QueryString["Active_SubscriptionPlans_ID"].ToString();
                con.Open();
                string str = "UPDATE[SubscriptionPlans_DB] SET[plan_status] = 'Active' WHERE ID = '" + Active_SubscriptionPlans_get_ID + "';";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                con.Close();
                Response.Redirect("SubscriptionPlans.aspx");
            }
            bindSubscriptionData();
        }
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void bindSubscriptionData()
        {
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [dbo].[SubscriptionPlans_DB] order by SubscriptionType ASC;", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                list_SubscriptionPlan_data.DataSource = dt;
                list_SubscriptionPlan_data.DataBind();
            }
            catch (Exception ex)
            {
            }
        }

        protected void bindEditSubscriptionData()
        {
            try
            {
                string edit_SubscriptionPlans_get_ID = Request.QueryString["edit_SubscriptionPlans_ID"].ToString();
                con.Open();
                string str = "Select * from SubscriptionPlans_DB where ID = '"+ edit_SubscriptionPlans_get_ID + "'";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                reader.Read();
                txt_edit_Subscription_Name.Text = reader["SubscriptionName"].ToString();
                txt_edit_Subscription_Price.Text = reader["SubscriptionPrice"].ToString();
                drp_edit_Subscription_Type.SelectedValue = reader["SubscriptionType"].ToString();
                txt_edit_Subscription_Description.Text = reader["SubscriptionDescription"].ToString();
                txt_edit_Accesible_Books.Text = reader["NoOfBooksAccess"].ToString();
                txt_edit_validity.Text = reader["NoOfDays"].ToString();
                drp_edit_subscription_tag.SelectedValue = reader["tags"].ToString();
                reader.Close();
                con.Close();
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_add_SubscriptionPlans_Click(object sender, EventArgs e)
        {
            Subscription_list_div.Visible = false;
            Subscription_add_div.Visible = true;
            Subscription_edit_div.Visible = false;
        }

        protected void btn_back_to_Subscription_list_Click(object sender, EventArgs e)
        {
            Subscription_list_div.Visible = true;
            Subscription_add_div.Visible = false;
            Subscription_edit_div.Visible = false;
        }

        protected void btn_add_SubscriptionPlan_Click(object sender, EventArgs e)
        {
            string get_txt_add_Subscription_Name = txt_add_Subscription_Name.Text;
            string get_txt_add_Subscription_Price = txt_add_Subscription_Price.Text;
            string get_txt_add_Subscription_Description = txt_add_Subscription_Description.Text;
            string get_txt_add_Accesible_Books = txt_add_Accesible_Books.Text;
            string get_txt_add_validity = txt_add_validity.Text;
            string get_drp_subscription_tag = drp_subscription_tag.SelectedValue;
            string get_drp_Subscription_Type = drp_Subscription_Type.SelectedValue;
            con.Open();
            string str = "INSERT INTO SubscriptionPlans_DB ([SubscriptionName],[SubscriptionPrice],[SubscriptionDescription],[NoOfBooksAccess],[NoOfDays],[tags],[SubscriptionType],[plan_status]) " +
                "VALUES ('"+ get_txt_add_Subscription_Name + "','"+ get_txt_add_Subscription_Price + "','"+ get_txt_add_Subscription_Description + "','"+ get_txt_add_Accesible_Books + "','"+ get_txt_add_validity + "','"+ get_drp_subscription_tag + "','"+ get_drp_Subscription_Type + "','Active');";
            SqlCommand com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            con.Close();
            Response.Redirect("SubscriptionPlans.aspx");
        }

        protected void btn_edit_SubscriptionPlan_Click(object sender, EventArgs e)
        {
            string edit_SubscriptionPlans_get_ID = Request.QueryString["edit_SubscriptionPlans_ID"].ToString();
            string get_txt_add_Subscription_Name = txt_edit_Subscription_Name.Text;
            string get_txt_add_Subscription_Price = txt_edit_Subscription_Price.Text;
            string get_txt_add_Subscription_Description = txt_edit_Subscription_Description.Text;
            string get_txt_add_Accesible_Books = txt_edit_Accesible_Books.Text;
            string get_txt_add_validity = txt_edit_validity.Text;
            string get_drp_subscription_tag = drp_edit_subscription_tag.SelectedValue;
            string get_drp_Subscription_Type = drp_edit_Subscription_Type.SelectedValue;
            con.Open();
            string str = "UPDATE SubscriptionPlans_DB SET [SubscriptionName] = '"+ get_txt_add_Subscription_Name + "',[SubscriptionPrice] = '"+ get_txt_add_Subscription_Price + "',[SubscriptionDescription] = '"+ get_txt_add_Subscription_Description + "',[NoOfBooksAccess] = '"+ get_txt_add_Accesible_Books + "',[NoOfDays] = '"+ get_txt_add_validity + "',[tags] = '"+ get_drp_subscription_tag + "',[SubscriptionType] = '"+ get_drp_Subscription_Type + "',[plan_status] = 'Active' WHERE ID = '"+ edit_SubscriptionPlans_get_ID + "'";
            SqlCommand com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Details Updated Succesfully!!!');location.href='SubscriptionPlans.aspx';", true);
        }
    }
}