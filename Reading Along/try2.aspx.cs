using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along
{
    public partial class try2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                var supportedTypes = new[] { "png", "jpg"};
                var fileExt = System.IO.Path.GetExtension(FileUpload1.FileName).Substring(1);
                if (!supportedTypes.Contains(fileExt))
                {
                    string ErrorMessage = "File Extension Is InValid - Only Upload png/jpg";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('"+ErrorMessage+"');", true);
                    
                }
                else
                {
                    bool chkfile = false;
                    int imgSize = FileUpload1.PostedFile.ContentLength;
                    string ext = System.IO.Path.GetExtension(this.FileUpload1.PostedFile.FileName);
                    if (FileUpload1.PostedFile.ContentLength > 1000000)
                    {
                        chkfile = false;
                        Image1.Visible = false;
                        Label1.Visible = false;
                        Label1.Text = "";
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('File is too big.');", true);
                        return;
                    }
                    else
                    {
                        chkfile = true;
                    }
                    if (FileUpload1.PostedFile != null && FileUpload1.PostedFile.FileName != "" && chkfile == true)
                    {
                        string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);

                        string fileSave = DateTime.Now.ToString("dd_MM_yyyy_HH_MM_ss_").ToString() + fileName;
                        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/tryStorage/") + fileSave);
                        System.IO.Stream fs = FileUpload1.PostedFile.InputStream;
                        System.IO.BinaryReader br = new System.IO.BinaryReader(fs);
                        Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        Image1.ImageUrl = "data:image/png;base64," + base64String;
                        Image1.Visible = true;
                        Label1.Visible = true;
                        Label1.Text = fileSave;
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
    }
}