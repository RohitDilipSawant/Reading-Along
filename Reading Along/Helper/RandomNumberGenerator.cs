using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Reading_Along.Helper
{
    public class RandomNumberGenerator
    {
        public static string getRandomNumber()
        {
            Random r = new Random();
            int genRand = r.Next(1000, 9999);
            string RandomNumber = ""+genRand+"";
            return RandomNumber;
        }
    }
}