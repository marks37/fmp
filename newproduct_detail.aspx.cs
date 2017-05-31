using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class newproduct_detail : System.Web.UI.Page
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
        string newProduct_id = Request["NewProduct"];
        if (!IsPostBack)
        {
            clsNewProduct newProd = DBLayer.getNewSaturationById(newProduct_id);
            newProduct_Name.Text = newProd.itemName;
            newProduct_Code.Text = newProd.itemCode;
            newProduct_Glu.Text = newProd.glu;
            newProduct_Division.Text = newProd.productDivision;
            newProduct_Price.Text = newProd.priceNet;
            newProduct_uom.Text = newProd.uom;
            lblChannel.Text = newProd.channel;
            lblDateCreated.Text = DateTime.Parse(newProd.createdAt).ToString("MM.dd.yyyy");
            lblDatePipeline.Text = DateTime.Parse(newProd.pipeline).ToString("MM.yyyy");
            lblDateSaturation.Text = DateTime.Parse(newProd.saturation).ToString("MM.yyyy");
        }
        rprtDatabind(newProduct_id);
    }

    protected void newProdAcctGrpRptr_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        LinkButton viewBtn = (LinkButton)e.Item.FindControl("viewBtn");
        LinkButton BtnEdit = (LinkButton)e.Item.FindControl("BtnEdit");
        LinkButton BtnDelete = (LinkButton)e.Item.FindControl("BtnDelete");
        string usertype = user.Type;
        if (usertype == "PMOG")
        {
            BtnEdit.Visible = true;
            BtnDelete.Visible = true;
        }
        else if (usertype == "Developer")
        {
            BtnEdit.Visible = false;
            BtnDelete.Visible = false;
        }

        //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //{
        //    clsAccountGroup newProdAcctGrpList = (clsAccountGroup)e.Item.DataItem;
        //    Label pipelineLbl = (Label)e.Item.FindControl("ProdpipelineDate");
        //    pipelineLbl.Text = DateTime.Parse(newProdAcctGrpList.pipeline_period).ToString("MM.dd.yyyy");
        //    Label saturationLbl = (Label)e.Item.FindControl("ProdsaturationDate");
        //    saturationLbl.Text = DateTime.Parse(newProdAcctGrpList.saturation_period).ToString("MM.dd.yyyy");
        //}

    }

    protected void newProdAcctGrpRptr_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string newProduct_id = Request["NewProduct"];
        if (e.CommandName.Equals("view"))
        {
            string newProdAcctGrp_id = (string)e.CommandArgument;
            Response.Redirect("newproduct_branch?NewProduct=" + Request["NewProduct"] + "&AcctGroupID=" + newProdAcctGrp_id);
        }
        else if (e.CommandName.Equals("edit"))
        {

        }
        else if (e.CommandName.Equals("delete"))
        {

        }
    }

    public void rprtDatabind(string newProduct_id)
    {
        List<clsAccountGroup> newProdAcctGrpList = DBLayer.getNewProductAssignAccountGroupByNPid(newProduct_id);
        newProdAcctGrpRptr.DataSource = newProdAcctGrpList;
        newProdAcctGrpRptr.DataBind();

        //foreach(RepeaterItem item in newProdAcctGrpRptr.Items)
        //{
        //    if(item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        LinkButton lb = (LinkButton)item.FindControl("viewBtn");


        //        lb.Visible = false;
        //    }
        //}
    }





    //Web Method
    [System.Web.Services.WebMethod]
    public static object getAcctGroup(string channel, string newProduct_id)
    {
        List<string> acctGroupList = DBLayer.getAccountGroupList(channel, newProduct_id);
        string json = JsonConvert.SerializeObject(new { acctGroupList });
        return json;
    }

    [System.Web.Services.WebMethod(EnableSession = true)]
    public static object submitAcctGroup(string TableAccountGroup, string Pk, string PipelineDate, string SatDate)
    {
        List<clsAccountGroup> accountGroup = JsonConvert.DeserializeObject<List<clsAccountGroup>>(TableAccountGroup);
        foreach (var acctgroup in accountGroup)
        {
            acctgroup.newproduct_id = Pk;
            acctgroup.pipeline_period = PipelineDate;
            acctgroup.saturation_period = SatDate;
        }
        DBLayer.insertAccountGroup(accountGroup);
        return "";
    }

    //[System.Web.Services.WebMethod]
    //public static object RefreshAccountofSaturationTable_Click(string newProduct_id)
    //{
    //    List<clsAccountGroup> newAssignAcctGroupList = DBLayer.getNewProductAssignAccountGroupByNPid(newProduct_id);
    //    string json = JsonConvert.SerializeObject(new { newAssignAcctGroupList });
    //    return json;
    //}


}