<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="BooksDetails.aspx.cs" Inherits="Reading_Along.BooksDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header_Footer_Head" runat="server">
	<style>
		 td{
			border: none!important;
		}
		 .container{
			 width: 75%;
		 }

	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header_Footer_Body" runat="server">
    <!--************************************
				Inner Banner Start
		*************************************-->
		<div class="tg-innerbanner tg-haslayout tg-parallax tg-bginnerbanner" data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll" data-image-src="images/parallax/bgparallax-07.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="tg-innerbannercontent">
							<h1>Books Details</h1>
							<ol class="tg-breadcrumb">
								<li><a href="javascript:void(0);">home</a></li>
								<li><a href="javascript:void(0);">Products</a></li>
								<li class="tg-active">Product Title Here</li>
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
					News Grid Start
			*************************************-->
			<div class="tg-sectionspace tg-haslayout">
				<div class="container">
					<div class="row">
						<div id="tg-twocolumns" class="tg-twocolumns">
							<div class="col-xs-12 col-sm-8 col-md-8 col-lg-9 pull-right">
								<div id="tg-content" class="tg-content">
									<div class="tg-productdetail" style="text-align: left;">
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="tg-postbook">
													<figure class="tg-featureimg">
                                                        <asp:Image ID="img_book_cover" runat="server" alt="image description" /></figure>
													<div class="tg-postbookcontent">
														<span class="tg-bookwriter">Available Digital Copy</span>
														<ul class="tg-delevrystock">
															<li><i class="icon-rocket"></i><span>Adds Free</span></li>
															<li><i class="icon-checkmark-circle"></i><span>Dispatch from the USA in 2 working days </span></li>
															<li><i class="icon-store"></i><span>Status: <em>In Stock</em></span></li>
														</ul>
														<a class="tg-btn tg-active tg-btn-lg" href="javascript:void(0);">Read Now</a>
														<a class="tg-btnaddtowishlist" href="javascript:void(0);">
															<span>add to wishlist</span>
														</a>
													</div>
												</div>
											</div>
											<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
												<asp:DataList ID="datalist_book_details" runat="server" RepeatDirection="Horizontal">
													<ItemTemplate>
														<div class="tg-productcontent" style="text-align: left;">
															<ul class="tg-bookscategories">
																<li><a href="javascript:void(0);">Art &amp; Photography</a></li>
															</ul>
															<div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
															<div class="tg-booktitle">
																<h3><%# Eval("Book_Name") %></h3>
															</div>
															<span class="tg-bookwriter">By: <a href="javascript:void(0);"><%# Eval("Book_Author") %></a></span>
															<span class="tg-stars"><span></span></span>
															<span class="tg-addreviews"><a href="javascript:void(0);">Add Your Review</a></span>
															<div class="tg-share">
																<span>Share:</span>
																<ul class="tg-socialicons">
																	<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
																	<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
																	<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
																	<li class="tg-googleplus"><a href="javascript:void(0);"><i class="fa fa-google-plus"></i></a></li>
																	<li class="tg-rss"><a href="javascript:void(0);"><i class="fa fa-rss"></i></a></li>
																</ul>
															</div>
															<div class="tg-description">
																<p><%# Eval("Book_Description") %>...<a href="#book_details">More</a></p>
															</div>
															<div class="tg-sectionhead">
																<h2>Product Details</h2>
															</div>
															<ul class="tg-productinfo">
																<li><span>Format:</span><span>Hardback</span></li>
																<li><span>Pages:</span><span>528 pages</span></li>
																<li><span>Dimensions:</span><span>153 x 234 x 43mm | 758g</span></li>
																<li><span>Publication Date:</span><span>June 27, 2017</span></li>
																<li><span>Publisher:</span><span>Sunshine Orlando</span></li>
																<li><span>Language:</span><span>English</span></li>
																<li><span>Illustrations note:</span><span>b&amp;w images thru-out; 1 x 16pp colour plates</span></li>
																<li><span>ISBN10:</span><span>1234567890</span></li>
																<li><span>ISBN13:</span><span>1234567890000</span></li>
																<li><span>Other Fomate:</span><span>CD-Audio, Paperback, E-Book</span></li>
															</ul>
															<div class="tg-alsoavailable">
																<figure>
																	<img src="images/users/img-02.jpg" alt="image description" />
																	<figcaption>
																		<h3>Also Available in:</h3>
																		<ul>
																			<li><span>CD-Audio $18.30</span></li>
																			<li><span>Paperback $20.10</span></li>
																			<li><span>E-Book $11.30</span></li>
																		</ul>
																	</figcaption>
																</figure>
															</div>
														</div>
													</ItemTemplate>
												</asp:DataList>
											</div>
											<div class="tg-productdescription" id="book_details">
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<div class="tg-sectionhead">
														<h2>Product Description</h2>
													</div>
													<ul class="tg-themetabs" role="tablist">
														<li role="presentation" class="active"><a href="#description" data-toggle="tab">Description</a></li>
													</ul>
													<div class="tg-tab-content tab-content">
														<div role="tabpanel" class="tg-tab-pane tab-pane active" id="description">
															<div class="tg-description">
																<p>Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veni quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenden
voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
																<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam remmata aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enimsam
voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos quistatoa.</p>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="tg-aboutauthor">
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<div class="tg-sectionhead">
														<h2>About Author</h2>
													</div>
													<div class="tg-authorbox">
														<figure class="tg-authorimg">
															<img src="images/author/imag-08.jpg" alt="image description">
														</figure>
														<div class="tg-authorinfo">
															<div class="tg-authorhead">
																<div class="tg-leftarea">
																	<div class="tg-authorname">
																		<h2>Kathrine Culbertson</h2>
																		<span>Author Since: June 27, 2017</span>
																	</div>
																</div>
																<div class="tg-rightarea">
																	<ul class="tg-socialicons">
																		<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
																		<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
																		<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
																		<li class="tg-googleplus"><a href="javascript:void(0);"><i class="fa fa-google-plus"></i></a></li>
																		<li class="tg-rss"><a href="javascript:void(0);"><i class="fa fa-rss"></i></a></li>
																	</ul>
																</div>
															</div>
															<div class="tg-description">
																<p>Laborum sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium totam rem aperiam eaque ipsa quae ab illo inventore veritatis etation.</p>
															</div>
															<a class="tg-btn tg-active" href="javascript:void(0);">View All Books</a>
														</div>
													</div>
												</div>
											</div>
											<div class="tg-relatedproducts">
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<div class="tg-sectionhead">
														<h2><span>Related Products</span>You May Also Like</h2>
														<a class="tg-btn" href="javascript:void(0);">View All</a>
													</div>
												</div>
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<div id="tg-relatedproductslider" class="tg-relatedproductslider tg-relatedbooks owl-carousel">
														<div class="item">
															<div class="tg-postbook">
																<figure class="tg-featureimg">
																	<div class="tg-bookimg">
																		<div class="tg-frontcover"><img src="images/books/img-01.jpg" alt="image description"></div>
																		<div class="tg-backcover"><img src="images/books/img-01.jpg" alt="image description"></div>
																	</div>
																	<a class="tg-btnaddtowishlist" href="javascript:void(0);">
																		<i class="icon-heart"></i>
																		<span>add to wishlist</span>
																	</a>
																</figure>
																<div class="tg-postbookcontent">
																	<ul class="tg-bookscategories">
																		<li><a href="javascript:void(0);">Adventure</a></li>
																		<li><a href="javascript:void(0);">Fun</a></li>
																	</ul>
																	<div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
																	<div class="tg-booktitle">
																		<h3><a href="javascript:void(0);">Help Me Find My Stomach</a></h3>
																	</div>
																	<span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>
																	<span class="tg-stars"><span></span></span>
																	<span class="tg-bookprice">
																		<ins>$25.18</ins>
																		<del>$27.20</del>
																	</span>
																	<a class="tg-btn tg-btnstyletwo" href="javascript:void(0);">
																		<i class="fa fa-shopping-basket"></i>
																		<em>Add To Basket</em>
																	</a>
																</div>
															</div>
														</div>
														<div class="item">
															<div class="tg-postbook">
																<figure class="tg-featureimg">
																	<div class="tg-bookimg">
																		<div class="tg-frontcover"><img src="images/books/img-02.jpg" alt="image description"></div>
																		<div class="tg-backcover"><img src="images/books/img-02.jpg" alt="image description"></div>
																	</div>
																	<a class="tg-btnaddtowishlist" href="javascript:void(0);">
																		<i class="icon-heart"></i>
																		<span>add to wishlist</span>
																	</a>
																</figure>
																<div class="tg-postbookcontent">
																	<ul class="tg-bookscategories">
																		<li><a href="javascript:void(0);">Adventure</a></li>
																		<li><a href="javascript:void(0);">Fun</a></li>
																	</ul>
																	<div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
																	<div class="tg-booktitle">
																		<h3><a href="javascript:void(0);">Drive Safely, No Bumping</a></h3>
																	</div>
																	<span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>
																	<span class="tg-stars"><span></span></span>
																	<span class="tg-bookprice">
																		<ins>$25.18</ins>
																		<del>$27.20</del>
																	</span>
																	<a class="tg-btn tg-btnstyletwo" href="javascript:void(0);">
																		<i class="fa fa-shopping-basket"></i>
																		<em>Add To Basket</em>
																	</a>
																</div>
															</div>
														</div>
														<div class="item">
															<div class="tg-postbook">
																<figure class="tg-featureimg">
																	<div class="tg-bookimg">
																		<div class="tg-frontcover"><img src="images/books/img-03.jpg" alt="image description"></div>
																		<div class="tg-backcover"><img src="images/books/img-03.jpg" alt="image description"></div>
																	</div>
																	<a class="tg-btnaddtowishlist" href="javascript:void(0);">
																		<i class="icon-heart"></i>
																		<span>add to wishlist</span>
																	</a>
																</figure>
																<div class="tg-postbookcontent">
																	<ul class="tg-bookscategories">
																		<li><a href="javascript:void(0);">Adventure</a></li>
																		<li><a href="javascript:void(0);">Fun</a></li>
																	</ul>
																	<div class="tg-themetagbox"></div>
																	<div class="tg-booktitle">
																		<h3><a href="javascript:void(0);">Let The Good Times Roll Up</a></h3>
																	</div>
																	<span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>
																	<span class="tg-stars"><span></span></span>
																	<span class="tg-bookprice">
																		<ins>$25.18</ins>
																		<del>$27.20</del>
																	</span>
																	<a class="tg-btn tg-btnstyletwo" href="javascript:void(0);">
																		<i class="fa fa-shopping-basket"></i>
																		<em>Add To Basket</em>
																	</a>
																</div>
															</div>
														</div>
														<div class="item">
															<div class="tg-postbook">
																<figure class="tg-featureimg">
																	<div class="tg-bookimg">
																		<div class="tg-frontcover"><img src="images/books/img-04.jpg" alt="image description"></div>
																		<div class="tg-backcover"><img src="images/books/img-04.jpg" alt="image description"></div>
																	</div>
																	<a class="tg-btnaddtowishlist" href="javascript:void(0);">
																		<i class="icon-heart"></i>
																		<span>add to wishlist</span>
																	</a>
																</figure>
																<div class="tg-postbookcontent">
																	<ul class="tg-bookscategories">
																		<li><a href="javascript:void(0);">Adventure</a></li>
																		<li><a href="javascript:void(0);">Fun</a></li>
																	</ul>
																	<div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
																	<div class="tg-booktitle">
																		<h3><a href="javascript:void(0);">Our State Fair Is A Great State Fair</a></h3>
																	</div>
																	<span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>
																	<span class="tg-stars"><span></span></span>
																	<span class="tg-bookprice">
																		<ins>$25.18</ins>
																		<del>$27.20</del>
																	</span>
																	<a class="tg-btn tg-btnstyletwo" href="javascript:void(0);">
																		<i class="fa fa-shopping-basket"></i>
																		<em>Add To Basket</em>
																	</a>
																</div>
															</div>
														</div>
														<div class="item">
															<div class="tg-postbook">
																<figure class="tg-featureimg">
																	<div class="tg-bookimg">
																		<div class="tg-frontcover"><img src="images/books/img-05.jpg" alt="image description"></div>
																		<div class="tg-backcover"><img src="images/books/img-05.jpg" alt="image description"></div>
																	</div>
																	<a class="tg-btnaddtowishlist" href="javascript:void(0);">
																		<i class="icon-heart"></i>
																		<span>add to wishlist</span>
																	</a>
																</figure>
																<div class="tg-postbookcontent">
																	<ul class="tg-bookscategories">
																		<li><a href="javascript:void(0);">Adventure</a></li>
																		<li><a href="javascript:void(0);">Fun</a></li>
																	</ul>
																	<div class="tg-themetagbox"></div>
																	<div class="tg-booktitle">
																		<h3><a href="javascript:void(0);">Put The Petal To The Metal</a></h3>
																	</div>
																	<span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>
																	<span class="tg-stars"><span></span></span>
																	<span class="tg-bookprice">
																		<ins>$25.18</ins>
																		<del>$27.20</del>
																	</span>
																	<a class="tg-btn tg-btnstyletwo" href="javascript:void(0);">
																		<i class="fa fa-shopping-basket"></i>
																		<em>Add To Basket</em>
																	</a>
																</div>
															</div>
														</div>
														<div class="item">
															<div class="tg-postbook">
																<figure class="tg-featureimg">
																	<div class="tg-bookimg">
																		<div class="tg-frontcover"><img src="images/books/img-06.jpg" alt="image description"></div>
																		<div class="tg-backcover"><img src="images/books/img-06.jpg" alt="image description"></div>
																	</div>
																	<a class="tg-btnaddtowishlist" href="javascript:void(0);">
																		<i class="icon-heart"></i>
																		<span>add to wishlist</span>
																	</a>
																</figure>
																<div class="tg-postbookcontent">
																	<ul class="tg-bookscategories">
																		<li><a href="javascript:void(0);">Adventure</a></li>
																		<li><a href="javascript:void(0);">Fun</a></li>
																	</ul>
																	<div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
																	<div class="tg-booktitle">
																		<h3><a href="javascript:void(0);">Help Me Find My Stomach</a></h3>
																	</div>
																	<span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>
																	<span class="tg-stars"><span></span></span>
																	<span class="tg-bookprice">
																		<ins>$25.18</ins>
																		<del>$27.20</del>
																	</span>
																	<a class="tg-btn tg-btnstyletwo" href="javascript:void(0);">
																		<i class="fa fa-shopping-basket"></i>
																		<em>Add To Basket</em>
																	</a>
																</div>
															</div>
														</div>
														<div class="item">
															<div class="tg-postbook">
																<figure class="tg-featureimg">
																	<div class="tg-bookimg">
																		<div class="tg-frontcover"><img src="images/books/img-03.jpg" alt="image description"></div>
																		<div class="tg-backcover"><img src="images/books/img-03.jpg" alt="image description"></div>
																	</div>
																	<a class="tg-btnaddtowishlist" href="javascript:void(0);">
																		<i class="icon-heart"></i>
																		<span>add to wishlist</span>
																	</a>
																</figure>
																<div class="tg-postbookcontent">
																	<ul class="tg-bookscategories">
																		<li><a href="javascript:void(0);">Adventure</a></li>
																		<li><a href="javascript:void(0);">Fun</a></li>
																	</ul>
																	<div class="tg-themetagbox"></div>
																	<div class="tg-booktitle">
																		<h3><a href="javascript:void(0);">Let The Good Times Roll Up</a></h3>
																	</div>
																	<span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>
																	<span class="tg-stars"><span></span></span>
																	<span class="tg-bookprice">
																		<ins>$25.18</ins>
																		<del>$27.20</del>
																	</span>
																	<a class="tg-btn tg-btnstyletwo" href="javascript:void(0);">
																		<i class="fa fa-shopping-basket"></i>
																		<em>Add To Basket</em>
																	</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-sm-4 col-md-4 col-lg-3 pull-left">
								<aside id="tg-sidebar" class="tg-sidebar">
									<div class="tg-widget tg-widgetsearch">
										<div class="tg-formtheme tg-formsearch">
											<div class="form-group">
												<button type="submit"><i class="icon-magnifier"></i></button>
												<input type="search" name="search" class="form-group" placeholder="Search by title, author, key...">
											</div>
										</div>
									</div>
									<div class="tg-widget tg-catagories">
										<div class="tg-widgettitle">
											<h3>Categories</h3>
										</div>
										<div class="tg-widgetcontent">
											<ul>
												<li><a href="javascript:void(0);"><span>Art &amp; Photography</span><em>28245</em></a></li>
												<li><a href="javascript:void(0);"><span>Biography</span><em>4856</em></a></li>
												<li><a href="javascript:void(0);"><span>Children’s Book</span><em>8654</em></a></li>
												<li><a href="javascript:void(0);"><span>Craft &amp; Hobbies</span><em>6247</em></a></li>
												<li><a href="javascript:void(0);"><span>Crime &amp; Thriller</span><em>888654</em></a></li>
												<li><a href="javascript:void(0);"><span>Fantasy &amp; Horror</span><em>873144</em></a></li>
												<li><a href="javascript:void(0);"><span>Fiction</span><em>18465</em></a></li>
												<li><a href="javascript:void(0);"><span>Fod &amp; Drink</span><em>3148</em></a></li>
												<li><a href="javascript:void(0);"><span>Graphic, Anime &amp; Manga</span><em>77531</em></a></li>
												<li><a href="javascript:void(0);"><span>Science Fiction</span><em>9247</em></a></li>
												<li><a href="javascript:void(0);"><span>View All</span></a></li>
											</ul>
										</div>
									</div>
								</aside>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--************************************
					News Grid End
			*************************************-->
		</main>
		<!--************************************
				Main End
		*************************************-->
</asp:Content>
