using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dev_saturation : System.Web.UI.Page
{
    clsDBLayer DBLayer = new clsDBLayer(ConfigurationManager.ConnectionStrings["SaturationDB"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        clsUser user = (clsUser) Session["user"];
        if (user == null)
        {
            Response.Redirect("~/Site_Login.aspx");
        }

        if (!IsPostBack)
        {
            List<clsNewProduct> newProdList = DBLayer.getAssignedNewProductsByUserId(user.Id);
            newProdRptr.DataSource = newProdList;
            newProdRptr.DataBind();
        }
    }
    protected void newProdRptr_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            clsNewProduct newProd = (clsNewProduct) e.Item.DataItem;
            Label pipelineLbl = (Label)e.Item.FindControl("pipelineDate");
            pipelineLbl.Text = DateTime.Parse(newProd.pipeline).ToString("MM.dd.yyyy");
            Label saturationLbl = (Label)e.Item.FindControl("saturationDate");
            saturationLbl.Text = DateTime.Parse(newProd.saturation).ToString("MM.dd.yyyy");
            Label dateCreatedLbl = (Label)e.Item.FindControl("dateCreated");
            dateCreatedLbl.Text = DateTime.Parse(newProd.createdAt).ToString("MM.dd.yyyy");
        }
    }
    protected void newProdRptr_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
}