<%@ Page Title="" Language="C#" MasterPageFile="~/User/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRM.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphAdmin" runat="server">
    <div class="panel panel-primary" style="margin-top: 35%">
        <div class="panel-heading">
            <h3 class="panel-title">لینک های سریع </h3>
        </div>
        <div class="panel-body">
            <div class="col-md-4">
                <a href="/Login.aspx">
                    <img src="/Image/Login-Manager.png" alt="ورود به سیستم" /></a>
            </div>
            <div class="col-md-4">
                <a href="/Register.aspx">
                    <img src="/Image/1450703801_Add-Male-User.png" alt="عضویت" /></a>
            </div>
            <div class="col-md-4">
                <a href="/Faq.aspx">
                    <img src="/Image/1450703836_13.png" alt="سوالات متداول" /></a>
            </div>
        </div>
    </div>
</asp:Content>
