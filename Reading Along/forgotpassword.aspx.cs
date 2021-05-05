using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reading_Along
{
    public partial class forgotpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            verify_OTP_Section.Visible = false;
            get_new_pass_section.Visible = false;
        }

        protected void btn_get_email_Click(object sender, EventArgs e)
        {
            get_Email_Section.Visible = false;
            verify_OTP_Section.Visible = true;
            get_new_pass_section.Visible = false;
        }

        protected void btn_validate_OTP_Click(object sender, EventArgs e)
        {
            get_Email_Section.Visible = false;
            verify_OTP_Section.Visible = false;
            get_new_pass_section.Visible = true;
        }

        protected void btn_change_pass_Click(object sender, EventArgs e)
        {

        }
    }
}