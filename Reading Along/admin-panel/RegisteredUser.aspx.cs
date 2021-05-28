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
    public partial class RegisteredUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            user_add_div.Visible = false;
            user_edit_div.Visible = false;
            if (Request.QueryString["edit_user_ID"] != null)
            {
                user_edit_div.Visible = true;
                user_add_div.Visible = false;
                user_list_div.Visible = false;
                if (!Page.IsPostBack)
                {
                    binduserData();
                }
            }
            if (Request.QueryString["remove_user_ID"] != null)
            {
                string remove_user_get_ID = Request.QueryString["remove_user_ID"].ToString();
                con.Open();
                string str = "DELETE FROM User_DB WHERE ID ='" + remove_user_get_ID + "';";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                con.Close();
                Response.Redirect("RegisteredUser.aspx");
            }
            bindData();
        }
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void binduserData()
        {
            try
            {
                // Display values
                string User_edit_get_ID = Request.QueryString["edit_user_ID"].ToString();
                SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
                con.Open();
                string str = "select * from User_DB where ID='" + User_edit_get_ID + "'";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                reader.Read();
                txt_edit_username.Text = reader["Username"].ToString();
                txt_edit_email.Text = reader["Email_ID"].ToString();
                txt_edit_fname.Text = reader["F_Name"].ToString();
                txt_edit_lname.Text = reader["L_Name"].ToString();
                txt_edit_phone.Text = reader["Phone_no"].ToString();
                txt_edit_address.Text = reader["Address"].ToString();
                txt_edit_city.Text = reader["City"].ToString();
                txt_edit_state.Text = reader["State"].ToString();
                txt_edit_country.Text = reader["Country"].ToString();
                txt_edit_pinciode.Text = reader["Postal_Code"].ToString();
                txt_edit_bio.Text = reader["About_Us"].ToString();
                txt_edit_designation.Text = reader["User_Designation"].ToString();
                txt_edit_qulifications.Text = reader["User_Qulification"].ToString();
                //drp_status.Items.FindByText(reader["Verification_Status"].ToString()).Selected= true;
                status_print.InnerText = reader["Verification_Status"].ToString();
                //drp_status.SelectedValue = reader["Verification_Status"].ToString();
                txt_subscription.Text = reader["User_Subscription"].ToString();
                txt_access_book.Text = reader["books_access"].ToString();
                //drp_subscription.Items.FindByText(reader["User_Subscription"].ToString()).Selected = true;
                reader.Close();
                con.Close();
                if(status_print.InnerText == "Verified")
                {
                    status_print.Style.Add("color", "Green");
                }
                if (status_print.InnerText == "Pending")
                {
                    status_print.Style.Add("color", "Red");
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected void bindData()
        {
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select * from User_DB;", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                list_users_data.DataSource = dt;
                list_users_data.DataBind();
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_add_user_Click(object sender, EventArgs e)
        {
            user_add_div.Visible = true;
            user_list_div.Visible = false;
            user_edit_div.Visible = false;
        }

        protected void btn_back_to_user_list_Click(object sender, EventArgs e)
        {
            user_add_div.Visible = false;
            user_list_div.Visible = true;
            user_edit_div.Visible = false;
        }
        protected void btn_add_user_save_details_Click(object sender, EventArgs e)
        {
            string get_username = txt_add_Username.Text;
            string get_txt_add_email = txt_add_email.Text;
            string get_txt_add_pwd = txt_add_pwd.Text;
            string get_txt_add_f_name = txt_add_f_name.Text;
            string get_txt_add_l_name = txt_add_l_name.Text;
            string get_txt_add_phone = txt_add_phone.Text;
            string get_txt_add_address = txt_add_address.Text;
            string get_txt_add_city = txt_add_city.Text;
            string get_txt_add_state = txt_add_state.Text;
            string get_txt_add_country = txt_add_country.Text;
            string get_txt_add_pin_code = txt_add_pin_code.Text;
            string get_txt_add_designation = txt_add_designation.Text;
            string get_txt_add_qulification = txt_add_qulification.Text;
            string get_txt_add_about_user = txt_add_about_user.Text;
            //,'" + get_txt_add_f_name + "'
            con.Open();
            string qry1 = "insert into User_DB (Username, Email_ID, F_Name, L_Name, [Password], [Role], Phone_no, books_access, Address, Verification_Status, City, State, Country, Postal_Code, User_Designation, User_Qulification, About_Us) " +
                "Values ('" + get_username + "','" + get_txt_add_email + "','" + get_txt_add_f_name + "','" + get_txt_add_l_name + "','" + get_txt_add_pwd + "','Coustomer'" +
                ",'" + get_txt_add_phone + "','0','" + get_txt_add_address + "','Pending','"+ get_txt_add_city + "','" + get_txt_add_state + "','" + get_txt_add_country + "','" + get_txt_add_pin_code + "','" + get_txt_add_designation + "','" + get_txt_add_qulification + "','" + get_txt_add_about_user + "');";
            SqlCommand cmd1 = new SqlCommand(qry1, con);
            SqlDataReader sdr1 = cmd1.ExecuteReader();
            con.Close();
        }

        protected void btn_edit_profile_Click(object sender, EventArgs e)
        {
            string user_admin_set_status = drp_status.SelectedValue.ToString();
            string User_edit_get_ID = Request.QueryString["edit_user_ID"].ToString();
            string user_f_name = txt_edit_fname.Text;
            string user_l_name = txt_edit_lname.Text;
            string user_Adress = txt_edit_address.Text;
            string user_city = txt_edit_city.Text;
            string user_pin_code = txt_edit_pinciode.Text;
            string user_country = txt_edit_country.Text;
            string user_state = txt_edit_state.Text;
            string user_phone = txt_edit_phone.Text;
            string user_About_Us = txt_edit_bio.Text;
            string user_deignation = txt_edit_designation.Text;
            string user_qulification = txt_edit_qulifications.Text;
            string user_verification_status = drp_status.SelectedValue;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
            if (user_admin_set_status == "0")
            {
                con.Open();
                string user_details_save_query = "UPDATE User_DB SET F_Name = '" + user_f_name + "', L_Name = '" + user_l_name + "', [Address] = '" + user_Adress + "', City = '" + user_city + "', Postal_Code = '" + user_pin_code + "', Country = '" + user_country + "', State = '" + user_state + "', Phone_no = '" + user_phone + "', About_Us = '" + user_About_Us + "', User_Designation = '" + user_deignation + "', User_Qulification ='" + user_qulification + "' WHERE ID = '" + User_edit_get_ID + "';";
                SqlCommand user_details_cmd = new SqlCommand(user_details_save_query, con);
                SqlDataReader user_details_read = user_details_cmd.ExecuteReader();
                con.Close();
            }
            else
            {
                con.Open();
                string user_details_save_query = "UPDATE User_DB SET F_Name = '" + user_f_name + "', L_Name = '" + user_l_name + "', [Address] = '" + user_Adress + "', City = '" + user_city + "', Postal_Code = '" + user_pin_code + "', Country = '" + user_country + "', State = '" + user_state + "', Phone_no = '" + user_phone + "', About_Us = '" + user_About_Us + "', User_Designation = '" + user_deignation + "', User_Qulification ='" + user_qulification + "', Verification_Status = '" + user_verification_status + "' WHERE ID = '" + User_edit_get_ID + "';";
                SqlCommand user_details_cmd = new SqlCommand(user_details_save_query, con);
                SqlDataReader user_details_read = user_details_cmd.ExecuteReader();
                con.Close();
            }
            Response.Write(@"<script language='javascript'>alert('Details Saved Succesfully');</script>");
            Response.Write(@"<script language='javascript'>window.open('RegisteredUser.aspx','_Self');</script>");
        }
    }
}