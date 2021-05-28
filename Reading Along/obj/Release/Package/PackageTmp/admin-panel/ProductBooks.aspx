<%@ Page Title="" Language="C#" MasterPageFile="~/admin-panel/HeaderSidebarFooter.Master" AutoEventWireup="true" CodeBehind="ProductBooks.aspx.cs" Inherits="Reading_Along.ProductBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="admin_dashboard_head" runat="server">
    <style>
        .validation_class{
            color : red;
        }
        
        .tags-input {
            border: 1px solid #333;
            display: inline-block;
        }

        .tags-input .tag {
            font-size: 85%;
            padding: 0.5em 0.75em;
            margin: 0.25em 0.1em;
            display: inline-block;
            background-color: #ddd;
            transition: all 0.1s linear;
            cursor: pointer;
        }

        .tags-input .tag:hover {
            background-color: #3af;
            color: white;
        }

        .tags-input .tag .close::after {
            content: '×';
            font-weight: bold;
            display: inline-block;
            transform: scale(1.4);
            margin-left: 0.75em;
        }

        .tags-input .tag .close:hover::after {
            color: red;
        }

        .tags-input .main-input {
            border: 0;
            outline: 0;
            padding: 0.5em 0.1em;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="admin_dashboard_body" runat="server">
    <!-- Header -->
    <div class="header bg-primary pb-6">
      <div class="container-fluid">
        <div class="header-body">
          <div class="row align-items-center py-4">
            <div class="col-lg-6 col-7">
              <h6 class="h2 text-white d-inline-block mb-0">Tables</h6>
              <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                  <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i></a></li>
                  <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                  <li class="breadcrumb-item active">Books</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content user list -->
    <div class="container-fluid mt--6" id="book_list_div" runat="server">
      <!-- Dark table -->
      <div class="row">
        <div class="col">
          <div class="card bg-default shadow">
              <div class="card-header bg-transparent row align-items-center">
                <div class="col-11">
                  <h3 class="text-white mb-0">All Book</h3>
                </div>
                <div class="col-1 text-left">
                    <asp:Button ID="btn_add_book" runat="server" class="btn btn-sm btn-neutral" Text="Add Book" OnClick="btn_add_book_Click" />
                </div>
              </div>
            <div class="table-responsive">
              <table class="table align-items-center table-dark table-flush">
                <thead class="thead-dark text-white">
                  <tr>
                    <th scope="col" class="sort" data-sort="name">Preview</th>
                    <th scope="col" class="sort" data-sort="name">Name</th>
                    <th scope="col" class="sort" data-sort="budget">Book Author</th>
                    <th scope="col" class="sort" data-sort="status">Publisher</th>
                    <th scope="col" data-sort="budget">Category</th>
                    <th scope="col" class="sort" data-sort="budget">Book Format</th>
                    <th scope="col" class="sort" data-sort="status">ISBN13</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody class="list">
                  <asp:Repeater ID="list_books_data"  runat="server">
                      <ItemTemplate>
                          <tr>
                            <th scope="row">
                              <div class="media align-items-center">
                                <div class="media-body">
                                    <img src="../BooksStorage/BookCover/<%# Eval("Book_Cover_Page") %>" style="width : auto; height : auto; max-height : 6rem;" class="navbar-brand-img" alt="Book Preview" />
                                </div>
                              </div>
                            </th>
                            <td class="budget">
                              <%# (Eval("Book_Name").ToString().Length > 20) ? (Eval("Book_Name").ToString().Substring(0, 20) + "...") : Eval("Book_Name")%>
                            </td>
                            <td>
                                <%# (Eval("Book_Author").ToString().Length > 20) ? (Eval("Book_Author").ToString().Substring(0, 20) + "...") : Eval("Book_Author")%>
                            </td>
                            <td>
                              <%# Eval("Publisher") %>
                            </td>
                            <td>
                              <%# Eval("Book_Category") %>
                            </td>
                            <td>
                                <%# Eval("Book_Format") %>
                            </td>
                            <td class="budget">
                              <%# Eval("Book_ISBN13") %>
                            </td>
                            <td class="text-right">
                              <div class="dropdown">
                                <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  <i class="fas fa-ellipsis-v"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                  <a class="dropdown-item" href="<%# Eval("ID", "ProductBooks.aspx?edit_book_ID={0}") %>">View / Edit</a>
                                  <a class="dropdown-item" href="<%# Eval("ID", "ProductBooks.aspx?remove_book_ID={0}") %>">Delete</a>
                                </div>
                              </div>
                            </td>
                            <%--<td class="budget">
                              $2500 USD
                            </td>--%>
                          </tr>
                      </ItemTemplate>
                  </asp:Repeater>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content Book add-->
    <div class="container-fluid mt--6" style="padding : 5px 30px; margin-bottom : 10em;" id="book_add_div" visible="false" runat="server">
      <div class="row">
        <div class="col-xl-12">
          <div class="card">
            <div class="card-header">
              <div class="row align-items-center">
                <div class="col-10">
                  <h3 class="mb-0">Add New Book</h3>
                </div>
                <div class="col-2 text-center">
                    <asp:Button ID="btn_back_to_user_list" runat="server" class="btn btn-sm btn-primary" style="font-size : 14px;" Text="<< Back to Book list" OnClick="btn_back_to_user_list_Click" CausesValidation="False"/>
                </div>
              </div>
            </div>
            <div class="card-body">
              <div>
                <h6 class="heading-small text-muted mb-4">Book Cover</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-1">
                      <div class="form-group">
                          <asp:Image ID="img_add_view_added_cover" style="max-height: 95px;" ImageUrl="~/images/Your Book Preview.png" runat="server" />
                          <asp:LinkButton ID="lnk_remove_cover_upload" runat="server" Visible="false" style="position : absolute; right: 8%; top : 60%;" OnClick="lnk_remove_cover_upload_Click"><i class="ni ni-fat-remove text-danger" style="font-size : 32px;"></i></asp:LinkButton>
                      </div>
                    </div>
                    <div class="col-lg-7">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Add Cover</label>
                          <asp:FileUpload ID="file_add_upl_book_cover" class="form-control" validationgroup="file_add_upl_book_cover_validate_group" causesvalidation="true" runat="server" />
                          <asp:Label class="form-control" style="border: none" ID="lbl_link" runat="server"></asp:Label>
                          <asp:requiredfieldvalidator id="RequiredFieldValidator2"
                              controltovalidate="file_add_upl_book_cover"
                              validationgroup="file_add_upl_book_cover_validate_group"
                              errormessage="Cover Page is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-2">
                      <div class="form-group">
                          <label class="form-control-label" for="input-username"> &nbsp </label>
                        <asp:Button ID="btn_add_upload_cover" class="btn form-control btn-warning" style="float: right;" runat="server" Text="Upload Cover" validationgroup="file_add_upl_book_cover_validate_group" OnClick="btn_add_upload_cover_Click"/>
                      </div>
                    </div>
                  </div>
                </div>
                <hr style="margin-top : 0px;" />
                <h6 class="heading-small text-muted mb-4">Upload File</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-1">
                      <div class="form-group">
                          <asp:Image ID="img_add_view_added_file" style="max-height: 95px;" ImageUrl="~/images/Your Book Preview.png" runat="server" />
                          <asp:LinkButton ID="lnk_remove_file_upload" runat="server" Visible="false" style="position : absolute; right: 8%; top : 60%;" OnClick="lnk_remove_file_upload_Click"><i class="ni ni-fat-remove text-danger" style="font-size : 32px;"></i></asp:LinkButton>
                      </div>
                    </div>
                    <div class="col-lg-7">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Upload File</label>
                          <asp:FileUpload ID="file_add_upl_book_files" class="form-control" validationgroup="file_add_upl_book_file_validate_group" causesvalidation="true" runat="server" />
                          <asp:Label class="form-control" style="border: none" ID="lbl_link_file" runat="server"></asp:Label>
                          <asp:requiredfieldvalidator id="RequiredFieldValidator11"
                              controltovalidate="file_add_upl_book_files"
                              validationgroup="file_add_upl_book_file_validate_group"
                              errormessage="Cover Page is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-2">
                      <div class="form-group">
                          <label class="form-control-label" for="input-username"> &nbsp </label>
                        <asp:Button ID="btn_add_upload_book_files" class="btn form-control btn-warning" style="float: right;" runat="server" Text="Upload File" validationgroup="file_add_upl_book_file_validate_group" OnClick="btn_add_upload_book_files_Click"/>
                      </div>
                    </div>
                  </div>
                </div>
                <hr style="margin-top : 0px;" />
                <h6 class="heading-small text-muted mb-4">Book information</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Book Name</label>
                        <asp:TextBox ID="txt_add_Book_Name" MaxLength="150" class="form-control" ValidationGroup="AddBookValidationGroup" placeholder="Book Name" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="req_validator_book_name"
                              controltovalidate="txt_add_Book_Name"
                              validationgroup="AddBookValidationGroup"
                              errormessage="Book Name is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">Book Short Name</label>
                          <asp:TextBox ID="txt_add_book_short_name" MaxLength="25" class="form-control" ValidationGroup="AddBookValidationGroup" placeholder="Book Short Name" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator1"
                              controltovalidate="txt_add_book_short_name"
                              validationgroup="AddBookValidationGroup"
                              errormessage="Book Short Name is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name">Book Author</label>
                          <asp:DropDownList ID="drp_add_book_author" class="form-control" placeholder="Book Author" ValidationGroup="AddBookValidationGroup" runat="server" DataSourceID="Sqldrpaddauthorinbook" DataTextField="Author_Name" DataValueField="Author_Name">
                              <asp:ListItem Selected="True">==Select==</asp:ListItem>
                          </asp:DropDownList>
                          <asp:SqlDataSource runat="server" ID="Sqldrpaddauthorinbook" ConnectionString='<%$ ConnectionStrings:Reading_Along_DB %>' SelectCommand="SELECT [Author_Name] FROM [Authors_DB] ORDER BY [Author_Name]"></asp:SqlDataSource>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator3"
                              controltovalidate="drp_add_book_author"
                              validationgroup="AddBookValidationGroup"
                              errormessage="Author Name is required." 
                              InitialValue="==Select=="
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-last-name">Book Publisher</label>
                          <asp:TextBox ID="txt_add_book_publisher" class="form-control" placeholder="Book Publisher" ValidationGroup="AddBookValidationGroup" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator4"
                              controltovalidate="txt_add_book_publisher"
                              validationgroup="AddBookValidationGroup"
                              errormessage="Publisher Name is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4" />
                <!-- Address -->
                <h6 class="heading-small text-muted mb-4">Book Details</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-md-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">Publish Date</label>
                          <asp:TextBox ID="txt_add_publish_date" class="form-control" placeholder="Publish Date" ValidationGroup="AddBookValidationGroup" textmode="Date" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator5"
                              controltovalidate="txt_add_publish_date"
                              validationgroup="AddBookValidationGroup"
                              errormessage="Publised Date is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">Number of Pages</label>
                          <asp:TextBox ID="txt_add_no_of_page" class="form-control" placeholder="No. of Pages" ValidationGroup="AddBookValidationGroup" textmode="number" MaxLength="5" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator6"
                              controltovalidate="txt_add_no_of_page"
                              validationgroup="AddBookValidationGroup"
                              errormessage="Number Of Pages is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">File Format</label>
                          <asp:TextBox ID="txt_add__file_format" class="form-control" placeholder="Phone No" ValidationGroup="add_book_detail_validate_group" value="pdf" runat="server" ReadOnly="true"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_edit_ISBN10">ISBN10</label>
                          <asp:TextBox ID="txt_add_isbn10" class="form-control" MaxLength="10" Minlength="10" ValidationGroup="AddBookValidationGroup" placeholder="ISBN10" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator7"
                              controltovalidate="txt_add_isbn10"
                              validationgroup="AddBookValidationGroup"
                              errormessage="ISBN10 is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_edit_ISBN13">ISBN13</label>
                          <asp:TextBox ID="txt_add_isbn13" class="form-control" MaxLength="13" Minlength="13" ValidationGroup="AddBookValidationGroup" placeholder="ISBN13" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator8"
                              controltovalidate="txt_add_isbn13"
                              validationgroup="AddBookValidationGroup"
                              errormessage="ISBN13 is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">Book Dimentions (CM)</label>
                          <asp:TextBox ID="txt_add_book_dimentions" class="form-control" MaxLength="20" ValidationGroup="AddBookValidationGroup" placeholder="Width X Height X Legth" textmode="SingleLine" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator9"
                              controltovalidate="txt_add_book_dimentions"
                              validationgroup="AddBookValidationGroup"
                              errormessage="Dimentions is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4" />
                <!-- Description -->
                <h6 class="heading-small text-muted mb-4">About Book</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name">Category</label>
                          <asp:DropDownList ID="drp_add_category" class="form-control" AutoPostBack="true" runat="server" DataSourceID="sql_drp_category" DataTextField="Category" DataValueField="Category">
                              <asp:ListItem Selected="True" Value="0">--Select--</asp:ListItem>
                          </asp:DropDownList>
                          <asp:SqlDataSource runat="server" ID="sql_drp_category" ConnectionString='<%$ ConnectionStrings:Reading_Along_DB %>' SelectCommand="SELECT DISTINCT [Category] FROM [categories_db] ORDER BY [Category]"></asp:SqlDataSource>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-last-name">Sub-Category</label>
                          <asp:DropDownList ID="drp_add_sub_category" class="form-control" runat="server" DataSourceID="sql_drp_sub_category" DataTextField="SubCategory" DataValueField="SubCategory">
                              <asp:ListItem Selected="True" Value="0">--Select--</asp:ListItem>
                          </asp:DropDownList>
                          <asp:SqlDataSource runat="server" ID="sql_drp_sub_category" ConnectionString='<%$ ConnectionStrings:Reading_Along_DB %>' SelectCommand="SELECT [SubCategory] FROM [SubCategory] WHERE ([CategoryName] = @CategoryName)">
                              <SelectParameters>
                                  <asp:ControlParameter ControlID="drp_add_category" PropertyName="SelectedValue" Name="CategoryName" Type="String"></asp:ControlParameter>
                              </SelectParameters>
                          </asp:SqlDataSource>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="pl-lg-4">
                  <div class="form-group">
                    <label class="form-control-label">Description</label>
                      <asp:TextBox ID="txt_add_description" textmode="MultiLine" rows="4" ValidationGroup="AddBookValidationGroup" Maxlength="500" class="form-control" placeholder="A few words about Book ..." runat="server"></asp:TextBox>
                      <asp:requiredfieldvalidator id="Requiredfieldvalidator10"
                              controltovalidate="txt_add_description"
                              validationgroup="AddBookValidationGroup"
                              errormessage="Description is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                  </div>
                </div>
                <hr class="my-4" />
                <!-- Description -->
                <h6 class="heading-small text-muted mb-4">Admin Section</h6>
                <div class="pl-lg-4">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label class="form-control-label" for="input-first-name">Tags (Comma "," Saperated)</label>
                                <asp:TextBox ID="txt_add_tags" class="form-control" placeholder="Subscription" MaxLength="50" validationgroup="AddBookValidationGroup" runat="server"></asp:TextBox>
                                <asp:requiredfieldvalidator id="Requiredfieldvalidator13"
                                  controltovalidate="txt_add_tags"
                                  validationgroup="AddBookValidationGroup"
                                  errormessage="Tags are required."
                                  class="validation_class"
                                  runat="Server">
                                </asp:requiredfieldvalidator>
                            </div>
                        </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name"><b>Product Listing : </b><span id="Span1" runat="server"></span></label>
                          <asp:DropDownList ID="drp_listing" class="form-control" validationgroup="AddBookValidationGroup" runat="server">
                              <asp:ListItem Value="0">-- Select --</asp:ListItem>  
                              <asp:ListItem>Recommended</asp:ListItem>
                              <asp:ListItem>Most Read</asp:ListItem>
                              <asp:ListItem>Author Picks</asp:ListItem>
                          </asp:DropDownList>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator12"
                              controltovalidate="drp_listing"
                              validationgroup="AddBookValidationGroup"
                              errormessage="Product Listing is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                  </div>
                </div>
                  <asp:Button ID="btn_add_book_details" class="btn btn-primary" style="float: right;" validationgroup="AddBookValidationGroup" runat="server" Text="Save" OnClick="btn_add_book_details_Click"/>                                                     
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content User Edit -->
    <div class="container-fluid mt--6" style="padding : 5px 30px; margin-bottom : 10em;" id="book_edit_div" visible="false" runat="server">
      <div class="row">
        <div class="col-xl-12">
          <div class="card">
            <div class="card-header">
              <div class="row align-items-center">
                <div class="col-10">
                  <h3 class="mb-0">Edit Book</h3>
                </div>
                <div class="col-2 text-center">
                    <asp:Button ID="btn_edit_back_to_list" runat="server" class="btn btn-sm btn-primary" style="font-size : 14px;" Text="<< Back to Book list" OnClick="btn_back_to_user_list_Click" CausesValidation="False"/>
                </div>
              </div>
            </div>
            <div class="card-body">
              <div>
                <h6 class="heading-small text-muted mb-4">Book Cover</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-1">
                      <div class="form-group">
                          <asp:Image ID="img_edit_view_added_cover" style="max-height: 95px;" ImageUrl="~/images/Your Book Preview.png" runat="server" />
                          <asp:LinkButton ID="lnk_edit_remove_cover_upload" runat="server" Visible="false" style="position : absolute; right: 8%; top : 60%;" OnClick="lnk_edit_remove_cover_upload_Click"><i class="ni ni-fat-remove text-danger" style="font-size : 32px;"></i></asp:LinkButton>
                      </div>
                    </div>
                    <div class="col-lg-7">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Add Cover</label>
                          <asp:FileUpload ID="file_edit_upl_book_cover" class="form-control" validationgroup="file_edit_upl_book_cover_validate_group" causesvalidation="true" runat="server" />
                          <asp:Label class="form-control" style="border: none" validationgroup="EditBookValidationGroup" ID="lbl_edit_link" runat="server"></asp:Label>
                          <asp:requiredfieldvalidator id="RequiredFieldValidator14"
                              controltovalidate="file_edit_upl_book_cover"
                              validationgroup="file_edit_upl_book_cover_validate_group"
                              errormessage="Cover Page is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-2">
                      <div class="form-group">
                          <label class="form-control-label" for="input-username"> &nbsp </label>
                        <asp:Button ID="btn_edit_upload_cover" class="btn form-control btn-warning" style="float: right;" runat="server" Text="Upload Cover" validationgroup="file_edit_upl_book_cover_validate_group" OnClick="btn_edit_upload_cover_Click"/>
                      </div>
                    </div>
                  </div>
                </div>
                <hr style="margin-top : 0px;" />
                <h6 class="heading-small text-muted mb-4">Book information</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-10">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Book Name</label>
                        <asp:TextBox ID="txt_edit_Book_Name" MaxLength="150" class="form-control" ValidationGroup="EditBookValidationGroup" placeholder="Book Name" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator16"
                              controltovalidate="txt_edit_Book_Name"
                              validationgroup="EditBookValidationGroup"
                              errormessage="Book Name is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name">Book Author : <span id="view_book_author" class="text-green" runat="server"></span></label>
                          <asp:DropDownList ID="drp_edit_book_author" class="form-control" placeholder="Book Author" ValidationGroup="EditBookValidationGroup" runat="server" DataSourceID="Sqldrpaddauthorinbook" DataTextField="Author_Name" DataValueField="Author_Name">
                              <asp:ListItem Selected="True">==Select==</asp:ListItem>
                          </asp:DropDownList>
                          <label class="form-control-label text-gray" for="input-first-name">*Note : Please Select Same Author if you dont wish to change it</label>
                          <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Reading_Along_DB %>' SelectCommand="SELECT [Author_Name] FROM [Authors_DB] ORDER BY [Author_Name]"></asp:SqlDataSource>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator18"
                              controltovalidate="drp_edit_book_author"
                              validationgroup="EditBookValidationGroup"
                              errormessage="Author Name is required." 
                              InitialValue="==Select=="
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-last-name">Book Publisher</label>
                          <asp:TextBox ID="txt_edit_book_publisher" class="form-control" placeholder="Book Publisher" ValidationGroup="EditBookValidationGroup" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator19"
                              controltovalidate="txt_edit_book_publisher"
                              validationgroup="EditBookValidationGroup"
                              errormessage="Publisher Name is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4" />
                <!-- Address -->
                <h6 class="heading-small text-muted mb-4">Book Details</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-md-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">Publish Date : <span id="view_publish_date" class="text-green" runat="server"></span></label>
                          <asp:TextBox ID="txt_edit_publish_date" class="form-control" placeholder="Publish Date" ValidationGroup="EditBookValidationGroup" textmode="Date" runat="server"></asp:TextBox>
                          <label>*Note : Keep This Field Empty for not to change.</label>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator20"
                              controltovalidate="txt_edit_publish_date"
                              validationgroup="EditBookValidationGroup"
                              errormessage="Publised Date is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">Number of Pages</label>
                          <asp:TextBox ID="txt_edit_no_of_page" class="form-control" placeholder="No. of Pages" ValidationGroup="EditBookValidationGroup" textmode="number" MaxLength="5" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator21"
                              controltovalidate="txt_edit_no_of_page"
                              validationgroup="EditBookValidationGroup"
                              errormessage="Number Of Pages is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">File Format</label>
                          <asp:TextBox ID="txt_edit__file_format" class="form-control" placeholder="Phone No" ValidationGroup="EditBookValidationGroup" value="pdf" runat="server" ReadOnly="true"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_edit_ISBN10">ISBN10</label>
                          <asp:TextBox ID="txt_edit_isbn10" class="form-control" MaxLength="10" Minlength="10" ValidationGroup="EditBookValidationGroup" placeholder="ISBN10" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator22"
                              controltovalidate="txt_edit_isbn10"
                              validationgroup="EditBookValidationGroup"
                              errormessage="ISBN10 is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_edit_ISBN13">ISBN13</label>
                          <asp:TextBox ID="txt_edit_isbn13" class="form-control" MaxLength="13" Minlength="13" ValidationGroup="EditBookValidationGroup" placeholder="ISBN13" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator23"
                              controltovalidate="txt_edit_isbn13"
                              validationgroup="EditBookValidationGroup"
                              errormessage="ISBN13 is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">Book Dimentions (CM)</label>
                          <asp:TextBox ID="txt_edit_book_dimentions" class="form-control" MaxLength="20" ValidationGroup="EditBookValidationGroup" placeholder="Width X Height X Legth" textmode="SingleLine" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator24"
                              controltovalidate="txt_edit_book_dimentions"
                              validationgroup="EditBookValidationGroup"
                              errormessage="Dimentions is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4" />
                <!-- Description -->
                <h6 class="heading-small text-muted mb-4">About Book</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name">Category : <span id="view_category" class="text-green" runat="server"></span></label>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name">Sub-Category : <span id="view_sub_category" class="text-green" runat="server"></span></label>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="pl-lg-4">
                  <div class="form-group">
                    <label class="form-control-label">Description</label>
                      <asp:TextBox ID="txt_edit_description" textmode="MultiLine" rows="4" ValidationGroup="AddBookValidationGroup" Maxlength="500" class="form-control" placeholder="A few words about Book ..." runat="server"></asp:TextBox>
                      <asp:requiredfieldvalidator id="Requiredfieldvalidator25"
                              controltovalidate="txt_edit_description"
                              validationgroup="AddBookValidationGroup"
                              errormessage="Description is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                  </div>
                </div>
                <hr class="my-4" />
                <!-- Description -->
                <h6 class="heading-small text-muted mb-4">Admin Section</h6>
                <div class="pl-lg-4">
                    <div class="row">
                        <div class="col-lg-12">
                          <div class="form-group">
                            <label class="form-control-label" for="input-first-name">Tags (Comma "," Saperated)</label>
                            <asp:TextBox ID="txt_edit_tags" class="form-control" TextMode="MultiLine" placeholder="Subscription" MaxLength="150" validationgroup="EditBookValidationGroup" runat="server"></asp:TextBox>
                              <asp:requiredfieldvalidator id="Requiredfieldvalidator27"
                                  controltovalidate="txt_edit_tags"
                                  validationgroup="EditBookValidationGroup"
                                  errormessage="Tags are required."
                                  class="validation_class"
                                  runat="Server">
                                </asp:requiredfieldvalidator>
                          </div>
                        </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name"><b>Product Listing : </b><span></span></label>
                          <asp:DropDownList ID="drp_edit_listing" class="form-control" validationgroup="EditBookValidationGroup" runat="server">
                              <asp:ListItem Value="0">-- Select --</asp:ListItem>  
                              <asp:ListItem>Recommended</asp:ListItem>
                              <asp:ListItem>Most Read</asp:ListItem>
                              <asp:ListItem>Author Picks</asp:ListItem>
                          </asp:DropDownList>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator26"
                              controltovalidate="drp_edit_listing"
                              validationgroup="EditBookValidationGroup"
                              errormessage="Product Listing is required."
                              class="validation_class" 
                              InitialValue="-- Select --"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                  </div>
                </div>
                  <asp:Button ID="btn_edit_book_details" class="btn btn-primary" style="float: right;" validationgroup="AddBookValidationGroup" runat="server" Text="Update" OnClick="btn_edit_book_details_Click"/>                                                     
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="tags.js"></script>
</asp:Content>
