<%@ Page Title="" Language="C#" MasterPageFile="~/User/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRM.User.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphAdmin" runat="server">
    <div class="col-md-12">
        <asp:Button runat="server" ID="btnAddTicket" CssClass="btn btn-default" Text="ثبت درخواست" OnClick="btnAddTicket_OnClick" />
        <asp:MultiView runat="server" ID="mvListTicket" ActiveViewIndex="0">
            <asp:View runat="server" ID="vwListTicket">
                <asp:LinqDataSource runat="server" ID="dsShowListUser" OnSelecting="dsShowListUser_OnSelecting"></asp:LinqDataSource>
                <asp:GridView runat="server" ID="dvListTicket" Width="100%" DataSourceID="dsShowListUser" CssClass="table table-bordered table-responsive" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Family" HeaderText="درخواست کننده"></asp:BoundField>
                        <asp:BoundField DataField="ProductName" HeaderText="نام کالا"></asp:BoundField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:yyyy/MM/dd}" HeaderText="نام کالا"></asp:BoundField>
                        <asp:BoundField DataField="Messge" HeaderText="متن ارسالی"></asp:BoundField>
                        <asp:TemplateField HeaderText="دستورات"></asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:View>
            <asp:View runat="server" ID="vwSendTicket">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label runat="server" ID="Label1" Text="نام کالا:"></asp:Label>
                            <asp:EntityDataSource runat="server" ID="enListProduct" ConnectionString="name=ManegmentProductCRMEntities" DefaultContainerName="ManegmentProductCRMEntities" EnableFlattening="False" EntitySetName="Tbl_Product"></asp:EntityDataSource>
                            <asp:DropDownList runat="server" ID="ddlProduct" CssClass="form-control" Height="40px" DataSourceID="enListProduct" DataTextField="ProductName" DataValueField="ProductID" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label runat="server" ID="Label3" Text="متن ارسالی:"></asp:Label>
                            <asp:TextBox runat="server" ID="txtMassge" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Button runat="server" ID="btnSendTiket" CssClass="btn btn-success" Text="ارسال درخواست" OnClick="btnSendTiket_OnClick" />
                        </div>
                    </div>
                    </div>
            </asp:View>
            <asp:View runat="server" ID="vwPigiri">
                <asp:Label runat="server" ID="lblPigiri" CssClass="alert alert-success"></asp:Label>
            </asp:View>
        </asp:MultiView>
    </div>
  

</asp:Content>
