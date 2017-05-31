using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SaturationMain : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        clsUser user = (clsUser)Session["user"];
        if (user == null)
        {
            Response.Redirect("~/Site_Login.aspx");
        }
        else
        {
            username.Text = user.Fullname;
        }
    }
    protected void logoutBtn_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Site_Login.aspx");
    }
}
