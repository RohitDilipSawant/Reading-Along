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
    public partial class authors : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void Page_Load(object sender, EventArgs e)
        {
            bindauthorsData();
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
                list_authors_list.DataSource = dt;
                list_authors_list.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
    }
}