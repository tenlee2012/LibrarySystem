<%@ Page Title="" Language="C#" MasterPageFile="~/base1.Master" AutoEventWireup="true" CodeBehind="bookmanage.aspx.cs" Inherits="WebApplication4.admin.bookmanger" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>图书管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	<div class="pages">
		<div class="container">
    <form id="form1" runat="server">
        <div>
            <div class="col-xs-3 col-sm-2 sidebar-offcanvas" id="sidebar">
                <a href="default.aspx" class="list-group-item">个人信息</a>
                <a href="usermanage.aspx" class="list-group-item">用户管理</a>
                <a href="bookmanage.aspx" class="list-group-item myactive">图书管理</a>
                <a href="bormanage.aspx" class="list-group-item">借阅管理</a>
            </div><!--/.sidebar-offcanvas-->

            <div class="col-xs-10 col-sm-10">
                <h4>按图书id搜索:<asp:TextBox ID="search" runat="server" ForeColor="#003300"></asp:TextBox>&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" CssClass="btn btn-default" Text="搜索" OnClick="Button1_Click" />
                    &nbsp;&nbsp;&nbsp;<asp:Button ID="addbook_button" runat="server" CssClass="btn btn-info" Text="添加图书" OnClick="addbook_button_Click"/>
                </h4>
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" DataKeyNames="bookid" DataSourceID="SqlDataSource1"
                    AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="bookid" HeaderText="图书id" SortExpression="bookid">
                            <HeaderStyle CssClass="hidden"></HeaderStyle>
                            <ItemStyle CssClass="hidden"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
                        <asp:BoundField DataField="bookname" HeaderText="书名" SortExpression="bookname" />
                        <asp:BoundField DataField="bookauthor" HeaderText="作者" SortExpression="bookauthor" />
                        <asp:BoundField DataField="booktotal" HeaderText="总数" SortExpression="booktotal" />
                        <asp:BoundField DataField="bookres" HeaderText="目前剩余" SortExpression="bookres" />
                        <asp:CommandField ShowSelectButton="True"/>
                    </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [lib_book] WHERE [bookid] = @original_bookid AND [ISBN] = @original_ISBN AND [bookname] = @original_bookname AND [bookauthor] = @original_bookauthor AND [bookpub] = @original_bookpub AND [bookpubdate] = @original_bookpubdate AND [bookprice] = @original_bookprice AND [bookdes] = @original_bookdes AND [booktotal] = @original_booktotal AND [bookres] = @original_bookres AND [typeid] = @original_typeid AND [bookindate] = @original_bookindate" InsertCommand="INSERT INTO [lib_book] ([bookid], [ISBN], [bookname], [bookauthor], [bookpub], [bookpubdate], [bookprice], [bookdes], [booktotal], [bookres], [typeid], [bookindate]) VALUES (@bookid, @ISBN, @bookname, @bookauthor, @bookpub, @bookpubdate, @bookprice, @bookdes, @booktotal, @bookres, @typeid, @bookindate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [lib_book]" UpdateCommand="UPDATE [lib_book] SET [ISBN] = @ISBN, [bookname] = @bookname, [bookauthor] = @bookauthor, [bookpub] = @bookpub, [bookpubdate] = @bookpubdate, [bookprice] = @bookprice, [bookdes] = @bookdes, [booktotal] = @booktotal, [bookres] = @bookres, [typeid] = @typeid, [bookindate] = @bookindate WHERE [bookid] = @original_bookid AND [ISBN] = @original_ISBN AND [bookname] = @original_bookname AND [bookauthor] = @original_bookauthor AND [bookpub] = @original_bookpub AND [bookpubdate] = @original_bookpubdate AND [bookprice] = @original_bookprice AND [bookdes] = @original_bookdes AND [booktotal] = @original_booktotal AND [bookres] = @original_bookres AND [typeid] = @original_typeid AND [bookindate] = @original_bookindate">
                    </asp:SqlDataSource>
                </div><!--/.col-xs-12.col-sm-9-->
        </div>
    </form>
            </div>
            </div>
</asp:Content>
