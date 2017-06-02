<%@ Page Title="" Language="C#" MasterPageFile="~/SaturationMain.master" AutoEventWireup="true" CodeFile="newproduct_view.aspx.cs" Inherits="newproduct_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .toggle.ios, .toggle-on.ios, .toggle-off.ios {
            border-radius: 20px;
        }

            .toggle.ios .toggle-handle {
                border-radius: 20px;
            }

        .toggle.android {
            border-radius: 0px;
        }

            .toggle.android .toggle-handle {
                border-radius: 0px;
            }

        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: rgba( 255, 255, 255, .8 ) url('ring.gif') 50% 50% no-repeat;
        }

        body.loading {
            overflow: hidden;
        }

            body.loading .modal {
                display: block;
            }
    </style>
    <div id="lower-navbar" class="" style="line-height: 40px; border-bottom: 1px solid #ddd;">
        <div class="container-fluid">
            <div class="pull-left">
                <span style="font-size: 100%;">New Products Setup</span>
            </div>
            <div class="pull-right" role="group">
                <div class="" role="toolbar">
                    <div class="btn-group">
                        <a class="btn btn-sm btn-default" style="font-size: 18px; padding: 0px 10px;" onclick="window.history.back();"><span class="text-muted fa fa-long-arrow-left"></span></a>
                    </div>
                    <div class="btn-group" role="group">
                        <%--<a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">View UL Products</a>--%>
                        <%--<a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">Add Product</a>--%>
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
            <div class="row">
                <div class="col-md-9">
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
                <div class="col-md-3">
                    <br />
                    <div class="" style="">
                        <div class="panel panel-default">
                            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>--%>
                            <table class="table table-bordered" id="newProdChannelStatusTable">
                                <thead>
                                    <tr>
                                        <th class="hidden">Id
                                        </th>
                                        <th>Channel
                                        </th>
                                        <th class="hidden"></th>
                                        <th class="text-center">Status
                                        </th>
                                        <th class="text-left">Pipeline</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="addr1"></tr>
                                    <tr id="addr2"></tr>
                                    <tr id="addr3"></tr>
                                    <tr id="addr4"></tr>

                                </tbody>
                            </table>
                            <%-- <asp:LinkButton ID="lbRefreshChannelTable" runat="server" Text="test" OnClick="lbRefreshChannelTable_Click" CssClass="lbRefreshChannelTable"></asp:LinkButton>
                                </ContentTemplate>
                            </asp:UpdatePanel>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <hr />
    </div>
    <div class="modal">
        <!-- Place at bottom of page -->
    </div>
    <script type="text/javascript">
        var NewProductDetails = getParameterByName('NewProductDetails');

        $(document).ready(function () {
            TableInitialize();
        });

        $(function () {
            $('#dob').editable({
                format: 'YYYY-MM-DD',
                viewformat: '.MM.YYYY',
                template: 'MM / YYYY',
                
                //combodate: {
                //    minYear: 2000,
                //    maxYear: 2015,
                //    minuteStep: 1
                //}
            });
        });
        $('#save-btn').click(function () {
            alert();
        });

        $body = $("body");
        $(document).on({
            ajaxStart: function () { $body.addClass("loading"); },
            ajaxStop: function () { $body.removeClass("loading"); }
        });

        $("tbody").on("change", ".toggleswitchChannel", function () {
            var channelid = $(this).closest('tr').find('td:first').text();
            var statustxt = $(this).closest('tr').find('td:eq(2)').text();
            UpdateChannelStatus(channelid, statustxt);
        });


        function UpdateChannelStatus(channelid, statustxt) {

            $.ajax({
                type: "POST",
                url: "newproduct_view.aspx/UpdateChannelStatus",
                data: "{ ChannelId: '" + channelid + "',Status: '" + statustxt + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    TableInitialize();
                },
                failure: function (response) {
                    alert('failed');
                }
            });

            location.reload();
            //$('#myModal').modal('toggle');
        };
        function TableInitialize() {
            $.ajax({
                type: "POST",
                url: "newproduct_view.aspx/lbRefreshChannelTable_Click",
                data: "{ NewProdDetailId: '" + NewProductDetails + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var result = JSON.parse(data.d);
                    var i = 1;
                    var tableSwitch = "<input type='checkbox' class='toggleswitchChannel' data-toggle='toggle' data-size='mini' data-on='Active' data-off='Disable' data-onstyle='info' data-offstyle='danger' data-style='android'";
                    $.each(result.newProdChannelStatus, function (key, value) {
                        var status_result = (value.status == 'Active') ? 'checked' : '';
                        $('#addr' + i).html("<td class='hidden'> " + value.id + " </td><td class='text-left'>" + value.channel + "</td><td class='hidden'>" + value.status + "</td><td class='text-center'>" + tableSwitch + "" + status_result + "></td><td></td>");
                        i++;
                    });
                    $(function () {
                        $('.toggleswitchChannel').bootstrapToggle();
                    })
                    i = 1;
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
    </script>
    <%-- <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet" />
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>--%>
</asp:Content>

