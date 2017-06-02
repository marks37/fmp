using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

/// <summary>
/// Summary description for clsNewProductContext
/// </summary>
public class clsNewProductContext : DbContext
{
	public clsNewProductContext() : base("SaturationDB")
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DbSet<clsNewProduct> newProducts { get; set; }
}