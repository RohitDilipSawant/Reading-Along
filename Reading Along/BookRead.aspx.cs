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
    public partial class BookRead : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["view_book_ID"] == null)
            {
                Response.Redirect("Books.aspx");
            }
            bindData();
        }
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void bindData()
        {
            try
            {
                string view_book_ID = Request.QueryString["view_book_ID"].ToString();
                con.Open();
                string str = "Select * from Books_DB where ID = " + view_book_ID + ";";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                reader.Read();
                string book_view_path = reader["File_Path"].ToString();
                reader.Close();
                con.Close();
                Book_Frame.Attributes.Add("src", "~/BooksStorage/BookFiles/" + book_view_path + "#toolbar=0");
            }
            catch (Exception ex)
            {
                
            }
        }
    }
}