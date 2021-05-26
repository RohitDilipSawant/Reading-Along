<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="authors.aspx.cs" Inherits="Reading_Along.authors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header_Footer_Head" runat="server">
	<style>
	 @media (min-width : 1200px){
		 .author_image{
			 max-height : 180px;
		 }
	 }
	 @media (max-width : 1024px){
		 .author_image{
			 max-height : 250px;
		 }
	 }
	 @media (max-width : 992px){
		 .author_image{
			 max-height : 250px;
		 }
	 }
	 @media (max-width : 768px){
		 .author_image{
			 max-height : 200px;
		 }
	 }
	 @media (max-width : 568px){
		 .author_image{
			 max-height : 480px;
		 }
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
							<h1>Authors</h1>
							<ol class="tg-breadcrumb">
								<li><a href="javascript:void(0);">home</a></li>
								<li class="tg-active">Authors</li>
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
					Authors Start
			*************************************-->
			<div class="tg-authorsgrid">
				<div class="container">
					<div class="row">
						<div class="tg-authors">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<div class="tg-sectionhead">
									<h2><span>Strong Minds Behind Us</span>All Authors we prefer</h2>
								</div>
							</div>
                            <asp:ListView ID="list_authors_list" runat="server">
								<ItemTemplate>
									<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
										<div class="tg-author">
											<figure><a href="javascript:void(0);"><img class="author_image" src="../BooksStorage/AuthorStorage/AuthorProfilePicture/<%# Eval("Author_Picture") %>" alt="image description"></a></figure>
											<div class="tg-authorcontent">
												<h2><a href="javascript:void(0);"><%# Eval("Author_Name") %></a></h2>
												<span>Since : <%# Eval("Author_Since") %></span>
												<ul class="tg-socialicons">
													<li class="tg-facebook"><a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
													<li class="tg-twitter"><a href="https://twitter.com/"><i class="fa fa-twitter"></i></a></li>
													<li class="tg-linkedin"><a href="https://www.linkedin.com/"><i class="fa fa-linkedin"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
								</ItemTemplate>
                            </asp:ListView>
							<%--<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-03.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-04.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-05.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-06.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-07.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-08.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-20.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-15.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-14.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-15.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-16.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-17.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-18.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-19.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-20.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-21.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-22.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
								<div class="tg-author">
									<figure><a href="javascript:void(0);"><img src="images/author/imag-23.jpg" alt="image description"></a></figure>
									<div class="tg-authorcontent">
										<h2><a href="javascript:void(0);">Jude Morphew</a></h2>
										<span>21,658 Published Books</span>
										<ul class="tg-socialicons">
											<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
											<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
											<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>--%>
						</div>
					</div>
				</div>
			</div>
			<!--************************************
					Authors End
			*************************************-->
		</main>
		<!--************************************
				Main End
		*************************************--> 
</asp:Content>
