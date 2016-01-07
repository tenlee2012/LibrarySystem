<%@ Page Title="" Language="C#" MasterPageFile="~/base1.Master" AutoEventWireup="true" CodeBehind="bormanage.aspx.cs" Inherits="WebApplication4.admin.bormanage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>借阅管理</title>
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
                <a href="bookmanage.aspx" class="list-group-item">图书管理</a>
                <a href="bormanage.aspx" class="list-group-item  myactive">借阅管理</a>
            </div><!--/.sidebar-offcanvas-->
            <div class="col-xs-10 col-sm-10">
                <form id="Form1" runat="server">
                    <div>
                        <div class="col-xs-2 col-md-2">
                        <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                            <asp:ListItem>已还书</asp:ListItem>
                            <asp:ListItem Selected="True">未还书</asp:ListItem>
                        </asp:DropDownList></div>
                        <div class="col-xs-3 col-md-3">
                            <asp:Button ID="Button1" runat="server" Text="筛选" CssClass="btn btn-info" OnClick="Button1_Click"/>
                        </div>
                    </div> <br /><br />
                    <div>
                        <% if(this.DropDownList1.SelectedValue=="未还书") {%>
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" 
                         AllowPaging="True" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging"
                        OnRowCommand="GridView1_RowCommand">
                        <Columns>
                        <asp:BoundField DataField="borid" HeaderText="借阅编号" />
                        <asp:BoundField DataField="userid" HeaderText="学号" />
                        <asp:BoundField DataField="bookid" HeaderText="图书编号" />
                        <asp:BoundField DataField="bookname" HeaderText="书名" />
                        <asp:BoundField DataField="bordate" HeaderText="借阅日期" />
                        <asp:BoundField DataField="shouldreturndate" HeaderText="应还日期" />
                        <asp:TemplateField>
                            <ItemTemplate>
                            <asp:Button ID="returnbook" runat="server" CommandName="returnbook" 
                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                            Text="还书" CssClass="btn btn-success" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                            <asp:Button ID="renewButton" runat="server" CommandName="renew" 
                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                            Text="续借" CssClass="btn btn-warning"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        </Columns>
                        </asp:GridView>
                        <%} else {%>
                        <asp:GridView ID="GridView2" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" 
                         AllowPaging="True" PageSize="10" OnPageIndexChanging="GridView1_PageIndexChanging"
                        OnRowCommand="GridView1_RowCommand">
                        <Columns>
                        <asp:BoundField DataField="borid" HeaderText="借阅编号" />
                        <asp:BoundField DataField="userid" HeaderText="学号" />
                        <asp:BoundField DataField="bookid" HeaderText="图书编号" />
                        <asp:BoundField DataField="bookname" HeaderText="书名" />
                        <asp:BoundField DataField="bordate" HeaderText="借阅日期" />
                        <asp:BoundField DataField="retdate" HeaderText="还书日期" />
                        </Columns>
                        </asp:GridView>
                        <%} %>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
