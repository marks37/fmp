<%@ Page Title="" Language="C#" MasterPageFile="~/SaturationMain.master" AutoEventWireup="true" CodeFile="newproduct_setup.aspx.cs" Inherits="newproduct_setup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        #table-modal {
            margin-top: 0px;
        }

        #table-modal_filter label {
            margin-bottom: 10px;
            font-weight: 100;
        }

        #table-modal_wrapper .panel-heading {
            padding: 5px 5px;
        }

        table.dataTable {
            margin-top: 0px !important;
        }

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

        #select2-modalddlUom-container {
            text-align: left;
        }
    </style>


    <div id="lower-navbar" class="" style="line-height: 40px; border-bottom: 1px solid #ddd;">
        <div class="container-fluid">
            <div class="pull-left">
                <span style="font-size: 100%;">New Products Setup</span>
            </div>
            <div class="pull-right">
                <div class="" role="toolbar">
                    <div class="btn-group" role="group">
                        <div class="input-group">
                            <div class="input-group" id="search">
                                <input id="tablenewprodsetup" type="text" class="form-control input-sm" placeholder="Search..." />
                                <%--       <span class="input-group-btn">
                                    <button class="btn btn-default btn-sm" type="button">Go</button>
                                </span>--%>
                            </div>
                        </div>
                    </div>
                    <%--&nbsp;--%>
                    <%--   <div class="btn-group" role="group">
                        <asp:LinkButton ID="prevBtn" CssClass="btn btn-sm btn-default disabled" runat="server"><span class="fa fa-chevron-left text-muted"></span></asp:LinkButton>
                        <asp:LinkButton ID="nextBtn" CssClass="btn btn-sm btn-default disabled" runat="server"><span class="fa fa-chevron-right text-muted"></span></asp:LinkButton>
                    </div>--%>
                    &nbsp;
                    <div class="btn-group" role="group">
                        <%--<a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">View UL Products</a>--%>
                        <a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">Add Product</a>
                    </div>
                </div>
            </div>
            <%--<div class="clearfix"></div>--%>
        </div>
    </div>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="" id="main-content-wrapper">
        <div class="container-fluid">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table id="newproducts_tbl_setup" class="table table-hover" style="margin-top: 10px;">
                        <thead>
                            <tr>
                                <th class="text-left">Id</th>
                                <th class="text-left">Item Code</th>
                                <th class="text-left">Item Name</th>
                                <th class="text-left">Glu</th>
                                <th class="text-left">Remarks</th>
                                <th class="text-left">Uom</th>
                                <th class="text-left">Price Net</th>
                                <th class="text-left">Division</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody class="text-center">
                            <asp:Repeater ID="newProdSetupRptr" runat="server" OnItemDataBound="newProdSetupRptr_ItemDataBound" OnItemCommand="newProdSetupRptr_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "id") %></td>
                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "itemCode") %></td>
                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "itemName") %></td>
                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "glu") %></td>
                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "remarks") %></td>
                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "uom") %></td>
                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "priceNet") %></td>
                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "productDivision") %></td>
                                        <td>
                                            <asp:LinkButton ID="viewBtn" CommandName="view" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>' runat="server" CssClass="btn btn-sm btn-default">View</asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>



    <div class="modal fade" id="myModal" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <%--X button at top right--%>
                            <button type="button" class="close" aria-label="Close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <%--End X button--%>

                            <%--Top left title--%>
                            <h4 class="modal-title" id="myModalLabel">New Product</h4>
                            <%--End top left title--%>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">

                                    <div class="form-group" style="width: 100%;">
                                        <input type="text" id="product_filter" class="form-control" placeholder="Enter item glu, code, name, uom, price, or division" style="width: 100%;" />
                                    </div>
                                    <%--Table inside modal--%>
                                    <table class="table table-bordered table-condensed table-hover" id="products_tbl">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th class="text-left hidden">Id</th>
                                                <th class="text-left">Item Code</th>
                                                <th class="text-left">Item Name</th>
                                                <th class="text-left">GLU</th>
                                                <th class="text-left">Division</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="RptNewProductSelection" runat="server" OnItemDataBound="RptNewProductSelection_ItemDataBound" OnItemCommand="RptNewProductSelection_ItemCommand">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-center">
                                                            <input type="checkbox" class="chkboxModalNewProdId" /></td>
                                                        <td class="text-left hidden"><%# DataBinder.Eval(Container.DataItem, "id") %></td>
                                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "itemCode") %></td>
                                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "itemName") %></td>
                                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "gluName") %></td>
                                                        <td class="text-left"><%# DataBinder.Eval(Container.DataItem, "divisionName") %></td>
                                                        <%--<td>
                                            <asp:LinkButton ID="viewBtn" CommandName="view" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>' runat="server" CssClass="btn btn-sm btn-default">View</asp:LinkButton>
                                        </td>--%>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                    <%--End table inside modal--%>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="col-lg-6">
                                <div class="form-group row">
                                    <div class="input-group input-group-sm">
                                        <div class="input-group-addon">₱</div>
                                        <input type="number" id="modaltbPrice" placeholder="0.00" style="width: 150px;" class="form-control" disabled="disabled">
                                        <div class="input-group-addon">/</div>
                                        <select class="form-control" id="modalddlUom" disabled="disabled" style="width: 100%;">
                                            <option></option>
                                            <option>Box</option>
                                            <option>Tablet</option>
                                            <option>Captulse</option>
                                            <option>Bottle</option>
                                            <option>Can</option>
                                            <option>Vial</option>
                                            <option>Tube</option>
                                            <option>Vial</option>
                                            <option>Set</option>
                                            <option>Pack</option>
                                            <option>Pouch</option>
                                            <option>Kit</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="input-group input-group-sm">
                                        <div class="input-group-addon">Remarks</div>
                                        <input type="text" id="modaltbRemarks" placeholder="remarks" class="form-control" disabled="disabled">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group row" style="height:30px;">
                                </div>
                                 <div class="form-group row bottom-right">
                                     <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
                                    <button type="button" id="btnSubmitNewProd" class="btn btn-primary btn-sm" disabled="disabled" data-dismiss="modal">Submit</button>
                                    <%--<asp:LinkButton ID="btnSubmitNewProd" CssClass="btn btn-primary btn-sm" runat="server" OnClick="btnSubmitNewProd_OnClick">Submit</asp:LinkButton>--%>
                                </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>





    <%--Jquery --%>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#newproducts_tbl_setup').DataTable({
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
            $('#tablenewprodsetup').on('keyup', function () {
                var keywords = $('#tablesearch').text;
                $('#newproducts_tbl_setup').DataTable().search(this.value).draw();
            });

            $('#modalddlUom').select2({
                placeholder: "UOM",
                theme: "bootstrap",
                width: 'resolve',
                dropdownAutoWidth: true,
                closeOnSelect: true,
                //allowClear: true,
            });

        });


        $('#table-modal tr').click(function (event) {
            if (event.target.type !== 'checkbox') {
                $(':checkbox', this).trigger('click');
            }
        });

        var table = $('#products_tbl').DataTable({
            "paging": false,
            "ordering": false,
            "info": false,
            "dom": 't',
            scrollY: 300,
            scrollCollapse: true,
            "language": {
                "emptyTable": "No data available",
            }
        });

        $('#products_tbl tbody').on('click', 'tr', function () {
            if ($(this).hasClass('info')) {
                $(this).removeClass('info');
                $(this).find('input[type=checkbox]').prop('checked', false);
                $('#modaltbPrice').prop('disabled', true);
                $('#modalddlUom').prop('disabled', true);
                $('#modaltbRemarks').prop('disabled', true);
                $('#modaltbPrice').val('');
                $('#modaltbRemarks').val('');
                $('#modalddlUom').val('').trigger('change')
            }
            else {
                table.$('tr.info').find('input[type=checkbox]').prop('checked', false);
                table.$('tr.info').removeClass('info');
                $(this).addClass('info');
                $(this).find('input[type=checkbox]').prop('checked', true);
                //$('#btnSubmitNewProd').prop('disabled', '');
                $('#modaltbPrice').prop('disabled', false);
                $('#modalddlUom').prop('disabled', false);
                $('#modaltbRemarks').prop('disabled', false);
            }
        });


        $('#product_filter').on('keyup', function () {
            var keywords = $('#product_filter').text;
            $('#products_tbl').DataTable().search(this.value).draw();
        });

        $('#myModal').on('shown.bs.modal', function (e) {
            $.fn.dataTable.tables({ visible: true, api: true }).columns.adjust();
        });

        $('#btnSubmitNewProd').click(function (e) {
            var newprodId = $('#products_tbl tr td :checkbox:checked').map(function () {
                return $(this).closest('tr').find('td').eq(1).text()
            }).get();
            var newprodPrice = $('#modaltbPrice').val();
            var newprodUom = $('#modalddlUom').val();
            var newprodRemarks = $('#modaltbRemarks').val();
            $.ajax({
                type: "POST",
                url: "newproduct_setup.aspx/SubmitNewProductSetup",
                data: "{ newprodId: '" + newprodId + "',newprodPrice: '" + newprodPrice + "',newprodUom: '" + newprodUom + "',newprodRemarks: '" + newprodRemarks + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    //if (data.success) {
                    window.location.href = res.d;
                    //}
                },
                failure: function (response) {
                    alert('failed');
                }
            });
        });

        function closeModal() {
            $('#myModal').modal('hide');
        }
        $('#modaltbPrice').change(function () {
            ModalFormValidation();
        })
        $('#modalddlUom').change(function () {
            ModalFormValidation();
        })
        function ModalFormValidation() {
            var newprodPrice = $('#modaltbPrice').val();
            var newprodUom = $('#modalddlUom').val();
            if (newprodPrice != '' && newprodUom != '') {
                $('#btnSubmitNewProd').prop('disabled', false);
            }
            else {
                $('#btnSubmitNewProd').prop('disabled', true);
            }
        }

        //var xPos, yPos;
        //var prm = Sys.WebForms.PageRequestManager.getInstance();
        //prm.add_beginRequest(BeginRequestHandler);
        //prm.add_endRequest(EndRequestHandler);
        //function BeginRequestHandler(sender, args) {
        //    xPos = $get('scrollDiv').scrollLeft;
        //    yPos = $get('scrollDiv').scrollTop;

        //}
        //function EndRequestHandler(sender, args) {
        //    $get('scrollDiv').scrollLeft = xPos;
        //    $get('scrollDiv').scrollTop = yPos;
        //}

    </script>
</asp:Content>

