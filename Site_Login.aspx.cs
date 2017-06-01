using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site_Login : System.Web.UI.Page
{
    clsDBLayer DBLayer = new clsDBLayer(ConfigurationManager.ConnectionStrings["SaturationDB"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void loginBtn_Click(object sender, EventArgs e)
    {
        //This is another test
        string username = inputUsername.Text;
        string password = inputPassword.Text;
        string message = "";
        clsUser user = DBLayer.validateUser(username, password);
        if (user != null)
        {
            Session["user"] = user;
            if (user.Type.Equals("Developer"))
            {
                Response.Redirect("~/newproduct_setup.aspx");
            }
            else if (user.Type.Equals("Sales Representative"))
            {
                Response.Redirect("~/cds_saturation.aspx");
            }
            else if (user.Type.Equals("Coordinator"))
            {
                Response.Redirect("coor_saturation.aspx");
            }
            else if (user.Type.Equals("PMOG"))
            {
                Response.Redirect("~/newproduct.aspx");
                //Response.Redirect("~/newproduct_setup.aspx");
            }
            else if (user.Type.Equals("Maintenance"))
            {
                //Response.Redirect("~/newproduct.aspx");
                Response.Redirect("~/newproduct_setup.aspx");
            }
            
        }
        else
        {
            message += "<div class='alert alert-danger'>";
            message += "Invalid username or password!";
            message += "</div>";
            invalidLogin.Text = message;
        }
    }
}