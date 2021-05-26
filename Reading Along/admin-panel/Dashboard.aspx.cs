using Reading_Along.Helper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along.Admin_Panel
{
    public partial class Dashboard1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bindDashboardData();
        }
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void bindDashboardData()
        {
            try
            {
                con.Open();
                string str = "SELECT count (Email_ID) FROM User_DB";
                SqlCommand com = new SqlCommand(str, con);
                Int32 get_count_String = (Int32)com.ExecuteScalar();
                set_total_new_users.InnerText = get_count_String.ToString();
                con.Close();
                con.Open();
                string str_book = "SELECT count (Book_Name) FROM Books_DB";
                SqlCommand com_book = new SqlCommand(str_book, con);
                Int32 get_count_book_String = (Int32)com_book.ExecuteScalar();
                set_total_book.InnerText = get_count_book_String.ToString();
                con.Close();
            }
            catch (Exception ex)
            {
            }
        }
    }
}