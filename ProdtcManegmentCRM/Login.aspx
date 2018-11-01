<%@ Page Title="" Language="C#" MasterPageFile="~/User/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CRM.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CphAdmin" runat="server">
   <asp:ScriptManager runat="server" ID="ScripManeger"></asp:ScriptManager>
     <asp:UpdatePanel runat="server" ID="uplanelLogin">
                <ContentTemplate>
                    <div class="well">
                        <div class="form-group has-feedback">
                            <asp:Label runat="server" ID="lblUsername" Text="نام کاربری:"></asp:Label>
                            <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control" TextMode="Email" placeholder="نام کاربری"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtUsername" ForeColor="red" runat="server" ErrorMessage="نام کاربری را وارد کنید"></asp:RequiredFieldValidator>
                            <i class="icon-users form-control-feedback"></i>
                        </div>

                        <div class="form-group has-feedback">
                            <asp:Label runat="server" ID="lblPassword" Text="کلمه عبور:"></asp:Label>
                            <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" TextMode="Password" placeholder="کلمه عبور"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword" ForeColor="red" runat="server" ErrorMessage="کلمه عبور را وارد کنید"></asp:RequiredFieldValidator>
                            
                            <i class="icon-lock form-control-feedback"></i>
                        </div>

                        <div class="row form-actions">
                            <div class="col-xs-6">
                                <div class="checkbox checkbox-success">
                                    <asp:CheckBox runat="server" ID="ckSaveUser" Text="مرا به خاطر بسپار" />
                                </div>
                            </div>

                            <div class="col-xs-6">
                                <asp:Button runat="server" ID="btnLogin" CssClass="btn btn-success pull-right" OnClick="btnLogin_OnClick" Text="ورود به سایت" />
                            </div>
                        </div>
                        <asp:CustomValidator ID="ckuserValid" CssClass="alert alert-danger btn-block" runat="server" ErrorMessage="کاربری با اطلاعات فوق یافت نشد" OnServerValidate="ckuserValid_OnServerValidate"></asp:CustomValidator>
                        <asp:UpdateProgress runat="server" ID="upprogressLogin" AssociatedUpdatePanelID="uplanelLogin">
                            <ProgressTemplate>
                                <img src="../Image/294.GIF" alt="ProgressUpdate" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>

                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
</asp:Content>
