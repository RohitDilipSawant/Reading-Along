<%@ Page Title="" Language="C#" MasterPageFile="~/admin-panel/HeaderSidebarFooter.Master" AutoEventWireup="true" CodeBehind="AuthorsList.aspx.cs" Inherits="Reading_Along.admin_panel.AuthorsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="admin_dashboard_head" runat="server">
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
                  <li class="breadcrumb-item active">Authors</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- List authors -->
    <div class="container-fluid mt--6" id="author_list_div" runat="server">
      <!-- Dark table -->
      <div class="row">
        <div class="col">
          <div class="card bg-default shadow">
              <div class="card-header bg-transparent row align-items-center">
                <div class="col-10">
                  <h3 class="text-white mb-0">All Authors</h3>
                </div>
                <div class="col-2 text-right">
                    <asp:Button ID="btn_add_author_section" runat="server" class="btn btn-sm btn-neutral" Text="Add Author" OnClick="btn_add_author_section_Click"/>
                </div>
              </div>
            <div class="table-responsive">
              <table class="table align-items-center table-dark table-flush">
                <thead class="thead-dark text-white">
                  <tr>
                    <th scope="col" class="sort" data-sort="name">Profile</th>
                    <th scope="col" class="sort" data-sort="name">Name</th>
                    <th scope="col" class="sort" data-sort="budget">Description</th>
                    <th scope="col" class="sort" data-sort="status">Since</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody class="list">
                  <asp:Repeater ID="list_authors_data"  runat="server">
                      <ItemTemplate>
                          <tr>
                            <th scope="row">
                              <div class="media align-items-center">
                                <div class="media-body">
                                    <img src="../BooksStorage/AuthorStorage/AuthorProfilePicture/<%# Eval("Author_Picture") %>" style="width : auto; height : auto; max-height : 6rem;" class="navbar-brand-img" alt="Book Preview" />
                                </div>
                              </div>
                            </th>
                            <td>
                              <%# Eval("Author_Name") %>
                            </td>
                            <td class="budget">
                              <%# (Eval("Author_Description").ToString().Length > 20) ? (Eval("Author_Description").ToString().Substring(0, 20) + "...") : Eval("Author_Description")%>
                            </td>
                            <td>
                              <%# Eval("Author_Since") %>
                            </td>
                            <td class="text-right">
                              <div class="dropdown">
                                <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  <i class="fas fa-ellipsis-v"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                  <a class="dropdown-item" href="<%# Eval("ID", "AuthorsList.aspx?edit_author_ID={0}") %>">View / Edit</a>
                                  <a class="dropdown-item" href="<%# Eval("ID", "AuthorsList.aspx?remove_author_ID={0}") %>">Delete</a>
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
    <!-- add authors -->
    <div class="container-fluid mt--6" style="padding : 5px 30px; margin-bottom : 10em;" id="author_add_div" visible="false" runat="server">
      <div class="row">
        <div class="col-xl-10 order-xl-1">
          <div class="card">
            <div class="card-header">
              <div class="row align-items-center">
                <div class="col-10">
                  <h3 class="mb-0">Add New Author</h3>
                </div>
                <div class="col-2 text-center">
                    <asp:Button ID="btn_back_to_Author_list" runat="server" class="btn btn-sm btn-primary" style="font-size : 14px;" Text="<< Back to list" CausesValidation="False" OnClick="btn_back_to_Author_list_Click"/>
                </div>
              </div>
            </div>
            <div class="card-body">
              <div>
                <h6 class="heading-small text-muted mb-4">Author Profile</h6>
                <div class="pl-lg-4">
                  <div class="row">
                   <div class="col-lg-2">
                      <div class="form-group">
                          <asp:Image ID="img_add_view_added_author" style="max-height: 95px;" ImageUrl="~/images/Your Book Preview.png" runat="server" />
                          <asp:LinkButton ID="lnk_remove_author_upload" runat="server" Visible="false" style="position : absolute; right: 8%; top : 60%;" OnClick="lnk_remove_author_upload_Click"><i class="ni ni-fat-remove text-danger" style="font-size : 32px;"></i></asp:LinkButton>
                      </div>
                    </div>
                    <div class="col-lg-7">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Add Cover</label>
                          <asp:FileUpload ID="file_add_upl_author_image" class="form-control" validationgroup="file_add_upl_author_validate_group" causesvalidation="true" runat="server" />
                          <asp:Label class="form-control" style="border: none" ID="lbl_link" runat="server"></asp:Label>
                          <asp:requiredfieldvalidator id="RequiredFieldValidator1"
                              controltovalidate="file_add_upl_author_image"
                              validationgroup="file_add_upl_author_validate_group"
                              errormessage="Author Image is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-2">
                      <div class="form-group">
                          <label class="form-control-label" for="input-username"> &nbsp </label>
                        <asp:Button ID="btn_add_upload_author" class="btn form-control btn-warning" style="float: right;" runat="server" Text="Upload" validationgroup="file_add_upl_author_validate_group" OnClick="btn_add_upload_author_Click"/>
                      </div>
                    </div>
                  </div>
                </div>
                  <hr />
                <h6 class="heading-small text-muted mb-4">New Author</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-5">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Author Name</label>
                        <asp:TextBox ID="txt_add_Author_Name" MaxLength="150" class="form-control" ValidationGroup="AddAuthorValidationGroup" placeholder="Enter Author Name" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="req_validator_Subscription_name"
                              controltovalidate="txt_add_Author_Name"
                              validationgroup="AddAuthorValidationGroup"
                              errormessage="Author Name is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-5">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Author Since</label>
                        <asp:TextBox ID="txt_add_Author_since" MaxLength="12" class="form-control" textmode="SingleLine" ValidationGroup="AddAuthorValidationGroup" placeholder="Eg :- 19-July" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="req_validator_author_since"
                              controltovalidate="txt_add_Author_since"
                              validationgroup="AddAuthorValidationGroup"
                              errormessage="Author Since is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                  </div>                                                     
              </div>
                <hr />
                <h6 class="heading-small text-muted mb-4">Author Description</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-12">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Description:</label>
                        <asp:TextBox ID="txt_add_author_Description" MaxLength="150" TextMode="MultiLine" class="form-control" ValidationGroup="AddAuthorValidationGroup" placeholder="Enter Subscription Description" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator6"
                              controltovalidate="txt_add_author_Description"
                              validationgroup="AddAuthorValidationGroup"
                              errormessage="Description is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                  </div>  
                </div>           
                <hr class="my-4" />
                <asp:Button ID="btn_add_author" class="btn btn-primary" style="float: right;" validationgroup="AddAuthorValidationGroup" runat="server" Text="Save" OnClick="btn_add_author_Click"/>                                                     
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Edit authors -->
    <div class="container-fluid mt--6" style="padding : 5px 30px; margin-bottom : 10em;" id="author_Edit_div" visible="false" runat="server">
      <div class="row">
        <div class="col-xl-10 order-xl-1">
          <div class="card">
            <div class="card-header">
              <div class="row align-items-center">
                <div class="col-10">
                  <h3 class="mb-0">Add New Author</h3>
                </div>
                <div class="col-2 text-center">
                    <asp:Button ID="btn_back_to_edit_Author_list" runat="server" class="btn btn-sm btn-primary" style="font-size : 14px;" Text="<< Back to list" CausesValidation="False" OnClick="btn_back_to_Author_list_Click"/>
                </div>
              </div>
            </div>
            <div class="card-body">
              <div>
                <h6 class="heading-small text-muted mb-4">Author Profile</h6>
                <div class="pl-lg-4">
                  <div class="row">
                   <div class="col-lg-2">
                      <div class="form-group">
                          <asp:Image ID="img_edit_view_added_author" style="max-height: 95px;" ImageUrl="~/images/Your Book Preview.png" runat="server" />
                          <asp:LinkButton ID="lnk_edit_remove_author_upload" runat="server" Visible="true" style="position : absolute; right: 8%; top : 60%;" OnClick="lnk_edit_remove_author_upload_Click"><i class="ni ni-fat-remove text-danger" style="font-size : 32px;"></i></asp:LinkButton>
                      </div>
                    </div>
                    <div class="col-lg-7">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Add Cover</label>
                          <asp:FileUpload ID="file_edit_upl_author_image" class="form-control" validationgroup="file_edit_upl_author_validate_group" Visible="false" causesvalidation="true" runat="server" />
                          <asp:Label class="form-control" style="border: none" ID="lbl_edit_link" runat="server"></asp:Label>
                          <asp:requiredfieldvalidator id="RequiredFieldValidator2"
                              controltovalidate="file_edit_upl_author_image"
                              validationgroup="file_edit_upl_author_validate_group"
                              errormessage="Author Image is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-2">
                      <div class="form-group">
                          <label class="form-control-label" for="input-username"> &nbsp </label>
                        <asp:Button ID="btn_edit_upload_author" class="btn form-control btn-warning" style="float: right;" Visible="false" runat="server" Text="Upload" validationgroup="file_edit_upl_author_validate_group" OnClick="btn_edit_upload_author_Click"/>
                      </div>
                    </div>
                  </div>
                </div>
                  <hr />
                <h6 class="heading-small text-muted mb-4">New Author</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-5">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Author Name</label>
                        <asp:TextBox ID="txt_edit_Author_Name" MaxLength="150" class="form-control" ValidationGroup="editAuthorValidationGroup" placeholder="Enter Author Name" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator3"
                              controltovalidate="txt_edit_Author_Name"
                              validationgroup="editAuthorValidationGroup"
                              errormessage="Author Name is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-5">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Author Since</label>
                        <asp:TextBox ID="txt_edit_Author_since" MaxLength="12" class="form-control" textmode="SingleLine" ValidationGroup="editAuthorValidationGroup" placeholder="Eg :- 19-July" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator4"
                              controltovalidate="txt_edit_Author_since"
                              validationgroup="editAuthorValidationGroup"
                              errormessage="Author Since is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                  </div>                                                     
              </div>
                <hr />
                <h6 class="heading-small text-muted mb-4">Author Description</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-12">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Description:</label>
                        <asp:TextBox ID="txt_edit_author_Description" MaxLength="150" TextMode="MultiLine" class="form-control" ValidationGroup="editAuthorValidationGroup" placeholder="Enter Subscription Description" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator5"
                              controltovalidate="txt_edit_author_Description"
                              validationgroup="editAuthorValidationGroup"
                              errormessage="Description is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                  </div>  
                </div>           
                <hr class="my-4" />
                <asp:Button ID="btn_edit_author" class="btn btn-primary" style="float: right;" validationgroup="editAuthorValidationGroup" runat="server" Text="Update" OnClick="btn_edit_author_Click"/>                                                     
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
