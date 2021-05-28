<%@ Page Title="" Language="C#" MasterPageFile="~/admin-panel/HeaderSidebarFooter.Master" AutoEventWireup="true" CodeBehind="ProductCategory.aspx.cs" Inherits="Reading_Along.admin_panel.ProductCategory" %>
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
                  <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                  <li class="breadcrumb-item active">Category</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content category & sub-category list -->
    <div class="container-fluid mt--6" id="category_list_div" runat="server">
      <!-- Dark table -->
      <div class="row">
        <div class="col-6">
          <div class="card bg-default shadow">
              <div class="card-header bg-transparent row align-items-center">
                <div class="col-9">
                  <h3 class="text-white mb-0">All Category</h3>
                </div>
                <div class="col-3 text-right">
                    <asp:Button ID="btn_add_category" runat="server" class="btn btn-sm btn-primary" Text="Add Category" OnClick="btn_add_category_Click"/>
                </div>
              </div>
            <div class="table-responsive">
              <table class="table align-items-center table-dark table-flush">
                <thead class="thead-dark text-white">
                  <tr>
                    <th scope="col" class="sort" data-sort="name">Categories</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody class="list">
                  <asp:Repeater ID="list_Category_data"  runat="server">
                      <ItemTemplate>
                          <tr>
                            <th scope="row">
                              <div class="media align-items-center">
                                <div class="media-body">
                                    <%# Eval("Category") %>
                                </div>
                              </div>
                            </th>
                            <td class="text-right">
                              <div class="dropdown">
                                <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  <i class="fas fa-ellipsis-v"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                  <a class="dropdown-item" href="<%# Eval("ID", "ProductCategory.aspx?remove_Category_ID={0}") %>">Delete</a>
                                </div>
                              </div>
                            </td>
                          </tr>
                      </ItemTemplate>
                  </asp:Repeater>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="col-6">
          <div class="card bg-default shadow">
              <div class="card-header bg-transparent row align-items-center">
                <div class="col-9">
                  <h3 class="text-white mb-0">All Sub-Category</h3>
                </div>
                <div class="col-3 text-right">
                    <asp:Button ID="btn_add_sub_category" runat="server" class="btn btn-sm btn-warning" Text="Add Sub Category" OnClick="btn_add_sub_category_Click"/>
                </div>
              </div>
            <div class="table-responsive">
              <table class="table align-items-center table-dark table-flush">
                <thead class="thead-dark text-white">
                  <tr>
                    <th scope="col" class="sort" data-sort="name">Categories</th>
                    <th scope="col" class="sort" data-sort="name">Sub Categories</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody class="list">
                  <asp:Repeater ID="list_subCategory_data"  runat="server">
                      <ItemTemplate>
                          <tr>
                            <th scope="row">
                              <div class="media align-items-center">
                                <div class="media-body">
                                    <%# Eval("SubCategory") %>
                                </div>
                              </div>
                            </th>
                            <td>
                              <%# Eval("CategoryName") %>
                            </td>
                            <td class="text-right">
                              <div class="dropdown">
                                <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  <i class="fas fa-ellipsis-v"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                  <a class="dropdown-item" href="<%# Eval("ID", "ProductCategory.aspx?remove_SubCategory_ID={0}") %>">Delete</a>
                                </div>
                              </div>
                            </td>
                          </tr>
                      </ItemTemplate>
                  </asp:Repeater>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        
      </div>
    </div>
    <!-- add category -->
    <div class="container-fluid mt--6" style="padding : 5px 30px; margin-bottom : 10em;" id="Category_add_div" visible="false" runat="server">
      <div class="row">
        <div class="col-xl-10 order-xl-1">
          <div class="card">
            <div class="card-header">
              <div class="row align-items-center">
                <div class="col-10">
                  <h3 class="mb-0">Add New Category</h3>
                </div>
                <div class="col-2 text-center">
                    <asp:Button ID="btn_back_to_user_list" runat="server" class="btn btn-sm btn-primary" style="font-size : 14px;" Text="<< Back to Category list" CausesValidation="False" OnClick="btn_back_to_category_list_Click"/>
                </div>
              </div>
            </div>
            <div class="card-body">
              <div>
                <h6 class="heading-small text-muted mb-4">Category</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Enter Category</label>
                        <asp:TextBox ID="txt_add_Category_Name" MaxLength="150" class="form-control" ValidationGroup="AddCategoryValidationGroup" placeholder="Category Name" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="req_validator_Category_name"
                              controltovalidate="txt_add_Category_Name"
                              validationgroup="AddCategoryValidationGroup"
                              errormessage="Category Name is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                  </div>
                <hr class="my-4" />
                  <asp:Button ID="btn_add_book_details" class="btn btn-primary" style="float: right;" validationgroup="AddCategoryValidationGroup" runat="server" Text="Save" OnClick="btn_add_book_details_Click"/>                                                     
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
    <!-- add Sub category -->
    <div class="container-fluid mt--6" style="padding : 5px 30px; margin-bottom : 10em;" id="sub_Category_add_div" visible="false" runat="server">
      <div class="row">
        <div class="col-xl-10 order-xl-1">
          <div class="card">
            <div class="card-header">
              <div class="row align-items-center">
                <div class="col-10">
                  <h3 class="mb-0">Add New Sub-Category</h3>
                </div>
                <div class="col-2 text-center">
                    <asp:Button ID="btn_back_list" runat="server" class="btn btn-sm btn-primary" style="font-size : 14px;" Text="<< Back to Category list" CausesValidation="False" OnClick="btn_back_to_category_list_Click"/>
                </div>
              </div>
            </div>
            <div class="card-body">
              <div>
                <h6 class="heading-small text-muted mb-4">Sub Category</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Add Sub-Category</label>
                        <asp:TextBox ID="txt_add_sub_Category_Name" MaxLength="150" class="form-control" ValidationGroup="Addsub_CategoryValidationGroup" placeholder="Sub-Category Name" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator1"
                              controltovalidate="txt_add_sub_Category_Name"
                              validationgroup="Addsub_CategoryValidationGroup"
                              errormessage="Category Name is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                      <div class="col-lg-6">
                          <div class="form-group">
                        <label class="form-control-label" for="input-username">Parent Category</label>
                          <asp:DropDownList ID="drp_parent_category_name" runat="server" class="form-control" ValidationGroup="Addsub_CategoryValidationGroup" DataSourceID="sql_drp_parent_category_name" DataTextField="Category" DataValueField="ID">
                              <asp:ListItem Selected="True">--select--</asp:ListItem>
                          </asp:DropDownList>
                          <asp:SqlDataSource runat="server" ID="sql_drp_parent_category_name" ConnectionString='<%$ ConnectionStrings:Reading_Along_DB %>' SelectCommand="SELECT DISTINCT [Category],[ID] FROM [categories_db] ORDER BY [Category]"></asp:SqlDataSource>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator2"
                              controltovalidate="drp_parent_category_name"
                              validationgroup="Addsub_CategoryValidationGroup"
                              errormessage="Category Name is required."
                              InitialValue="--select--"
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                  </div>
                <hr class="my-4" />
                  <asp:Button ID="btn_add_subcategory" class="btn btn-primary" style="float: right;" validationgroup="Addsub_CategoryValidationGroup" runat="server" Text="Save" OnClick="btn_add_subcategory_Click"/>                                                     
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
</asp:Content>
