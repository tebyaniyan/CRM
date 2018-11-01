<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AccessLevel.aspx.cs" Inherits="CRM.Admin.AccessLevel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphAdmin" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">سطح دسترسی</h1>

        </div>
    </div>
    <asp:MultiView runat="server" ID="mvRole" ActiveViewIndex="0">
        <asp:View runat="server" ID="vwListRole">
            <asp:LinqDataSource runat="server" ID="dsShowRole" OnSelecting="dsShowRole_OnSelecting"></asp:LinqDataSource>
            <asp:GridView runat="server" CssClass="table table-bordered table-hover" Width="100%" ID="gvShowRole" DataSourceID="dsShowRole" AutoGenerateColumns="False" OnRowCommand="gvShowRole_RowCommand">
                <Columns>
                    <asp:BoundField DataField="RoleName" HeaderText="نوع دسترسی"></asp:BoundField>
                    <asp:BoundField DataField="RoleTitle" HeaderText="نام دسترسی"></asp:BoundField>
                    <asp:TemplateField HeaderText="دستورات">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="edit" CommandArgument='<%#Eval("RoleID")%>' CommandName="DoEdit"><i class="btn btn-success glyphicon glyphicon-edit"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:View>
        <asp:View runat="server" ID="vwAddRole">
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label runat="server" ID="lbltitleName" Text="نام دسترسی:"></asp:Label>
                    <asp:TextBox runat="server" ID="txtTitleName" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button runat="server" ID="btnAdd" CssClass="btn btn-success" Text="ویرایش" OnClick="btnAdd_OnClick" />
                    <asp:Button runat="server" ID="btnCancel" CssClass="btn btn-danger" Text="انصراف" OnClick="btnCancel_OnClick" />
                </div>
            </div>

        </asp:View>
    </asp:MultiView>
</asp:Content>
