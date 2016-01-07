<%@ Page Title="" Language="C#" MasterPageFile="~/base2.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication4.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <title>帝国大学图书馆欢迎你</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
        <h1 class="text-center"><p style="color: white;">账号登录</p></h1><br />
        <form id="Form1" class="center-block" action="#" method="post" runat="server"  style="max-width:400px">
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon" ><span class="glyphicon glyphicon-user"></span></span>
                    <asp:TextBox ID="username" runat="server" CssClass="form-control" style="height: 48px;"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="CheckUserNameNull" runat="server" ErrorMessage="用户名不能为空" ControlToValidate="username" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password" style="height: 48px;"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="CheckPassNull" runat="server" ErrorMessage="密码不能为空" ControlToValidate="password" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <asp:Label ID="info" runat="server" Text=""></asp:Label>
            <asp:Button ID="login_submit" runat="server" Text="登录" CssClass="btn btn-lg btn-primary btn-block" OnClick="login_submit_Click"/>
            <br />
        </form>
    </div>
</asp:Content>
