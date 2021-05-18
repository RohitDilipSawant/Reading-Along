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
    public partial class ProductCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
            if (Request.QueryString["remove_Category_ID"] != null)
            {
                string remove_Category_get_ID = Request.QueryString["remove_Category_ID"].ToString();
                con.Open();
                string str = "DELETE FROM categories_db WHERE ID ='" + remove_Category_get_ID + "';";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                con.Close();
                Response.Redirect("ProductCategory.aspx");
            }
            if (Request.QueryString["remove_SubCategory_ID"] != null)
            {
                string remove_SubCategory_get_ID = Request.QueryString["remove_SubCategory_ID"].ToString();
                con.Open();
                string str = "DELETE FROM SubCategory WHERE ID ='" + remove_SubCategory_get_ID + "';";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                con.Close();
                Response.Redirect("ProductCategory.aspx");
            }
            bindcategoryData();
            bindsubcategoryData();
        }
        protected void bindcategoryData()
        {
            SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select * from categories_db order by Category ASC;", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                list_Category_data.DataSource = dt;
                list_Category_data.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void bindsubcategoryData()
        {
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select * from SubCategory order by [CategoryName] ASC;", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                list_subCategory_data.DataSource = dt;
                list_subCategory_data.DataBind();
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_add_category_Click(object sender, EventArgs e)
        {
            category_list_div.Visible = false;
            Category_add_div.Visible = true;
            sub_Category_add_div.Visible = false;
        }

        protected void btn_add_sub_category_Click(object sender, EventArgs e)
        {
            category_list_div.Visible = false;
            Category_add_div.Visible = false;
            sub_Category_add_div.Visible = true;
        }

        protected void btn_back_to_category_list_Click(object sender, EventArgs e)
        {
            category_list_div.Visible = true;
            Category_add_div.Visible = false;
            sub_Category_add_div.Visible = false;
        }

        protected void btn_add_subcategory_Click(object sender, EventArgs e)
        {
            string get_new_sub_category_name = txt_add_sub_Category_Name.Text;
            string get_new_sub_category_drp_parent_category_id = drp_parent_category_name.SelectedValue;
            string get_new_sub_category_drp_parent_category_name = drp_parent_category_name.Items[drp_parent_category_name.SelectedIndex].Text;
            con.Open();
            string str = "INSERT INTO [dbo].[SubCategory] ([SubCategory],[CategoryID],[CategoryName]) VALUES ('"+ get_new_sub_category_name + "','"+ get_new_sub_category_drp_parent_category_id + "','"+ get_new_sub_category_drp_parent_category_name + "');";
            SqlCommand com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            con.Close();
            Response.Redirect("ProductCategory.aspx");
        }

        protected void btn_add_book_details_Click(object sender, EventArgs e)
        {
            string get_new_category_name = txt_add_Category_Name.Text;
            con.Open();
            string str = "INSERT INTO [dbo].[categories_db] ([Category]) VALUES ('"+ get_new_category_name + "')";
            SqlCommand com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            con.Close();
            Response.Redirect("ProductCategory.aspx");
        }
    }
}