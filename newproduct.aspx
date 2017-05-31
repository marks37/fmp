<%@ Page Title="" Language="C#" MasterPageFile="~/SaturationMain.master" AutoEventWireup="true" CodeFile="newproduct.aspx.cs" Inherits="newproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .table {
            border-bottom: 1px solid #ddd;
        }

            .table > thead > tr > th {
            }

            .table > tbody > tr {
                background-color: #fff;
            }

        .table-modal > tbody > tr {
            cursor: pointer;
        }

        .select2-container {
            width: 100% !important;
            padding: 0;
        }

        tr {
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        .highlight {
            background-color: #00ff90;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="lower-navbar" class="" style="line-height: 40px; border-bottom: 1px solid #ddd;">
        <div class="container-fluid">
            <div class="pull-left">
                <span style="font-size: 100%;">Saturation</span>
            </div>
            <div class="pull-right">
                <div class="" role="toolbar">
                    <div class="btn-group" role="group">
                        <div class="input-group">
                            <div class="input-group" id="search">
                                <input id="tablesearch" type="text" class="form-control input-sm" placeholder="Search..." />
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="btn-group" role="group">
                        <%--<a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">View UL Products</a>--%>
                        <a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">Set Saturation</a>
                    </div>
                </div>
            </div>
            <%--<div class="clearfix"></div>--%>
        </div>
    </div>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="" id="main-content-wrapper">
        <!-- Table -->
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <table id="newproducts_tbl" class="table table-hover" style="margin-top: 10px;">
                    <thead>
                        <tr>
                            <th class="text-left">Id</th>
                            <th class="text-left">Item Code</th>
                            <th class="text-left">Item Name</th>
                            <th class="text-left">Channel</th>
                            <th class="text-center">Pipeline</th>
                            <th class="text-center">End Saturation</th>
                            <%--<th class="text-center">Plan</th>
                    <th class="text-center">Confirmed</th>--%>
                            <th class="text-center">Date Created</th>
                            <%--<th class="text-left">Status</th>--%>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                        <asp:Repeater ID="newProdRptr" runat="server" OnItemDataBound="newProdRptr_ItemDataBound" OnItemCommand="newProdRptr_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "id") %></td>
                                    <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "itemCode") %></td>
                                    <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "itemName") %></td>
                                    <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "channel") %></td>
                                    <td>
                                        <asp:Label ID="pipelineDate" runat="server" Text=""></asp:Label></td>
                                    <td>
                                        <asp:Label ID="saturationDate" runat="server" Text=""></asp:Label></td>
                                    <%--<td><%# DataBinder.Eval(Container.DataItem, "plan") %></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "confirmed") %></td>--%>
                                    <td>
                                        <asp:Label ID="dateCreated" runat="server" Text=""></asp:Label></td>
                                    <%--<td class="text-left"><span class="label label-default">Active</span></td>--%>
                                    <td>
                                        <asp:LinkButton ID="viewBtn" CommandName="view" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>' runat="server" Width="50" CssClass="btn btn-sm btn-default">View</asp:LinkButton>
                                        <%--<asp:LinkButton ID="btnEdit" CommandName="edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>' runat="server" Width="50" CssClass="btn btn-sm btn-danger">Edit</asp:LinkButton>--%>
                                        <button id="btnEdit" type="button" style="width: 50px;" class="btn btn-sm btn-danger btnEdit">Edit</button>

                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <!-- End Table -->
    </div>

    <!-- Modal-->
    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <%--X button at top right--%>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <%--End X button--%>

                            <%--Top left title--%>
                            <h4 class="modal-title">Set Saturation</h4>
                            <%--End top left title--%>
                        </div>
                        <div class="modal-body" id="">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="new_product_form">
                                        <div class="form-group">
                                            <label class="control-label">Channel / Brand </label>
                                            <select id="ddlChannelBrand" name="ddlChannelBrand" class="form-control input-md"></select>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Pipeline Date</label>
                                            <%--<input  id='PipeLineDate' type="date"  class='form-control input-md'/>--%>
                                            <asp:TextBox ID="tbPipeLineDate" runat="server" placeholder="mm / yyyy" CssClass="form-control input-md StartDate"></asp:TextBox>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label">End Saturation Date</label>
                                            <%--<input  id='SaturationDate' type="date"  class='form-control input-md'/>--%>
                                            <asp:TextBox ID="tbSaturationDate" runat="server" placeholder="mm / yyyy" CssClass="form-control input-md EndDate"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Remarks</label>
                                            <%--<input id='tbRemarks' type="text"  class='form-control input-md'/>--%>
                                            <asp:TextBox ID="tbRemarks" runat="server" CssClass="form-control input-md"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
                                <%--<button id="btnAddSaturation" type="button" class="btn btn-primary btn-sm">Create</button>--%>
                                <asp:LinkButton ID="btnAddSaturation" runat="server" CssClass="btn btn-primary btn-sm" OnClick="btnAddSaturation_Click">Create</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>


        </div>
    </div>
    <!-- End Modal -->

    <!-- Modal 2-->
    <div class="modal fade" id="myModal2" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <%--X button at top right--%>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <%--End X button--%>

                            <%--Top left title--%>
                            <h4 class="modal-title">Edit Saturation</h4>
                            <%--End top left title--%>
                        </div>
                        <div class="modal-body" id="">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="edit_product_form">
                                        <div class="form-group">
                                            <label class="control-label">Channel / Brand </label>
                                            <asp:TextBox ID="Modal2tbChannelBrand" runat="server" Enabled="false" CssClass="form-control input-md"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Pipeline Date</label>
                                            <%--<input  id='PipeLineDate' type="date"  class='form-control input-md'/>--%>
                                            <asp:TextBox ID="Modal2tbPipeLineDate" runat="server" CssClass="form-control input-sm StartDate"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">End Saturation Date</label>
                                            <%--<input  id='SaturationDate' type="date"  class='form-control input-md'/>--%>
                                            <asp:TextBox ID="Modal2tbSaturationDate" runat="server" CssClass="form-control input-md EndDate"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Remarks</label>
                                            <%--<input id='tbRemarks' type="text"  class='form-control input-md'/>--%>
                                            <asp:TextBox ID="Modal2tbRemarks" runat="server" CssClass="form-control input-md"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
                                <%--<button id="btnAddSaturation" type="button" class="btn btn-primary btn-sm">Create</button>--%>
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary btn-sm" OnClick="btnAddSaturation_Click">Create</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <!-- End Modal -->





    <script type="text/javascript">
        $(document).ready(function () {
            $('#newproducts_tbl').DataTable({
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
            $('#tablesearch').on('keyup', function () {
                var keywords = $('#tablesearch').text;
                $('#newproducts_tbl').DataTable().search(this.value).draw();
            });
            populateDdlChannelBranch('#ddlChannelBrand');
        });
       
        var startDate = new Date();
        var FromEndDate = new Date();
        $('.StartDate').datepicker({
            autoclose: true,
            minViewMode: 1,
            format: 'mm/yyyy'
        }).on('changeDate', function (selected) {
            startDate = new Date(selected.date.valueOf());
            //startDate.setMonth(startDate.getMonth(new Date(selected.date.valueOf())));
            $('.EndDate').datepicker('setStartDate', startDate);
        });
        $('.EndDate').datepicker({
            autoclose: true,
            minViewMode: 1,
            format: 'mm/yyyy',
            
        }).on('changeDate', function (selected) {
            FromEndDate = new Date(selected.date.valueOf());
            //FromEndDate.setMonth(FromEndDate.getMonth(new Date(selected.date.valueOf())));
            $('.StartDate').datepicker('setEndDate', FromEndDate);
        });
      

        $('#ddlChannelBrand').on('change', function () {
            tableValidation();
        });
        $('#ContentPlaceHolder1_tbPipeLineDate').on('change', function () {
            tableValidation();
        });
        $('#ContentPlaceHolder1_tbSaturationDate').on('change', function () {
            tableValidation();
        });
        $('#ContentPlaceHolder1_tbRemarks').on('change', function () {
            tableValidation();
        });
        $('.btnEdit').on('click', function () {
            var AcctGrpId = $(this).closest('tr').find('td:first').text();
            //$.ajax({
            //    type: "POST",
            //    url: "newproduct.aspx/LoadDetailsToModal2",
            //    data: "{}",
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (data) {
            //        var result = JSON.parse(data.d);
            //        $.each(result.ChannelBranchList, function (key, value) {
            //            $(name).append($('<option>').text(value.channel + " / " + value.itemname).attr('value', value.id));
            //        });
            //    },
            //    failure: function (response) {
            //        alert('failed');
            //    }
            //});
        });


        function closeModal() {
            $('#myModal').modal('hide');
        }
        function tableValidation() {
            var dllchannel = $('#ddlChannelBrand').text();
            var tbpipeline = $('#ContentPlaceHolder1_tbPipeLineDate').val();
            var tbsaturation = $('#ContentPlaceHolder1_tbSaturationDate').val();
            var tbremarks = $('#ContentPlaceHolder1_tbRemarks').val();
            if (dllchannel != '' && tbpipeline.length != 0 && tbsaturation.length != 0 && tbremarks.length != 0) {
                $('#ContentPlaceHolder1_btnAddSaturation').removeAttr('disabled');
            }
            else {
                $('#ContentPlaceHolder1_btnAddSaturation').attr('disabled', 'true');
            }



            //if (countofemptycell == '0') {
            //    $('#btnAddSaturation').removeAttr('disabled');
            //}
            //else {
            //    $('#btnSubmit').attr('disabled', 'true');
            //}
            //if ( != null || $('#ContentPlaceHolder1_tbPipeLineDate').val() != null || $('#ContentPlaceHolder1_tbSaturationDate').val() != null || $('#ContentPlaceHolder1_tbRemarks').val() != null) {
            //    countempty = 1;
            //}
            //else
            //{
            //    countempty = 0;
            //}
            //if ($('#ddlChannelBrand').text != null) {
            //    countempty = countempty + 1;
            //}
            //if ($('#ContentPlaceHolder1_tbPipeLineDate').val() != null) {
            //    countempty = countempty + 1;
            //}
            //if ($('#ContentPlaceHolder1_tbSaturationDate').val() != null) {
            //    countempty = countempty + 1;
            //}
            //if ($('#ContentPlaceHolder1_tbRemarks').val() != null) {
            //    countempty = countempty + 1;
            //}



        }
        function populateDdlChannelBranch(name) {
            $(name).select2({
                placeholder: "Select Branch",
                theme: "bootstrap",
                width: 'resolve',
                closeOnSelect: true,
                //allowClear: true,
            });
            $(name).append($('<option>').text('').attr('value', ''));
            $.ajax({
                type: "POST",
                url: "newproduct.aspx/populateDllChannelBrand",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var result = JSON.parse(data.d);
                    $.each(result.ChannelBranchList, function (key, value) {
                        $(name).append($('<option>').text(value.channel + " / " + value.itemname).attr('value', value.id));
                    });
                },
                failure: function (response) {
                    alert('failed');
                }
            });
            modalFormReset();
        };
        function modalFormReset() {
            $('#ContentPlaceHolder1_tbPipeLineDate').val(null);
            $('#ContentPlaceHolder1_tbSaturationDate').val(null);
            $('#ContentPlaceHolder1_tbRemarks').val(null);
            $('#ContentPlaceHolder1_btnAddSaturation').attr('disabled', 'true');
        }


        //function CreateSaturation() {
        //    var channelbrandid = $('#ddlChannelBrand').val();
        //    var pipelinedate = $('#PipeLineDate').val();
        //    var saturationdate = $('#SaturationDate').val();
        //    var remarks = $('#tbRemarks').val();
        //    $.ajax({
        //        type: "POST",
        //        url: "newproduct.aspx/CreateSaturation",
        //        data: "{ChannelBrandID: '" + channelbrandid + "',\
        //                PipeLineDate: '" + pipelinedate + "',\
        //                SaturationDate: '" + saturationdate + "',\
        //                Remarks: '" + remarks + "' }",

        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: function (data) {
        //            var result = JSON.parse(data.d);
        //            //$.each(result.ChannelBranchList, function (key, value) {
        //            //    $(name).append($('<option>').text(value.channel + " / " + value.itemname).attr('value', value.id));
        //            //});
        //        },
        //        failure: function (response) {
        //            alert('failed');
        //        }
        //    });
        //};
        //$("#btnAddSaturation").click(function () {
        //    CreateSaturation();
        //});



        //$(document).ready(function () {
        //    $('#itemSelect').select2({
        //        placeholder: "Select UL Item",
        //        theme: "bootstrap",
        //        allowClear: true,
        //    });

        //    $('#channelSelect').select2({
        //        placeholder: "Select channel",
        //        theme: "bootstrap",
        //        allowClear: true,
        //    });

        //    $('#table-modal tr').click(function (event) {
        //        if (event.target.type !== 'checkbox') {
        //            $(':checkbox', this).trigger('click');
        //        }
        //    });

        //    var validation = 0;
        //    $('#create_btn').prop('disabled', 'true');
        //    $('#create_btn2').attr('disabled', 'true');

        //    var table = $('#products_tbl').DataTable({
        //        "paging": false,
        //        "ordering": false,
        //        "info": false,
        //        "dom": 't',
        //        scrollY: 300,
        //        scrollCollapse: true,
        //        "language": {
        //            "emptyTable": "No data available",
        //        }
        //    });

        //    $('#products_tbl tbody').on('click', 'tr', function () {
        //        if ($(this).hasClass('info')) {
        //            $(this).removeClass('info');
        //            $(this).find('input[type=checkbox]').prop('checked', false);
        //            $('#create_btn').prop('disabled', 'disabled');
        //        }
        //        else {
        //            table.$('tr.info').find('input[type=checkbox]').prop('checked', false);
        //            table.$('tr.info').removeClass('info');
        //            $(this).addClass('info');
        //            $(this).find('input[type=checkbox]').prop('checked', true);
        //            $('#create_btn').prop('disabled', '');
        //        }
        //    });

        //    $('#myModal').on('shown.bs.modal', function (e) {
        //        $.fn.dataTable.tables({ visible: true, api: true }).columns.adjust();
        //    });

        //    $('#product_filter').on('keyup', function () {
        //        var keywords = $('#product_filter').text;
        //        $('#products_tbl').DataTable().search(this.value).draw();
        //    });

        //    $('.form-a').on('keyup change', function () {
        //        var empty_flds = 0;
        //        var error = $("<span></span>").addClass('help-block').text("This is required.");
        //        if ($(this).val() == "") {
        //            if ($(this).closest('div.form-group').find('span.help-block').length) {
        //                //$(this).closest('div.form-group').find('.help-block').remove();
        //            } else {
        //                $(this).closest('div.form-group').append(error);
        //            }
        //            $(this).closest('div.form-group').addClass('has-error');
        //        } else {
        //            $(this).closest('div.form-group').removeClass('has-error');
        //            $(this).closest('div.form-group').find('.help-block').remove();
        //        }
        //        $('.form-a').each(function () {
        //            if (!$.trim($(this).val())) {
        //                empty_flds++;
        //            }
        //        });
        //        if (empty_flds) {
        //            $('#create_btn2').attr('disabled', 'true');
        //        } else {
        //            $('#create_btn2').removeAttr('disabled');
        //        }
        //    });

        //    $('#myModal2').on('hide.bs.modal', function (e) {
        //        $('#itemSelect').val('').trigger('change')
        //        $('#channelSelect').val('').trigger('change')
        //        $('#pipelineInput').val("");
        //        $('#saturationInput').val("");
        //        $('#create_btn2').prop('disabled', 'true');
        //        $('#new_product_form').find('.form-group').each(function () {
        //            $(this).find('span.help-block').remove();
        //            $(this).removeClass('has-error');
        //        });
        //    });

        //});

    </script>
    <script src="Scripts/datepicker-bootstrap.min.js"></script>
</asp:Content>

