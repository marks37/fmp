<%@ Page Title="" Language="C#" MasterPageFile="~/SaturationMain.master" AutoEventWireup="true" CodeFile="newproduct_detail.aspx.cs" Inherits="newproduct_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        dl {
            margin-bottom: 0;
            font-size: 14px;
        }

        dt {
            font-weight: 500;
            color: rgba(0,0,0,0.60);
            /*color: #9E9E9E;*/
            font-weight: normal;
        }

        dd {
            font-weight: normal;
            color: rgba(0,0,0,0.80);
        }

        #main-content-wrapper {
            top: 91px;
        }

        #test-tbl thead tr th:first-child {
            /*vertical-align: top;*/
            /*padding: 10px 5px;*/
            /*text-align: left;*/
            /*font-size: 14px;*/
            /*padding: 10px 15px;*/
            padding-left: 15px;
        }

        #test-tbl thead tr th:last-child {
            padding-right: 15px;
        }

        #test-tbl tbody tr td:last-child {
            padding-right: 15px;
        }

        #test-tbl tbody tr td:first-child {
            /*vertical-align: top;*/
            /*padding: 10px 5px;*/
            /*text-align: left;*/
            /*font-size: 14px;*/
            /*padding: 10px 15px;*/
            padding-left: 15px;
        }

        .table {
            border-bottom: 1px solid #ddd;
        }

            .table > thead > tr > th {
            }

            .table > tbody > tr {
                background-color: #fff;
            }

        #table-modal > tbody > tr {
            cursor: pointer;
        }

        #table-modal > thead > tr {
            background-color: #F5F5F5;
        }

        .select2-container {
            width: 100% !important;
            padding: 0;
        }

        .lower-navbar-wrapper {
            position: fixed;
            top: 50px;
            z-index: 100;
            width: 100%;
        }

        .lower-navbar-wrapper {
            background-color: #FAFAFA;
            padding-top: 7px;
            padding-bottom: 7px;
            border-bottom: 1px solid #ddd;
        }

        div#search {
            width: 300px;
            line-height: 2px;
        }

        .highlight {
            background-color: #00ff90;
        }

        #devchild_table tbody tr {
            cursor: pointer;
        }

        span.select2-container {
            z-index: 10050;
        }

        #AccountGroup_tbl tr td:last-child {
            width: 45px;
        }
    </style>

    <div id="lower-navbar" class="" style="line-height: 40px; border-bottom: 1px solid #ddd;">
        <div class="container-fluid">
            <div class="pull-left">
                <span style="font-size: 100%;">Saturation / Account Group</span>
            </div>
            <div class="pull-right">
                <div class="" role="toolbar">
                    <div class="btn-group">
                        <a class="btn btn-sm btn-default" style="font-size: 18px; padding: 0px 10px;" href="newproduct.aspx"><span class="text-muted fa fa-long-arrow-left"></span></a>
                    </div>

                    <div class="btn-group" role="group">
                        <a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">Add <span class="glyphicon glyphicon-plus"></span></a>
                    </div>

                </div>
            </div>
            <asp:Label ID="checkUser" runat="server" CssClass="hidden"></asp:Label>
            <%--<div class="clearfix"></div>--%>
        </div>
    </div>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="" id="main-content-wrapper">
        <!-- Insert main content here -->
        <div class="">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-md-8">
                        <h1>
                            <asp:Label ID="newProduct_Name" runat="server" Text=""></asp:Label><br />
                            <small>
                                <asp:Label ID="newProduct_Code" runat="server" Text=""></asp:Label></small></h1>
                        <br />
                        <h5><strong>GLU: </strong>
                            <asp:Label ID="newProduct_Glu" runat="server" Text=""></asp:Label></h5>
                        <h5><strong>Division: </strong>
                            <asp:Label ID="newProduct_Division" runat="server" Text=""></asp:Label></h5>
                        <h5><strong>Price/UOM: </strong>
                            <asp:Label ID="newProduct_Price" runat="server" Text=""></asp:Label>
                            /
                            <asp:Label ID="newProduct_uom" runat="server" Text=""></asp:Label></h5>
                    </div>

                    <div class="col-md-4">
                        <br />
                        <div class="" style="">
                            <div class="panel panel-default">
                                <table class="table table-bordered">
                                    <tbody>
                                        <tr>
                                            <th>Channel</th>
                                            <td>
                                                <asp:Label ID="lblChannel" runat="server" Text="Test Channel" /></td>
                                            <%-- <th>Confirmed</th>
                                            <td>
                                                <asp:Label ID="lblConfirmed" runat="server" Text="Test Confirmed" /></td>--%>
                                        </tr>
                                        <tr>
                                            <th>Date Created</th>
                                            <td>
                                                <asp:Label ID="lblDateCreated" runat="server" Text="Test DateCreated" /></td>
                                            <%-- <th>Plan</th>
                                            <td>
                                                <asp:Label ID="lblPlan" runat="server" Text="Test Plan" /></td>--%>
                                        </tr>
                                        <tr>
                                            <th>Pipeline</th>
                                            <td>
                                                <asp:Label ID="lblDatePipeline" runat="server" Text="Test DatePipeline" /></td>
                                            <%--<th>Pending</th>
                                            <td>
                                                <asp:Label ID="lblPending" runat="server" Text="Test Pending" /></td>--%>
                                        </tr>
                                        <tr>
                                            <th>End Saturation</th>
                                            <td>
                                                <asp:Label ID="lblDateSaturation" runat="server" Text="Test DateSaturation" /></td>
                                            <%--  <th>Status</th>
                                            <td><span class="label label-default">Active</span></td>--%>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="panel with-nav-tabs">
                <div class="panel-heading">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab1default" data-toggle="tab">Target</a></li>
                        <li><a href="#tab2default" data-toggle="tab">Actual</a></li>
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
                                                <th class="text-left">Account Group</th>
                                                <th class="text-left">Plan</th>
                                                <th class="text-left">Confirmed</th>
                                                <th class="text-center">Pending</th>
                                                <th class="text-left">Remarks</th>
                                                <th class="text-center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-center" id="SaturationAssignAcctGrpTbl">
                                            <%--<tr id="satrow1"></tr>--%>
                                            <asp:Repeater ID="newProdAcctGrpRptr" runat="server" OnItemDataBound="newProdAcctGrpRptr_ItemDataBound" OnItemCommand="newProdAcctGrpRptr_ItemCommand">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "id") %></td>
                                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "account_group_name") %></td>
                                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "plan") %></td>
                                                        <td>
                                                            <asp:Label ID="ProdpipelineDate" runat="server" Text="" CssClass="left"></asp:Label></td>
                                                        <td>
                                                            <asp:Label ID="ProdsaturationDate" runat="server" Text="" CssClass="left"></asp:Label></td>
                                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "remarks") %></td>
                                                        <td class="text-center">
                                                            <div class="btn-group">
                                                                <asp:LinkButton ID="viewBtn" CommandName="view" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>' runat="server" Width="55" CssClass="btn btn-default">View</asp:LinkButton>
                                                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                    <span class="caret"></span>
                                                                    <span class="sr-only">Toggle Dropdown</span>
                                                                </button>
                                                                <ul class="dropdown-menu">
                                                                    <li>
                                                                        <asp:LinkButton ID="BtnEdit" CommandName="edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>' runat="server" CssClass="">Edit</asp:LinkButton></li>
                                                                    <li role="separator" class="divider"></li>
                                                                    <li>
                                                                        <asp:LinkButton ID="BtnDelete" CommandName="delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>' runat="server" CssClass="">Delete</asp:LinkButton></li>
                                                                </ul>
                                                            </div>

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
    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <%--X button at top right--%>
                    <button type="button" class="close" aria-label="Close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <%--End X button--%>

                    <%--Top left title--%>
                    <h4 class="modal-title" id="myModalLabel">Account Group</h4>
                    <%--End top left title--%>
                </div>

                <div class="modal-body" style="height: 470px;">
                    <div class="row clearfix" style="max-height: 450px; overflow-y: scroll;">
                        <div class="col-md-12" style="min-height: 430px;">
                            <table class="table table-bordered table-condensed" id="AccountGroup_tbl">
                                <thead>
                                    <tr>
                                        <th data-override="account_group_name">Account Group</th>
                                        <th data-override="plan">Plan</th>
                                        <th data-override="remarks">Remarks</th>
                                        <th></th>

                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            <br />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-md-7 text-left">
                            <select id="select0" class="account-group-select" data-ctr="2"></select>
                        </div>
                        <div class="col-md-2">
                            <input type="button" style="width: 100%;" disabled="disabled" class="btn btn-primary" id="add_row" value="Add" />
                        </div>
                        <div class="col-md-3">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-default " data-dismiss="modal">Cancel</button>
                                <button id="btnSubmit" type="button" disabled="disabled" class="btn btn-primary ">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal -->

    <script type="text/javascript">
        $(document).ready(function () {
            populateAcctGrp("#select0");
            //TableInitialize();
            $('#newproductsAcctGroup_tbl').DataTable({
                "paging": false,
                "ordering": false,
                "info": false,
                "dom": 't',
                //"fixedHeader": {
                //    header: true,
                //    footer: true,
                "language": {
                    "emptyTable": "No Data Available",
                }
            });
        });

        $("#add_row").click(function () {
            var selectedacctgrp = $("#select0 option:selected").text();
            $('#addr' + i).html("<td> <label id='lblSelectedAcctGrp" + i + "' class='lblSelectedCode'>" + selectedacctgrp + "</label> </td><td><input  id='tbPlan" + i + "' type='number' placeholder='Plan'  class='alloc-qty-text form-control input-md'></td><td><input  id='tbRemarks" + i + "' type='text' placeholder='Remarks'  class='remarks-text form-control input-sm'></td> <td><a class='pull-right btn btn-sm btn-danger delete_row'><span class='glyphicon glyphicon-trash '></span></a></td>");
            $('#AccountGroup_tbl').append('<tr id="addr' + (i + 1) + '"></tr>');
            i++;
            $("#select0 option[value='" + selectedacctgrp + "']").prop('disabled', true);
            $("#select0").select2({
                placeholder: "Select channel",
                theme: "bootstrap",
                width: 'resolve',
                closeOnSelect: true,
                //allowClear: true,
            });
            $('#select0').val(null).trigger("change");
            $('#add_row').prop('disabled', true);
        });
        $(document).on('click', '.delete_row', function () {

            var deletedacctgrp = $(this).closest('tr').find('td').find('label').html();
            $("#select0 option[value='" + deletedacctgrp + "']").prop('disabled', false);
            $("#select0").select2({
                placeholder: "Select channel",
                theme: "bootstrap",
                width: 'resolve',
                closeOnSelect: true,
                //allowClear: true,
            });
            $(this).parent().parent().remove(); //Deleting the Row (tr) Element 
            tableValidation();
        });
        $('#btnSubmit').click(function () {
            var pk = getParameterByName('pk');
            $(".tablelblpkey").text(pk);
            var tableAcctGrp = $('#AccountGroup_tbl').tableToJSON({
                ignoreColumns: [3],
                ignoreEmptyRows: true,
                textExtractor: {
                    0: function (cellIndex, $cell) {
                        if ($cell.find('label').text().length != 0) {
                            return $cell.find('label').text();
                        }
                    },
                    1: function (cellIndex, $cell) {
                        if ($cell.find("input").val().length != 0) {
                            return $cell.find("input").val();
                        }
                    },
                    2: function (cellIndex, $cell) {
                        if ($cell.find("input").val().length != 0) {
                            return $cell.find("input").val();
                        }
                    }
                }
            });
            submittedAcctGroup(tableAcctGrp);
            location.reload();
        });
        $("#myModal").on("show.bs.modal", function (e) {
            resetTable();
        })
        $('#AccountGroup_tbl').on('change', function () {
            tableValidation();
        });
        $('#table-modal tr').click(function (event) {
            if (event.target.type !== 'checkbox') {
                $(':checkbox', this).trigger('click');
            }
        });
        $('#select0').on("select2:select", function (e) {
            var test = $(this).val();
            if (test != '') {
                $('#add_row').prop('disabled', false);
            }
            else {
                $('#add_row').prop('disabled', true);
            }
        });

        function populateAcctGrp(name) {
            $(name).select2({
                placeholder: "Select channel",
                theme: "bootstrap",
                width: 'resolve',
                closeOnSelect: true,
                //allowClear: true,
            });
            $(name).append($('<option>').text('').attr('value', ''));
            var pk = getParameterByName('NewProduct');
            var channel = $('#ContentPlaceHolder1_lblChannel').text();
            $.ajax({
                type: "POST",
                url: "newproduct_detail.aspx/getAcctGroup",
                data: "{ channel: '" + channel + "',newProduct_id: '" + pk + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var result = JSON.parse(data.d);
                    $.each(result.acctGroupList, function (i, value) {
                        $(name).append($('<option>').text(value).attr('value', value));
                    });
                },
                failure: function (response) {
                    alert('failed');
                }
            });
        }
        function tableValidation() {
            var countplanempty = $('.alloc-qty-text').filter(function () {
                return !$(this).val();
            }).length;
            var countremarksempty = $('.remarks-text').filter(function () {
                return !$(this).val();
            }).length;
            var countofemptycell = (countplanempty + countremarksempty);
            if (countofemptycell == '0') {
                $('#btnSubmit').removeAttr('disabled');
            }
            else {
                $('#btnSubmit').attr('disabled', 'true');
            }
        }
        function submittedAcctGroup(tableAcctGrp) {
            var TableAccountGroup = JSON.stringify(tableAcctGrp);
            var pk = getParameterByName('NewProduct');
            var pipeline = $('#ContentPlaceHolder1_lblDatePipeline').text();
            var satdate = $('#ContentPlaceHolder1_lblDateSaturation').text();
            $.ajax({
                type: "POST",
                url: "newproduct_detail.aspx/submitAcctGroup",
                data: "{ TableAccountGroup: '" + TableAccountGroup + "',Pk: '" + pk + "',PipelineDate: '" + pipeline + "',SatDate: '" + satdate + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                    }
                },
                failure: function (response) {
                    alert('failed');
                }
            });
            //location.reload();
            //$('#myModal').modal('toggle');
        }
        function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }
        function resetTable() {
            $('#AccountGroup_tbl').find("tr:gt(0)").remove();
            $('#AccountGroup_tbl').append('<tr id="addr1"></tr>');
            i = 1;
            $('#select0').val(null).trigger("change");
            $('#tbPlan0').val(null);
            $('#tbRemarks0').val(null);
        }


        //function TableInitialize() {
        //    var newProduct_id = getParameterByName('NewProduct');
        //    $.ajax({
        //        type: "POST",
        //        url: "newproduct_detail.aspx/RefreshAccountofSaturationTable_Click",
        //        data: "{ newProduct_id: '" + newProduct_id + "'}",
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: function (data) {
        //            var result = JSON.parse(data.d);
        //            var r = 1;
        //            var ActionButton = "<button type='button' class='btn btn-default btnOpenAcctgrp'>View</button>&nbsp<button type='button' class='btn btn-danger btnEditAcctgrp'>Edit</button>";
        //            $.each(result.newAssignAcctGroupList, function (key, value) {
        //                $('#satrow' + r).html("<td class='text-left'> " + value.id + " </td><td class='text-left'>" + value.account_group_name + "</td><td class='text-left'>" + value.plan + "</td><td class='text-left'>TestConfirm</td><td class='text-center'>TestPending</td><td class='text-left'>TestRemarks</td><td class='text-center'>" + ActionButton + "</td>");
        //                $('#SaturationAssignAcctGrpTbl').append('<tr id="satrow' + (r + 1) + '"></tr>');
        //                r++;
        //            });
        //            r = 1;
        //            checkType();
        //        },
        //        failure: function (response) {
        //            alert('failed');
        //        }
        //    });

        //};
        //function checkType() {

        //    var usertype = $('#ContentPlaceHolder1_checkUser').text();
        //    if (usertype == 'PMOG')
        //    {
        //        $('.btnOpenAcctgrp').show()
        //        $('.btnEditAcctgrp').show();
        //    }
        //    else
        //    {
        //        $('.btnOpenAcctgrp').hide();
        //        $('.btnEditAcctgrp').hide();
        //    }
        //};

    </script>
    <%-- <script src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>--%>
    <script src="Scripts/tabletojson.min.js"></script>

</asp:Content>

