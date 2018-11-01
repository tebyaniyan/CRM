<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendTicket.aspx.cs" Inherits="CRM.User.SendTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ارسال تیکت</title>
    <link href="/User/Content/css/bootstrap-rtl.css" rel="stylesheet" />
    <link href="/User/Content/css/justified-nav.css" rel="stylesheet" />
    <script src="/User/Content/Scripts/bootstrap-rtl.js"></script>
    <script src="/User/Content/Scripts/jquery-1.10.2.min.js"></script>
    <script src="/User/Content/Scripts/collapse.js"></script>
</head>
<body>
    <form id="form1" runat="server">


        <div class="container">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="/User/SendTicket.aspx">لیست تیکت ها <span class="sr-only">(current)</span></a></li>
                        
                        </ul>

                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container-fluid -->
            </nav>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">لیست تیکت ها</h3>
                </div>
                <div class="panel-body">
                    <asp:Button runat="server" ID="btnAddTicket" CssClass="btn btn-default" Text="ثبت درخواست" OnClick="btnAddTicket_OnClick" />
                    <hr />
                    <div class="clearfix"></div>
                    <div class="col-md-12">
                        <asp:MultiView runat="server" ID="mvListTicket" ActiveViewIndex="0">
                            <asp:View runat="server" ID="vwListTicket">
                                <asp:LinqDataSource runat="server" ID="dsShowListUser" OnSelecting="dsShowListUser_OnSelecting"></asp:LinqDataSource>
                                <asp:GridView runat="server" ID="dvListTicket" DataSourceID="dsShowListUser" CssClass="table table-bordered table-responsive" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="Family" HeaderText="درخواست کننده"></asp:BoundField>
                                        <asp:BoundField DataField="ProductName" HeaderText="نام کالا"></asp:BoundField>
                                        <asp:BoundField DataField="Date" DataFormatString="{0:yyyy/MM/dd}" HeaderText="نام کالا"></asp:BoundField>
                                        <asp:BoundField DataField="Messge" HeaderText="متن ارسالی"></asp:BoundField>
                                        <asp:BoundField DataField="ReplayMassge" HeaderText="پاسخ"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </asp:View>
                            <asp:View runat="server" ID="vwSendTicket">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="Label1" Text="نام کالا:"></asp:Label>
                                        <asp:EntityDataSource runat="server" ID="enListProduct" ConnectionString="name=ManegmentProductCRMEntities" DefaultContainerName="ManegmentProductCRMEntities" EnableFlattening="False" EntitySetName="Tbl_Product"></asp:EntityDataSource>
                                        <asp:DropDownList runat="server" ID="ddlProduct" CssClass="form-control" Height="40px" DataSourceID="enListProduct" DataTextField="ProductName" DataValueField="ProductID" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="Label3" Text="متن ارسالی:"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtMassge" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Button runat="server" ID="btnSendTiket" CssClass="btn btn-success" Text="ارسال درخواست" OnClick="btnSendTiket_OnClick" />
                                    </div>
                                </div>
                            </asp:View>
                            <asp:View runat="server" ID="vwPigiri">
                                
                                <asp:Label runat="server" ID="lblPigiri" CssClass="alert alert-success"></asp:Label>
                            </asp:View>
                        </asp:MultiView>
                    </div>
                </div>
            </div>
            <div class="footer">
                <p>
                    طراحی سسیتم مدیریت مشتریان ( کنترل دستگاه ها )

                </p>
            </div>
        </div>




    </form>
</body>
</html>
