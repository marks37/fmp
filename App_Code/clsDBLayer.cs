using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsDBLayer
/// </summary>
public class clsDBLayer
{
    private string gConnString;

    public clsDBLayer(string strConn)
    {
        gConnString = strConn;
    }

    public clsDBLayer()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public DateTime GetCurrentTime()
    {
        DateTime serverTime = DateTime.Now;
        DateTime _localTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(serverTime, TimeZoneInfo.Local.Id, "Singapore Standard Time");
        return _localTime;
    }

    public void addNewActivityLog(clsActivityLog log)
    {
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"INSERT INTO [dbo].[Data_User_Activity_Log]
           ([username]
           ,[pageUrl]
           ,[activity]
           ,[dateCreated])
     VALUES
           (@username
           ,@pageUrl
           ,@activity
           ,@dateCreated)";

        myCommand.Parameters.Add("@username", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@pageUrl", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@activity", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@dateCreated", System.Data.SqlDbType.NVarChar);

        myCommand.Parameters["@username"].Value = log.Username;
        myCommand.Parameters["@pageUrl"].Value = log.PageUrl;
        myCommand.Parameters["@activity"].Value = log.Activity;
        myCommand.Parameters["@dateCreated"].Value = log.DateCreated;

        try
        {

            myConnection.Open();
            myCommand.ExecuteNonQuery();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

    }

    public clsUser validateUser(string username, string password)
    {
        clsUser user = new clsUser();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT * FROM [Saturation_Database].[dbo].[Ref_User]
        WHERE [username] = @username AND [password] = @password";

        myCommand.Parameters.Add("@username", System.Data.SqlDbType.VarChar);
        myCommand.Parameters["@username"].Value = username;
        myCommand.Parameters.Add("@password", System.Data.SqlDbType.VarChar);
        myCommand.Parameters["@password"].Value = password;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                user.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                user.Username = (myReader["username"] == null) ? string.Empty : myReader["username"].ToString();
                user.Password = (myReader["password"] == null) ? string.Empty : myReader["password"].ToString();
                user.Fullname = (myReader["fullname"] == null) ? string.Empty : myReader["fullname"].ToString();
                user.Firstname = (myReader["firstname"] == null) ? string.Empty : myReader["firstname"].ToString();
                user.MiddleName = (myReader["middle"] == null) ? string.Empty : myReader["middle"].ToString();
                user.Lastname = (myReader["lastname"] == null) ? string.Empty : myReader["lastname"].ToString();
                user.Type = (myReader["type"] == null) ? string.Empty : myReader["type"].ToString();
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return user;
    }

    public List<clsUser> getAllUsers()
    {
        List<clsUser> users = new List<clsUser>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("SELECT TOP 1000 [id] " +
        ",[username] " +
        ",[password] " +
        ",[firstname] " +
        ",[lastname] " +
        ",[type] " +
        ",[area] " +
        ",[is_active] " +
        ",[email] " +
        "FROM [visibility_system_database].[dbo].[Ref_User]");

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                clsUser user = new clsUser();
                user.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                user.Firstname = (myReader["firstname"] == null) ? string.Empty : myReader["firstname"].ToString();
                user.Password = (myReader["password"] == null) ? string.Empty : myReader["password"].ToString();
                user.Username = (myReader["username"] == null) ? string.Empty : myReader["username"].ToString();
                user.Type = (myReader["type"] == null) ? string.Empty : myReader["type"].ToString();
                user.Username = (myReader["area"] == null) ? string.Empty : myReader["area"].ToString();
                user.Username = (myReader["is_active"] == null) ? string.Empty : myReader["is_active"].ToString();
                user.Username = (myReader["email"] == null) ? string.Empty : myReader["email"].ToString();
                users.Add(user);
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }



        return users;
    }

    //    public clsBranch getBranchById(string branchId)
    //    {
    //        clsBranch branch = new clsBranch();

    //        SqlConnection myConnection = new SqlConnection();
    //        SqlCommand myCommand = new SqlCommand();

    //        myConnection.ConnectionString = gConnString;
    //        myCommand.Connection = myConnection;

    //        myCommand.CommandType = System.Data.CommandType.Text;
    //        myCommand.CommandText = @"SELECT TOP 1000 [id]
    //      ,[branch_code]
    //      ,[branch_name]
    //      ,[branch_address]
    //      ,[account_group_1]
    //      ,[account_group_2]
    //      ,[channel]
    //      ,[team]
    //      ,[sales_rep_name]
    //      ,[sales_rep_code]
    //      ,[ul_account_code]
    //      ,[account_code]
    //      ,[remarks]
    //      ,[team_leader]
    //      ,[cds]
    //  FROM [visibility_system_database].[dbo].[Ref_Branch]
    //  WHERE id = @branchId";

    //        myCommand.Parameters.Add("@branchId", System.Data.SqlDbType.NVarChar);
    //        myCommand.Parameters["@branchId"].Value = branchId;

    //        try
    //        {
    //            myConnection.Open();
    //            SqlDataReader myReader = myCommand.ExecuteReader();
    //            while (myReader.Read())
    //            {
    //                branch.BranchId = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
    //                branch.BranchName = (myReader["branch_name"] == null) ? string.Empty : myReader["branch_name"].ToString();
    //                branch.BranchCode = (myReader["branch_code"] == null) ? string.Empty : myReader["branch_code"].ToString();
    //                branch.BranchAddress = (myReader["branch_address"] == null) ? string.Empty : myReader["branch_address"].ToString();
    //                branch.Account_group_1 = (myReader["account_group_1"] == null) ? string.Empty : myReader["account_group_1"].ToString();

    //            }
    //            myReader.Close();

    //        }
    //        catch (Exception objExp)
    //        {
    //            throw objExp;
    //        }
    //        finally
    //        {
    //            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
    //            {
    //                myConnection.Close();
    //            }
    //        }

    //        return branch;
    //    }

    public clsUser getUserById(string userId)
    {
        clsUser user = new clsUser();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("SELECT TOP 1000 [id] " +
        ",[username] " +
        ",[password] " +
        ",[fullname] " +
        ",[firstname] " +
        ",[middle] " +
        ",[lastname] " +
        ",[type] " +
        ",[area] " +
        ",[is_active] " +
        ",[email] " +
        "FROM [visibility_system_database].[dbo].[Ref_User] " +
        "WHERE id = @userId");

        myCommand.Parameters.Add("@userId", System.Data.SqlDbType.VarChar);
        myCommand.Parameters["@userId"].Value = userId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                user.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                user.Username = (myReader["username"] == null) ? string.Empty : myReader["username"].ToString();
                user.Password = (myReader["password"] == null) ? string.Empty : myReader["password"].ToString();
                user.Fullname = (myReader["fullname"] == null) ? string.Empty : myReader["fullname"].ToString();
                user.Firstname = (myReader["firstname"] == null) ? string.Empty : myReader["firstname"].ToString();
                user.MiddleName = (myReader["middle"] == null) ? string.Empty : myReader["middle"].ToString();
                user.Lastname = (myReader["lastname"] == null) ? string.Empty : myReader["lastname"].ToString();
                user.Type = (myReader["type"] == null) ? string.Empty : myReader["type"].ToString();
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return user;
    }

    public List<clsNewProduct> getAssignedNewProductsByUserId(string userId)
    {
        List<clsNewProduct> newProductList = new List<clsNewProduct>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT C.[id]
              ,[glu]
              ,[item_id]
              ,[item_code]
              ,[item_name]
              ,[remarks]
              ,[uom]
              ,[price_net]
              ,[product_division]
              ,C.[channel]
              ,[pipeline_period]
              ,[saturation_period]
              ,C.[created_at]
              ,C.[created_by]
              ,C.[modified_at]
              ,C.[modified_by]
              ,[status]
              ,[plan]
              ,[confirmed]
        FROM [dbo].Ref_User A
        INNER JOIN [dbo].Ref_User_Channel B ON A.id = B.user_id
        INNER JOIN [dbo].Ref_NewProduct C ON B.channel = C.channel
        WHERE A.id = @userId 
        ORDER BY C.id desc";

        myCommand.Parameters.AddWithValue("@userId", System.Data.SqlDbType.VarChar);
        myCommand.Parameters["@userId"].Value = userId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                clsNewProduct newProd = new clsNewProduct();
                newProd.id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                newProd.glu = (myReader["glu"] == null) ? string.Empty : myReader["glu"].ToString();
                newProd.itemId = (myReader["item_id"] == null) ? string.Empty : myReader["item_id"].ToString();
                newProd.itemCode = (myReader["item_code"] == null) ? string.Empty : myReader["item_code"].ToString();
                newProd.itemName = (myReader["item_name"] == null) ? string.Empty : myReader["item_name"].ToString();
                newProd.remarks = (myReader["remarks"] == null) ? string.Empty : myReader["remarks"].ToString();
                newProd.uom = (myReader["uom"] == null) ? string.Empty : myReader["uom"].ToString();
                newProd.priceNet = (myReader["price_net"] == null) ? string.Empty : myReader["price_net"].ToString();
                newProd.productDivision = (myReader["product_division"] == null) ? string.Empty : myReader["product_division"].ToString();
                newProd.channel = (myReader["channel"] == null) ? string.Empty : myReader["channel"].ToString();
                newProd.pipeline = (myReader["pipeline_period"] == null) ? string.Empty : myReader["pipeline_period"].ToString();
                newProd.saturation = (myReader["saturation_period"] == null) ? string.Empty : myReader["saturation_period"].ToString();
                newProd.createdAt = (myReader["created_at"] == null) ? string.Empty : myReader["created_at"].ToString();
                newProd.createdBy = (myReader["created_by"] == null) ? string.Empty : myReader["created_by"].ToString();
                newProd.modifiedAt = (myReader["modified_at"] == null) ? string.Empty : myReader["modified_at"].ToString();
                newProd.modifiedBy = (myReader["modified_by"] == null) ? string.Empty : myReader["modified_by"].ToString();
                newProd.status = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                newProd.plan = (myReader["plan"] == null) ? string.Empty : myReader["plan"].ToString();
                newProd.confirmed = (myReader["confirmed"] == null) ? string.Empty : myReader["confirmed"].ToString();
                newProductList.Add(newProd);
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
        return newProductList;
    }


    public List<clsUser_Channel> getUserAssignedChannelsByUserId(string userId)
    {
        List<clsUser_Channel> assignedChannels = new List<clsUser_Channel>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT [id]
      ,[user_id]
      ,[channel]
  FROM [Saturation_Database].[dbo].[Ref_User_Channel]
  WHERE user_id = 1";

        myCommand.Parameters.AddWithValue("@userId", System.Data.SqlDbType.VarChar);
        myCommand.Parameters["@userId"].Value = userId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                clsUser_Channel assignedChannel = new clsUser_Channel();
                assignedChannel.id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                assignedChannel.channel = (myReader["channel"] == null) ? string.Empty : myReader["channel"].ToString();
                assignedChannel.user_id = (myReader["user_id"] == null) ? string.Empty : myReader["user_id"].ToString();
                assignedChannels.Add(assignedChannel);
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return assignedChannels;

    }

    public clsNewProduct getNewProductById(string id)
    {
        clsNewProduct newProd = new clsNewProduct();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT [id]
      ,[glu]
      ,[item_code]
      ,[item_name]
      ,[remarks]
      ,[uom]
      ,[price_net]
      ,[product_division]
      ,[created_at]
      ,[created_by]
      ,[modified_at]
      ,[modified_by]
      ,[status]
      ,[plan]
      ,[confirmed]
      ,[deleted_at]
      ,[deleted_by]
  FROM [Saturation_Database].[dbo].[Ref_NewProduct]
  WHERE [id] = @id";

        myCommand.Parameters.AddWithValue("@id", System.Data.SqlDbType.VarChar);
        myCommand.Parameters["@id"].Value = id;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                newProd.id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                newProd.glu = (myReader["glu"] == null) ? string.Empty : myReader["glu"].ToString();
                newProd.itemCode = (myReader["item_code"] == null) ? string.Empty : myReader["item_code"].ToString();
                newProd.itemName = (myReader["item_name"] == null) ? string.Empty : myReader["item_name"].ToString();
                newProd.remarks = (myReader["remarks"] == null) ? string.Empty : myReader["remarks"].ToString();
                newProd.uom = (myReader["uom"] == null) ? string.Empty : myReader["uom"].ToString();
                newProd.priceNet = (myReader["price_net"] == null) ? string.Empty : myReader["price_net"].ToString();
                newProd.productDivision = (myReader["product_division"] == null) ? string.Empty : myReader["product_division"].ToString();
                newProd.createdAt = (myReader["created_at"] == null) ? string.Empty : myReader["created_at"].ToString();
                newProd.createdBy = (myReader["created_by"] == null) ? string.Empty : myReader["created_by"].ToString();
                newProd.modifiedAt = (myReader["modified_at"] == null) ? string.Empty : myReader["modified_at"].ToString();
                newProd.modifiedBy = (myReader["modified_by"] == null) ? string.Empty : myReader["modified_by"].ToString();
                newProd.status = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                newProd.plan = (myReader["plan"] == null) ? string.Empty : myReader["plan"].ToString();
                newProd.confirmed = (myReader["confirmed"] == null) ? string.Empty : myReader["confirmed"].ToString();
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
        return newProd;
    }



    public string addNewProduct(clsNewProduct newProd)
    {
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"INSERT INTO [dbo].[Ref_NewProduct]
                ([glu]
                ,[item_code]
                ,[item_name]
                ,[remarks]
                ,[uom]
                ,[price_net]
                ,[product_division]
                ,[created_at]
                ,[created_by]
                ,[modified_at]
                ,[modified_by]
                ,[status]
                ,[plan]
                ,[confirmed]
                ,[deleted_at]
                ,[deleted_by]
                ,[ul_item_id])
     VALUES
           ((select [glu_name] from [Ref_UL_Item] where [id] = @ul_item_id)
           ,(select [item_code] from [Ref_UL_Item] where [id] = @ul_item_id)
           ,(select [item_name] from [Ref_UL_Item] where [id] = @ul_item_id)
           ,@remarks
           ,@uom
           ,@price
           ,(select [division_name] from [Ref_UL_Item] where [id] = @ul_item_id)
           ,@created_at
           ,@created_by
           ,@modified_at
           ,@modified_by
           ,@status
           ,@plan
           ,@confirmed
           ,@deleted_at
           ,@deleted_by
           ,@ul_item_id)
            select MAX([id]) AS [id] from [Ref_NewProduct]";

        myCommand.Parameters.AddWithValue("@remarks", (Object)newProd.remarks ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@uom", (Object)newProd.uom ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@price", (Object)newProd.priceNet ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@created_at", (Object)newProd.createdAt ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@created_by", (Object)newProd.createdBy ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@modified_at", (Object)newProd.modifiedAt ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@modified_by", (Object)newProd.modifiedBy ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@status", (Object)newProd.status ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@plan", (Object)newProd.plan ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@confirmed", (Object)newProd.confirmed ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@deleted_at", (Object)newProd.deleted_at ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@deleted_by", (Object)newProd.deleted_by ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@ul_item_id", (Object)newProd.ul_item_id ?? DBNull.Value);

        string newProd_Id = "";
        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                newProd_Id = myReader["id"].ToString();
            }
            myReader.Close();
        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
        return newProd_Id;

    }

    public string addNewProductChannel(string newProd_Id)
    {
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"INSERT INTO [dbo].[Ref_NewProduct_Channel]
                ([channel], [newproduct_id],[status])
     VALUES
                ('General Trade',@newprodid,'Disable'),
                ('Key Accounts',@newprodid,'Disable'),
                ('Mercury',@newprodid,'Disable'),
                ('Modern Trade',@newprodid,'Disable')";

        myCommand.Parameters.AddWithValue("@newprodid", newProd_Id);

        //string newProd_Id = "";
        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            //while (myReader.Read())
            //{
            //    newProd_Id = myReader["id"].ToString();
            //}
            myReader.Close();
        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
        return newProd_Id;

    }



    public clsUL_Item getUL_ItemById(string id)
    {
        clsUL_Item ul_item = new clsUL_Item();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT * FROM [dbo].[Ref_UL_Item] where id = @id";

        myCommand.Parameters.Add("@id", System.Data.SqlDbType.VarChar);
        myCommand.Parameters["@id"].Value = id;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                ul_item.id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                ul_item.itemCode = (myReader["item_code"] == null) ? string.Empty : myReader["item_code"].ToString();
                ul_item.itemName = (myReader["item_name"] == null) ? string.Empty : myReader["item_name"].ToString();
                ul_item.baseTag = (myReader["base_tag"] == null) ? string.Empty : myReader["base_tag"].ToString();
                ul_item.classification = (myReader["classification"] == null) ? string.Empty : myReader["classification"].ToString();
                ul_item.class1 = (myReader["class"] == null) ? string.Empty : myReader["class"].ToString();
                ul_item.divisionCode = (myReader["division_code"] == null) ? string.Empty : myReader["division_code"].ToString();
                ul_item.divisionName = (myReader["division_name"] == null) ? string.Empty : myReader["division_name"].ToString();
                ul_item.gluClusterCode = (myReader["glu_cluster_code"] == null) ? string.Empty : myReader["glu_cluster_code"].ToString();
                ul_item.gluClusterName = (myReader["glu_cluster_name"] == null) ? string.Empty : myReader["glu_cluster_name"].ToString();
                ul_item.gluSubGroup = (myReader["glu_sub_group"] == null) ? string.Empty : myReader["glu_sub_group"].ToString();
                ul_item.gluCode = (myReader["glu_code"] == null) ? string.Empty : myReader["glu_code"].ToString();
                ul_item.gluName = (myReader["glu_name"] == null) ? string.Empty : myReader["glu_name"].ToString();
                ul_item.categoryCode = (myReader["category_code"] == null) ? string.Empty : myReader["category_code"].ToString();
                ul_item.categoryName = (myReader["category_name"] == null) ? string.Empty : myReader["category_name"].ToString();
                ul_item.subBrandCode = (myReader["sub_brand_code"] == null) ? string.Empty : myReader["sub_brand_code"].ToString();
                ul_item.subBrandName = (myReader["sub_brand_name"] == null) ? string.Empty : myReader["sub_brand_name"].ToString();
                ul_item.brandCode = (myReader["brand_code"] == null) ? string.Empty : myReader["brand_code"].ToString();
                ul_item.franchiseCode = (myReader["franchise_code"] == null) ? string.Empty : myReader["franchise_code"].ToString();
                ul_item.franchiseName = (myReader["franchise_name"] == null) ? string.Empty : myReader["franchise_name"].ToString();
                ul_item.segmentCode = (myReader["segment_code"] == null) ? string.Empty : myReader["segment_code"].ToString();
                ul_item.segmentName = (myReader["segment_name"] == null) ? string.Empty : myReader["segment_name"].ToString();
                ul_item.moleculeCode = (myReader["molecule_code"] == null) ? string.Empty : myReader["molecule_code"].ToString();
                ul_item.moleculeName = (myReader["molecule_name"] == null) ? string.Empty : myReader["molecule_name"].ToString();
                ul_item.clusterCode = (myReader["cluster_code"] == null) ? string.Empty : myReader["cluster_code"].ToString();
                ul_item.clusterName = (myReader["cluster_name"] == null) ? string.Empty : myReader["cluster_name"].ToString();
                ul_item.itemStatus = (myReader["item_status"] == null) ? string.Empty : myReader["item_status"].ToString();
                ul_item.itemStatusName = (myReader["item_status_name"] == null) ? string.Empty : myReader["item_status_name"].ToString();
                ul_item.className = (myReader["class_name"] == null) ? string.Empty : myReader["class_name"].ToString();
                ul_item.lineName = (myReader["line_name"] == null) ? string.Empty : myReader["line_name"].ToString();
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return ul_item;
    }



    public DataTable ExecSQLQuery(string query)
    {
        DataTable dt = null;
        SqlConnection sqlCon = new SqlConnection(gConnString);
        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
        sqlCmd.CommandTimeout = 0;
        SqlDataAdapter sqlAdap = new SqlDataAdapter(sqlCmd);

        try
        {
            sqlCon.Open();

            dt = new DataTable();
            sqlAdap.Fill(dt);

            sqlCon.Close();
        }
        catch (Exception)
        {
            //error
            sqlCon.Close();
            dt = null;
        }

        return dt;
    }





    //newproduct_setup
    public List<clsUL_Item> getUL_Items()
    {
        List<clsUL_Item> UL_items = new List<clsUL_Item>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT  [id]
                                        ,[item_code]
                                        ,[item_name]
                                        ,[division_name]
                                        ,[glu_name]
                                        ,[category_name]
                                        ,[item_status] 
                                    FROM [dbo].[Ref_UL_Item]
                        where  [item_code] ++ [item_name] not in (select [item_code] ++ [item_name] from [Ref_NewProduct])";

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                clsUL_Item ul_item = new clsUL_Item();
                ul_item.id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                ul_item.itemCode = (myReader["item_code"] == null) ? string.Empty : myReader["item_code"].ToString();
                ul_item.itemName = (myReader["item_name"] == null) ? string.Empty : myReader["item_name"].ToString();
                //ul_item.baseTag = (myReader["base_tag"] == null) ? string.Empty : myReader["base_tag"].ToString();
                //ul_item.classification = (myReader["classification"] == null) ? string.Empty : myReader["classification"].ToString();
                //ul_item.class1 = (myReader["class"] == null) ? string.Empty : myReader["class"].ToString();
                //ul_item.divisionCode = (myReader["division_code"] == null) ? string.Empty : myReader["division_code"].ToString();
                ul_item.divisionName = (myReader["division_name"] == null) ? string.Empty : myReader["division_name"].ToString();
                //ul_item.gluClusterCode = (myReader["glu_cluster_code"] == null) ? string.Empty : myReader["glu_cluster_code"].ToString();
                //ul_item.gluClusterName = (myReader["glu_cluster_name"] == null) ? string.Empty : myReader["glu_cluster_name"].ToString();
                //ul_item.gluSubGroup = (myReader["glu_sub_group"] == null) ? string.Empty : myReader["glu_sub_group"].ToString();
                //ul_item.gluCode = (myReader["glu_code"] == null) ? string.Empty : myReader["glu_code"].ToString();
                ul_item.gluName = (myReader["glu_name"] == null) ? string.Empty : myReader["glu_name"].ToString();
                ul_item.itemStatus = (myReader["item_status"] == null) ? string.Empty : myReader["item_status"].ToString();
                //ul_item.categoryCode = (myReader["category_code"] == null) ? string.Empty : myReader["category_code"].ToString();
                ul_item.categoryName = (myReader["category_name"] == null) ? string.Empty : myReader["category_name"].ToString();
                //ul_item.subBrandCode = (myReader["sub_brand_code"] == null) ? string.Empty : myReader["sub_brand_code"].ToString();
                //ul_item.subBrandName = (myReader["sub_brand_name"] == null) ? string.Empty : myReader["sub_brand_name"].ToString();
                //ul_item.brandCode = (myReader["brand_code"] == null) ? string.Empty : myReader["brand_code"].ToString();
                //ul_item.franchiseCode = (myReader["franchise_code"] == null) ? string.Empty : myReader["franchise_code"].ToString();
                //ul_item.franchiseName = (myReader["franchise_name"] == null) ? string.Empty : myReader["franchise_name"].ToString();
                //ul_item.segmentCode = (myReader["segment_code"] == null) ? string.Empty : myReader["segment_code"].ToString();
                //ul_item.segmentName = (myReader["segment_name"] == null) ? string.Empty : myReader["segment_name"].ToString();
                //ul_item.moleculeCode = (myReader["molecule_code"] == null) ? string.Empty : myReader["molecule_code"].ToString();
                //ul_item.moleculeName = (myReader["molecule_name"] == null) ? string.Empty : myReader["molecule_name"].ToString();
                //ul_item.clusterCode = (myReader["cluster_code"] == null) ? string.Empty : myReader["cluster_code"].ToString();
                //ul_item.clusterName = (myReader["cluster_name"] == null) ? string.Empty : myReader["cluster_name"].ToString();
                //ul_item.itemStatus = (myReader["item_status"] == null) ? string.Empty : myReader["item_status"].ToString();
                //ul_item.itemStatusName = (myReader["item_status_name"] == null) ? string.Empty : myReader["item_status_name"].ToString();
                //ul_item.className = (myReader["class_name"] == null) ? string.Empty : myReader["class_name"].ToString();
                //ul_item.lineName = (myReader["line_name"] == null) ? string.Empty : myReader["line_name"].ToString();
                UL_items.Add(ul_item);
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return UL_items;
    }


    public List<clsNewProduct> getNewProduct()
    {
        List<clsNewProduct> newProductList = new List<clsNewProduct>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT  [id]
                                ,[glu]
                                ,[item_code]
                                ,[item_name]
                                ,[remarks]
                                ,[uom]
                                ,[price_net]
                                ,[product_division]
                                FROM [Saturation_Database].[dbo].[Ref_NewProduct] 
                                ORDER BY [id] DESC ";

        //myCommand.Parameters.AddWithValue("@userId", System.Data.SqlDbType.VarChar);
        //myCommand.Parameters["@userId"].Value = userId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                clsNewProduct newProd = new clsNewProduct();
                newProd.id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                newProd.glu = (myReader["glu"] == null) ? string.Empty : myReader["glu"].ToString();
                newProd.itemCode = (myReader["item_code"] == null) ? string.Empty : myReader["item_code"].ToString();
                newProd.itemName = (myReader["item_name"] == null) ? string.Empty : myReader["item_name"].ToString();
                newProd.remarks = (myReader["remarks"] == null) ? string.Empty : myReader["remarks"].ToString();
                newProd.uom = (myReader["uom"] == null) ? string.Empty : myReader["uom"].ToString();
                newProd.priceNet = (myReader["price_net"] == null) ? string.Empty : myReader["price_net"].ToString();
                newProd.productDivision = (myReader["product_division"] == null) ? string.Empty : myReader["product_division"].ToString();
                newProductList.Add(newProd);
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
        return newProductList;
    }


    public List<clsChannel> getNewProdChannelStatusByID(string newProduct_id)
    {
        List<clsChannel> ChannelStatus = new List<clsChannel>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"select [id],[channel],[status]
                                from [Ref_NewProduct_Channel]
                                where newproduct_id = @newProd_Id";

        myCommand.Parameters.AddWithValue("@newProd_Id", System.Data.SqlDbType.Int);
        myCommand.Parameters["@newProd_Id"].Value = newProduct_id;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                clsChannel channelStatus = new clsChannel();
                channelStatus.id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                channelStatus.channel = (myReader["channel"] == null) ? string.Empty : myReader["channel"].ToString();
                channelStatus.status = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                ChannelStatus.Add(channelStatus);
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return ChannelStatus;

    }

    public string UpdateChannelSatusById(string ChannelId, string Status)
    {
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"update [dbo].[Ref_NewProduct_Channel] set [status] = @status where [id] = @channelId";


        myCommand.Parameters.AddWithValue("@channelId", ChannelId);
        myCommand.Parameters.AddWithValue("@status", Status);

        string newProd_Id = "";
        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            //while (myReader.Read())
            //{
            //    newProd_Id = myReader["id"].ToString();
            //}
            myReader.Close();
        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
        return newProd_Id;

    }







    //newproduct

    public List<clsNewProduct> getCreatedNewProductsByUserId(string userId)
    {
        List<clsNewProduct> newProductList = new List<clsNewProduct>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT a.[id] 
                                        ,b.[glu]
                                        ,b.[item_code]
                                        ,b.[item_name]
                                        ,a.[channel]
                                        ,a.[pipeline_period]
                                        ,a.[saturation_period]
                                        ,a.[newproduct_id]
                                        ,a.[created_at]
                                        ,a.[created_by]
                                        ,a.[modified_at]
                                        ,a.[modified_by]
                                        ,a.[status]
                                        ,b.[plan]
                                        ,a.[remarks]
                                        ,a.[active]
                                        FROM [dbo].[Ref_NewProduct_Channel] a 
                                        left join [dbo].[Ref_NewProduct] b
                                        on a.newproduct_id = b.id
                                        where a.[status] = 'Active' and channel in (select channel
                                        from [Saturation_Database].[dbo].[Ref_User_Channel] 
                                        where [user_id] = @userId) and a.[created_at] is not null
                                        order by a.[id]
                                        ";

        myCommand.Parameters.AddWithValue("@userId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@userId"].Value = userId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                clsNewProduct newProd = new clsNewProduct();
                newProd.id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                newProd.glu = (myReader["glu"] == null) ? string.Empty : myReader["glu"].ToString();
                newProd.itemCode = (myReader["item_code"] == null) ? string.Empty : myReader["item_code"].ToString();
                newProd.itemName = (myReader["item_name"] == null) ? string.Empty : myReader["item_name"].ToString();
                //newProd.description = (myReader["description"] == null) ? string.Empty : myReader["description"].ToString();
                //newProd.uom = (myReader["uom"] == null) ? string.Empty : myReader["uom"].ToString();
                //newProd.priceNet = (myReader["price_net"] == null) ? string.Empty : myReader["price_net"].ToString();
                //newProd.productDivision = (myReader["product_division"] == null) ? string.Empty : myReader["product_division"].ToString();
                newProd.channel = (myReader["channel"] == null) ? string.Empty : myReader["channel"].ToString();
                newProd.pipeline = (myReader["pipeline_period"] == null) ? string.Empty : myReader["pipeline_period"].ToString();
                newProd.saturation = (myReader["saturation_period"] == null) ? string.Empty : myReader["saturation_period"].ToString();
                newProd.createdAt = (myReader["created_at"] == null) ? string.Empty : myReader["created_at"].ToString();
                newProd.createdBy = (myReader["created_by"] == null) ? string.Empty : myReader["created_by"].ToString();
                newProd.modifiedAt = (myReader["modified_at"] == null) ? string.Empty : myReader["modified_at"].ToString();
                newProd.modifiedBy = (myReader["modified_by"] == null) ? string.Empty : myReader["modified_by"].ToString();
                newProd.status = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                newProd.plan = (myReader["plan"] == null) ? string.Empty : myReader["plan"].ToString();
                //newProd.confirmed = (myReader["confirmed"] == null) ? string.Empty : myReader["confirmed"].ToString();
                newProductList.Add(newProd);
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
        return newProductList;
    }
    public string UpdateSaturationBYChannelBrandId(clsChannel newSaturation)
    {
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"update [dbo].[Ref_NewProduct_Channel]
                                    set [pipeline_period] = @pipelinedate,
                                        [saturation_period] = @saturationdate,
                                        [remarks] = @remarks,
                                        [created_at] = @created_at,
                                        [created_by] = @created_by
                                        where [id] = @id";

        myCommand.Parameters.Add("@id", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@pipelinedate", System.Data.SqlDbType.DateTime);
        myCommand.Parameters.Add("@saturationdate", System.Data.SqlDbType.DateTime);
        myCommand.Parameters.Add("@remarks", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@created_at", System.Data.SqlDbType.DateTime);
        myCommand.Parameters.Add("@created_by", System.Data.SqlDbType.NVarChar);

        myCommand.Parameters["@id"].Value = newSaturation.id;
        myCommand.Parameters["@pipelinedate"].Value = newSaturation.pipeline_period;
        myCommand.Parameters["@saturationdate"].Value = newSaturation.saturation_period;
        myCommand.Parameters["@remarks"].Value = newSaturation.remarks;
        myCommand.Parameters["@created_at"].Value = newSaturation.created_at;
        myCommand.Parameters["@created_by"].Value = newSaturation.created_by;


        //myCommand.Parameters.AddWithValue("@id", (Object)newSaturation.id ?? DBNull.Value);
        //myCommand.Parameters.AddWithValue("@pipelinedate", (Object)newSaturation.pipeline_period ?? DBNull.Value);
        //myCommand.Parameters.AddWithValue("@saturationdate", (Object)newSaturation.saturation_period ?? DBNull.Value);
        //myCommand.Parameters.AddWithValue("@remarks", (Object)newSaturation.remarks ?? DBNull.Value);
        //myCommand.Parameters.AddWithValue("@created_at", (Object)newSaturation.created_at?? DBNull.Value);
        //myCommand.Parameters.AddWithValue("@created_by", (Object)newSaturation.created_by ?? DBNull.Value);
        ////myCommand.Parameters.AddWithValue("@price", (Object)newProd.priceNet ?? DBNull.Value);
        //myCommand.Parameters.AddWithValue("@product_division", (Object)newProd.productDivision ?? DBNull.Value);
        //myCommand.Parameters.AddWithValue("@created_at", (Object)newProd.createdAt ?? DBNull.Value);
        //myCommand.Parameters.AddWithValue("@created_by", (Object)newProd.createdBy ?? DBNull.Value);
        //myCommand.Parameters.AddWithValue("@modified_at", (Object)newProd.modifiedAt ?? DBNull.Value);
        //myCommand.Parameters.AddWithValue("@modified_by", (Object)newProd.modifiedBy ?? DBNull.Value);
        //myCommand.Parameters.AddWithValue("@status", (Object)newProd.status ?? DBNull.Value);
        //myCommand.Parameters.AddWithValue("@plan", (Object)newProd.plan ?? DBNull.Value);
        //myCommand.Parameters.AddWithValue("@confirmed", (Object)newProd.confirmed ?? DBNull.Value);
        //myCommand.Parameters.AddWithValue("@deleted_at", (Object)newProd.deleted_at ?? DBNull.Value);
        //myCommand.Parameters.AddWithValue("@deleted_by", (Object)newProd.deleted_by ?? DBNull.Value);

        string newProd_Id = "";
        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            //while (myReader.Read())
            //{
            //    newProd_Id = myReader["id"].ToString();
            //}
            myReader.Close();
        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
        return newProd_Id;

    }
    public List<clsChannel> getChannelBrandById(string userid)
    {
        List<clsChannel> ChannelBranchList = new List<clsChannel>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT a.[id] 
                                        ,b.[glu]
                                        ,b.[item_code]
                                        ,b.[item_name]
                                        ,b.[product_division]
                                        ,b.[uom]
                                        ,b.[price_net]
                                        ,a.[channel]
                                        ,a.[pipeline_period]
                                        ,a.[saturation_period]
                                        ,a.[newproduct_id]
                                        ,a.[created_at]
                                        ,a.[created_by]
                                        ,a.[modified_at]
                                        ,a.[modified_by]
                                        ,a.[deleted_at]
                                        ,a.[deleted_by]
                                        ,a.[status]
                                        ,a.[remarks]
                                        ,a.[active]
                                        FROM [dbo].[Ref_NewProduct_Channel] a 
                                        left join [dbo].[Ref_NewProduct] b
                                        on a.newproduct_id = b.id
                                        where a.[status] = 'Active' and channel in (select channel
                                        from [Saturation_Database].[dbo].[Ref_User_Channel] 
                                        where [user_id] = @userId) and a.[created_at] is null
                                        order by a.[id]";

        myCommand.Parameters.AddWithValue("@userId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@userId"].Value = userid;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                clsChannel channelbranch = new clsChannel();
                channelbranch.id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                channelbranch.channel = (myReader["channel"] == null) ? string.Empty : myReader["channel"].ToString();
                channelbranch.itemname = (myReader["item_name"] == null) ? string.Empty : myReader["item_name"].ToString();
                channelbranch.item_code = (myReader["item_code"] == null) ? string.Empty : myReader["item_code"].ToString();
                channelbranch.glu = (myReader["glu"] == null) ? string.Empty : myReader["glu"].ToString();
                channelbranch.product_division = (myReader["product_division"] == null) ? string.Empty : myReader["product_division"].ToString();
                channelbranch.price_net = (myReader["price_net"] == null) ? string.Empty : myReader["price_net"].ToString();
                channelbranch.uom = (myReader["uom"] == null) ? string.Empty : myReader["uom"].ToString();
                ChannelBranchList.Add(channelbranch);
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return ChannelBranchList;
    }



    //newproduct_detail
    public clsNewProduct getNewSaturationById(string newProduct_id)
    {
        clsNewProduct newProd = new clsNewProduct();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"select  a.[id]
		                                ,b.[glu]
		                                ,b.[item_code]
		                                ,b.[item_name]
		                                ,b.[remarks]
		                                ,b.[uom]
		                                ,b.[price_net]
		                                ,b.[product_division]
		                                ,a.[channel]
		                                ,a.[pipeline_period]
		                                ,a.[saturation_period]
		                                ,a.[newproduct_id]
		                                ,a.[created_at]
		                                ,a.[created_by]
		                                ,a.[modified_at]
		                                ,a.[modified_by]
		                                ,a.[deleted_at]
		                                ,a.[deleted_by]
		                                ,a.[status]
		                                ,a.[remarks]
		                                ,a.[active]
		                                from [dbo].[Ref_NewProduct_Channel] a
		                                left join [dbo].[Ref_NewProduct] b
		                                on a.newproduct_id = b.id
		                                where a.[id] = @id";

        myCommand.Parameters.AddWithValue("@id", System.Data.SqlDbType.VarChar);
        myCommand.Parameters["@id"].Value = newProduct_id;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                newProd.id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                newProd.glu = (myReader["glu"] == null) ? string.Empty : myReader["glu"].ToString();
                newProd.itemCode = (myReader["item_code"] == null) ? string.Empty : myReader["item_code"].ToString();
                newProd.itemName = (myReader["item_name"] == null) ? string.Empty : myReader["item_name"].ToString();
                newProd.remarks = (myReader["remarks"] == null) ? string.Empty : myReader["remarks"].ToString();
                newProd.uom = (myReader["uom"] == null) ? string.Empty : myReader["uom"].ToString();
                newProd.priceNet = (myReader["price_net"] == null) ? string.Empty : myReader["price_net"].ToString();
                newProd.productDivision = (myReader["product_division"] == null) ? string.Empty : myReader["product_division"].ToString();
                newProd.channel = (myReader["channel"] == null) ? string.Empty : myReader["channel"].ToString();
                newProd.pipeline = (myReader["pipeline_period"] == null) ? string.Empty : myReader["pipeline_period"].ToString();
                newProd.saturation = (myReader["saturation_period"] == null) ? string.Empty : myReader["saturation_period"].ToString();
                newProd.createdAt = (myReader["created_at"] == null) ? string.Empty : myReader["created_at"].ToString();



                //newProd.createdBy = (myReader["created_by"] == null) ? string.Empty : myReader["created_by"].ToString();
                //newProd.modifiedAt = (myReader["modified_at"] == null) ? string.Empty : myReader["modified_at"].ToString();
                //newProd.modifiedBy = (myReader["modified_by"] == null) ? string.Empty : myReader["modified_by"].ToString();
                newProd.status = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                //newProd.plan = (myReader["plan"] == null) ? string.Empty : myReader["plan"].ToString();
                //newProd.confirmed = (myReader["confirmed"] == null) ? string.Empty : myReader["confirmed"].ToString();
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
        return newProd;
    }
    public List<clsAccountGroup> getNewProductAssignAccountGroupByNPid(string newProduct_id)
    {
        List<clsAccountGroup> newProductAcctGrp = new List<clsAccountGroup>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT [id]
                                        ,[account_group_1]
                                        ,[allocation_plan_qty]
                                        ,[allocation_plan_amt]
                                        ,[remarks]
                                        ,[pipeline_period]
                                        ,[saturation_period]
                                        ,[newproduct_id]
                                        FROM [Saturation_Database].[dbo].[Ref_NewProduct_Account]
                                        WHERE [newproduct_id] = @newProduct_id
                                        ORDER BY [id] DESC ";

        myCommand.Parameters.AddWithValue("@newProduct_id", System.Data.SqlDbType.Int);
        myCommand.Parameters["@newProduct_id"].Value = newProduct_id;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                clsAccountGroup newProdAcctGroup = new clsAccountGroup();
                newProdAcctGroup.id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                newProdAcctGroup.account_group_name = (myReader["account_group_1"] == null) ? string.Empty : myReader["account_group_1"].ToString();
                newProdAcctGroup.plan = (myReader["allocation_plan_qty"] == null) ? string.Empty : myReader["allocation_plan_qty"].ToString();
                newProdAcctGroup.remarks = (myReader["remarks"] == null) ? string.Empty : myReader["remarks"].ToString();
                newProdAcctGroup.allocation_plan_amt = (myReader["allocation_plan_amt"] == null) ? string.Empty : myReader["allocation_plan_amt"].ToString();
                newProdAcctGroup.pipeline_period = (myReader["pipeline_period"] == null) ? string.Empty : myReader["pipeline_period"].ToString();
                newProdAcctGroup.saturation_period = (myReader["saturation_period"] == null) ? string.Empty : myReader["saturation_period"].ToString();
                newProdAcctGroup.newproduct_id = (myReader["newproduct_id"] == null) ? string.Empty : myReader["newproduct_id"].ToString();
                newProductAcctGrp.Add(newProdAcctGroup);
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
        return newProductAcctGrp;
    }

    public List<string> getAccountGroupList(string channel, string newProduct_id)
    {
        List<string> acctGroupList = new List<string>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"select distinct [account_group_1] FROM [Ref_Branch] where [Channel] = @channel and [account_group_1] not in (select distinct [account_group_1] 
                                  FROM [Saturation_Database].[dbo].[Ref_NewProduct_Account]
                                  where [newproduct_id] = @newProduct_id) ";


        myCommand.Parameters.AddWithValue("@channel", System.Data.SqlDbType.VarChar);
        myCommand.Parameters.AddWithValue("@newProduct_id", System.Data.SqlDbType.Int);

        myCommand.Parameters["@channel"].Value = channel;
        myCommand.Parameters["@newProduct_id"].Value = newProduct_id;
        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                string acctGroup = (myReader["account_group_1"] == null) ? string.Empty : myReader["account_group_1"].ToString();
                acctGroupList.Add(acctGroup);
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return acctGroupList;
    }
    public void insertAccountGroup(List<clsAccountGroup> accountGroup)
    {
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"INSERT INTO [dbo].[Ref_NewProduct_Account]
           ([account_group_1]
            ,[allocation_plan_qty]
            ,[remarks]
            ,[pipeline_period]
            ,[saturation_period]
            ,[newproduct_id])
     VALUES
           (@account_group_1
           ,@allocation_plan_qty
           ,@remarks,
            @pipeline_period,
            @saturation_period,
            @newproduct_id)";

        myCommand.Parameters.Add("@account_group_1", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@allocation_plan_qty", System.Data.SqlDbType.Int);
        myCommand.Parameters.Add("@remarks", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@pipeline_period", System.Data.SqlDbType.Date);
        myCommand.Parameters.Add("@saturation_period", System.Data.SqlDbType.Date);
        myCommand.Parameters.Add("@newproduct_id", System.Data.SqlDbType.Int);

        try
        {

            myConnection.Open();
            //myCommand.ExecuteNonQuery();

            foreach (var item in accountGroup)
            {
                myCommand.Parameters[0].Value = item.account_group_name;
                myCommand.Parameters[1].Value = item.plan;
                myCommand.Parameters[2].Value = item.remarks;
                myCommand.Parameters[3].Value = item.pipeline_period;
                myCommand.Parameters[4].Value = item.saturation_period;
                myCommand.Parameters[5].Value = item.newproduct_id;

                myCommand.ExecuteNonQuery();
            }
        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

    }


    //newproduct_branch
    public void insertBranchSelect(List<clsBranch> BranchSelect)
    {
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"INSERT INTO [dbo].[Ref_NewProduct_Branch]
           ([account_code]
      ,[account_name]
      ,[branch_code]
      ,[branch_name]
      ,[sales_rep_code]
      ,[sales_rep_name]
      ,[status]
      ,[remarks]
      ,[newproduct_account_id]
      ,[branch_id])
     VALUES
           (@account_code
            ,@account_name
            ,@branch_code
            ,@branch_name
            ,@sales_rep_code
            ,@sales_rep_name
            ,@status
            ,@remarks
            ,@newproduct_account_id
            ,@branch_id)";

        myCommand.Parameters.Add("@account_code", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@account_name", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@branch_code", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@branch_name", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@sales_rep_code", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@sales_rep_name", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@status", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@remarks", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@newproduct_account_id", System.Data.SqlDbType.Int);
        myCommand.Parameters.Add("@branch_id", System.Data.SqlDbType.Int);
        try
        {

            myConnection.Open();
            //myCommand.ExecuteNonQuery();

            foreach (var item in BranchSelect)
            {
                myCommand.Parameters[0].Value = "";
                myCommand.Parameters[1].Value = "";
                myCommand.Parameters[2].Value = item.branchCode;
                myCommand.Parameters[3].Value = item.branchName;
                myCommand.Parameters[4].Value = "";
                myCommand.Parameters[5].Value = "";
                myCommand.Parameters[6].Value = item.status;
                myCommand.Parameters[7].Value = "";
                myCommand.Parameters[8].Value = item.newproductaccountid;
                myCommand.Parameters[9].Value = item.branchId;

                myCommand.ExecuteNonQuery();
            }
        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

    }
    public List<clsBranch> getBranchNamelist(string newProductAcctGrp_id)
    {
        List<clsBranch> branchNameList = new List<clsBranch>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"select [id], [branch_code],replace(branch_name,'''','`') as [branch_name]
                                from [dbo].[Ref_Branch]
                                where [account_group_1] in ( SELECT distinct [account_group_1]
                                from [Ref_NewProduct_Account]
                                where [id] = @newProductAcctGrp_id) and [id] not in (select branch_id from [Ref_NewProduct_Branch] where [newproduct_account_id] = @newProductAcctGrp_id)";

        myCommand.Parameters.AddWithValue("@newProductAcctGrp_id", System.Data.SqlDbType.Int);

        myCommand.Parameters["@newProductAcctGrp_id"].Value = newProductAcctGrp_id;
        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                clsBranch branch = new clsBranch();
                branch.branchId = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                branch.branchCode = (myReader["branch_code"] == null) ? string.Empty : myReader["branch_code"].ToString();
                branch.branchName = (myReader["branch_name"] == null) ? string.Empty : myReader["branch_name"].ToString();
                branchNameList.Add(branch);
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return branchNameList;
    }
    public clsAccountGroup getNewProductAcctGrpById(string newProductAcctGrp_id)
    {
        clsAccountGroup AcctGrp = new clsAccountGroup();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT [id]
                      ,[account_group_1]
                      ,[allocation_plan_qty]
                      ,[allocation_plan_amt]
                      ,[remarks]
                      ,[pipeline_period]
                      ,[saturation_period]
                      ,[newproduct_id]
                        FROM [Saturation_Database].[dbo].[Ref_NewProduct_Account]
                         WHERE [id] = @id";

        myCommand.Parameters.AddWithValue("@id", System.Data.SqlDbType.Int);
        myCommand.Parameters["@id"].Value = newProductAcctGrp_id;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                AcctGrp.id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                AcctGrp.account_group_name = (myReader["account_group_1"] == null) ? string.Empty : myReader["account_group_1"].ToString();
                AcctGrp.plan = (myReader["allocation_plan_qty"] == null) ? string.Empty : myReader["allocation_plan_qty"].ToString();
                AcctGrp.remarks = (myReader["remarks"] == null) ? string.Empty : myReader["remarks"].ToString();
                AcctGrp.allocation_plan_amt = (myReader["allocation_plan_amt"] == null) ? string.Empty : myReader["allocation_plan_amt"].ToString();
                AcctGrp.pipeline_period = (myReader["pipeline_period"] == null) ? string.Empty : myReader["pipeline_period"].ToString();
                AcctGrp.saturation_period = (myReader["saturation_period"] == null) ? string.Empty : myReader["saturation_period"].ToString();
                AcctGrp.newproduct_id = (myReader["newproduct_id"] == null) ? string.Empty : myReader["newproduct_id"].ToString();
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
        return AcctGrp;
    }
    public List<clsBranch> getNewProductAssignBranchesByAcctGrpId(string newProductAcctGrp_id)
    {
        List<clsBranch> newProdBranches = new List<clsBranch>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT [id]
                                        ,[account_code]
                                        ,[account_name]
                                        ,[branch_code]
                                        ,[branch_name]
                                        ,[sales_rep_code]
                                        ,[sales_rep_name]
                                        ,[status]
                                        ,[remarks]
                                        ,[newproduct_account_id]
                                        ,[branch_id]
                                        FROM [Saturation_Database].[dbo].[Ref_NewProduct_Branch]
                                        WHERE newproduct_account_id = @newProductAcctGrp_id
                                        ORDER BY [id] DESC ";

        myCommand.Parameters.AddWithValue("@newProductAcctGrp_id", System.Data.SqlDbType.Int);
        myCommand.Parameters["@newProductAcctGrp_id"].Value = newProductAcctGrp_id;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                clsBranch newProdBranch = new clsBranch();
                newProdBranch.iD = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                newProdBranch.branchCode = (myReader["branch_code"] == null) ? string.Empty : myReader["branch_code"].ToString();
                newProdBranch.branchName = (myReader["branch_name"] == null) ? string.Empty : myReader["branch_name"].ToString();
                newProdBranch.status = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                newProdBranch.remarks = (myReader["remarks"] == null) ? string.Empty : myReader["remarks"].ToString();
                newProdBranch.branchId = (myReader["branch_id"] == null) ? string.Empty : myReader["branch_id"].ToString();
                newProdBranch.newproductaccountid = (myReader["newproduct_account_id"] == null) ? string.Empty : myReader["newproduct_account_id"].ToString();
                newProdBranches.Add(newProdBranch);
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
        return newProdBranches;
    }

}