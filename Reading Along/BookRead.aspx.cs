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
                Response.Redirect("AllBooks.aspx");
            }
            else
            {
                if (Session["User_Login"] == null)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Sign Up!!! If Already Have an Account Please Login!!');location.href='Login.aspx';", true);
                }
                else
                {
                    // get Users value
                    string user_session = Session["User_Login"].ToString();
                    con.Open();
                    string str = "Select * from User_DB where Email_ID = '" + user_session + "';";
                    SqlCommand com = new SqlCommand(str, con);
                    SqlDataReader reader = com.ExecuteReader();
                    reader.Read();
                    string user_sub_expiry_date_str = Convert.ToDateTime(reader["User_Subscription_validity_Date"]).ToString("yyyy/MM/dd");
                    string user_sub_accesible_books_str = reader["User_Subscription_accesible_book"].ToString();
                    string user_books_access_str = reader["books_access"].ToString();
                    string user_ID_str = reader["ID"].ToString();
                    reader.Close();
                    con.Close();
                    Int32 user_sub_accesible_books_int = Convert.ToInt32(user_sub_accesible_books_str);
                    Int32 user_books_access_int = Convert.ToInt32(user_books_access_str);
                    DateTime todays_date = Convert.ToDateTime(DateTime.Now.ToString("yyyy/MM/dd"));
                    DateTime user_sub_expiry_date = Convert.ToDateTime(user_sub_expiry_date_str);

                    // get books value
                    string get_book_id = Request.QueryString["view_book_ID"].ToString();
                    con.Open();
                    string Books_Details_str = "Select * from Books_DB where ID = '" + get_book_id + "';";
                    SqlCommand Books_Details_com = new SqlCommand(Books_Details_str, con);
                    SqlDataReader Books_Details_reader = Books_Details_com.ExecuteReader();
                    Books_Details_reader.Read();
                    string user_book_name_str = Books_Details_reader["Book_Name"].ToString();
                    Books_Details_reader.Close();
                    con.Close();

                    // Validate book use in UserBooksAccess
                    con.Open();
                    string qry = "select * from UserBooksAccess where Book_ID='" + get_book_id + "' and User_Email='" + user_session + "'";
                    SqlCommand cmd = new SqlCommand(qry, con);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        con.Close();
                        if (todays_date <= user_sub_expiry_date)
                        {
                            bindData();
                        }
                        if (todays_date > user_sub_expiry_date)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You dont have any active Subscription!!! PLease get one.!!');location.href='pricing.aspx';", true);
                        }
                    }
                    else
                    {
                        con.Close();
                        if (todays_date <= user_sub_expiry_date)
                        {
                            if (user_sub_accesible_books_int > 0)
                            {
                                //Update User values
                                Int32 new_user_sub_accesible_books_int = user_sub_accesible_books_int - 1;
                                Int32 new_user_books_access_int = user_books_access_int + 1;
                                string new_user_sub_accesible_books_str = new_user_sub_accesible_books_int.ToString();
                                string new_user_books_access_str = new_user_books_access_int.ToString();
                                con.Open();
                                string update_use_access_str = "UPDATE [User_DB] SET books_access = '" + new_user_books_access_str + "', User_Subscription_accesible_book = '" + new_user_sub_accesible_books_str + "' WHERE Email_ID = '" + user_session + "';";
                                SqlCommand update_use_access_com = new SqlCommand(update_use_access_str, con);
                                SqlDataReader update_use_access_reader = update_use_access_com.ExecuteReader();
                                con.Close();


                                // Insert into UserBooksAccess
                                con.Open();
                                string Insert_UserBooksAccess_str = "INSERT INTO UserBooksAccess (User_ID,User_Email,Book_ID,Book_Name) VALUES ('"+ user_ID_str + "','"+ user_session + "','"+ get_book_id + "','"+ user_book_name_str + "');";
                                SqlCommand Insert_UserBooksAccess_com = new SqlCommand(Insert_UserBooksAccess_str, con);
                                SqlDataReader Insert_UserBooksAccess_reader = Insert_UserBooksAccess_com.ExecuteReader();
                                con.Close();

                                bindData();
                            }
                            if (user_sub_accesible_books_int == 0)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You have exceeded books access limit!!! Please get new subscription to access new books.!!');location.href='pricing.aspx';", true);
                            }
                        }
                        if (todays_date > user_sub_expiry_date)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You dont have any active Subscription!!! PLease get one.!!');location.href='pricing.aspx';", true);
                        }
                    }
                }
            }            
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