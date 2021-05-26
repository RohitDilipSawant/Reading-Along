using Reading_Along.Helper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along
{
    public partial class contactus : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_contactus_Click(object sender, EventArgs e)
        {
            string messanger_name = txt_name.Text;
            string messanger_email = txt_email.Text;
            string messanger_phone = txt_phone.Text;
            string messanger_subject = txt_subject.Text;
            string messanger_coment = txt_comment.Text;
            con.Open();
            string str = "INSERT INTO ContactUs_DB ([MessengerName],[MessengerEmail],[MessengerPhone],[MessengerSubject],[MessangerComment]) VALUES ('"+ messanger_name + "','"+ messanger_email + "','"+ messanger_phone + "','"+ messanger_subject + "','"+ messanger_coment + "');";
            SqlCommand com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Message Send Successfull!!!');location.href='contactus.aspx';", true);
        }
    }
}