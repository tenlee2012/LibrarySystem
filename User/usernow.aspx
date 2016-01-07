<%@ Page Title="" Language="C#" MasterPageFile="~/base1.Master" AutoEventWireup="true" CodeBehind="usernow.aspx.cs" Inherits="WebApplication4.nowbook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="pages">
		<div class="container">
            <%
                if (this.flag != 0)
                {%>
                <div class="alert alert-success" role="alert">
                    <asp:Label ID="renewinfo" runat="server" Text=""></asp:Label>
			   </div>
                <%
                }
            %>

    <div class="col-xs-3 col-sm-2 sidebar-offcanvas" id="sidebar">
        <table>
            <tr><td></td></tr>
            <tr><td></td></tr>
        </table>
        <a href="default.aspx" class="list-group-item">个人信息</a>
        <a href="userbag.aspx" class="list-group-item">我的书包</a>
        <a href="usernow.aspx" class="list-group-item myactive">当前借阅</a>
        <a href="userhistory.aspx" class="list-group-item">借阅历史</a>
    </div>
    <div class="col-xs-9 col-sm-9">
    
        <form id="Form1" runat="server">
            <asp:Label ID="retinfo" runat="server" ForeColor="Red" />
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" 
                 AllowPaging="True" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging"
                 OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
              
                <Columns>
                    <asp:BoundField DataField="borid" HeaderText="借阅编号">
                        <HeaderStyle CssClass="hidden"></HeaderStyle><ItemStyle CssClass="hidden"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="序号">
                        <ItemTemplate>
                            <asp:Literal ID="Literal1" runat="server"   Text='<%# (Container.DataItemIndex+1) %>'></asp:Literal>
                        </ItemTemplate> 
                    </asp:TemplateField>
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
                <PagerTemplate>
                    <asp:Label ID="lblPage" runat="server" Text='<%# "第" + (((GridView)Container.NamingContainer).PageIndex + 1)  + "页/共" + (((GridView)Container.NamingContainer).PageCount) + "页" %> '></asp:Label>
                    <asp:LinkButton ID="lbnFirst" runat="Server" Text="首页"  Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>' CommandName="Page" CommandArgument="First" ></asp:LinkButton>
                    <asp:LinkButton ID="lbnPrev" runat="server" Text="上一页" Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>' CommandName="Page" CommandArgument="Prev"  ></asp:LinkButton>
                    <asp:LinkButton ID="lbnNext" runat="Server" Text="下一页" Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != (((GridView)Container.NamingContainer).PageCount - 1) %>' CommandName="Page" CommandArgument="Next" ></asp:LinkButton>
                    <asp:LinkButton ID="lbnLast" runat="Server" Text="尾页"   Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != (((GridView)Container.NamingContainer).PageCount - 1) %>' CommandName="Page" CommandArgument="Last" ></asp:LinkButton>
                    到第<asp:TextBox runat="server" ID="inPageNum"></asp:TextBox>页 <asp:Button ID="Button1" CommandName="go" runat="server" Text="go"/>
                </PagerTemplate>
            </asp:GridView>
       </form>
    </div>
</div>
        </div>
</asp:Content>
