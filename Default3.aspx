<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Default3.aspx.cs" Inherits="WebApplication4.Default" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>帝国大学图书馆</title>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- jQuery (necessary JavaScript plugins) -->
    <script src="js/bootstrap.js"></script>
    <!-- Custom Theme files -->
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="University Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
    Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>

</head>
<body>
<!-- banner -->
    <script src="js/responsiveslides.min.js"></script>
    <script>
    $(function () {
        $("#slider").responsiveSlides({
            auto: true,
            nav: true,
            speed: 500,
            namespace: "callbacks",
            pager: true,
        });
    });
    </script>  
    <div class="banner">	  
	    <div class="header">
		    <div class="logo">
			    <a href="index.html"><img src="images/logo.jpg" alt=""/></a>
			</div>
			<div class="top-menu">
				<span class="menu"></span>
				<ul class="navig">
				    <li class="active"><a href="/">首页</a></li>
				    <li><a href="/search.aspx">检索</a></li>
					<li><a href="gallery.aspx">图集</a></li>
					<li><a href="about.html">关于</a></li>
					<li><a href="contact.aspx">联系</a></li>
					<%
                        if (Session["userid"] == null)
                        {
                            Response.Write("<li><a href='/login.aspx'>登陆</a></li>");
                        }
                        else
                        {
                            string userid = Session["userid"].ToString();
                            string username = Session["username"].ToString();
                            if(Convert.ToInt32(Session["usertype"]) == 0)
                            {
                                Response.Write("<li><a href='/admin/'>欢迎," + username +"</a></li>");   
                            }
                            else
                            {
                                Response.Write("<li><a href='/user/'>欢迎," + username +"</a></li>");  
                            }
                            Response.Write("<li><a href='/logout.aspx'>退出</a></li>");
                        }
                    %>
				</ul>
			</div>
			<!-- script-for-menu -->
		    <script>
		     $("span.menu").click(function () {
		         $("ul.navig").slideToggle("slow", function () {
		         });
		     });
		    </script>
		    <!-- script-for-menu -->
            <div class="clearfix"></div>
	    </div>
	    <div class="slider">
		 <div class="caption">
			 <div class="container">
				  <div class="callbacks_container">
					  <ul class="rslides" id="slider">
						    <li><h3>帝国大学图书馆欢迎你</h3></li>
							<li><h3>书山有路，学海无涯</h3></li>	
							<li><h3>静以修身,学以养德</h3></li>	
					  </ul>	
						<div class="clearfix"></div>
				  </div>
			  </div>
		  </div>
	  </div>
	  <div class="banner-grids">
		  <div class="container">
			 <div class="col-md-4 banner-grid">
				 <h3>公告信息</h3>
				 <div class="banner-grid-sec">
					 <div class="news-grid">
						 <h4><a href="#">Vivamus tempus ligula</a></h4>
						 <p>Aliquam sem velit, rhoncus sed arcu eu viverra.</p>
					 </div>
					 <div class="news-grid">
						 <h4><a href="#">Vivamus tempus ligula</a></h4>
						 <p>Aliquam sem velit, rhoncus sed arcu eu viverra.</p>
					 </div>
					 <div class="news-grid">
						 <h4><a href="#">Vivamus tempus ligula</a></h4>
						 <p>Aliquam sem velit, rhoncus sed arcu eu viverra.</p>
					 </div>
					 <div class="news-grid">
						 <h4><a href="#">Vivamus tempus ligula</a></h4>
						 <p>Aliquam sem velit, rhoncus sed arcu eu viverra.</p>
					 </div>
				 </div>
			 </div>
			 <div class="col-md-4 banner-grid">
				 <h3>培训讲座</h3>
				 <div class="banner-grid-sec">
					 <div class="news-grid">
						 <h4><a href="#">系列讲座安排</a></h4>
						 <p>2015年图书馆秋冬学期系列讲座安排(12月)</p>
					 </div>
					 <div class="news-grid">
						 <h4><a href="#">论文写作与数字资源检索培训</a></h4>
						 <p>2015年11月3日论文写作与数字资源检索培训</p>
					 </div>
					 <div class="news-grid">
						 <h4><a href="#">图书馆志愿者培训</a></h4>
						 <p>2015年度图书馆志愿者培训（两场）</p>
					 </div>
					 <div class="news-grid">
						 <h4><a href="#">新生培训</a></h4>
						 <p>2015年10月13日新生培训</p>
					 </div>
				 </div>
			 </div>
			 <div class="col-md-4 banner-grid">
				 <h3>News Letter</h3>
				 <div class="banner-grid-sec news_sec">
					 <div class="news-ltr">
						 <h4><a href="#">Pellentesque sed arcu lacinia</a></h4>
						 <p>Aliquam sem velit, rhoncus sed arcu eu viverra. Suspendisse lacus posuere ultricies turpis.</p>
					 </div>
					 <form>
						 <input type="text" placeholder="Email Address*" required="">
						 <input type="submit" value="SEND">
					 </form>
				 </div>
			 </div>
			 <div class="clearfix"></div>
		  </div>
	  </div>
</div>
<!---->
<div class="welcome">
	 <div class="container">
		 <h2>Duis aliquet in ex nec elementum. In commodo molestie libero ornare elementum.</h2>
		 <div class="welcm_sec">
			 <div class="col-md-9 campus">
				 <div class="campus_head">
					 <h3>Welcome</h3>
					 <p>Nunc justo sapien, cursus at urna at, placerat porttitor tellus. Aliquam vehicula tellus nunc,
					 id pretium lacus placerat dignissim. Donec quis dui sed lacus vulputate scelerisque a sit amet neque.</p>
				 </div>
				 <div class="col-md-3 wel_grid">
					 <img src="images/w1.jpg" class="img-responsive" alt=""/>
					 <h5><a href="#">Aliquam sit amet</a></h5>
					 <p>Morbi molestie nec ante ultrices. Cum sociis natoque penatibus et magnis dis parturient</p>
				 </div>
				 <div class="col-md-3 wel_grid">
					 <img src="images/w3.jpg" class="img-responsive" alt=""/>
					 <h5><a href="#">Aliquam sit amet</a></h5>
					 <p>Morbi molestie nec ante ultrices. Cum sociis natoque penatibus et magnis dis parturient</p>
				 </div>
				 <div class="col-md-3 wel_grid">
					 <img src="images/w2.jpg" class="img-responsive" alt=""/>
					 <h5><a href="#">Aliquam sit amet</a></h5>
					 <p>Morbi molestie nec ante ultrices. Cum sociis natoque penatibus et magnis dis parturient</p>
				 </div>
				 <div class="col-md-3 wel_grid">
					 <img src="images/w4.jpg" class="img-responsive" alt=""/>
					 <h5><a href="#">Aliquam sit amet</a></h5>
					 <p>Morbi molestie nec ante ultrices. Cum sociis natoque penatibus et magnis dis parturient</p>
				 </div>
				 <div class="clearfix"></div>
				 <div class="more_info">
						 <a href="blog.html">More Info....</a>
				 </div>
			 </div>
			 <div class="col-md-3 testimonal">
					<h3>Testimonials</h3>
					<div class="testimnl-grid">
						 <a href="#"><p>Aenean ultrices commodo risus, id sollicitudin nunc commodo at. Sed sagittis, lacus id viverra eleifend, enim magna.</p></a>
						 <h5>John.Mr</h5>
					</div>
					<div class="testimnl-grid">
						 <a href="#"><p>Aenean ultrices commodo risus, id sollicitudin nunc commodo at. Sed sagittis, lacus id viverra eleifend, enim magna.</p></a>
						 <h5>John.Mr</h5>
					</div>
					<div class="testimnl-grid">
						 <a href="#"><p>Aenean ultrices commodo risus, id sollicitudin nunc commodo at. Sed sagittis, lacus id viverra eleifend, enim magna.</p></a>
						 <h5>John.Mr</h5>
					</div>
			 </div>
			 <div class="clearfix"></div>
		 </div>
	 </div>
</div>
<!---->
<div class="news">
	 <div class="container">
		 <h3>Top News</h3>
		  <div class="event-grids">			
		     <div class="col-md-4 event-grid">
				 <div class="date">
				     <h4>26</h4>
					 <span>08/2012</span>
				 </div>				 
			     <div class="event-info">
					  <h5><a href="#">Etiam malesuada feugiat rutrum purus quis vulputate.</a></h5>
						<p>Praesent sagittis in enim vel cursus. Aenean velit ante, maximus ac placerat at, 
						volutpat et orci. Aliquam eu tellus orci.</p>					
				 </div>
				 <div class="clearfix"></div>				 			 
			 </div>
			 <div class="col-md-4 event-grid">
				 <div class="date">
				     <h4>24</h4>
					 <span>06/2012</span>
				 </div>				 
			     <div class="event-info">
					  <h5><a href="#">Etiam malesuada feugiat rutrum purus quis vulputate.</a></h5>
						<p>Praesent sagittis in enim vel cursus. Aenean velit ante, maximus ac placerat at, 
						volutpat et orci. Aliquam eu tellus orci.</p>					
				 </div>
				 <div class="clearfix"></div>				 			 
			 </div>
			 <div class="col-md-4 event-grid">
				 <div class="date">
				     <h4>20</h4>
					 <span>04/2012</span>
				 </div>				 
			     <div class="event-info">
					  <h5><a href="#">Etiam malesuada feugiat rutrum purus quis vulputate.</a></h5>
						<p>Praesent sagittis in enim vel cursus. Aenean velit ante, maximus ac placerat at, 
						volutpat et orci. Aliquam eu tellus orci.</p>					
				 </div>
				 <div class="clearfix"></div>				 			 
			 </div>
			 <div class="clearfix"></div>	
		 </div>
	 </div>
</div>
<!---->
<div class="footer">
	 <div class="container">
		 <div class="ftr-sec">
			 <div class="col-md-4 ftr-grid">
				 <h3>Text Module</h3>
				 <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ut odio ut quam convallis ultricies. Morbi rutrum lectus tortor. Cras vitae semper mi, et feugiat dolor.</p>
				 <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ut odio ut quam convallis ultricies. Morbi rutrum lectus tortor. Cras vitae semper mi, et feugiat dolor.</p>
			 </div>
			 <div class="col-md-4 ftr-grid2">
				 <h3>Pages</h3>
				 <ul>
					 <li><a href="index.html"><span></span>Home</a></li>
					 <li><a href="about.html"><span></span>About</a></li>
					 <li><a href="program.html"><span></span>Programs</a></li>
					 <li><a href="blog.html"><span></span>Blog</a></li>	
					 <li><a href="gallery.html"><span></span>Gallery</a></li>
					 <li><a href="contact.html"><span></span>Contact</a></li>
				 </ul>
			 </div>
			 <div class="col-md-4 ftr-grid3">
				 <h3>Quick links</h3>
				 <ul>
					 <li><a href="about.html"><span></span>History</a></li>
					 <li><a href="about.html"><span></span>Departments</a></li>
					 <li><a href="gallery.html"><span></span>Services</a></li>
					 <li><a href="blog.html"><span></span>Guidancs</a></li>	
					 <li><a href="about.html"><span></span>Team</a></li>
					 <li><a href="contact.html"><span></span>Contact</a></li>
				 </ul>
			 </div>
			 <div class="clearfix"></div>
		 </div>
	 </div>
</div>
<!---->
<div class="copywrite">
	 <div class="container">
		 <p>Copyright ©软联.net小组. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
	 </div>
</div>
<!---->
</body>
</html>
