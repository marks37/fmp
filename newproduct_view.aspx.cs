using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class newproduct_view : System.Web.UI.Page
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
        string newProduct_id = Request["NewProductDetails"];
        clsNewProduct newProd = DBLayer.getNewProductById(newProduct_id);
        newProduct_Name.Text = newProd.itemName;
        newProduct_Code.Text = newProd.itemCode;
        newProduct_Glu.Text = newProd.glu;
        newProduct_Division.Text = newProd.productDivision;
        newProduct_Price.Text = newProd.priceNet;
        newProduct_uom.Text = newProd.uom;
        //List<clsChannel> newProdChannelStatus = DBLayer.getNewProdChannelStatusByID(newProduct_id);
        //newProdChannelStatusRptr.DataSource = newProdChannelStatus;
        //newProdChannelStatusRptr.DataBind();
        //    lblDateCreated.Text = DateTime.Parse(newProd.createdAt).ToString("MM-dd-yyyy");
        //    lblDatePipeline.Text = DateTime.Parse(newProd.pipeline).ToString("MM-dd-yyyy");
        //    lblDateSaturation.Text = DateTime.Parse(newProd.saturation).ToString("MM-dd-yyyy");
    }


    protected void newProdChannelStatusRptr_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //{
        //    clsChannel newProd = (clsChannel)e.Item.DataItem;
        //    var dataItem = newProd.status;
        //    //CheckBox cb = new CheckBox();
        //    //cb = (CheckBox)e.Item.FindControl("toggleswitchChannel");
        //    if (dataItem == "Active")
        //    {
        //        cb.Attributes.Add("checked", "true");
        //    }
        //    else
        //    {
        //        cb.Attributes.Remove("checked");
        //    }
        //}
    }
    [System.Web.Services.WebMethod(EnableSession = true)]

    public static object UpdateChannelStatus(string ChannelId, string Status)
    {
        string UpdtStat = (Status == "Active") ? "Disable" : "Active";
        clsUser userId = (clsUser)HttpContext.Current.Session["user"];
        DBLayer.UpdateChannelSatusById(ChannelId, UpdtStat);
        return "";
    }


    [System.Web.Services.WebMethod]
    public static object lbRefreshChannelTable_Click(string NewProdDetailId)
    {
        List<clsChannel> newProdChannelStatus = DBLayer.getNewProdChannelStatusByID(NewProdDetailId);
        string json = JsonConvert.SerializeObject(new { newProdChannelStatus });
        return json;
        
    }
}