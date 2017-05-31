<%@ Page Title="" Language="C#" MasterPageFile="~/SaturationMain.master" AutoEventWireup="true" CodeFile="cdschild_saturation.aspx.cs" Inherits="cdschild_saturation" %>

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

        #devchild_table tbody tr {
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="lower-navbar" class="" style="line-height: 40px; border-bottom: 1px solid #ddd;">
        <div class="container-fluid">
            <div class="pull-left">
                <span style="font-size: 100%;">Target Product Saturation / Data</span>
            </div>
            <div class="pull-right">
                <div class="" role="toolbar">
                    <div class="btn-group">
                        <a class="btn btn-sm btn-default" style="font-size: 18px; padding: 0px 10px;" href="/dev_saturation.aspx"><span class="text-muted fa fa-long-arrow-left"></span></a>
                    </div>
                    <div class="btn-group" role="group">
                        <a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">Add Branch</a>
                    </div>
                </div>
            </div>
            <%--<div class="clearfix"></div>--%>
        </div>
    </div>

    <div class="" id="main-content-wrapper">
        <!-- Insert main content here -->
        <br />
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-7">
                    <h2>Cholinerv 1g</h2>
                    <h5>156703</h5>
                    <h5>General Trade</h5>
                    <h5>Rusley Sales Corp.</h5>
                </div>

                <div class="col-md-5">
                    <div class="panel panel-default">
                        <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <th>Pipeline</th>
                                    <td>06/01/2011</td>
                                </tr>
                                <tr>
                                    <th>Saturation</th>
                                    <td>03/22/2015</td>
                                </tr>
                                <tr>
                                    <th>Date Created</th>
                                    <td>10/19/2016</td>
                                </tr>
                                <tr>
                                    <th>Status</th>
                                    <td><span class="label label-default">Active</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid" style="margin-bottom: 0;">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#">Target</a></li>
                <li role="presentation"><a href="#">Actual</a></li>
            </ul>
        </div>
        <hr style="margin-top: -1px; margin-bottom: 5px;" />
        <div class="container-fluid">
            <br />
            <div class="pull-left">

                <div class="input-group" id="search">
                    <input type="text" class="form-control input-sm" placeholder="Search..." />
                    <span class="input-group-btn">
                        <button class="btn btn-default btn-sm" type="button">Go</button>
                    </span>
                </div>
                <br />
            </div>
            <div class="btn-group" role="group" style="margin-left: 20px;">
                <a class="active btn btn-default btn-sm">Pending</a>
                <a class="btn btn-default btn-sm">Confirmed</a>
            </div>

            <div class="pull-right">
                <div class="input-group">
                    <div class="input-group">
                        <a class="btn btn-success btn-sm" id="branch_confirm" style="visibility: hidden;">Confirm</a>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>

            <div>

                <table id="devchild_table" style="border-bottom: 0;" class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center">
                                <input type="checkbox" id="check" />
                            </th>
                            <th class="text-left">Branch Code</th>
                            <th class="text-left">Branch Name</th>
                            <th class="text-left">CDS</th>
                            <th class="text-center">Status</th>
                        </tr>
                    </thead>

                    <tbody class="text-center">
                        <tr>
                            <td>
                                <input type="checkbox" /></td>
                            <td class="text-left">V311657U</td>
                            <td class="text-left">ALESIA PHARMACY</td>
                            <td class="text-left">Jose A. Zozobrado</td>
                            <td><span class="label label-primary">In-Progress</span></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" /></td>
                            <td class="text-left">V311657U</td>
                            <td class="text-left">ALESIA PHARMACY</td>
                            <td class="text-left">Jose A. Zozobrado</td>
                            <td><span class="label label-primary">In-Progress</span></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" /></td>
                            <td class="text-left">V311657U</td>
                            <td class="text-left">ALESIA PHARMACY</td>
                            <td class="text-left">Jose A. Zozobrado</td>
                            <td><span class="label label-primary">In-Progress</span></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" /></td>
                            <td class="text-left">V311657U</td>
                            <td class="text-left">ALESIA PHARMACY</td>
                            <td class="text-left">Jose A. Zozobrado</td>
                            <td><span class="label label-primary">In-Progress</span></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" /></td>
                            <td class="text-left">V311657U</td>
                            <td class="text-left">ALESIA PHARMACY</td>
                            <td class="text-left">Jose A. Zozobrado</td>
                            <td><span class="label label-primary">In-Progress</span></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" /></td>
                            <td class="text-left">V311657U</td>
                            <td class="text-left">ALESIA PHARMACY</td>
                            <td class="text-left">Jose A. Zozobrado</td>
                            <td><span class="label label-primary">In-Progress</span></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" /></td>
                            <td class="text-left">V311657U</td>
                            <td class="text-left">ALESIA PHARMACY</td>
                            <td class="text-left">Jose A. Zozobrado</td>
                            <td><span class="label label-primary">In-Progress</span></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" /></td>
                            <td class="text-left">V311657U</td>
                            <td class="text-left">ALESIA PHARMACY</td>
                            <td class="text-left">Jose A. Zozobrado</td>
                            <td><span class="label label-primary">In-Progress</span></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" /></td>
                            <td class="text-left">V311657U</td>
                            <td class="text-left">ALESIA PHARMACY</td>
                            <td class="text-left">Jose A. Zozobrado</td>
                            <td><span class="label label-primary">In-Progress</span></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" /></td>
                            <td class="text-left">V311657U</td>
                            <td class="text-left">ALESIA PHARMACY</td>
                            <td class="text-left">Jose A. Zozobrado</td>
                            <td><span class="label label-primary">In-Progress</span></td>
                        </tr>
                    </tbody>
                </table>
                <br />
            </div>
        </div>
    </div>
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
                    <h4 class="modal-title" id="myModalLabel">Add Branch</h4>
                    <%--End top left title--%>
                </div>

                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="input-group">
                                <input type="text" class="form-control input-sm" placeholder="Search..." />
                                <span class="input-group-btn">
                                    <button class="btn btn-default btn-sm" type="button">Go</button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <br />
                    <%--Table inside modal--%>
                    <div class="">
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-hover table-bordered" id="table-modal" style="border-bottom: 0;">
                                    <thead>
                                        <tr>
                                            <th class="text-center">
                                                <input type="checkbox" id="checkall" />
                                            </th>
                                            <th class="text-center">Account Group</th>
                                            <th class="text-center">Account Code</th>
                                            <th class="text-center">Branch ID</th>
                                            <th class="text-center">Branch Name</th>
                                            <th class="text-center">CDS</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-center">
                                                <input type="checkbox" />
                                            </td>
                                            <td class="text-center">Pharmacy</td>
                                            <td class="text-center">0080117171</td>
                                            <td class="text-center">0080117171</td>
                                            <td class="text-center">ALESIA PHARMACY</td>
                                            <td class="text-center">Jose A. Zozobrado</td>

                                        </tr>
                                        <tr>
                                            <td class="text-center">
                                                <input type="checkbox" />
                                            </td>
                                            <td class="text-center">Pharmacy</td>
                                            <td class="text-center">0080117171</td>
                                            <td class="text-center">0080117171</td>
                                            <td class="text-center">ALESIA PHARMACY</td>
                                            <td class="text-center">Jose A. Zozobrado</td>

                                        </tr>
                                        <tr>
                                            <td class="text-center">
                                                <input type="checkbox" />
                                            </td>
                                            <td class="text-center">Pharmacy</td>
                                            <td class="text-center">0080117171</td>
                                            <td class="text-center">0080117171</td>
                                            <td class="text-center">ALESIA PHARMACY</td>
                                            <td class="text-center">Jose A. Zozobrado</td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <%--End table inside modal--%>
                    <br />
                </div>

                <div class="modal-footer">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-success btn-sm">Submit</button>
                    </div>
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

        $(document).ready(function () {
            $('#devchild_table tr').click(function (event) {
                if (event.target.type !== 'checkbox') {
                    $(':checkbox', this).trigger('click');
                    $('#branch_confirm').css('visibility', 'visible');
                }
            });
        });


        $("#checkall").click(function () {
            $('#table-modal tbody tr input:checkbox').not(this).prop("checked", this.checked);
        });

        $("#check").click(function () {
            $("input:checkbox").not(this).prop("checked", this.checked);

        });

        $("td:first-child input").change(function () {
            $(this).closest("tr").toggleClass("highlight", this.checked);
        });

        //$(document).ready(function () {
        //    $("#table-modal").DataTable();
        //});
    </script>
    <script src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>
</asp:Content>

