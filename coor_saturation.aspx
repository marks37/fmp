<%@ Page Title="" Language="C#" MasterPageFile="~/SaturationMain.master" AutoEventWireup="true" CodeFile="coor_saturation.aspx.cs" Inherits="coor_saturation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                font-weight: normal;
                line-height: 25px;
                border-bottom: 0;
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
                <span style="font-size: 100%;">Target Product Saturation</span>
            </div>
            <div class="pull-right">
                <div class="" role="toolbar">
                    <div class="btn-group" role="group">
                        <div class="input-group">
                            <div class="input-group" id="search">
                                <input type="text" class="form-control input-sm" placeholder="Search..." />
                                <span class="input-group-btn">
                                    <button class="btn btn-default btn-sm" type="button">Go</button>
                                </span>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="btn-group" role="group">
                        <a class="active btn btn-default btn-sm">New</a>
                        <a class="btn btn-default btn-sm">In-progress</a>
                        <a class="btn btn-default btn-sm">Finished</a>
                    </div>
                    &nbsp;
                    <div class="btn-group" role="group">
                        <asp:LinkButton ID="prevBtn" CssClass="btn btn-sm btn-default disabled" runat="server"><span class="fa fa-chevron-left text-muted"></span></asp:LinkButton>
                        <asp:LinkButton ID="nextBtn" CssClass="btn btn-sm btn-default disabled" runat="server"><span class="fa fa-chevron-right text-muted"></span></asp:LinkButton>
                    </div>
                    &nbsp;
                    <div class="btn-group" role="group">
                        <a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">New Target </a>
                    </div>
                </div>
            </div>
            <%--<div class="clearfix"></div>--%>
        </div>
    </div>

    <div class="" id="main-content-wrapper">
        <!-- Table -->
        <table id="dev_table" class="table table-hover" style="margin-top: 10px;">
            <thead>
                <tr>
                    <th class="text-center">Item Code</th>
                    <th class="text-center">Item Name</th>
                    <th class="text-center">Channel</th>
                    <th class="text-center">Account Group</th>
                    <th class="text-center">Pipeline</th>
                    <th class="text-center">Saturation</th>
                    <th class="text-center">Date Created</th>
                    <th class="text-center">Status</th>
                    <th class="text-center">Action</th>
                </tr>
            </thead>

            <tbody class="text-center">
                <tr>
                    <td>156703</td>
                    <td>Cholinerv 1g</td>
                    <td>General Trade</td>
                    <td>Rusley Sales Corp.</td>
                    <td>06/01/2011</td>
                    <td>03/22/2015</td>
                    <td>10/19/2016</td>
                    <td><span class="label label-default">Active</span></td>
                    <td><a href="/devchild_saturation.aspx" class="btn btn-sm btn-default">View</a></td>
                </tr>
                <tr>
                    <td>156703</td>
                    <td>Cholinerv 1g</td>
                    <td>General Trade</td>
                    <td>Rusley Sales Corp.</td>
                    <td>06/01/2011</td>
                    <td>03/22/2015</td>
                    <td>10/19/2016</td>
                    <td><span class="label label-default">Active</span></td>
                    <td><a href="#" class="btn btn-sm btn-default">View</a></td>
                </tr>
                <tr>
                    <td>156703</td>
                    <td>Cholinerv 1g</td>
                    <td>General Trade</td>
                    <td>Rusley Sales Corp.</td>
                    <td>06/01/2011</td>
                    <td>03/22/2015</td>
                    <td>10/19/2016</td>
                    <td><span class="label label-default">Inactive</span></td>
                    <td><a href="#" class="btn btn-sm btn-default">View</a></td>
                </tr>
                <tr>
                    <td>156703</td>
                    <td>Cholinerv 1g</td>
                    <td>General Trade</td>
                    <td>Rusley Sales Corp.</td>
                    <td>06/01/2011</td>
                    <td>03/22/2015</td>
                    <td>10/19/2016</td>
                    <td><span class="label label-default">Inactive</span></td>
                    <td><a href="#" class="btn btn-sm btn-default">View</a></td>
                </tr>
                <tr>
                    <td>156703</td>
                    <td>Cholinerv 1g</td>
                    <td>General Trade</td>
                    <td>Rusley Sales Corp.</td>
                    <td>06/01/2011</td>
                    <td>03/22/2015</td>
                    <td>10/19/2016</td>
                    <td><span class="label label-default">Active</span></td>
                    <td><a href="#" class="btn btn-sm btn-default">View</a></td>
                </tr>
            </tbody>
        </table>
        <!-- End Table -->
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <%--X button at top right--%>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <%--End X button--%>

                    <%--Top left title--%>
                    <h4 class="modal-title" id="myModalLabel">New Target Saturation</h4>
                    <%--End top left title--%>
                </div>

                <div class="modal-body">
                    <div class="row">
                        <%--'Select Channel' and textbox--%>
                        <div class="col-md-5">
                            <p>Select Channel</p>
                        </div>
                        <div class="col-md-7">
                            <input type="text" class="form-control" />
                        </div>
                        <%--End 'Select Channel' and textbox--%>
                    </div>
                    <div class="row">
                        <%--'Select Target Product' and textbox--%>
                        <div class="col-md-5">
                            <p style="margin-top: 5px;">Select Target Product</p>
                        </div>
                        <div class="col-md-7">
                            <input type="text" class="form-control" />
                        </div>
                        <%--End 'Select Target Product' and textbox--%>
                    </div>
                    <div class="row" style="margin-bottom: 20px;">
                        <%--'Select Target Account Group' and textbox--%>
                        <div class="col-md-5">
                            <p style="margin-top: 5px;">Select Target Account Group</p>
                        </div>
                        <div class="col-md-7">
                            <input type="text" class="form-control" />
                        </div>
                        <%-- End 'Select Target Account Group' and textbox--%>
                    </div>
                    <hr />

                    <%--Table inside modal--%>
                    <div class="">
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-hover table-modal" id="table-modal">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Channel</th>
                                            <th class="text-center">Account Group</th>
                                            <th class="text-center">Account Code</th>
                                            <th class="text-center">Branch ID</th>
                                            <th class="text-center">Branch Name</th>
                                            <th class="text-center">CDS</th>
                                            <th class="text-center">
                                                <input type="checkbox" id="checkall" /></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-center">General Trade</td>
                                            <td class="text-center">Pharmacy</td>
                                            <td class="text-center">0080117171</td>
                                            <td class="text-center">0080117171</td>
                                            <td class="text-center">ALESIA PHARMACY</td>
                                            <td class="text-center">Jose A. Zozobrado</td>
                                            <td class="text-center">
                                                <input type="checkbox" /></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">General Trade</td>
                                            <td class="text-center">Pharmacy</td>
                                            <td class="text-center">0080117171</td>
                                            <td class="text-center">0080117171</td>
                                            <td class="text-center">ALESIA PHARMACY</td>
                                            <td class="text-center">Jose A. Zozobrado</td>
                                            <td class="text-center">
                                                <input type="checkbox" /></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">General Trade</td>
                                            <td class="text-center">Pharmacy</td>
                                            <td class="text-center">0080117171</td>
                                            <td class="text-center">0080117171</td>
                                            <td class="text-center">ALESIA PHARMACY</td>
                                            <td class="text-center">Jose A. Zozobrado</td>
                                            <td class="text-center">
                                                <input type="checkbox" /></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">General Trade</td>
                                            <td class="text-center">Pharmacy</td>
                                            <td class="text-center">0080117171</td>
                                            <td class="text-center">0080117171</td>
                                            <td class="text-center">ALESIA PHARMACY</td>
                                            <td class="text-center">Jose A. Zozobrado</td>
                                            <td class="text-center">
                                                <input type="checkbox" /></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">General Trade</td>
                                            <td class="text-center">Pharmacy</td>
                                            <td class="text-center">0080117171</td>
                                            <td class="text-center">0080117171</td>
                                            <td class="text-center">ALESIA PHARMACY</td>
                                            <td class="text-center">Jose A. Zozobrado</td>
                                            <td class="text-center">
                                                <input type="checkbox" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <%--End table inside modal--%>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal -->

    <script type="text/javascript">
        $(document).ready(function () {
            $('#table-modal tr').click(function (event) {
                if (event.target.type !== 'checkbox') {
                    $(':checkbox', this).trigger('click');
                }
            });
        });

        $("#checkall").click(function () {
            $('input:checkbox').not(this).prop('checked', this.checked);
            $('#table-modal tr td').toggleClass('highlight');
        });

        $('td:first-child input').change(function () {
            $(this).closest('tr').toggleClass("highlight", this.checked);
        });

        $(document).ready(function () {
            $('#table-modal').DataTable();
        });
    </script>
    <script src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>
</asp:Content>

