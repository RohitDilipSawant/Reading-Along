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
    public partial class AllBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());

            if (Request.QueryString["addwishlist_ID"] != null)
            {
                if (Session["User_Login"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    string User_get_Email = Session["User_Login"].ToString();
                    string Book_get_ID = Request.QueryString["addwishlist_ID"].ToString();
                    con.Open();
                    string check_str = "select * from users_whistlist where Book_ID='" + Book_get_ID + "' and User_Email='" + User_get_Email + "'";
                    SqlCommand check_com = new SqlCommand(check_str, con);
                    SqlDataReader check_reader = check_com.ExecuteReader();
                    if (check_reader.Read())
                    {
                        con.Close();
                    }
                    else
                    {
                        con.Close();
                        con.Open();
                        string str = "select * from User_DB where Email_ID='" + User_get_Email + "'";
                        SqlCommand com = new SqlCommand(str, con);
                        SqlDataReader reader = com.ExecuteReader();
                        reader.Read();
                        string get_userId = reader["ID"].ToString();
                        reader.Close();
                        con.Close();
                        con.Open();
                        string books_str = "select * from Books_DB where ID='" + Book_get_ID + "'";
                        SqlCommand books_com = new SqlCommand(books_str, con);
                        SqlDataReader books_reader = books_com.ExecuteReader();
                        books_reader.Read();
                        string get_books_Image = books_reader["Book_Cover_Page"].ToString();
                        string get_books_Name = books_reader["Book_Name"].ToString();
                        books_reader.Close();
                        con.Close();
                        con.Open();
                        string qry1 = "insert into users_whistlist ([User_Email], [User_ID], [Book_ID], [Book_Image], [Book_Name]) Values ('" + User_get_Email + "','" + get_userId + "','" + Book_get_ID + "','" + get_books_Image + "','" + get_books_Name + "');";
                        SqlCommand cmd1 = new SqlCommand(qry1, con);
                        SqlDataReader sdr1 = cmd1.ExecuteReader();
                        con.Close();
                        Response.Redirect("AllBooks.aspx");
                    }
                }
            }
            if (Request.QueryString["remove_wishlist_Book_ID"] != null)
            {
                string remove_Book_get_ID = Request.QueryString["remove_wishlist_Book_ID"].ToString();
                con.Open();
                string str = "DELETE FROM users_whistlist WHERE ID='" + remove_Book_get_ID + "';";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                con.Close();
                Response.Redirect("AllBooks.aspx");
            }
            if (Request.QueryString["removeallwishlistBookID"] != null)
            {
                if (Session["User_Login"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    string User_get_Email = Session["User_Login"].ToString();
                    string remove_Book_get_ID = Request.QueryString["removeallwishlistBookID"].ToString();
                    con.Open();
                    string str = "DELETE FROM users_whistlist WHERE User_Email='" + User_get_Email + "';";
                    SqlCommand com = new SqlCommand(str, con);
                    SqlDataReader reader = com.ExecuteReader();
                    con.Close();
                    Response.Redirect("AllBooks.aspx");
                }
            }
            bindData();
            bindtopcategoryData();
            if (Request.QueryString["FilterCategory"] != null)
            {
                try
                {
                    string get_category_ID = Request.QueryString["FilterCategory"].ToString();
                    con.Open();
                    string str = "select * from [categories_db] where ID='" + get_category_ID + "'";
                    SqlCommand com = new SqlCommand(str, con);
                    SqlDataReader reader = com.ExecuteReader();
                    reader.Read();
                    string get_Category_name = reader["Category"].ToString();
                    reader.Close();
                    con.Close();

                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter("Select * from Books_DB where Book_Category = '" + get_Category_name + "' order by Book_Name ASC;", con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    con.Close();
                    datalist_all_book.DataSource = dt;
                    datalist_all_book.DataBind();
                    product_adds.Visible = false;
                }
                catch (Exception ex)
                {
                }
            }
            if (Request.QueryString["ViewAllCategory"] == "all")
            {
                product_adds.Visible = false;
                bindcategoryData();
                viewAllCategory_lnk.Visible = false;
            }
            if (Request.QueryString["Search"] != null)
            {
                bindsearchData();
                product_adds.Visible = false;
            }
        }
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void bindData()
        {
            try
            {
                string get_short_value = drp_short_by.SelectedValue;
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select * from Books_DB order by "+ get_short_value + " ASC;", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                datalist_all_book.DataSource = dt;
                datalist_all_book.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        protected void bindtopcategoryData()
        {
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select TOP 10 * from [categories_db] order by Category ASC;", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                rpr_category.DataSource = dt;
                rpr_category.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        protected void bindcategoryData()
        {
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select * from [categories_db] order by Category ASC;", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                rpr_category.DataSource = dt;
                rpr_category.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        protected void bindsearchData()
        {
            try
            {
                string get_search_word = Request.QueryString["Search"].ToString();
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Books_DB WHERE product_tags LIKE '%"+ get_search_word + "%' ORDER BY NEWID();", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                datalist_all_book.DataSource = dt;
                datalist_all_book.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
    }
}