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
    public partial class Inbox : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["remove_comment_ID"] != null)
            {
                string remove_comment_get_ID = Request.QueryString["remove_comment_ID"].ToString();
                con.Open();
                string str = "DELETE FROM ContactUs_DB WHERE ID ='" + remove_comment_get_ID + "';";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                con.Close();
                Response.Redirect("Inbox.aspx");
            }
            bindInboxData();
        }
        protected void bindInboxData()
        {
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM ContactUs_DB order by ID DESC;", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                list_inbox_data.DataSource = dt;
                list_inbox_data.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
    }
}