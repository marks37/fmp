using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newproduct : System.Web.UI.Page
{
    private clsUser user { get; set; }
    static clsDBLayer DBLayer = new clsDBLayer(ConfigurationManager.ConnectionStrings["SaturationDB"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        user = (clsUser)Session["user"];
        if (user == null)
        {
            Response.Redirect("~/Site_Login.aspx");
        }
        if (!IsPostBack)
        {
         BindTable();
        }
    }
    protected void newProdRptr_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            clsNewProduct newProd = (clsNewProduct)e.Item.DataItem;
            Label pipelineLbl = (Label)e.Item.FindControl("pipelineDate");
            pipelineLbl.Text = DateTime.Parse(newProd.pipeline).ToString("MM.yyyy");
            Label saturationLbl = (Label)e.Item.FindControl("saturationDate");
            saturationLbl.Text = DateTime.Parse(newProd.saturation).ToString("MM.yyyy");
            Label dateCreatedLbl = (Label)e.Item.FindControl("dateCreated");
            dateCreatedLbl.Text = DateTime.Parse(newProd.createdAt).ToString("MM.dd.yyyy");
        }
    }
    protected void newProdRptr_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.Equals("view"))
        {
            string newProd_id = (string)e.CommandArgument;
            Response.Redirect("newproduct_detail?NewProduct=" + newProd_id);
        }
    }
    protected void btnAddSaturation_Click(object sender, EventArgs e)
    {
        string channelbrandid = Request["ddlChannelBrand"];
        string pipelinedate = tbPipeLineDate.Text;
        string saturationdate = tbSaturationDate.Text;
        string remarks = tbRemarks.Text;
        clsChannel newSaturation = new clsChannel();
        newSaturation.id = channelbrandid;
        newSaturation.pipeline_period = pipelinedate;
        newSaturation.saturation_period = saturationdate;
        newSaturation.remarks = remarks;
        newSaturation.created_at = DBLayer.GetCurrentTime().ToString();
        newSaturation.created_by = user.Id;
        DBLayer.UpdateSaturationBYChannelBrandId(newSaturation);
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "closeModal();populateDdlChannelBranch('#ddlChannelBrand');", true);
        BindTable();
    }
    public void BindTable()
    {
        if (user.Type.Equals("PMOG"))
        {
            string userId = user.Id;
            List<clsNewProduct> newProdList = DBLayer.getCreatedNewProductsByUserId(userId);
            newProdRptr.DataSource = newProdList;
            newProdRptr.DataBind();
        }
    }




    // Web Method 
    [System.Web.Services.WebMethod(EnableSession = true)]
    public static object populateDllChannelBrand()
    {
        clsUser userId = (clsUser)HttpContext.Current.Session["user"];
        string userid = userId.Id;
        List<clsChannel> ChannelBranchList = DBLayer.getChannelBrandById(userid);
        string json = JsonConvert.SerializeObject(new { ChannelBranchList });
        return json;
    }


    //[System.Web.Services.WebMethod]
    //public static object LoadDetail()
    //{
        
    //    List<clsNewProduct> test = 
    //    string json = JsonConvert.SerializeObject(new { ChannelBranchList });
    //    return json;
    //}

 
    
}