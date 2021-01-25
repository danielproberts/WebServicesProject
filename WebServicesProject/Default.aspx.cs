 using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace WebServicesProject
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnMap_Click(object sender, EventArgs e)
        {
            string address = txtStreet.Text + " " + txtCity.Text + " " + txtState.Text + " " + txtZip.Text;

            //Add Google API Key Here
            var gKey = "";

            var requestUri = string.Format("https://maps.googleapis.com/maps/api/geocode/xml?key={1}&address={0}&sensor=false",
                Uri.EscapeDataString(address), gKey);

            var request = WebRequest.Create(requestUri);
            var response = request.GetResponse();
            var xdoc = XDocument.Load(response.GetResponseStream());

            var result = xdoc.Element("GeocodeResponse").Element("result");
            var locationElement = result.Element("geometry").Element("location");
            
            string strLatitude = locationElement.Element("lat").ToString();
            strLatitude = strLatitude.Substring(5);
            strLatitude = strLatitude.Substring(0, strLatitude.Length - 6);

            string strLongitude = locationElement.Element("lng").ToString();
            strLongitude = strLongitude.Substring(5);
            strLongitude = strLongitude.Substring(0, strLongitude.Length - 6);

            string strMapType = string.Empty;
            if(RoadRad.Checked == true)
            {
                strMapType = "1";
            }
            else if(SatRad.Checked ==true)
            {
                strMapType = "2";
            }
            else if(HybRad.Checked == true)
            {
                strMapType = "3";
            }

            Response.Redirect("MapPage.aspx?lat=" + strLatitude + "&long=" + strLongitude + "&maptype=" + strMapType);
        }
    }
}