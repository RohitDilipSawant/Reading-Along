<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="wishlist.aspx.cs" Inherits="Reading_Along.wishlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header_Footer_Head" runat="server">
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
                            <h1>Wishlist</h1>
                            <ol class="tg-breadcrumb">
                                <li><a href="javascript:void(0);">home</a></li>
                                <li class="tg-active">Wishlist</li>
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
                <div class="container" style ="width: 90%;">
                    <div class="row">
                        <div class="tg-minicartbody">
                                            <asp:ListView ID="listview_wishlist" runat="server">
												<ItemTemplate>
													<a href="<%# Eval("Book_ID", "BooksDetails.aspx?Book_ID={0}") %>">
														<div class="tg-minicarproduct">
															<figure>
																<img src="BooksStorage/BookCover/<%# Eval("Book_Image") %>" alt="image description" style="height : 75px;">
															</figure>
															<div class="tg-minicarproductdata">
																<h5><%# Eval("Book_Name") %></h5>
																<a href="<%# Eval("ID", "wishlist.aspx?remove_wishlist_Book_ID={0}") %>"><i class="fa fa-trash-o"></i></a>
															</div>
														</div>
													</a>
												</ItemTemplate>
                                            </asp:ListView>
										<div class="tg-description"><p>No more products were added to the wishlist!</p></div>
										</div>
										<div class="tg-minicartfoot">
											
											<div class="tg-btns">
												<a class="tg-btn tg-active" href="wishlist.aspx?removeallwishlistBookID=all"><i class="fa fa-trash-o"></i>
												<span>Clear Your Wishlist</span></a>
											</div>
										</div>
                    </div>
                </div>
            </div>
        </main>
</asp:Content>
