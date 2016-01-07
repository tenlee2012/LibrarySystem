<%@ Page Title="" Language="C#" MasterPageFile="~/base1.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="WebApplication4.search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>图书搜索</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pages">
		<div class="container">
            
            <div class="row row-offcanvas row-offcanvas-right">
                <div class="col-xs-12 col-sm-9">
                    <form id="Form1" method="post" runat="server">
                        <div class="col-md-3" aria-autocomplete="none">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="lead form-control" AutoPostBack="False">
                            <asp:ListItem>书名</asp:ListItem>
                            <asp:ListItem>作者</asp:ListItem>
                            <asp:ListItem>ISBN号</asp:ListItem>
                            <asp:ListItem>出版社</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-5">    
                            <asp:TextBox ID="SearchInput" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <asp:Button ID="Search" runat="server" Text="搜索" CssClass="btn btn-default btn-block" OnClick="Search_Click" />
                        </div>
                        <br /><br /><br />
                        <div>
                            <%
                                if (this.GridView1.Rows.Count == 0)
                                {
                                    Response.Write("<h4><span>查询记录为空</span></h4>"); 
                                }
                            %>
                            <asp:Label ID="addinfo" runat="server" ForeColor="Red" />
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" 
                            AllowPaging="True" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging"
                            OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting" 
                                 OnRowCommand="GridView1_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="bookid" HeaderText="图书编号">
                                    <HeaderStyle CssClass="hidden"></HeaderStyle><ItemStyle CssClass="hidden"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="序号">
                                    <ItemTemplate>
                                    <asp:Literal ID="Literal1" runat="server"   Text='<%# (Container.DataItemIndex+1) %>'></asp:Literal>
                                    </ItemTemplate> 
                                </asp:TemplateField>
                                <asp:BoundField DataField="bookname" HeaderText="书名" ReadOnly="True" />
                                <asp:CommandField ShowSelectButton="true" SelectText="放到书包"/>
                                <asp:CommandField ShowDeleteButton="True" DeleteText="查看详情" />
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
                        </div>
                    </form>
                </div>
                <div class="col-xs-2 col-sm-2 sidebar-offcanvas" id="sidebar">
                <div class="list-group">
                    <a href="search.aspx" class="list-group-item myactive">检索</a>
                    <a href="bookboard.aspx" class="list-group-item">图书借阅排行榜</a>
                    <a href="userboard.aspx" class="list-group-item">用户借阅排行榜</a>
                </div>
                </div><!--/.sidebar-offcanvas-->
            </div>
        </div>
    </div>     
</asp:Content>
