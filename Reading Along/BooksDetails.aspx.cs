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
    public partial class BooksDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bindData();
        }
        protected void bindData()
        {
            SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
            try
            {
                string Book_Detail_ID = Request.QueryString["Book_ID"].ToString();
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select * from Books_DB where ID='" + Book_Detail_ID + "'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                datalist_book_details.DataSource = dt;
                datalist_book_details.DataBind();
                rpr_book_details.DataSource = dt;
                rpr_book_details.DataBind();
                rpr_description.DataSource = dt;
                rpr_description.DataBind();
                con.Close();

                //get author id & name
                con.Open();
                string str = "select * from Books_DB where ID='" + Book_Detail_ID + "'";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                reader.Read();
                string get_BookAuthor_name = reader["Book_Author"].ToString();
                string get_category_name = reader["Book_Category"].ToString();
                reader.Close();
                con.Close();

                //get author details
                con.Open();
                SqlDataAdapter da_author = new SqlDataAdapter("select * from Authors_DB where Author_Name ='" + get_BookAuthor_name + "'", con);
                DataTable dt_author = new DataTable();
                da_author.Fill(dt_author);
                rpr_author_details.DataSource = dt_author;
                rpr_author_details.DataBind();
                con.Close();

                //get related books details
                con.Open();
                SqlDataAdapter da_related_book = new SqlDataAdapter("select * from Books_DB where Book_Category ='" + get_category_name + "'", con);
                DataTable dt_related_book = new DataTable();
                da_related_book.Fill(dt_related_book);
                rpr_relatedbooks.DataSource = dt_related_book;
                rpr_relatedbooks.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
            }
        }
    }
}