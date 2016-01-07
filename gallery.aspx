<%@ Page Title="" Language="C#" MasterPageFile="~/base1.Master" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="WebApplication4.gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>图书馆精彩图集</title>
 <script type="text/javascript" src="js/jquery.fancybox.js"></script>
	   <script type="text/javascript">
	       $(document).ready(function () {
	           /*
                *  Simple image gallery. Uses default settings
                */

	           $('.fancybox').fancybox();

	       });
		</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="gallery">
	 <div class="container">
		 <h2>Gallery</h2>
		 <div class="event-pics">
				<a class="fancybox" href="images/1.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><img src="images/1.jpg" class="img-style row6" alt=""><span> </span></a>
				<a class="fancybox" href="images/2.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><img src="images/2.jpg" class="img-style row6" alt=""><span> </span></a>
				<a class="fancybox" href="images/3.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><img src="images/3.jpg" class="img-style row6" alt=""><span> </span></a>
				<a class="fancybox" href="images/4.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><img src="images/4.jpg" class="img-style row6" alt=""><span> </span></a>
				<div class="clearfix"></div>
				<a class="fancybox" href="images/5.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><img src="images/5.jpg" class="img-style row6" alt=""><span> </span></a>
				<a class="fancybox" href="images/6.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><img src="images/6.jpg" class="img-style row6" alt=""><span> </span></a>
				<a class="fancybox" href="images/7.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><img src="images/7.jpg" class="img-style row6" alt=""><span> </span></a>
				<a class="fancybox" href="images/8.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><img src="images/8.jpg" class="img-style row6" alt=""><span> </span></a>
				<div class="clearfix"></div>
				<a class="fancybox" href="images/9.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><img src="images/9.jpg" class="img-style row6" alt=""><span> </span></a>
				<a class="fancybox" href="images/10.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><img src="images/10.jpg" class="img-style row6" alt=""><span> </span></a>
				<a class="fancybox" href="images/11.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><img src="images/11.jpg" class="img-style row6" alt=""><span> </span></a>
				<a class="fancybox" href="images/1.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><img src="images/1.jpg" class="img-style row6" alt=""><span> </span></a>
				<div class="clearfix"></div>
		 </div>
	 </div>
</div>
</asp:Content>
