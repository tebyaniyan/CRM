<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Ticket.aspx.cs" Inherits="CRM.Admin.Ticket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphAdmin" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">مدیریت درخواست های ارسالی</h1>

        </div>
    </div>
    <asp:MultiView runat="server" ID="mvListticket" ActiveViewIndex="0">
        <asp:View runat="server" ID="vwList">
            <asp:LinqDataSource runat="server" ID="dsListTicket" OnSelecting="dsListTicket_OnSelecting"></asp:LinqDataSource>
            <asp:GridView runat="server" ID="dvListTicket" DataSourceID="dsListTicket" OnRowCommand="dvListTicket_OnRowCommand" CssClass="table table-bordered table-responsive" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Family" HeaderText="درخواست کننده"></asp:BoundField>
                    <asp:BoundField DataField="ProductName" HeaderText="نام کالا"></asp:BoundField>
                    <asp:BoundField DataField="Date" DataFormatString="{0:yyyy/MM/dd}" HeaderText="نام کالا"></asp:BoundField>
                    <asp:BoundField DataField="Messge" HeaderText="متن ارسالی"></asp:BoundField>
                    <asp:TemplateField HeaderText="دستورات">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="btnReplay" CssClass="btn btn-success btn-sm" Text="پاسخ" CommandArgument='<%#Eval("TicketID") %>' CommandName="DoReplay"></asp:LinkButton>/
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:View>
        <asp:View runat="server" ID="vwReplay">
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label runat="server" ID="lblName" Text="نام:"></asp:Label>
                    <asp:TextBox runat="server" ID="txtName" Enabled="False" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label runat="server" ID="Label1" Text="نام کالا:"></asp:Label>
                    <asp:TextBox runat="server" ID="txtProductName" Enabled="False" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label runat="server" ID="Label2" Text="تاریخ درخواست:"></asp:Label>
                    <asp:TextBox runat="server" ID="txtDate" Enabled="False" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label runat="server" ID="Label3" Text="متن ارسالی:"></asp:Label>
                    <asp:TextBox runat="server" ID="txtMassge" Enabled="False" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <hr />
            <div class="clearfix"></div>
            <div class="col-md-12">
                <div class="form-group">
                    <asp:Label runat="server" ID="lblReplay" Text="متن پاسخ"></asp:Label>
                    <asp:TextBox runat="server" ID="txtReplay" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-6">
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Button runat="server" ID="btnSend" CssClass="btn btn-success" Text="ارسال پاسخ" OnClick="btnSend_OnClick" />
                    </div>
                </div>
            </div>

        </asp:View>
    </asp:MultiView>
</asp:Content>
