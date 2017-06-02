using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsUser
/// </summary>
public class clsUser
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
    private string password;

    public string Password
    {
        get { return password; }
        set { password = value; }
    }
    private string firstname;

    private string fullname;

    public string Fullname
    {
        get { return fullname; }
        set { fullname = value; }
    }

    public string Firstname
    {
        get { return firstname; }
        set { firstname = value; }
    }

    private string middleName;

    public string MiddleName
    {
        get { return middleName; }
        set { middleName = value; }
    }

    private string lastname;

    public string Lastname
    {
        get { return lastname; }
        set { lastname = value; }
    }

    private int isActive;

    public int IsActive
    {
        get { return isActive; }
        set { isActive = value; }
    }

    private string email;

    public string Email
    {
        get { return email; }
        set { email = value; }
    }

    private string type;

    public string Type
    {
        get { return type; }
        set { type = value; }
    }

    private string area;

    public string Area
    {
        get { return area; }
        set { area = value; }
    }

    private string company;

    public string Company
    {
        get { return company; }
        set { company = value; }
    }

	public clsUser()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}

public class clsUser_Channel
{
    public string id { get; set; }
    public string user_id { get;set; }
    public string channel { get; set; }

    public clsUser_Channel()
    {

    }
}