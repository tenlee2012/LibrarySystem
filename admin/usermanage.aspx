<%@ Page Title="" Language="C#" MasterPageFile="~/base1.Master" AutoEventWireup="true" CodeBehind="usermanage.aspx.cs" Inherits="WebApplication4.admin.usermanage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>用户管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="pages">
		<div class="container">
       <form id="form1" runat="server">
                <div>
                <div class="col-xs-3 col-sm-2 sidebar-offcanvas" id="sidebar">
                <a href="default.aspx" class="list-group-item">个人信息</a>
                <a href="usermanage.aspx" class="list-group-item myactive">用户管理</a>
                <a href="bookmanage.aspx" class="list-group-item">图书管理</a>
                <a href="bormanage.aspx" class="list-group-item">借阅管理</a>
            </div><!--/.sidebar-offcanvas-->

                    <div class="col-xs-9 col-sm-9">
                        <h4>按学号搜索:<asp:TextBox ID="search" runat="server" ForeColor="#003300"></asp:TextBox>&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" CssClass="btn btn-default" Text="搜索" OnClick="Button1_Click" />
                        &nbsp;&nbsp;&nbsp;<asp:Button ID="adduser_button" runat="server" CssClass="btn btn-info" Text="添加用户" OnClick="adduser_button_Click"/><br />
                        </h4>
                            
                         <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="userid" 
                             DataSourceID="SqlDataSource1" PageSize="5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="userid" HeaderText="学号" ReadOnly="True" SortExpression="userid">
                                </asp:BoundField>
                                <asp:BoundField DataField="username" HeaderText="姓名" SortExpression="username" />
                                <asp:BoundField DataField="usersex" HeaderText="性别" SortExpression="usersex" />
                                <asp:BoundField DataField="userredp" HeaderText="学院" SortExpression="userredp" />
                                <asp:BoundField DataField="userstate" HeaderText="状态" SortExpression="userstate" />
                                <asp:BoundField DataField="usertype" HeaderText="用户类型" SortExpression="usertype" />
                                <asp:CommandField ShowSelectButton="True">
                                <ControlStyle ForeColor="Red" />
                                </asp:CommandField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [lib_user] WHERE [userid] = @original_userid AND [username] = @original_username AND [usersex] = @original_usersex AND [userredp] = @original_userredp AND [userstate] = @original_userstate AND [usertype] = @original_usertype" InsertCommand="INSERT INTO [lib_user] ([userid], [username], [usersex], [userredp], [userstate], [usertype]) VALUES (@userid, @username, @usersex, @userredp, @userstate, @usertype)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [userid], [username], [usersex], [userredp], [userstate], [usertype] FROM [lib_user]" UpdateCommand="UPDATE [lib_user] SET [username] = @username, [usersex] = @usersex, [userredp] = @userredp, [userstate] = @userstate, [usertype] = @usertype WHERE [userid] = @original_userid AND [username] = @original_username AND [usersex] = @original_usersex AND [userredp] = @original_userredp AND [userstate] = @original_userstate AND [usertype] = @original_usertype">
                        </asp:SqlDataSource>
                    </div><!--/.col-xs-12.col-sm-9-->
            </div>
 </form>
        </div>
            </div>
            
</asp:Content>
