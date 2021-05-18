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

namespace Reading_Along
{
    public partial class ProductBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["edit_book_ID"] != null)
            {
                book_edit_div.Visible = true;
                book_add_div.Visible = false;
                book_list_div.Visible = false;
                bindbookData();
            }
            if (Request.QueryString["remove_book_ID"] != null)
            {
                string remove_book_get_ID = Request.QueryString["remove_book_ID"].ToString();
                con.Open();
                string str = "DELETE FROM Books_DB WHERE ID ='" + remove_book_get_ID + "';";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                con.Close();
                Response.Redirect("ProductBooks.aspx");
            }
            bindData();
        }
        SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
        protected void bindData()
        {
            SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select * from Books_Db order by Book_Name ASC;", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                list_books_data.DataSource = dt;
                list_books_data.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        protected void bindbookData()
        {
            try
            {
                //// Display values
                //string Book_edit_get_ID = Request.QueryString["edit_book_ID"].ToString();
                //SqlConnection con = new SqlConnection(ConStringHelper.getConnectionString());
                //con.Open();
                //string str = "select * from Books_DB where ID='" + Book_edit_get_ID + "'";
                //SqlCommand com = new SqlCommand(str, con);
                //SqlDataReader reader = com.ExecuteReader();
                //reader.Read();
                //txt_edit_username.Text = reader["Username"].ToString();
                //txt_edit_email.Text = reader["Email_ID"].ToString();
                //txt_edit_fname.Text = reader["F_Name"].ToString();
                //txt_edit_lname.Text = reader["L_Name"].ToString();
                //txt_edit_phone.Text = reader["Phone_no"].ToString();
                //txt_edit_address.Text = reader["Address"].ToString();
                //txt_edit_city.Text = reader["City"].ToString();
                //txt_edit_state.Text = reader["State"].ToString();
                //txt_edit_country.Text = reader["Country"].ToString();
                //txt_edit_pinciode.Text = reader["Postal_Code"].ToString();
                //txt_edit_bio.Text = reader["About_Us"].ToString();
                //txt_edit_designation.Text = reader["User_Designation"].ToString();
                //txt_edit_qulifications.Text = reader["User_Qulification"].ToString();
                ////drp_status.Items.FindByText(reader["Verification_Status"].ToString()).Selected= true;
                //status_print.InnerText = reader["Verification_Status"].ToString();
                ////drp_status.SelectedValue = reader["Verification_Status"].ToString();
                //txt_subscription.Text = reader["User_Subscription"].ToString();
                //txt_access_book.Text = reader["books_access"].ToString();
                ////drp_subscription.Items.FindByText(reader["User_Subscription"].ToString()).Selected = true;
                //reader.Close();
                //con.Close();
                //if (status_print.InnerText == "Verified")
                //{
                //    status_print.Style.Add("color", "Green");
                //}
                //if (status_print.InnerText == "Pending")
                //{
                //    status_print.Style.Add("color", "Red");
                //}
            }
            catch (Exception ex)
            {
            }
        }
        protected void BindCoverUploadAndPreview()
        {
            try
            {
                var supportedTypes = new[] { "png", "jpg" };
                var fileExt = System.IO.Path.GetExtension(file_add_upl_book_cover.FileName).Substring(1);
                if (!supportedTypes.Contains(fileExt))
                {
                    string ErrorMessage = "File Type Is InValid - Only png, jpg supported";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ErrorMessage + "');", true);

                }
                else
                {
                    bool chkfile = false;
                    int imgSize = file_add_upl_book_cover.PostedFile.ContentLength;
                    string ext = System.IO.Path.GetExtension(this.file_add_upl_book_cover.PostedFile.FileName);
                    if (file_add_upl_book_cover.PostedFile.ContentLength > 1000000)
                    {
                        chkfile = false;
                        img_add_view_added_cover.Visible = false;
                        lnk_remove_cover_upload.Visible = false;
                        lbl_link.Visible = false;
                        lbl_link.Text = "";
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('File is too big Max 1MB book cover file can be added.');", true);
                        return;
                    }
                    else
                    {
                        chkfile = true;
                    }
                    if (file_add_upl_book_cover.PostedFile != null && file_add_upl_book_cover.PostedFile.FileName != "" && chkfile == true)
                    {
                        string random_number = RandomNumberGenerator.getRandomNumber().ToString();
                        string fileName = Path.GetFileName(file_add_upl_book_cover.PostedFile.FileName);

                        string fileSave = DateTime.Now.ToString("dd_MM_yyyy_HH_MM_ss_").ToString() + random_number +"."+ fileExt;
                        file_add_upl_book_cover.PostedFile.SaveAs(Server.MapPath("~/BooksStorage/BookCover/") + fileSave);
                        System.IO.Stream fs = file_add_upl_book_cover.PostedFile.InputStream;
                        System.IO.BinaryReader br = new System.IO.BinaryReader(fs);
                        Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        img_add_view_added_cover.ImageUrl = "data:image/png;base64," + base64String;
                        img_add_view_added_cover.Visible = true;
                        lbl_link.Visible = true;
                        lbl_link.Visible = true;
                        lbl_link.Text = fileSave;
                        lnk_remove_cover_upload.Visible = true;
                        file_add_upl_book_cover.Visible = false;
                    }

                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Upload Image');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('System Error');", true);
            }
        }
        protected void BindfileUploadAndPreview()
        {
            try
            {
                var supportedTypes = new[] { "pdf" };
                var fileExt = System.IO.Path.GetExtension(file_add_upl_book_files.FileName).Substring(1);
                if (!supportedTypes.Contains(fileExt))
                {
                    string ErrorMessage = "File Type Is InValid - Only pdf file is supported";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ErrorMessage + "');", true);

                }
                else
                {
                    bool chkfile = false;
                    int imgSize = file_add_upl_book_files.PostedFile.ContentLength;
                    string ext = System.IO.Path.GetExtension(this.file_add_upl_book_files.PostedFile.FileName);
                    if (file_add_upl_book_files.PostedFile.ContentLength > 20000000)
                    {
                        chkfile = false;
                        img_add_view_added_file.Visible = false;
                        lnk_remove_file_upload.Visible = false;
                        lbl_link_file.Visible = false;
                        lbl_link_file.Text = "";
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('File is too big max 20 MB file is allowed.');", true);
                        return;
                    }
                    else
                    {
                        chkfile = true;
                    }
                    if (file_add_upl_book_files.PostedFile != null && file_add_upl_book_files.PostedFile.FileName != "" && chkfile == true)
                    {
                        string random_number = RandomNumberGenerator.getRandomNumber().ToString();
                        string fileName = Path.GetFileName(file_add_upl_book_files.PostedFile.FileName);

                        string fileSave = DateTime.Now.ToString("dd_MM_yyyy_HH_MM_ss_").ToString() + random_number + "." + fileExt;
                        file_add_upl_book_files.PostedFile.SaveAs(Server.MapPath("~/BooksStorage/BookFiles/") + fileSave);
                        System.IO.Stream fs = file_add_upl_book_files.PostedFile.InputStream;
                        System.IO.BinaryReader br = new System.IO.BinaryReader(fs);
                        Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        img_add_view_added_file.ImageUrl = "~/images/pdfSuccess.jpg";
                        img_add_view_added_file.Visible = true;
                        lnk_remove_file_upload.Visible = true;
                        lbl_link_file.Visible = true;
                        lbl_link_file.Text = fileSave;
                        file_add_upl_book_files.Visible = false;
                    }

                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Upload Image');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('System Error');", true);
            }
        }

        protected void btn_add_book_Click(object sender, EventArgs e)
        {
            book_edit_div.Visible = false;
            book_add_div.Visible = true;
            book_list_div.Visible = false;
        }

        protected void btn_back_to_user_list_Click(object sender, EventArgs e)
        {
            book_edit_div.Visible = false;
            book_add_div.Visible = false;
            book_list_div.Visible = true;
        }

        protected void btn_add_book_details_Click(object sender, EventArgs e)
        {
            try
            {
                string get_book_name = txt_add_Book_Name.Text;
                string get_book_description = txt_add_description.Text.ToString();
                string get_book_publish_date = txt_add_publish_date.Text;
                string get_book_author = txt_add_book_author.Text;
                string get_book_publisher = txt_add_book_publisher.Text;
                string get_book_category = drp_add_category.Text;
                string get_book_sub_category = drp_add_sub_category.Text;
                string get_book_format = "PDF";
                string get_book_page = txt_add_no_of_page.Text;
                string get_book_dimentions = txt_add_book_dimentions.Text;
                string get_book_isbn10 = txt_add_isbn10.Text;
                string get_book_isbn13 = txt_add_isbn13.Text;
                string get_book_Book_Cover_Page = lbl_link.Text;
                string get_book_Book_Short_Name = txt_add_book_short_name.Text;
                string get_book_File_Path = lbl_link_file.Text;
                con.Open();
                string str = "INSERT INTO [dbo].[Books_DB] ([Book_Name],[Book_Description],[Book_Publish_Date],[Book_Author],[Publisher],[Book_Category],[Book_Sub_Category],[Book_Format],[Book_Pages],[Book_View],[Book_ISBN10],[Book_ISBN13],[Book_Cover_Page],[Book_Short_Name],[File_Path]) " +
                    "VALUES ('" + get_book_name + "','" + get_book_description + "','" + get_book_publish_date + "','" + get_book_author + "','" + get_book_publisher + "','" + get_book_category + "','" + get_book_sub_category + "','" + get_book_format + "','" + get_book_page + "','" + get_book_dimentions + "','" + get_book_isbn10 + "','" + get_book_isbn13 + "','" + get_book_Book_Cover_Page + "','" + get_book_Book_Short_Name + "','" + get_book_File_Path + "');";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                con.Close();
                Response.Write(@"<script language='javascript'>alert('Details Saved!!!');</script>");
                Response.Write(@"<script language='javascript'>window.open('ProductBooks.aspx','_self');</script>");
            }
            catch (Exception ex)
            {
                Response.Write(@"<script language='javascript'>alert('Something went wrong!!!'"+ex+");</script>");
                Response.Write(@"<script language='javascript'>window.open('ProductBooks.aspx','_self');</script>");
            }
            
        }

        protected void btn_add_upload_cover_Click(object sender, EventArgs e)
        {
            BindCoverUploadAndPreview();
        }

        protected void btn_add_upload_book_files_Click(object sender, EventArgs e)
        {
            BindfileUploadAndPreview();
        }

        protected void lnk_remove_cover_upload_Click(object sender, EventArgs e)
        {
            img_add_view_added_cover.ImageUrl = "~/images/Your Book Preview.png";
            lbl_link.Text = null;
            lbl_link.Visible = false;
            lnk_remove_cover_upload.Visible = false;
            file_add_upl_book_cover.Visible = true;
        }

        protected void lnk_remove_file_upload_Click(object sender, EventArgs e)
        {
            img_add_view_added_file.ImageUrl = "~/images/Your Book Preview.png";
            lbl_link_file.Text = null;
            lbl_link_file.Visible = false;
            lnk_remove_file_upload.Visible = false;
            file_add_upl_book_files.Visible = true;
        }
    }
}