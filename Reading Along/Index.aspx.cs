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
    public partial class Index : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void Page_Load(object sender, EventArgs e)
        {
            bindNewReleaseData();
            bindauthorchoiceData();
            bindMostReadData();
            bindauthorsData();
            total_counts_bindData();
        }
        protected void bindNewReleaseData()
        {
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT TOP 3 * FROM [Books_DB] ORDER BY ID DESC;", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                rpr_new_release.DataSource = dt;
                rpr_new_release.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        protected void bindauthorchoiceData()
        {
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [dbo].[Books_DB] where Product_Listing = 'Author Picks' ORDER BY Book_Name ASC;", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                rpr_author_choice_book.DataSource = dt;
                rpr_author_choice_book.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        protected void bindMostReadData()
        {
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [dbo].[Books_DB] where Product_Listing = 'Most Read' ORDER BY Book_Name ASC;", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                rpr_Most_Read.DataSource = dt;
                rpr_Most_Read.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        protected void bindauthorsData()
        {
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Authors_DB ORDER BY Author_Name ASC;", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                rpr_authors.DataSource = dt;
                rpr_authors.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        protected void total_counts_bindData()
        {
            try
            {
                con.Open();
                SqlCommand qry_book_count = new SqlCommand("SELECT COUNT(*) FROM Books_DB;", con);
                Int32 get_count_String_book_count = (Int32)qry_book_count.ExecuteScalar();
                no_of_book_have.InnerText = get_count_String_book_count.ToString();
                con.Close();
                
                con.Open();
                SqlCommand qry_user_count = new SqlCommand("SELECT COUNT(*) FROM User_DB;", con);
                Int32 get_count_String_user_count = (Int32)qry_user_count.ExecuteScalar();
                no_of_users.InnerText = get_count_String_user_count.ToString();
                con.Close();

                con.Open();
                SqlCommand qry_Happy_user_count = new SqlCommand("SELECT COUNT(*) FROM User_DB where [User_Subscription] != 'Stater Pack';", con);
                Int32 get_count_String_Happy_user_count = (Int32)qry_Happy_user_count.ExecuteScalar();
                no_of_happy_user.InnerText = get_count_String_Happy_user_count.ToString();
                con.Close();
            }
            catch (Exception ex)
            {
            }
        }

    }
}