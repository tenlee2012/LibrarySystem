<%@ Page Title="" Language="C#" MasterPageFile="~/base1.Master" AutoEventWireup="true" CodeBehind="userbag.aspx.cs" Inherits="WebApplication4.userbag" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>我的书包</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pages">
	    <div class="container">
    <div>
    <div class="col-xs-3 col-sm-2 sidebar-offcanvas" id="sidebar">
        <table>
            <tr><td></td></tr>
            <tr><td></td></tr>
        </table>
        <a href="default.aspx" class="list-group-item">个人信息</a>
        <a href="userbag.aspx" class="list-group-item myactive">我的书包</a>
        <a href="usernow.aspx" class="list-group-item">当前借阅</a>
        <a href="userhistory.aspx" class="list-group-item">借阅历史</a>
    </div>
    <div class="col-xs-5 col-sm-5">
        <form runat="server">
            <asp:Label ID="borinfo" runat="server" ForeColor="Red" />
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" 
                 AllowPaging="True" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging"
                 OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                 OnRowDeleting="GridView1_RowDeleting" >
              
                <Columns>
                    <asp:BoundField DataField="bookid" HeaderText="图书编号">
                        <HeaderStyle CssClass="hidden"></HeaderStyle><ItemStyle CssClass="hidden"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="序号">
                        <ItemTemplate>
                        <asp:Literal ID="Literal1" runat="server"   Text='<%# (Container.DataItemIndex+1) %>'></asp:Literal>
                        </ItemTemplate> 
                    </asp:TemplateField>
                    <asp:BoundField DataField="bookname" HeaderText="书名" />
                    <asp:CommandField ShowSelectButton="true" SelectText="借阅" />
                    <asp:CommandField ShowDeleteButton="True" ShowHeader="True" HeaderText="删除"></asp:CommandField>
                </Columns>
            </asp:GridView>
        </form>
    </div>
</div>
            </div>
        </div>
</asp:Content>
