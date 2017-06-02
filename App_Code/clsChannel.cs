using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsChannel
/// </summary>
public class clsChannel
{
    public string id { get; set; }
    public string channel { get; set; }
    public string itemname { get; set; }
    public string item_code { get; set; }
    public string pipeline_period { get; set; }
    public string saturation_period { get; set; }
    public string newproduct_id { get; set; }
    public string created_at { get; set; }
    public string created_by { get; set; }
    public string modified_at { get; set; }
    public string modified_by { get; set; }
    public string deleted_at { get; set; }
    public string deleted_by { get; set; }
    public string status { get; set; }
    public string active { get; set; }
    public string remarks { get; set; }

    public string product_division { get; set; }
    public string uom { get; set; }
    public string price_net { get; set; }
    public string glu { get; set; }





	public clsChannel()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}