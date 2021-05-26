<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="Reading_Along.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header_Footer_Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header_Footer_Body" runat="server">
    <div id="tg-wrapper" class="tg-wrapper tg-haslayout">
		<!--************************************
				Inner Banner Start
		*************************************-->
		<div class="tg-innerbanner tg-haslayout tg-parallax tg-bginnerbanner" data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll" data-image-src="images/parallax/bgparallax-07.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="tg-innerbannercontent">
							<h1>About Us</h1>
							<ol class="tg-breadcrumb">
								<li><a href="javascript:void(0);">home</a></li>
								<li class="tg-active">About Us</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--************************************
				Inner Banner End
		*************************************-->
		<!--************************************
				Main Start
		*************************************-->
		<main id="tg-main" class="tg-main tg-haslayout">
			<!--************************************
					About Us Start
			*************************************-->
			<section class="tg-sectionspace tg-haslayout">
				<div class="container">
					<div class="row">
						<div class="tg-aboutus">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<div class="tg-aboutusshortcode">
									<div class="tg-sectionhead">
										<h2><span>Greetings &amp; Welcome</span>Know More About Us</h2>
									</div>
									<div class="tg-description">
										<p>Welcome to Reading Along, your number one source for all things books. We're dedicated to providing you 
											the very best of our books, with an emphasis on store categories. Founded in 2021 by Rohit Sawant & Neda Khan, 
											Reading Along has come a long way from its beginnings, please don't hesitate to contact us.</p>
									</div>
									<div class="tg-btns">
										<a class="tg-btn tg-active" href="#our_team">Meet Our Team</a>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<figure style="height : 270px;">
									<img src="images/placeholder.jpg" alt="image description">
									<iframe src="https://www.youtube.com/embed/acwr_Islo9A?rel=0&amp;controls=0&amp;showinfo=0"></iframe>
								</figure>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--************************************
					About Us End
			*************************************-->
			<!--************************************
					Call to Action Start
			*************************************-->
			<section class="tg-parallax tg-bgcalltoaction tg-haslayout" data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll" data-image-src="images/parallax/bgparallax-06.jpg">
				<div class="tg-sectionspace tg-haslayout">
					<div class="container">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<div class="tg-calltoaction">
									<h2>Fully Loaded Library</h2>
									<h3>Get all what you want to read at Reading Along.</h3>
									<a class="tg-btn tg-active" href="AllBooks.aspx">Buy Now</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--************************************
					Call to Action End
			*************************************-->
			<!--************************************
					Success Start
			*************************************-->
			<section class="tg-sectionspace tg-haslayout">
				<div class="container">
					<div class="row">
						<div class="tg-successstory">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<div class="tg-sectionhead">
									<h2><span>Our Pride Moments</span>Journey of Success</h2>
								</div>
								<div id="tg-successslider" class="tg-successslider tg-success owl-carousel">
									<div class="item">
										<figure>
											<img src="images/img-01.jpg" alt="image description">
										</figure>
										<div class="tg-successcontent">
											<div class="tg-sectionhead">
												<h2><span>November 21, 2020</span>First Step Toward Project</h2>
											</div>
											<div class="tg-description">
												<p>We have decided to make an cloud base library project in year 2020 planned a proposal for the same. 
													we planning to do this project in group with 2 members Rohit Sawant & Neda khan. Planning is the process of thinking about the activities required to achieve a desired goal.
													so we started to plan proposed tasks & goals of the project. At the end of the semester we documented the complete pre-documentation of the project.
												</p>
											</div>
										</div>
									</div>
									<div class="item">
										<figure>
											<img src="images/img-01.jpg" alt="image description">
										</figure>
										<div class="tg-successcontent">
											<div class="tg-sectionhead">
												<h2><span>Feb 17, 2021</span>Secound Step Toward Project</h2>
											</div>
											<div class="tg-description">
												<p>After Sem-3 we took steps towards project implementation. We got through various project designs, online bootstraps, modules. 
													The main challenge of the project was azure cloud implementation we took an online Azure web application development course. 
													We togetherly completed the course and divided our work load. Then we started our project in Visual Studio with the 1st page as Index.aspx</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--************************************
					Success End
			*************************************-->
			<!--************************************
					Testimonials Start
			*************************************-->
			<section class="tg-parallax tg-bgtestimonials tg-haslayout" data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll" data-image-src="images/parallax/bgparallax-05.jpg">
				<div class="tg-sectionspace tg-haslayout">
					<div class="container">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 col-lg-push-2">
								<div id="tg-testimonialsslider" class="tg-testimonialsslider tg-testimonials owl-carousel">
									<div class="item tg-testimonial">
										<figure><img src="images/author/imag-02.jpg" alt="image description"></figure>
										<blockquote><q>The best book collection we have offered you. Our contain management team has work alot to bring the best for our readers</q></blockquote>
										<div class="tg-testimonialauthor">
											<h3>Mrunal Gaikwad</h3>
											<span>Content-Manager @ Reading Along</span>
										</div>
									</div>
									<div class="item tg-testimonial">
										<figure><img src="images/author/imag-03.jpg" alt="image description"></figure>
										<blockquote><q>Our marketing team are reaching out to you through all the posssible mediums. we are also coming up with the best possible deals and subscription plans.</q></blockquote>
										<div class="tg-testimonialauthor">
											<h3>Pawan Rana</h3>
											<span>Marketing-Manager @ Reading Along</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--************************************
					Testimonials End
			*************************************-->
			<!--************************************
					Authors Start
			*************************************-->
			<section id="our_team" class="tg-sectionspace tg-haslayout">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class="tg-sectionhead">
								<h2><span>Team Behind Book Library</span>Meet Our Professionals</h2>
							</div>
						</div>
						<div id="tg-teamsslider" class="tg-authors tg-teamsmember owl-carousel">
							<div class="item tg-author tg-member">
								<figure><a href="javascript:void(0);"><img src="images/Owner/MrRohit.jpg" alt="image description"></a></figure>
								<div class="tg-authorcontent">
									<h2><a href="javascript:void(0);">Rohit Sawant</a></h2>
									<span>Owner & Project Developer</span>
									<ul class="tg-socialicons">
										<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
										<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
										<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="item tg-author tg-member">
								<figure><a href="javascript:void(0);"><img src="images/Owner/missnedakhan.jpg" alt="image description"></a></figure>
								<div class="tg-authorcontent">
									<h2><a href="javascript:void(0);">Neda Khan</a></h2>
									<span>Owner & Project Developer</span>
									<ul class="tg-socialicons">
										<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
										<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
										<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--************************************
					Authors End
			*************************************-->
		</main>
		<!--************************************
				Main End
		*************************************-->
		</div>
</asp:Content>

