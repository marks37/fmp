using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class devchild_saturation : System.Web.UI.Page
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
        string newProductAcctGrp_id = Request["AcctGroupID"];
        clsAccountGroup newProductAcctGrp = DBLayer.getNewProductAcctGrpById(newProductAcctGrp_id);
        lblAccountGroup_Name.Text = newProductAcctGrp.account_group_name;
        lblRemakrs.Text = newProductAcctGrp.remarks;
        lblNewProdAcctId.Text = newProductAcctGrp.id;
        lblPlanQty.Text = newProductAcctGrp.plan;
        rprtDatabind(newProductAcctGrp_id);
    }

    protected void rptNewProdBranches_ItemDataBound(object sender, RepeaterItemEventArgs e)
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

    protected void rptNewProdBranches_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //string newProduct_id = Request["NewProduct"];
        //if (e.CommandName.Equals("view"))
        //{
        //    string newProdAcctGrp_id = (string)e.CommandArgument;
        //    Response.Redirect("newproduct_branch?NewProduct=" + Request["NewProduct"] + "&AcctGroupID=" + newProdAcctGrp_id);
        //}
        //else if (e.CommandName.Equals("edit"))
        //{

        //}
        //else if (e.CommandName.Equals("delete"))
        //{

        //}
    }

    public void rprtDatabind(string newProductAcctGrp_id)
    {
        List<clsBranch> newProdBranchesList = DBLayer.getNewProductAssignBranchesByAcctGrpId(newProductAcctGrp_id);
        rptNewProdBranches.DataSource = newProdBranchesList;
        rptNewProdBranches.DataBind();
        List<clsBranch> branchNameList = DBLayer.getBranchNamelist(newProductAcctGrp_id);
        RptAvailableBranch.DataSource = branchNameList;
        RptAvailableBranch.DataBind();
    }



    //Web Method 
    [System.Web.Services.WebMethod]
    public static string getBranchName(string newProductAcctGrp_id)
    {
        List<clsBranch> branchNameList = DBLayer.getBranchNamelist(newProductAcctGrp_id);
        string json = JsonConvert.SerializeObject(new { branchNameList });
        return json;
    }

    [System.Web.Services.WebMethod]
    public static object submitBranch(string TableBranchSelect, string newProductAcctGrpId)
    {
        List<clsBranch> BranchSelect = JsonConvert.DeserializeObject<List<clsBranch>>(TableBranchSelect);
        foreach (var branch in BranchSelect)
        {
            branch.newproductaccountid = newProductAcctGrpId;
            branch.status = "Pending";
        }
        DBLayer.insertBranchSelect(BranchSelect);
        return "";
    }

}