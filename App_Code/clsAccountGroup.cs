using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsAccountGroup
/// </summary>
public class clsAccountGroup
{
    public string account_group_name { get; set; }
    public string plan { get; set; }
    public string remarks { get; set; }
    public string allocation_plan_amt { get; set; }
    public string pipeline_period { get; set; }
    public string saturation_period { get; set; }
    public string newproduct_id { get; set; }
    public string id { get; set; }
    public clsAccountGroup()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}