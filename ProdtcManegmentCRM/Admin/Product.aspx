<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="CRM.Admin.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphAdmin" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">محصولات</h1>

        </div>
    </div>
    <br />
    <asp:Button runat="server" ID="btnAddProduct" CssClass="btn btn-primary" Text="کالا جدید" OnClick="btnAddProduct_OnClick" />
    <br />
    <asp:MultiView runat="server" ID="mvShowListProduct" ActiveViewIndex="0">
        <asp:View runat="server" ID="vwListProduct">
            <asp:LinqDataSource runat="server" ID="dsListProduct" OnSelecting="dsListProduct_OnSelecting"></asp:LinqDataSource>
            <asp:GridView runat="server" ID="gvListProduct" OnRowCommand="gvListProduct_OnRowCommand" DataSourceID="dsListProduct" AllowPaging="True" CssClass="table table-bordered table-hover table-responsive" Width="100%" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField HeaderText="نام محصول" DataField="ProductName"></asp:BoundField>
                    <asp:BoundField HeaderText="تاریخ ثبت" DataField="Date"></asp:BoundField>
                    <asp:BoundField HeaderText="تولید کننده" DataField="Company"></asp:BoundField>
                    <asp:BoundField HeaderText="توضیحات" DataField="Note"></asp:BoundField>
                    <asp:TemplateField HeaderText="دستورات">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnEdit" CssClass="btn btn-success" CommandArgument='<%#Eval("ProductID")%>' CommandName="DoEdit" Text="ویرایش"></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lbtnDelete" CssClass="btn btn-danger" CommandArgument='<%#Eval("ProductID")%>' CommandName="DoDelete" Text="حذف"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:View>
        <asp:View runat="server" ID="vwAddProduct">
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label runat="server" ID="lblName" Text="نام محصول" />
                    <asp:TextBox runat="server" ID="txtName" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label runat="server" ID="Label1" Text="شرکت تولید کننده" />
                    <asp:TextBox runat="server" ID="txtCompany" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12">
                <div class="form-group">
                    <asp:Label runat="server" ID="Label2" Text="توضیحات محصول" />
                    <asp:TextBox runat="server" ID="txtNote" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            
            
                 <div class="col-md-6">
                <div class="form-group">
                    <asp:Button runat="server" ID="btnAdd" CssClass="btn btn-success" Text="ثبت محصول" OnClick="btnAdd_OnClick"/>
                    <asp:Button runat="server" ID="btnCancell" CssClass="btn btn-danger" Text="انصراف"/>
                </div>
            </div>
        </asp:View>

    </asp:MultiView>
</asp:Content>
