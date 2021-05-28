using Reading_Along.Helper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along
{
    public partial class Header_Footer : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["Search"] != null)
                {
                    if (!Page.IsPostBack)
                    {
                        string get_search_word = Request.QueryString["Search"].ToString();
                        txt_main_search.Value = get_search_word;
                    }
                }
                SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
                User_name_block.Visible = false;
                user_options.Visible = false;
                bindauthorData();
                bindtopcategoryData();
                bindinnertab_new_releasedData();
                totalbooks_count_bindData();
                if (Session["User_Login"] != null)
                {
                    string User_Session = Session["User_Login"].ToString();
                    con.Open();
                    string str = "select * from User_DB where Email_ID='" + User_Session + "'";
                    SqlCommand com = new SqlCommand(str, con);
                    SqlDataReader reader = com.ExecuteReader();
                    reader.Read();
                    lbl_user_name.Text = reader["F_Name"].ToString() + " " + reader["L_Name"].ToString();
                    reader.Close();
                    con.Close();
                    user_options.Visible = true;
                    login_registration_links_block.Visible = false;
                    User_name_block.Visible = true;
                    wishlist_bindData();

                    con.Open();
                    SqlCommand qry = new SqlCommand("SELECT COUNT(*) FROM users_whistlist WHERE User_Email='" + User_Session + "';", con);
                    Int32 get_count_String = (Int32)qry.ExecuteScalar();
                    wishlist_count_id.InnerText = get_count_String.ToString();
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message); 
            }
        }
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void wishlist_bindData()
        {
            try
            {
                string User_Session = Session["User_Login"].ToString();
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select * from users_whistlist where User_Email='" + User_Session + "';", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                listview_wishlist.DataSource = dt;
                listview_wishlist.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        protected void bindauthorData()
        {
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT Top 3 * FROM Authors_DB;", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                rpr_top_author.DataSource = dt;
                rpr_top_author.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        protected void btn_Email_Newsletter_Click(object sender, EventArgs e)
        {
            string Newsletter_email = txt_email_news.Text;
            con.Open();
            string str = "INSERT INTO Email_Newsletter (Email_ID) VALUES ('" + Newsletter_email + "');";
            SqlCommand com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            con.Close();
            txt_email_news.Text = "";
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
                rpr_category_menu.DataSource = dt;
                rpr_category_menu.DataBind();
                
            }
            catch (Exception ex)
            {
            }
        }
        protected void bindinnertab_new_releasedData()
        {
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT TOP 6 * FROM [Books_DB] ORDER BY ID DESC;", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                rpr_innertab_new_released.DataSource = dt;
                rpr_innertab_new_released.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        protected void totalbooks_count_bindData()
        {
            try
            {
                con.Open();
                SqlCommand qry = new SqlCommand("SELECT COUNT(*) FROM Books_DB;", con);
                Int32 get_count_String = (Int32)qry.ExecuteScalar();
                books_total_count.InnerText = get_count_String.ToString();
                con.Close();
            }
            catch (Exception ex)
            {
            }
        }

        protected void lnk_main_search_Click(object sender, EventArgs e)
        {
            string search_str = txt_main_search.Value;
            Response.Redirect("AllBooks.aspx?Search="+ search_str);
        }
    }
}