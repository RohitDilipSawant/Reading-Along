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
								<li class="tg-active">Details</li>
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
							<div class="col-xs-12 col-sm-10 col-md-10 col-lg-11">
								<div id="tg-content" class="tg-content">
									<div class="tg-productdetail" style="text-align: left;">
										<div class="row">
                                            <asp:Repeater ID="rpr_book_details" runat="server">
												<ItemTemplate>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="tg-postbook">
															<figure class="tg-featureimg">
																<img ID="img_book_cover" src="../BooksStorage/BookCover/<%# Eval("Book_Cover_Page") %>" />
															</figure>
															<div class="tg-postbookcontent">
																<span class="tg-bookwriter">Digital Copy</span>
																<ul class="tg-delevrystock">
																	<li><i class="icon-rocket"></i><span>Adds Free</span></li>
																	<li><i class="icon-checkmark-circle"></i><span>Available </span></li>
																</ul>
																<a class="tg-btn tg-active tg-btn-lg" href="<%# Eval("ID", "BookRead.aspx?view_book_ID={0}") %>">Read Now</a>
																<a class="tg-btnaddtowishlist" href="<%# Eval("ID", "AllBooks.aspx?addwishlist_ID={0}") %>">
																	<span>add to wishlist</span>
																</a>
															</div>
														</div>
													</div>
												</ItemTemplate>
                                            </asp:Repeater>
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
																<p><%# (Eval("Book_Description").ToString().Length > 20) ? (Eval("Book_Description").ToString().Substring(0, 20) + "...") : Eval("Book_Description")%>...<a href="#book_details">More</a></p>
															</div>
															<div class="tg-sectionhead">
																<h2>Product Details</h2>
															</div>
															<ul class="tg-productinfo">
																<li><span>Format:</span><span><%# Eval("Book_Format") %></span></li>
																<li><span>Pages:</span><span><%# Eval("Book_Pages") %> pages</span></li>
																<li><span>Dimensions:</span><span><%# Eval("Book_View") %>span></li>
																<li><span>Publication Date:</span><span><%# Eval("Book_Publish_Date", "{0:MM/dd/yyyy}") %></span></li>
																<li><span>Publisher:</span><span><%# Eval("Publisher") %></span></li>
																<li><span>Language:</span><span><%# Eval("Book_Author") %></span></li>
																<li><span>ISBN10:</span><span><%# Eval("Book_ISBN10") %></span></li>
																<li><span>ISBN13:</span><span><%# Eval("Book_ISBN13") %></span></li>
															</ul>
														</div>
													</ItemTemplate>
												</asp:DataList>
											</div>
											<div class="tg-productdescription" style="margin-top : 4em;" id="book_details">
                                                <asp:Repeater ID="rpr_description" runat="server">
													<ItemTemplate>
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
																<p><%# Eval("Book_Description") %></p>
															</div>
														</div>
													</div>
												</div>
													</ItemTemplate>
                                                </asp:Repeater>
											</div>
											<div class="tg-aboutauthor">
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<div class="tg-sectionhead">
														<h2>About Author</h2>
													</div>
                                                    <asp:Repeater ID="rpr_author_details" runat="server">
														<ItemTemplate>
															<div class="tg-authorbox">
														<figure class="tg-authorimg">
															<img src="../BooksStorage/AuthorStorage/AuthorProfilePicture/<%# Eval("Author_Picture") %>" style="max-height : 100px; max-width : 100px;" alt="image description">
														</figure>
														<div class="tg-authorinfo">
															<div class="tg-authorhead">
																<div class="tg-leftarea">
																	<div class="tg-authorname">
																		<h2><%# Eval("Author_Name") %></h2>
																		<span>Author Since: <%# Eval("Author_Since") %></span>
																	</div>
																</div>
																<%--<div class="tg-rightarea">
																	<ul class="tg-socialicons">
																		<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
																		<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
																		<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
																		<li class="tg-googleplus"><a href="javascript:void(0);"><i class="fa fa-google-plus"></i></a></li>
																		<li class="tg-rss"><a href="javascript:void(0);"><i class="fa fa-rss"></i></a></li>
																	</ul>
																</div>--%>
															</div>
															<div class="tg-description">
																<p><%# Eval("Author_Description") %></p>
															</div>
															<%--<a class="tg-btn tg-active" href="javascript:void(0);">View All Books</a>--%>
														</div>
													</div>
														</ItemTemplate>
                                                    </asp:Repeater>
												</div>
											</div>
											<div class="tg-relatedproducts">
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<div class="tg-sectionhead">
														<h2><span>Related Products</span>You May Also Like</h2>
														<a class="tg-btn" href="AllBooks.aspx">View All</a>
													</div>
												</div>
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<div id="tg-relatedproductslider" class="tg-relatedproductslider tg-relatedbooks owl-carousel">
                                                        <asp:Repeater ID="rpr_relatedbooks" runat="server">
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
																	<div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
																	<div class="tg-booktitle">
																		<h3><a href="<%# Eval("ID", "BooksDetails.aspx?Book_ID={0}") %>"><%# (Eval("Book_Name").ToString().Length > 20) ? (Eval("Book_Name").ToString().Substring(0, 20) + "...") : Eval("Book_Name")%>...</a></h3>
																	</div>
																	<span class="tg-bookwriter">By: <a href="javascript:void(0);"><%# (Eval("Book_Author").ToString().Length > 20) ? (Eval("Book_Author").ToString().Substring(0, 20) + "...") : Eval("Book_Author")%></a></span>
																	<a class="tg-btn tg-btnstyletwo" href="<%# Eval("ID", "BookRead.aspx?view_book_ID={0}") %>">
																		<i class="fa fa-book"></i>
																		<em>Read Now</em>
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
									</div>
								</div>
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
