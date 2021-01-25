using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebServicesProject
{
    public partial class MapPage : System.Web.UI.Page
    {
        public string strLatitude = string.Empty;
        public string strLongitude = string.Empty;
        public string strMapType = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                strLatitude = Request.QueryString["lat"].ToString();
            }
            catch(Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Exception: " + ex.Message.ToString());
            }

            try
            {
                strLongitude = Request.QueryString["long"].ToString();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Exception: " + ex.Message.ToString());
            }

            try
            {
                strMapType = Request.QueryString["maptype"].ToString();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Exception: " + ex.Message.ToString());
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

    }
}