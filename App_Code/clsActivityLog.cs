using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsActivityLog
/// </summary>
public class clsActivityLog
{
    private string id;

    public string Id
    {
        get { return id; }
        set { id = value; }
    }
    private string username;

    public string Username
    {
        get { return username; }
        set { username = value; }
    }
    private string pageUrl;

    public string PageUrl
    {
        get { return pageUrl; }
        set { pageUrl = value; }
    }
    private string activity;

    public string Activity
    {
        get { return activity; }
        set { activity = value; }
    }
    private string dateCreated;

    public string DateCreated
    {
        get { return dateCreated; }
        set { dateCreated = value; }
    }

	public clsActivityLog()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}