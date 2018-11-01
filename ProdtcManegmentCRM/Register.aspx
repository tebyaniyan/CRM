<%@ Page Title="" Language="C#" MasterPageFile="~/User/Master.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CRM.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphAdmin" runat="server">

    <div class="panel panel-primary" style="margin-top: 35%">
        <div class="panel-heading">
            <h3 class="panel-title">لینک های سریع </h3>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <asp:Label runat="server" ID="lblName" Text="نام "></asp:Label>
                <asp:TextBox runat="server" ID="txtFullName" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" ID="Label1" Text="نام خانوادگی"></asp:Label>
                <asp:TextBox runat="server" ID="txtfamily" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" ID="Label2" Text="نام کاربری"></asp:Label>
                <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="نام کاربری را وارد کنید" ForeColor="red" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label runat="server" ID="Label3" Text="کلمه عبور"></asp:Label>
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="نام کاربری را وارد کنید" ForeColor="red" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            </div>
               <div class="form-group">
                <asp:Label runat="server" ID="Label4" Text="ایمیل"></asp:Label>
                <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control"></asp:TextBox>
            </div>
                <div class="form-group">
                    <asp:Button runat="server" ID="btnRegister" CssClass="btn btn-success" OnClick="btnRegister_OnClick" Text="عضویت"/>
                    <asp:Button runat="server" ID="btnCancell" CssClass="btn btn-danger" Text="انصراف"/>
            </div>
        </div>
    </div>







</asp:Content>
