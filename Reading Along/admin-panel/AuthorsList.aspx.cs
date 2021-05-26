using Reading_Along.Helper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along.admin_panel
{
    public partial class AuthorsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["remove_author_ID"] != null)
            {
                string remove_author_get_ID = Request.QueryString["remove_author_ID"].ToString();
                con.Open();
                string str = "DELETE FROM Authors_DB WHERE ID ='" + remove_author_get_ID + "';";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                con.Close();
                Response.Redirect("AuthorsList.aspx");
            }
            bindauthorData();
        }
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void bindauthorData()
        {
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [dbo].[Authors_DB] order by [Author_Name] ASC;", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                list_authors_data.DataSource = dt;
                list_authors_data.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        protected void btn_add_author_Click(object sender, EventArgs e)
        {
            try
            {
                string get_txt_add_author_name = txt_add_Author_Name.Text;
                string get_txt_add_author_description = txt_add_author_Description.Text;
                string get_txt_add_author_since = txt_add_Author_since.Text;
                string get_txt_add_author_picture = lbl_link.Text;
                con.Open();
                string str = "INSERT INTO Authors_DB ([Author_Name],[Author_Description],[Author_Since],[Author_Picture]) VALUES ('" + get_txt_add_author_name + "','" + get_txt_add_author_description + "','" + get_txt_add_author_since + "','" + get_txt_add_author_picture + "');";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                con.Close();
                Response.Write(@"<script language='javascript'>alert('Details Saved!!!');</script>");
                Response.Write(@"<script language='javascript'>window.open('AuthorsList.aspx','_self');</script>");
            }
            catch
            {
                Response.Write(@"<script language='javascript'>alert('Something went wrong try after some time!!!');</script>");
                Response.Write(@"<script language='javascript'>window.open('AuthorsList.aspx','_self');</script>");
            }
            
        }
        protected void BindauthorUploadAndPreview()
        {
            try
            {
                var supportedTypes = new[] { "png", "jpg" };
                var fileExt = System.IO.Path.GetExtension(file_add_upl_author_image.FileName).Substring(1);
                if (!supportedTypes.Contains(fileExt))
                {
                    string ErrorMessage = "File Type Is InValid - Only png, jpg supported";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ErrorMessage + "');", true);

                }
                else
                {
                    bool chkfile = false;
                    int imgSize = file_add_upl_author_image.PostedFile.ContentLength;
                    string ext = System.IO.Path.GetExtension(this.file_add_upl_author_image .PostedFile.FileName);
                    if (file_add_upl_author_image.PostedFile.ContentLength > 1000000)
                    {
                        chkfile = false;
                        img_add_view_added_author.Visible = false;
                        lnk_remove_author_upload.Visible = false;
                        lbl_link.Visible = false;
                        lbl_link.Text = "";
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('File is too big Max 1MB book cover file can be added.');", true);
                        return;
                    }
                    else
                    {
                        chkfile = true;
                    }
                    if (file_add_upl_author_image.PostedFile != null && file_add_upl_author_image.PostedFile.FileName != "" && chkfile == true)
                    {
                        string random_number = RandomNumberGenerator.getRandomNumber().ToString();
                        string fileName = Path.GetFileName(file_add_upl_author_image.PostedFile.FileName);

                        string fileSave = DateTime.Now.ToString("dd_MM_yyyy_HH_MM_ss_").ToString() + random_number + "." + fileExt;
                        file_add_upl_author_image.PostedFile.SaveAs(Server.MapPath("~/BooksStorage/AuthorStorage/AuthorProfilePicture/") + fileSave);
                        System.IO.Stream fs = file_add_upl_author_image.PostedFile.InputStream;
                        System.IO.BinaryReader br = new System.IO.BinaryReader(fs);
                        Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        img_add_view_added_author.ImageUrl = "data:image/png;base64," + base64String;
                        img_add_view_added_author.Visible = true;
                        lbl_link.Visible = true;
                        lbl_link.Visible = true;
                        lbl_link.Text = fileSave;
                        lnk_remove_author_upload.Visible = true;
                        file_add_upl_author_image.Visible = false;
                    }

                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Upload Image');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('System Error"+ex+"');", true);
            }
        }
        protected void btn_add_upload_author_Click(object sender, EventArgs e)
        {
            BindauthorUploadAndPreview();
        }

        protected void lnk_remove_author_upload_Click(object sender, EventArgs e)
        {
            img_add_view_added_author.ImageUrl = "~/images/Your Book Preview.png";
            lbl_link.Text = null;
            lbl_link.Visible = false;
            lnk_remove_author_upload.Visible = false;
            file_add_upl_author_image.Visible = true;
        }

        protected void btn_back_to_Author_list_Click(object sender, EventArgs e)
        {
            author_list_div.Visible = true;
            author_add_div.Visible = false;
        }

        protected void btn_add_author_section_Click(object sender, EventArgs e)
        {
            author_list_div.Visible = false;
            author_add_div.Visible = true;
        }
    }
}