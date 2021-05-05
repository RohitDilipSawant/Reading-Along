using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Reading_Along.Helper
{
    public class randomProfileGenerator
    {
        public static string getProfileGenerator()
        {
            Random r = new Random();
            int genRand = r.Next(1, 11);
            string profile_image = "~/images/profile/" + genRand + ".jpg";
            return profile_image;
        }
    }
}