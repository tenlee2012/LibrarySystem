<%@ Page Title="" Language="C#" MasterPageFile="~/base1.Master" AutoEventWireup="true" CodeBehind="userinfo.aspx.cs" Inherits="WebApplication4.admin.userinfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>用户详细信息</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pages">
	<div class="container">
    <form runat="server">
        <%
            if (this.flag != 0)
            {%>
            <div class="alert alert-success" role="alert">
                <asp:Label ID="addinfo" runat="server" Text=""></asp:Label>
			</div>
            <%
            }
        %>
        <div>
            <div class="col-xs-3 col-sm-2 sidebar-offcanvas" id="sidebar">
                <a href="default.aspx" class="list-group-item">个人信息</a>
                <a href="usermanage.aspx" class="list-group-item myactive">用户管理</a>
                <a href="bookmanage.aspx" class="list-group-item">图书管理</a>
                <a href="bormanage.aspx" class="list-group-item">借阅管理</a>
            </div><!--/.sidebar-offcanvas-->

            <div class="col-xs-5 col-sm-5">
                学号：<asp:TextBox ID="userid" runat="server" ReadOnly="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="必填" ControlToValidate="userid" ForeColor="red"></asp:RequiredFieldValidator><br /><br />
                姓名：<asp:TextBox ID="username" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="必填" ControlToValidate="username" ForeColor="red"></asp:RequiredFieldValidator><br /><br />
                密码重置：<asp:CheckBox ID="CheckBox1" runat="server" /><br /><br />
                性别：<asp:DropDownList ID="usersex" runat="server">
                    <asp:ListItem>男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                </asp:DropDownList><br /><br />
                学院：<asp:DropDownList ID="userredp" runat="server">
                    <asp:ListItem>信息学院</asp:ListItem>
                    <asp:ListItem>外国语学院</asp:ListItem>
                    <asp:ListItem>法学院</asp:ListItem>
                    <asp:ListItem>建筑学院</asp:ListItem>
                    <asp:ListItem>工商管理学院</asp:ListItem>
                </asp:DropDownList><br /><br />
                类型：<asp:DropDownList ID="usertype" runat="server">
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                </asp:DropDownList>
                <br /><br />
                <asp:Button ID="Button1" runat="server" Text="确定" CssClass="btn btn-info" OnClick="Button1_Click"/>
                <asp:Button ID="Button2" runat="server" Text="删除" CssClass="btn btn-danger" OnClick="Button2_Click"/>
            </div>
        </div>
    </form>
    </div>
    </div>
</asp:Content>
