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
    public partial class wishlist : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_Login"] != null)
            {
                if (Request.QueryString["remove_wishlist_Book_ID"] != null)
                {
                    string remove_Book_get_ID = Request.QueryString["remove_wishlist_Book_ID"].ToString();
                    con.Open();
                    string str = "DELETE FROM users_whistlist WHERE ID='" + remove_Book_get_ID + "';";
                    SqlCommand com = new SqlCommand(str, con);
                    SqlDataReader reader = com.ExecuteReader();
                    con.Close();
                    Response.Redirect("wishlist.aspx");
                }
                if (Request.QueryString["removeallwishlistBookID"] != null)
                {
                    string User_get_Email = Session["User_Login"].ToString();
                    string remove_Book_get_ID = Request.QueryString["removeallwishlistBookID"].ToString();
                    con.Open();
                    string str = "DELETE FROM users_whistlist WHERE User_Email='" + User_get_Email + "';";
                    SqlCommand com = new SqlCommand(str, con);
                    SqlDataReader reader = com.ExecuteReader();
                    con.Close();
                    Response.Redirect("wishlist.aspx");
                }
                wishlist_bindData();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Login.!!');location.href='Login.aspx';", true);
            }
        }
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
    }
}