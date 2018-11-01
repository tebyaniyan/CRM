<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="CRM.Admin.Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphAdmin" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">مدیریت مشتریان</h1>
            <div class="pull-left">
                <asp:Button runat="server" ID="btnShowaddView" CssClass="btn btn-primary" Text="مشتری جدید" OnClick="btnShowaddView_OnClick" />
            </div>
               <div class="clearfix"></div>
            <br/>
         
        </div>
    </div>


        <!-- /.portlet-header -->
        <asp:LinqDataSource runat="server" ID="dsShowUser" OnSelecting="dsShowUser_OnSelecting"></asp:LinqDataSource>
        <asp:MultiView runat="server" ID="mvListUser" ActiveViewIndex="0">
            <asp:View runat="server" ID="vwListUser">
                <asp:GridView runat="server" CssClass="table table-bordered table-hover" Width="100%" ID="gvListUer" OnRowCommand="gvListUer_OnRowCommand" AllowPaging="True" PageSize="10" DataSourceID="dsShowUser" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="نام"></asp:BoundField>
                        <asp:BoundField DataField="Family" HeaderText="  نام خانوادگی"></asp:BoundField>
                        <asp:BoundField DataField="Roletitle" HeaderText="سطح دسترسی"></asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="ایمیل"></asp:BoundField>
                        <asp:BoundField DataField="Password" HeaderText="کلمه عبور"></asp:BoundField>
                     <asp:TemplateField HeaderText="دستورات">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="edit" CommandArgument='<%#Eval("UserID")%>' CommandName="DoEdit"><i class="btn btn-success glyphicon glyphicon-edit"></i></asp:LinkButton>
                                <asp:LinkButton runat="server" ID="btnDelete" CommandArgument='<%#Eval("UserID")%>' CommandName="DoDelete"><i class="btn btn-danger glyphicon glyphicon-trash"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:View>
            <asp:View runat="server" ID="vweditUser">
                <div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label runat="server" ID="lblrole" Text="سطح دسترسی:"></asp:Label>
                            <asp:EntityDataSource runat="server" ID="enrole" ConnectionString="name=ManegmentProductCRMEntities" DefaultContainerName="ManegmentProductCRMEntities" EnableFlattening="False" EntitySetName="Tbl_Role"></asp:EntityDataSource>
                            <asp:DropDownList runat="server" ID="ddlRole" CssClass="form-control" DataSourceID="enrole" DataTextField="RoleTitle" DataValueField="RoleId" />
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label runat="server" ID="lblName" Text="نام :"></asp:Label>
                            <asp:TextBox runat="server" ID="txtname" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label runat="server" ID="lblFamily" Text="نام خانوادگی:"></asp:Label>
                            <asp:TextBox runat="server" ID="txtFamily" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label runat="server" ID="lblemail" Text="ایمیل:"></asp:Label>
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label runat="server" ID="Label1" Text="نام کاربری::"></asp:Label>
                            <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:Label runat="server" ID="lblPassword" Text="کلمه عبور:"></asp:Label>
                            <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="clearfix"></div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <button type="button" class="btn btn-danger" runat="server" id="btnCancell" onserverclick="btnCancell_OnServerClick">انصراف</button>
                            <button type="button" runat="server" id="btnAdd" onserverclick="btnAdd_OnServerClick" class="btn btn-success">ثبت کاربر</button>
                        </div>
                    </div>
                </div>

            </asp:View>
        </asp:MultiView>
 

</asp:Content>
