<%@ Page Title="" Language="C#" MasterPageFile="~/base1.Master" AutoEventWireup="true" CodeBehind="addbook.aspx.cs" Inherits="WebApplication4.admin.addbook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>添加图书</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pages">
	    <div class="container">
            <%
                if (this.flag != 0)
                {%>
                <div class="alert alert-success" role="alert">
                    <asp:Label ID="addinfo" runat="server" Text=""></asp:Label>
			   </div>
                <%
                }
            %>
            <div class="col-xs-3 col-sm-2 sidebar-offcanvas" id="sidebar">
                <a href="default.aspx" class="list-group-item">个人信息</a>
                <a href="usermanage.aspx" class="list-group-item">用户管理</a>
                <a href="bookmanage.aspx" class="list-group-item myactive">图书管理</a>
                <a href="bormanage.aspx" class="list-group-item">借阅管理</a>
            </div><!--/.sidebar-offcanvas-->
            <div class="col-xs-5 col-sm-5">
                <form id="Form1" runat="server">
                    书名*：<asp:TextBox ID="bookname" runat="server">&nbsp;&nbsp;</asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空" ControlToValidate="bookname" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />
                    ISBN*：<asp:TextBox ID="ISBN" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="ISBN" ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能为空" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />
                    作者*：<asp:TextBox ID="bookauthor" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="bookauthor" ID="RequiredFieldValidator3" runat="server" ErrorMessage="不能为空" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />
                    出版社*：<asp:TextBox ID="bookpub" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="bookpub" ID="RequiredFieldValidator4" runat="server" ErrorMessage="不能为空" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />
                    出版日期*：<asp:TextBox ID="bookpubdate" runat="server" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="bookpubdate" ID="RequiredFieldValidator5" runat="server" ErrorMessage="不能为空" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />
                    价格*：<asp:TextBox ID="bookprice" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="bookprice" ID="RequiredFieldValidator8" runat="server" ErrorMessage="不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="必须为数字" ControlToValidate="bookprice" ValidationExpression="^[0-9]+(.[0-9]{2})?$"></asp:RegularExpressionValidator><br /><br />
                    总数*：<asp:TextBox ID="booktotal" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="booktotal" ID="RequiredFieldValidator9" runat="server" ErrorMessage="不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="必须为两位小数数字" ControlToValidate="booktotal" ValidationExpression="(\d+)"></asp:RegularExpressionValidator><br /><br />
                    入库日期*：<asp:TextBox ID="bookindate" runat="server" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="bookindate" ID="RequiredFieldValidator6" runat="server" ErrorMessage="不能为空" ForeColor="Red"></asp:RequiredFieldValidator><br /><br />
                    照片： <asp:FileUpload ID="FileUpload1" runat="server" Wrap="False" />
                    图书介绍*：<br /><asp:TextBox ID="bookdes" runat="server" TextMode="MultiLine" Rows="10" EnableViewState="True" MaxLength="20" ReadOnly="False" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="bookdes" ID="RequiredFieldValidator7" runat="server" ErrorMessage="不能为空" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:Button ID="Button1" runat="server" Text="确定" CssClass="btn btn-primary" OnClick="Button1_Click"/>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
