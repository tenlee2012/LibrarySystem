<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SQLTest.aspx.cs" Inherits="WebApplication4.SQLTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="http://res.layui.com/css/xu.css" type="text/css" rel="stylesheet" />
    <script src="http://res.layui.com/lay/lib/laydate/laydate.js"></script>

    <title>测试页面</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        Lable1:
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <br />
     
         <div class="skidown">
            <input class="laydate-icon-molv skindemo" skin="molv" placeholder="演示" value="演示" onclick="laydate({ istime: true, format: 'YYYY-MM-DD hh:mm:ss' })">
             <br />
             <asp:TextBox ID="TextBox2" runat="server" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"></asp:TextBox>
             <br />
             <br />
            <br />
             <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
             <br />
             <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
             <br />
            <asp:Button ID="Button2" runat="server" Text="Button" />

         </div>

    </div>


    </form>

</body>
</html>
