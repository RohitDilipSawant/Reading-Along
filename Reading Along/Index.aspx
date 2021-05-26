<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Reading_Along.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header_Footer_Head" runat="server">
	<style>
	 @media (min-width : 1200px){
		 .slider_font_color{
			 color : #000;
		 }
	 }
	 @media (max-width : 1024px){
		 .slider_font_color{
			 color : #000;
		 }
	 }
	 @media (max-width : 992px){
		 .slider_font_color{
			 color : #000;
		 }
	 }
	 @media (max-width : 768px){
		 .slider_font_color{
			 color : #000;
		 }
	 }
	 @media (max-width : 568px){
		 .slider_font_color{
			 color : #fff;
		 }
	 }
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header_Footer_Body" runat="server">
    		<!--************************************
				Home Slider Start
		*************************************-->
		<div id="tg-homeslider" class="tg-homeslider tg-haslayout owl-carousel" style="color: #77b748;">
			<div class="item" data-vide-bg="poster: images/slider/img-01.jpg" data-vide-options="position: 0% 50%">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-10 col-md-push-1 col-lg-8 col-lg-push-2">
							<div class="tg-slidercontent">
								<figure class="tg-authorimg"><a href="javascript:void(0);"><img src="images/Owner/MrRohit.jpg" style="margin-bottom : -6%;" alt="image description"></a></figure>
								<h1 class="slider_font_color">Rohit Sawant</h1>
								<h2 class="slider_font_color">Latest 2021 Release</h2>
								<div class="tg-description">
									<p>Educational materials available from Primary to Postgraduate levels</p>
								</div>
								<%--<div class="tg-btns">
									<a class="tg-btn" href="javascript:void(0);">buy now</a>
									<a class="tg-btn" href="javascript:void(0);">read more</a>
								</div>--%>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="item" data-vide-bg="poster: images/slider/img-01.jpg" data-vide-options="position: 0% 50%">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-10 col-md-push-1 col-lg-8 col-lg-push-2">
							<div class="tg-slidercontent">
								<figure class="tg-authorimg"><a href="javascript:void(0);"><img src="images/Owner/missnedakhan.jpg" style="margin-bottom : -6%;" alt="image description"></a></figure>
								<h1 class="slider_font_color">Neda Khan</h1>
								<h2 class="slider_font_color">Latest 2021 Release</h2>
								<div class="tg-description">
									<p>Educational materials available from Primary to Postgraduate levels</p>
								</div>
								<%--<div class="tg-btns">
									<a class="tg-btn" href="javascript:void(0);">buy now</a>
									<a class="tg-btn" href="javascript:void(0);">read more</a>
								</div>--%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--************************************
				Home Slider End
		*************************************-->
		<!--************************************
				Main Start
		*************************************-->
		<main id="tg-main" class="tg-main tg-haslayout">
			<!--************************************
					All Status Start
			*************************************-->
			<section class="tg-haslayout">
				<div class="container">
					<div class="row">
						<div class="tg-allstatus">
							<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
								<div class="tg-parallax tg-bgbookwehave" data-z-index="2" data-appear-top-offset="600" data-parallax="scroll" data-image-src="images/parallax/bgparallax-01.jpg">
									<div class="tg-status">
										<div class="tg-statuscontent">
											<span class="tg-statusicon"><i class="icon-book"></i></span>
											<h2>Books we have<span id="no_of_book_have" runat="server">24,179,213</span></h2>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
								<div class="tg-parallax tg-bgtotalmembers" data-z-index="2" data-appear-bottom-offset="600" data-parallax="scroll" data-image-src="images/parallax/bgparallax-02.jpg">
									<div class="tg-status">
										<div class="tg-statuscontent">
											<span class="tg-statusicon"><i class="icon-user"></i></span>
											<h2>Total members<span id="no_of_users" runat="server">15,179,213</span></h2>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
								<div class="tg-parallax tg-bghappyusers" data-z-index="2" data-appear-top-offset="600" data-parallax="scroll" data-image-src="images/parallax/bgparallax-03.jpg">
									<div class="tg-status">
										<div class="tg-statuscontent">
											<span class="tg-statusicon"><i class="icon-heart"></i></span>
											<h2>Happy users<span>1,267,539</span></h2>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--************************************
					All Status End
			*************************************-->
			<!--************************************
					Best Selling Start
			*************************************-->
			<section class="tg-sectionspace tg-haslayout">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class="tg-sectionhead">
								<h2><span>People’s Choice</span>Most Read Books</h2>
								<a class="tg-btn" href="AllBooks.aspx">View All</a>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div id="tg-bestsellingbooksslider" class="tg-bestsellingbooksslider tg-bestsellingbooks owl-carousel">
                                <asp:Repeater ID="rpr_Most_Read" runat="server">
									<ItemTemplate>
										<div class="item">
											<div class="tg-postbook">
												<figure class="tg-featureimg">
													<div class="tg-bookimg">
														<div class="tg-frontcover"><img src="../BooksStorage/BookCover/<%# Eval("Book_Cover_Page") %>" alt="image description"></div>
														<div class="tg-backcover"><img src="../BooksStorage/BookCover/<%# Eval("Book_Cover_Page") %>" alt="image description"></div>
													</div>
													<a class="tg-btnaddtowishlist" href="<%# Eval("ID", "AllBooks.aspx?addwishlist_ID={0}") %>">
														<i class="icon-heart"></i>
														<span>add to wishlist</span>
													</a>
												</figure>
												<div class="tg-postbookcontent">
													<ul class="tg-bookscategories">
														<li><a href="javascript:void(0);"><%# Eval("Book_Category") %></a></li>
														<li><a href="javascript:void(0);"><%# Eval("Book_Sub_Category") %></a></li>
													</ul>
													<div class="tg-themetagbox"><span class="tg-themetag"><%# Eval("Product_Listing") %></span></div>
													<div class="tg-booktitle">
														<h3><a href="<%# Eval("ID", "BooksDetails.aspx?Book_ID={0}") %>"><%# (Eval("Book_Name").ToString().Length > 20) ? (Eval("Book_Name").ToString().Substring(0, 20) + "...") : Eval("Book_Name")%>...</a></h3>
													</div>
													<span class="tg-bookwriter">By: <a href="javascript:void(0);"><a href="javascript:void(0);"><%# (Eval("Book_Author").ToString().Length > 20) ? (Eval("Book_Author").ToString().Substring(0, 20) + "...") : Eval("Book_Author")%></a></span>
													<a class="tg-btn tg-btnstyletwo" href="<%# Eval("ID", "BookRead.aspx?view_book_ID={0}") %>">
														<i class="fa fa-book"></i>
														<em>Read</em>
													</a>
												</div>
											</div>
										</div>
									</ItemTemplate>
                                </asp:Repeater>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--************************************
					Best Selling End
			*************************************-->
			<!--************************************
					Featured Item Start
			*************************************-->
			<section class="tg-bglight tg-haslayout">
				<div class="container" style="width : 95%;">
					<div class="row">
						<div class="tg-featureditm">
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 hidden-sm hidden-xs">
								<figure style="margin-left:30%;"><img src="images/img-02.png" alt="image description"></figure>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-7 col-lg-7">
								<div class="tg-featureditmcontent" style="padding-right: 10%;">
									<div class="tg-themetagbox"><span class="tg-themetag">Benefits</span></div>
									<div class="tg-booktitle">
										<h3><a href="javascript:void(0);">Things To Know About Go Green</a></h3>
									</div>
									<span class="tg-bookwriter" style="text-align: justify; text-justify: inter-word;"><a href="#">Reading E-Books will result to LESS TREE CUTTING. Every eBook takes the place of 22.5 physical books as far as purchasing, according to a report by the Cleantech Group of San Francisco. The green researcher found that in 2008 the production of books and newspapers required 125 million trees to be harvested and cut down. But the number of trees needed to be destroyed for an eBook of any circulation is zero. Chances are our culture will never be completely paperless, but moving toward eBooks and eTextbooks certainly helps protect trees, which keep humans alive.</a></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--************************************
					Featured Item End
			*************************************-->
			<!--************************************
					New Release Start
			*************************************-->
			<section class="tg-sectionspace tg-haslayout">
				<div class="container">
					<div class="row">
						<div class="tg-newrelease">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<div class="tg-sectionhead">
									<h2><span>Taste The New Knowledge</span>New Release Books</h2>
								</div>
								<div class="tg-description">
									<p>This page is updated daily with the newest and upcoming book releases! Each month, I’ll move books over to the 2020 Book Releases page so that the newest releases stay at the top of this page. Pre-orders are not charged until the book releases. This list is compiled by me personally. Feel free to reach out if I’m missing anything.</p>
								</div>
								<div class="tg-btns">
									<a class="tg-btn tg-active" href="javascript:void(0);">View All</a>
								</div>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<div class="row">
									<div class="tg-newreleasebooks">
                                        <asp:Repeater ID="rpr_new_release" runat="server">
											<ItemTemplate>
												<div class="col-xs-4 col-sm-4 col-md-6 col-lg-4">
													<div class="tg-postbook">
														<figure class="tg-featureimg">
															<div class="tg-bookimg">
																<div class="tg-frontcover"><img src="../BooksStorage/BookCover/<%# Eval("Book_Cover_Page") %>" alt="image description"></div>
																<div class="tg-backcover"><img src="../BooksStorage/BookCover/<%# Eval("Book_Cover_Page") %>" alt="image description"></div>
															</div>
															<a class="tg-btnaddtowishlist" href="<%# Eval("ID", "books.aspx?addwishlist_ID={0}") %>">
																<i class="icon-heart"></i>
																<span>add to wishlist</span>
															</a>
														</figure>
														<div class="tg-postbookcontent">
															<ul class="tg-bookscategories">
																<li><a href="javascript:void(0);"><%# Eval("Book_Category") %></a></li>
																<li><a href="javascript:void(0);"><%# Eval("Book_Sub_Category") %></a></li>
															</ul>
															<div class="tg-booktitle">
																<h3><a href="<%# Eval("ID", "BooksDetails.aspx?Book_ID={0}") %>"><%# (Eval("Book_Name").ToString().Length > 20) ? (Eval("Book_Name").ToString().Substring(0, 20) + "...") : Eval("Book_Name")%>...</a></h3>
															</div>
															<span class="tg-bookwriter">By: <a href="javascript:void(0);"><%# Eval("Book_Author") %></a></span>
														</div>
													</div>
												</div>
											</ItemTemplate>
                                        </asp:Repeater>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--************************************
					New Release End
			*************************************-->
			<!--************************************
					Collection Count Start
			*************************************-->
			<section class="tg-parallax tg-bgcollectioncount tg-haslayout" data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll" data-image-src="images/parallax/bgparallax-04.jpg">
				<div class="tg-sectionspace tg-collectioncount tg-haslayout">
					<div class="container">
						<div class="row">
							<div id="tg-collectioncounters" class="tg-collectioncounters">
								<div class="tg-collectioncounter tg-drama">
									<div class="tg-collectioncountericon">
										<i class="icon-bubble"></i>
									</div>
									<div class="tg-titlepluscounter">
										<h2>Drama</h2>
										<h3 data-from="0" data-to="6179213" data-speed="8000" data-refresh-interval="50">6,179,213</h3>
									</div>
								</div>
								<div class="tg-collectioncounter tg-horror">
									<div class="tg-collectioncountericon">
										<i class="icon-heart-pulse"></i>
									</div>
									<div class="tg-titlepluscounter">
										<h2>Horror</h2>
										<h3 data-from="0" data-to="3121242" data-speed="8000" data-refresh-interval="50">3,121,242</h3>
									</div>
								</div>
								<div class="tg-collectioncounter tg-romance">
									<div class="tg-collectioncountericon">
										<i class="icon-heart"></i>
									</div>
									<div class="tg-titlepluscounter">
										<h2>Romance</h2>
										<h3 data-from="0" data-to="2101012" data-speed="8000" data-refresh-interval="50">2,101,012</h3>
									</div>
								</div>
								<div class="tg-collectioncounter tg-fashion">
									<div class="tg-collectioncountericon">
										<i class="icon-star"></i>
									</div>
									<div class="tg-titlepluscounter">
										<h2>Fashion</h2>
										<h3 data-from="0" data-to="1158245" data-speed="8000" data-refresh-interval="50">1,158,245</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--************************************
					Collection Count End
			*************************************-->
			<!--************************************
					Picked By Author Start
			*************************************-->
			<section class="tg-sectionspace tg-haslayout">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class="tg-sectionhead">
								<h2><span>Some Great Books</span>Picked By Authors</h2>
								<a class="tg-btn" href="javascript:void(0);">View All</a>
							</div>
						</div>
						<div id="tg-pickedbyauthorslider" class="tg-pickedbyauthor tg-pickedbyauthorslider owl-carousel">
                            <asp:Repeater ID="rpr_author_choice_book" runat="server">
								<ItemTemplate>
									<div class="item">
										<div class="tg-postbook">
											<figure class="tg-featureimg">
												<div class="tg-bookimg">
													<div class="tg-frontcover"><img src="../BooksStorage/BookCover/<%# Eval("Book_Cover_Page") %>" alt="image description"></div>
												</div>
												<div class="tg-hovercontent">
													<div class="tg-description">
														<p><%# (Eval("Book_Description").ToString().Length > 40) ? (Eval("Book_Description").ToString().Substring(0, 40) + "...") : Eval("Book_Description")%>...</p>
													</div>
													<strong class="tg-bookpage">Book Pages: <%# Eval("Book_Pages") %></strong>
													<strong class="tg-bookcategory">Category: <%# Eval("Book_Category") %>, <%# Eval("Book_Sub_Category") %></strong>
												</div>
											</figure>
											<div class="tg-postbookcontent">
												<div class="tg-booktitle">
													<h3><a href="javascript:void(0);"><%# Eval("Book_Name") %></a></h3>
												</div>
												<span class="tg-bookwriter">By: <a href="javascript:void(0);"><%# Eval("Book_Author") %></a></span>
												<a class="tg-btn tg-btnstyletwo" href="<%# Eval("ID", "BookRead.aspx?view_book_ID={0}") %>">
													<i class="fa fa-book"></i>
													<em>Read</em>
												</a>
											</div>
										</div>
									</div>
								</ItemTemplate>
                            </asp:Repeater>
						</div>
					</div>
				</div>
			</section>
			<!--************************************
					Picked By Author End
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
			<section class="tg-sectionspace tg-haslayout">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class="tg-sectionhead">
								<h2><span>Strong Minds Behind Us</span>Most Popular Authors</h2>
								<a class="tg-btn" href="authors.aspx">View All</a>
							</div>
						</div>
						<div id="tg-authorsslider" class="tg-authors tg-authorsslider owl-carousel">
                            <asp:Repeater ID="rpr_authors" runat="server">
								<ItemTemplate>
									<div class="item tg-author">
										<figure><a href="javascript:void(0);"><img src="../BooksStorage/AuthorStorage/AuthorProfilePicture/<%# Eval("Author_Picture") %>" alt="image description"></a></figure>
										<div class="tg-authorcontent">
											<h2><a href="javascript:void(0);"><%# Eval("Author_Name") %></a></h2>
											<span>Since : <%# Eval("Author_Since") %></span>
										</div>
									</div>
								</ItemTemplate>
                            </asp:Repeater>
						</div>
					</div>
				</div>
			</section>
			<!--************************************
					Authors End
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
									<h2>Open Discount For All</h2>
									<h3>Find the best pricing and subscribe now.</h3>
									<a class="tg-btn tg-active" href="pricing.aspx">Subscribe Now</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--************************************
					Call to Action End
			*************************************-->
		</main>
		<!--************************************
				Main End
		*************************************-->
</asp:Content>
