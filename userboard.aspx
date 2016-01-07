<%@ Page Title="" Language="C#" MasterPageFile="~/base1.Master" AutoEventWireup="true" CodeBehind="userboard.aspx.cs" Inherits="WebApplication4.userboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>用户借阅排行榜</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pages">
		<div class="container">
            
            <div class="row row-offcanvas row-offcanvas-right">
                <div class="col-xs-12 col-sm-9">
                    <form id="Form1" method="post" runat="server">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" 
                            AllowPaging="True" PageSize="10">
                            <Columns>
                                <asp:TemplateField HeaderText="序号">
                                    <ItemTemplate>
                                    <asp:Literal ID="Literal1" runat="server"   Text='<%# (Container.DataItemIndex+1) %>'></asp:Literal>
                                    </ItemTemplate> 
                                </asp:TemplateField>
                                <asp:BoundField DataField="userid" HeaderText="学号" />
                                <asp:BoundField DataField="username" HeaderText="姓名" ReadOnly="True" />
                                <asp:BoundField DataField="usersex" HeaderText="性别" ReadOnly="True" />
                                <asp:BoundField DataField="userredp" HeaderText="学院" ReadOnly="True" />
                                <asp:BoundField DataField="user_sum" HeaderText="借阅总数" ReadOnly="True" />                              
                            </Columns>
                            </asp:GridView>
                    </form>
                </div>
                <div class="col-xs-2 col-sm-2 sidebar-offcanvas" id="sidebar">
                <div class="list-group">
                    <a href="search.aspx" class="list-group-item">检索</a>
                    <a href="bookboard.aspx" class="list-group-item">图书借阅排行榜</a>
                    <a href="userboard.aspx" class="list-group-item  myactive">用户借阅排行榜</a>
                </div>
                </div><!--/.sidebar-offcanvas-->
            </div>
        </div>
        </div>
</asp:Content>
