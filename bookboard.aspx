<%@ Page Title="" Language="C#" MasterPageFile="~/base1.Master" AutoEventWireup="true" CodeBehind="bookboard.aspx.cs" Inherits="WebApplication4.bookboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>图书借阅排行榜</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="pages">
		<div class="container">
            
            <div class="row row-offcanvas row-offcanvas-right">
                <div class="col-xs-12 col-sm-9">
                    <form id="Form1" method="post" runat="server">
                        <div>
                            <%
                                if (this.GridView1.Rows.Count == 0)
                                {
                                    Response.Write("<h4><span>查询记录为空</span></h4>"); 
                                }
                            %>
                            <asp:Label ID="addinfo" runat="server" ForeColor="Red" />
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="False" 
                            AllowPaging="True" PageSize="10" OnPageIndexChanging="GridView1_PageIndexChanging"
                            OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                                OnRowDeleting="GridView1_RowDeleting" >
                            <Columns>
                                <asp:BoundField DataField="bookid" HeaderText="图书编号">
                                    <HeaderStyle CssClass="hidden"></HeaderStyle>
                                    <ItemStyle CssClass="hidden"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="序号">
                                    <ItemTemplate>
                                    <asp:Literal ID="Literal1" runat="server"   Text='<%# (Container.DataItemIndex+1) %>'></asp:Literal>
                                    </ItemTemplate> 
                                </asp:TemplateField>
                                <asp:BoundField DataField="bookname" HeaderText="书名" ReadOnly="True" />
                                <asp:BoundField DataField="bor_sum" HeaderText="借阅总数" ReadOnly="True" />
                                <asp:CommandField ShowSelectButton="true" SelectText="放到书包"/>
                                <asp:CommandField ShowDeleteButton="True" DeleteText="查看详情" />
                            </Columns>
                            </asp:GridView>
                        </div>
                    </form>
                </div>
                <div class="col-xs-2 col-sm-2 sidebar-offcanvas" id="sidebar">
                <div class="list-group">
                    <a href="search.aspx" class="list-group-item">检索</a>
                    <a href="bookboard.aspx" class="list-group-item  myactive">图书借阅排行榜</a>
                    <a href="userboard.aspx" class="list-group-item">用户借阅排行榜</a>
                </div>
                </div><!--/.sidebar-offcanvas-->
            </div>
        </div>
    </div>    
</asp:Content>
