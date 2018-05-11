using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace zamjobs
{
    public class Format
    {
        // Format used for Job Post. e.g ZP000001
        public string GetJobPostIdFormat(string jobPostID)
        {
            return string.Format("ZP{0:000000}", Convert.ToInt32(jobPostID));
        }

        // Format used for Advertiser. e.g ZA000001
        public string GetAdvertiserIdFormat(string advertiserID)
        {
            return string.Format("ZA{0:000000}", Convert.ToInt32(advertiserID));
        }

        // Format used for Jobseeker. e.g ZS000001
        public string GetJobseekerIdFormat(string jobseekerID)
        {
            return string.Format("ZS{0:000000}", Convert.ToInt32(jobseekerID));
        }

        // Format used for Admin. e.g ZM000001
        public string GetAdminIdFormat(string adminID)
        {
            return string.Format("ZM{0:000000}", Convert.ToInt32(adminID));
        }

        // Format used for Order. e.g ZJ000001
        public string GetOrderNumFormat(string orderNum)
        {
            return string.Format("ZJ{0:000000}", Convert.ToInt32(orderNum));
        }

        public string capitalizeStart(string str)
        {
            if ((int)str.Length >= 1)
            {
                string lowerStr = str.ToLower();
                string upperStr = str.ToUpper();
                upperStr = upperStr.Substring(0, 1);
                lowerStr = lowerStr.Substring(1);
                str = upperStr + lowerStr;
            }
            return str;
        }

        public string DateFormat(string date)
        {
            return string.Format("{0:dd/MM/yyyy}", Convert.ToDateTime(date) );
        }
    }
}
