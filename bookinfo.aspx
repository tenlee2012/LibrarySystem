<%@ Page Title="" Language="C#" MasterPageFile="~/base1.Master" AutoEventWireup="true" CodeBehind="bookinfo.aspx.cs" Inherits="WebApplication4.bookinfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>图书详情</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
    <div class="single contact">
        <div class="container">
            <div class="single-main">
                <div class="col-md-12 single-main-left">
                    <div class="col-md-5">  
                        <div class="flexslider">
                            <asp:Image ID="Image1" runat="server" />
                        </div>
                    </div>  
                <div class="col-md-7 single-top-right">
                    <div class="details-left-info simpleCart_shelfItem">
                        <h2><asp:Label ID="bookname" runat="server" Text="" Font-Bold="True"></asp:Label></h2><br />
                        <p class="availability"><span class="color">总数: <asp:Label ID="booktotal" runat="server" Text="Label"></asp:Label></span></p>
                        <p class="availability"><span class="color">可借数: <asp:Label ID="bookres" runat="server" Text="Label"></asp:Label></span></p>
                        <br />
                        <h3 class="quick">书籍简介：</h3>
                        <p class="quick_desc"> <asp:Label ID="bookdes" runat="server" Text="Label"></asp:Label>
                        </p><br />
                        <h3 class="quick">作者简介：</h3>
                        <p class="quick_desc"> <asp:Label ID="bookauthor" runat="server" Text="Label"></asp:Label>
                        </p><br />
                        <h3 class="quick">出版社：</h3>
                        <p class="quick_desc"> <asp:Label ID="bookpub" runat="server" Text="Label"></asp:Label>
                        </p><br />
                        <h3 class="quick">出版日期：</h3>
                            <p class="quick_desc"> <asp:Label ID="bookpubdate" runat="server" Text="Label"></asp:Label>
                        </p><br />
                <% if (this.bookname.Text != "") { %>
                <div class="single-but item_add" style="float:left; ">
                    <asp:Button ID="Button1" runat="server" Text="放到书包" CssClass="btn btn-success" OnClick="Button1_Click"/>
                </div>
                <div class="single-but item_add" style="float:left; padding-left: 15px; ">
                    <asp:Button ID="Button2" runat="server" Text="立马借阅" CssClass="btn btn-success" OnClick="Button2_Click"/>
                </div>
                <% }%>
                &nbsp;&nbsp;<asp:Label ID="addinfo" runat="server" ForeColor="Red" />
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
                </div>
            </div>
        </div>
        </form>
</asp:Content>
