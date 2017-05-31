using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newproduct_setup : System.Web.UI.Page
{
    static clsDBLayer DBLayer = new clsDBLayer(ConfigurationManager.ConnectionStrings["SaturationDB"].ToString());

    private clsUser user;
    protected void Page_Load(object sender, EventArgs e)
    {
        user = (clsUser)Session["user"];
        if (user == null)
        {
            Response.Redirect("~/Site_Login.aspx");
            Session.Clear();
        }
        if (!IsPostBack)
        {
            this.DataBind();
        }
        InitializeDropdown();
    }

    protected void newProdSetupRptr_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //{
        //    clsAccountGroup newProdAcctGrpList = (clsAccountGroup)e.Item.DataItem;
        //    Label pipelineLbl = (Label)e.Item.FindControl("ProdpipelineDate");
        //    pipelineLbl.Text = DateTime.Parse(newProdAcctGrpList.pipeline_period).ToString("MM.dd.yyyy");
        //    Label saturationLbl = (Label)e.Item.FindControl("ProdsaturationDate");
        //    saturationLbl.Text = DateTime.Parse(newProdAcctGrpList.saturation_period).ToString("MM.dd.yyyy");
        //}
    }

    protected void newProdSetupRptr_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.Equals("view"))
        {
            string newProd_id = (string)e.CommandArgument;
            Response.Redirect("newproduct_view?NewProductDetails=" + newProd_id);
        }
    }

    protected void btnSubmitNewProd_OnClick(object sender, EventArgs e)
    {
        //clsNewProduct newProd = new clsNewProduct();
        ////newProd.itemCode = tbItemCode.Text;
        ////newProd.itemName = tbItemName.Text;
        //newProd.glu = tbGlu.Text;
        ////newProd.description = tbDescription.Text;
        //newProd.uom = tbUom.Text;
        //newProd.priceNet = tbPriceNet.Text;
        //newProd.productDivision = tbProdDivision.Text ;
        //newProd.createdAt = DBLayer.GetCurrentTime().ToString();
        //newProd.createdBy = user.Id;
        //string newProd_Id = DBLayer.addNewProduct(newProd);
        //DBLayer.addNewProductChannel(newProd_Id);
        //this.DataBind();
        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "closeModal();", true);
    }

    public override void DataBind()
    {
        List<clsNewProduct> NewProductlist = DBLayer.getNewProduct();
        newProdSetupRptr.DataSource = NewProductlist;
        newProdSetupRptr.DataBind();
    }


    public void InitializeDropdown()
    {
        List<clsUL_Item> UL_items = DBLayer.getUL_Items();
        RptNewProductSelection.DataSource = UL_items;
        RptNewProductSelection.DataBind();
    }
    protected void RptNewProductSelection_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //{
        //    clsAccountGroup newProdAcctGrpList = (clsAccountGroup)e.Item.DataItem;
        //    Label pipelineLbl = (Label)e.Item.FindControl("ProdpipelineDate");
        //    pipelineLbl.Text = DateTime.Parse(newProdAcctGrpList.pipeline_period).ToString("MM.dd.yyyy");
        //    Label saturationLbl = (Label)e.Item.FindControl("ProdsaturationDate");
        //    saturationLbl.Text = DateTime.Parse(newProdAcctGrpList.saturation_period).ToString("MM.dd.yyyy");
        //}
    }

    protected void RptNewProductSelection_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //if (e.CommandName.Equals("view"))
        //{
        //    string newProd_id = (string)e.CommandArgument;
        //    Response.Redirect("newproduct_view?NewProductDetails=" + newProd_id);
        //}
    }


    [System.Web.Services.WebMethod(EnableSession = true)]
    public static string SubmitNewProductSetup(string newprodId, string newprodPrice, string newprodUom,string newprodRemarks)
    {
        clsUser userId = (clsUser)HttpContext.Current.Session["user"];
        clsNewProduct newProd = new clsNewProduct();
        newProd.ul_item_id = newprodId;
        newProd.uom = newprodUom;
        newProd.remarks = newprodRemarks;
        newProd.priceNet = newprodPrice;
        newProd.createdAt = DBLayer.GetCurrentTime().ToString();
        newProd.createdBy = userId.Id;
        string newProd_Id = DBLayer.addNewProduct(newProd);
        DBLayer.addNewProductChannel(newProd_Id);
        return "newproduct_view?NewProductDetails=" + newProd_Id;
    }

}