using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace Reading_Along.Helper
{
    public class EmailHealper
    {
        public static void SendOtpMail(string uemail,string OTP_code)
        {
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress("sawantproject@gmail.com");
                mail.To.Add(uemail);
                mail.Subject = "Reading Along Verification Mail";
                mail.Body = "<h1>" + OTP_code + " This Is Verification Code. we request you not to disclose your OTP with anyone else.</h1>";
                mail.IsBodyHtml = true;

                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtp.Credentials = new System.Net.NetworkCredential("sawantproject@gmail.com", "Earn@123");
                    smtp.EnableSsl = true;
                    smtp.Send(mail);
                }
            }
        }
        public static void SendSubscriptionConfirm(string uemail)
        {
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress("sawantproject@gmail.com");
                mail.To.Add(uemail);
                mail.Subject = "Reading Along Subscribed Successful Mail";
                mail.Body = "<h2> Your Email : " + uemail + " Is Subscribed Now. we request you not to disclose your ID Password with anyone else.</h2>";
                mail.IsBodyHtml = true;

                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtp.Credentials = new System.Net.NetworkCredential("sawantproject@gmail.com", "Earn@123");
                    smtp.EnableSsl = true;
                    smtp.Send(mail);
                }
            }
        }
    }
}