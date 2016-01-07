<%@ Page Title="" Language="C#" MasterPageFile="~/base1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication4.admin.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>管理界面</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="pages">
		<div class="container">
            <div class="col-xs-3 col-sm-2 sidebar-offcanvas" id="sidebar">
                <a href="default.aspx" class="list-group-item   myactive">个人信息</a>
                <a href="usermanage.aspx" class="list-group-item">用户管理</a>
                <a href="bookmanage.aspx" class="list-group-item">图书管理</a>
                <a href="bormanage.aspx" class="list-group-item">借阅管理</a>
            </div><!--/.sidebar-offcanvas-->

    <div class="col-xs-5 col-sm-5">
        
        <h4>姓名:&nbsp;&nbsp;<asp:Label ID="username" runat="server" Text=""></asp:Label></h4>
        <h4>学号:&nbsp;&nbsp;<asp:Label ID="userid" runat="server" Text=""></asp:Label></h4>
        <h4>性别:&nbsp;&nbsp;<asp:Label ID="usersex" runat="server" Text=""></asp:Label></h4>
        <h4>院系:&nbsp;&nbsp;<asp:Label ID="userredp" runat="server" Text="Label"></asp:Label></h4>
        <form id="Form2" class  ="form-horizontal" runat="server">
            <asp:Label runat="server" ID="info" Text="如果你要修改密码" ForeColor="Red" />
            <h4>原&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码：<asp:TextBox ID="oldpass" runat="server" TextMode="Password" ForeColor="#003300"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="原密码不能空" ControlToValidate="oldpass" ForeColor="#FF0066"></asp:RequiredFieldValidator>
            </h4>
            <h4>新&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码：<asp:TextBox ID="newpass" runat="server" TextMode="Password" ForeColor="Black"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="新密码不能空" ControlToValidate="newpass" ForeColor="#FF0066"></asp:RequiredFieldValidator></h4>
            <h4>重复新密码：<asp:TextBox ID="repass" runat="server" TextMode="Password" ForeColor="Black"></asp:TextBox><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次密码不同" ControlToCompare="newpass" ControlToValidate="repass" ForeColor="Red"></asp:CompareValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="repass" ErrorMessage=""></asp:RequiredFieldValidator></h4>
            <asp:Button ID="Button1" runat="server" Text="确定" CssClass="btn btn-warning" style="float:left" OnClick="Button1_Click"/>
        </form>
    </div>
</div>
       </div>
</asp:Content>
