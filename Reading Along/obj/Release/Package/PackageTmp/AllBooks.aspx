<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="AllBooks.aspx.cs" Inherits="Reading_Along.AllBooks" %>
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
                            <h1>All Books</h1>
                            <ol class="tg-breadcrumb">
                                <li><a href="javascript:void(0);">home</a></li>
                                <li class="tg-active">All Books</li>
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
                        <div id="tg-twocolumns" class="tg-twocolumns">
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-9 pull-right">
                                <div id="tg-content" class="tg-content">
                                    <div class="tg-products">
                                        <div class="tg-sectionhead">
                                            <h2><span>People’s Choice</span>Books</h2>
                                        </div>
                                        <div class="tg-featurebook alert" role="alert" id="product_adds" runat="server">
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                            <div class="tg-featureditm">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 hidden-sm hidden-xs">
                                                        <figure><img src="images/img-04.png" alt="image description"></figure>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                                                        <div class="tg-featureditmcontent">
                                                            <div class="tg-themetagbox"><span class="tg-themetag">Advertisement</span></div>
                                                            <div class="tg-booktitle">
                                                                <h3><a href="javascript:void(0);">Things To Know About Green Flat Design</a></h3>
                                                            </div>
                                                            <span class="tg-bookwriter">By: <a href="javascript:void(0);">Farrah Whisenhunt</a></span>
                                                            <span class="tg-stars"><span></span></span>
                                                            <div class="tg-priceandbtn">
                                                                <span class="tg-bookprice">
                                                                    <ins>₹23.18</ins>
                                                                    <del>₹30.20</del>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tg-productgrid">
                                            <div class="tg-refinesearch">
                                                <%--<span>showing 1 to 8 of 20 total</span>--%>
                                                <div class="tg-formtheme tg-formsortshoitems">
                                                    <fieldset>
                                                        <div class="form-group">
                                                            <label>sort by:</label>
                                                            <asp:DropDownList ID="drp_short_by" AutoPostBack="true" class="tg-select" runat="server">
                                                                <asp:ListItem Value="Book_Short_Name">Name</asp:ListItem>
                                                                <asp:ListItem Value="Book_Author">Author</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <asp:ListView ID="datalist_all_book" runat="server">
                                                    <ItemTemplate>
                                                        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3" style="text-align: left;">
                                                            <div class="tg-postbook">
                                                                <figure class="tg-featureimg">
                                                                    <div class="tg-bookimg">
                                                                        <div class="tg-frontcover"><img src="../BooksStorage/BookCover/<%# Eval("Book_Cover_Page") %>" style="max-height : 400.73px;"  alt="image description"></div>
                                                                        <div class="tg-backcover"><img src="../BooksStorage/BookCover/<%# Eval("Book_Cover_Page") %>" style="max-height : 400.73px;" alt="image description"></div>
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
                                                                    <span class="tg-themetag">Recommended</span>
                                                                    <div class="tg-booktitle">
                                                                        <h4><a href="<%# Eval("ID", "BooksDetails.aspx?Book_ID={0}") %>"><%# (Eval("Book_Name").ToString().Length > 20) ? (Eval("Book_Name").ToString().Substring(0, 20) + "...") : Eval("Book_Name")%>...</a></h4>
                                                                        <span class="tg-bookwriter">By: <a href="javascript:void(0);"><%# (Eval("Book_Author").ToString().Length > 20) ? (Eval("Book_Author").ToString().Substring(0, 20) + "...") : Eval("Book_Author")%></a></span>
                                                                    </div>
                                                                
                                                                    <a class="tg-btn tg-btnstyletwo" href="<%# Eval("ID", "BookRead.aspx?view_book_ID={0}") %>">
                                                                        <i class="fa fa-book"></i>
                                                                        <em>Read Now</em>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3 pull-left">
                                <aside id="tg-sidebar" class="tg-sidebar">
                                    <%--<div class="tg-widget tg-widgetsearch">
                                        <div class="tg-formtheme tg-formsearch">
                                            <div class="form-group">
                                                <button type="submit"><i class="icon-magnifier"></i></button>
                                                <input type="search" name="search" class="form-group" placeholder="Search by title, author, key...">
                                            </div>
                                        </div>
                                    </div>--%>
                                    <div class="tg-widget tg-catagories">
                                        <div class="tg-widgettitle">
                                            <h3>Categories</h3>
                                        </div>
                                        <div class="tg-widgetcontent">
                                            <ul>
                                                <asp:Repeater ID="rpr_category" runat="server">
                                                    <ItemTemplate>
                                                        <li><a href="<%# Eval("ID", "AllBooks.aspx?FilterCategory={0}") %>"><span><%# Eval("Category") %></span><%--<em>28245</em>--%></a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <li id="viewAllCategory_lnk" runat="server" visible="true"><a href="AllBooks.aspx?ViewAllCategory=all"><span>View All</span></a></li>
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
