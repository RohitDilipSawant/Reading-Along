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
                string str = "select * from Books_DB where ID='" + Book_Detail_ID + "'";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                reader.Read();
                img_book_cover.ImageUrl = reader["Book_Cover_Page"].ToString();
                reader.Close();

                if (dt.Rows.Count <= 0) {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please login or Your session has expired.');location.href='index.aspx';", true);
                }
                else
                {

                }
                con.Close();
            }
            catch (Exception ex)
            {
            }
        }
    }
}