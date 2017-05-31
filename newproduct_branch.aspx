<%@ Page Title="" Language="C#" MasterPageFile="~/SaturationMain.master" AutoEventWireup="true" CodeFile="newproduct_branch.aspx.cs" Inherits="devchild_saturation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .select2-container {
            width: 100% !important;
            padding: 0;
        }

        span.select2-container {
            z-index: 10050;
        }

        #tbl_BranchList tr td:last-child {
            width: 45px;
        }
      
    </style>
    <div id="lower-navbar" class="" style="line-height: 40px; border-bottom: 1px solid #ddd;">
        <div class="container-fluid">
            <div class="pull-left">
                <span style="font-size: 100%;">Saturation / Account Group / Branch</span>
            </div>
            <div class="pull-right">
                <div class="" role="toolbar">
                    <div class="btn-group">
                        <a class="btn btn-sm btn-default" style="font-size: 18px; padding: 0px 10px;" onclick="window.history.back();"><span class="text-muted fa fa-long-arrow-left"></span></a>
                    </div>

                    <div class="btn-group" role="group">
                        <a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">Pending</a>
                    </div>
                    <div class="btn-group" role="group">
                        <a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModalTwo">Add Branch</a>
                    </div>
                    <%--<div class="btn-group" role="group">
                        <a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">Add Branch</a>
                    </div>--%>
                </div>
            </div>
            <%--<div class="clearfix"></div>--%>
        </div>
    </div>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="" id="main-content-wrapper">
        <!-- Insert main content here -->
        <br />
        <div class="">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <h1>
                            <asp:Label ID="lblAccountGroup_Name" runat="server" Text="" /></h1>
                        <asp:Label ID="lblRemakrs" CssClass="hidden" runat="server" Text="" />
                        <asp:Label ID="lblNewProdAcctId" CssClass="hidden" runat="server" Text="" />
                        <br />
                    </div>

                    <div class="col-md-4">
                        <br />
                        <div class="" style="margin-top: -10px;">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Plan</th>
                                        <th>Confirmed</th>
                                        <th>Pending</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPlanQty" runat="server" Text="" /></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>

            <br />
            <div class="panel with-nav-tabs">
                <div class="panel-heading">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab1default" data-toggle="tab">tab1</a></li>
                        <li><a href="#tab2default" data-toggle="tab">tab2</a></li>
                    </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1default">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <table id="newproductsAcctGroup_tbl" class="table table-hover" style="margin-top: 10px;">
                                        <thead>
                                            <tr>
                                                <th class="text-left">Id</th>
                                                <th class="text-left">Branch Name</th>
                                                <th class="text-left">Branch Code</th>
                                                <th class="text-left">Status</th>
                                                <th class="text-center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-center" id="SaturationAssignAcctGrpTbl">
                                            <asp:Repeater ID="rptNewProdBranches" runat="server" OnItemDataBound="rptNewProdBranches_ItemDataBound" OnItemCommand="rptNewProdBranches_ItemCommand">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "iD") %></td>
                                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "branchName") %></td>
                                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "branchCode") %></td>
                                                        <%--<td>
                                                            <asp:Label ID="ProdpipelineDate" runat="server" Text="" CssClass="left"></asp:Label></td>
                                                        <td>
                                                            <asp:Label ID="ProdsaturationDate" runat="server" Text="" CssClass="left"></asp:Label></td>--%>
                                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "status") %></td>
                                                        <td class="text-center">
                                                            <asp:LinkButton ID="btnApproved" CommandName="Approved" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>' runat="server" CssClass="btn btn-sm btn-default">Confirm</asp:LinkButton>
                                                            <%--<asp:LinkButton ID="BtnEdit" CommandName="edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>' runat="server"  CssClass="btn btn-sm btn-default">Edit</asp:LinkButton>
                                                            <asp:LinkButton ID="BtnDelete" CommandName="delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>' runat="server"  CssClass="btn btn-sm btn-danger">Delete</asp:LinkButton>--%>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                        <div class="tab-pane fade" id="tab2default">
                            test2
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--X button at top right--%>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <%--End X button--%>

                    <%--Top left title--%>
                    <h4 class="modal-title" id="myModalLabel">Test Add Branches</h4>
                    <%--End top left title--%>
                </div>
                <div class="container-fluid" style="min-height: 550px; max-height: 550px;">
                    <div class="row" style="margin-top: 10px;">
                        <div class="col-md-6">
                            <input type="text" class="form-control input-sm" id="tbSearchAvailbTable" />
                            <table class="table table-condensed table-hover small modaltble" id="tbl_AvailBranch">
                                <thead class="">
                                    <tr>
                                        <th data-override="branchCode">Branch Code </th>
                                        <th data-override="branchName">Branch Name</th>
                                        <th class="" data-override="branchId">Branch Id</th>
                                    </tr>
                                </thead>
                                <tbody id="tbl_AvailBranchBody" >
                                    <asp:Repeater ID="RptAvailableBranch" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "branchCode") %></td>
                                                <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "branchName") %></td>
                                                <td class="text-left "><%# DataBinder.Eval(Container.DataItem, "branchId") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                       <%-- <div class="col-md-2">
                            <button type="button" class="btn btn-default btn-sm">>></button>
                            <button type="button" class="btn btn-default btn-sm"><<</button>
                        </div>--%>

                        <div class="col-md-6">
                            <input type="text" class="form-control" />
                            <table class="table table-condensed table-hover small modaltble" id="tbl_SelectedBranch">
                                <thead class="">
                                    <tr>
                                        <th data-override="branchCode">Branch Code </th>
                                        <th data-override="branchName">Branch Name</th>
                                        <th  class="" data-override="branchId">Branch Id</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary btn-sm">Submit</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- End Modal -->

    <!-- ModalTwo -->
    <div class="modal fade" id="myModalTwo" tabindex="2" data-backdrop="static" data-keyboard="false" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabelTwo">Add Branches</h4>
                </div>

                <%--Table inside modal--%>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-condensed table-hover" id="tbl_BranchList">
                                <thead>
                                    <tr>
                                        <th data-override="branchCode">Branch Code </th>
                                        <th data-override="branchName">Branch Name</th>
                                        <th data-override="branchId" class="hidden">Branch Id</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div style="border: none !important;">
                        <br />
                        <hr />
                        <div class="row">
                            <div class="col-md-9">
                                <select id="branchselect0" class="ddlbranchselect" data-ctr="2"></select>
                            </div>
                            <div class="col-md-3">
                                <input type="button" style="width: 100%;" disabled="disabled" class="btn btn-primary" id="btnSelectBranch" value="Add" />
                            </div>

                        </div>
                        <br />
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
                        <button id="btnSubmit" type="button" disabled="disabled" class="btn btn-primary btn-sm">Submit</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal Two -->



    <script type="text/javascript">
        $(document).ready(function () {
            populateBranchName("#branchselect0");
            populateBranchNametbl("#tbl_AvailBranchBody");
           
            //$('#tbl_AvailBranch').DataTable({
            //    dom: 't',
            //    info: false,
            //    scrollY: '400px',
            //    scrollCollapse: true,
            //    paging: false,
            //    searching: false,
            //});
        });

        $('table.modaltble').DataTable({
            paging: false,
            ordering: true,
            info: false,
            dom: 't',
            searching: true,
            scrollY: '400px',
            scrollCollapse: true,
            "language": {
                "emptyTable": "No Data Available",
            }
        });
        $('#tbSearchAvailbTable').on('keyup', function () {
            $('#tbl_AvailBranch').DataTable().search(this.value).draw();
        });
        $('#myModal').on('shown.bs.modal', function (e) {
            $.fn.dataTable.tables({ visible: true, api: true }).columns.adjust();
        });



        $('#tbl_AvailBranch tbody').on('dblclick', 'tr', function () {
            //var selectedbranchid = $(this).find('label').html();
            //alert($(this).find('td').next('td').next('td').text());

            var $row = $(this);
            var addRow = $('#tbl_AvailBranch').DataTable().row($row);
            $('#tbl_SelectedBranch').DataTable().row.add(addRow.data()).draw();
            addRow.remove().draw();
        });




        var i = 1;
        $("#btnSelectBranch").click(function () {
            var selectedbranch = $("#branchselect0 option:selected").text();
            var array = selectedbranch.split(" / ");
            var selectedbranchid = $("#branchselect0 option:selected").val();
            $('#addr' + i).html("<td><label id='lblSelectedBranchCode" + i + "' class='lblSelectedCode'>" + array[0] + "</label></td><td><label id='lblSelectedBranchName" + i + "' class=''>" + array[1] + "</label></td> <td><label id='lblSelectedBranchId" + i + "' class='hidden'>" + selectedbranchid + "</label></td> <td><a class='pull-right btn btn-sm btn-danger delete_row'><span class='glyphicon glyphicon-trash '></span></a></td>");
            $('#tbl_BranchList').append('<tr id="addr' + (i + 1) + '"></tr>');
            i++;
            tableValidation();
            $("#branchselect0 option[value='" + selectedbranchid + "']").prop('disabled', true);
            $('#branchselect0').select2({
                placeholder: "Select Branch",
                theme: "bootstrap",
                width: 'resolve',
                closeOnSelect: true,
            });
            $('#branchselect0').val(null).trigger("change");
            $('#btnSelectBranch').prop('disabled', true);
        });
        $(document).on('click', '.delete_row', function () {
            var deletedbranchid = $(this).closest('tr').find('td').next('td').next('td').find('label').html();
            $("#branchselect0 option[value='" + deletedbranchid + "']").prop('disabled', false);
            $('#branchselect0').select2({
                placeholder: "Select Branch",
                theme: "bootstrap",
                width: 'resolve',
                closeOnSelect: true,
            });
            $(this).parent().parent().remove(); //Deleting the Row (tr) Element 
            tableValidation();
        });
        $("#myModalTwo").on("show.bs.modal", function (e) {
            resetTable();
        })
        $('#branchselect0').on("select2:select", function (e) {
            var test = $(this).val();
            if (test != '') {
                $('#btnSelectBranch').prop('disabled', false);
            }
            else {
                $('#btnSelectBranch').prop('disabled', true);
            }
        });
        $('#btnSubmit').click(function () {
            var tblselectedbranch = $('#tbl_BranchList').tableToJSON({
                ignoreColumns: [3],
                ignoreEmptyRows: true,
            });
            submittedBranchName(tblselectedbranch);
            location.reload();
        });


        function resetTable() {
            $('#tbl_BranchList').find("tr:gt(0)").remove();
            $('#tbl_BranchList').append('<tr id="addr1"></tr>');
            $('#branchselect0').val(null).trigger("change");
            $('#btnSelectBranch').prop('disabled', true);
            $('#btnSubmit').prop('disabled', true);
            i = 1;
        };
        function populateBranchName(name) {
            $(name).select2({
                placeholder: "Select Branch",
                theme: "bootstrap",
                width: 'resolve',
                closeOnSelect: true,
                //allowClear: true,
            });
            $(name).append($('<option>').text('').attr('value', ''));
            var pk = getParameterByName('AcctGroupID');
            $.ajax({
                type: "POST",
                url: "newproduct_branch.aspx/getBranchName",
                data: "{newProductAcctGrp_id: '" + pk + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var result = JSON.parse(data.d);
                    $.each(result.branchNameList, function (key, value) {
                        $(name).append($('<option>').text(value.branchCode + " / " + value.branchName).attr('value', value.branchId));
                    });
                },
                failure: function (response) {
                    alert('failed');
                }
            });
        };
        function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }
        function tableValidation() {
            var rowCount = $('#tbl_BranchList >tbody >tr').length;
            if (rowCount == '1') {
                $('#btnSubmit').prop('disabled', true);
            }
            else {
                $('#btnSubmit').prop('disabled', false);
            }
        };
        function submittedBranchName(tblselectedbranch) {
            var TableBranchName = JSON.stringify(tblselectedbranch);
            var newProductAcctGrpId = getParameterByName('AcctGroupID');
            $.ajax({
                type: "POST",
                url: "newproduct_branch.aspx/submitBranch",
                data: "{ TableBranchSelect: '" + TableBranchName + "',newProductAcctGrpId: '" + newProductAcctGrpId + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    console.log(data.d);
                },
                failure: function (response) {
                    alert('failed');
                }
            });
        }



        //function populateBranchNametbl(name) {
        //    var pk = getParameterByName('AcctGroupID');
        //    $.ajax({
        //        type: "POST",
        //        url: "newproduct_branch.aspx/getBranchName",
        //        data: "{newProductAcctGrp_id: '" + pk + "' }",
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: function (data) {
        //            var result = JSON.parse(data.d);
        //            $.each(result.branchNameList, function (key, value) {
        //                $('<tr>').html("<td>" + value.branchCode + "</td><td>" + value.branchName + "</td><td>" + value.branchId + "</td>").appendTo(name);
        //            });
        //        },
        //        failure: function (response) {
        //            alert('failed');
        //        }
        //    });

        //};

    </script>
    <%--<script src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>--%>
    <%--<script src="http://www.developerdan.com/table-to-json/javascripts/jquery.tabletojson.min.js"></script>--%>
</asp:Content>

