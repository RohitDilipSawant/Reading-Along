<%@ Page Title="" Language="C#" MasterPageFile="~/admin-panel/HeaderSidebarFooter.Master" AutoEventWireup="true" CodeBehind="RegisteredUser.aspx.cs" Inherits="Reading_Along.admin_panel.RegisteredUser" %>
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
                  <li class="breadcrumb-item"><a href="#">Tables</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Tables</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content user list -->
    <div class="container-fluid mt--6" id="user_list_div" runat="server">
      <!-- Dark table -->
      <div class="row">
        <div class="col">
          <div class="card bg-default shadow">
              <div class="card-header bg-transparent row align-items-center">
                <div class="col-11">
                  <h3 class="text-white mb-0">Registered Users </h3>
                </div>
                <div class="col-1 text-left">
                    <asp:Button ID="btn_add_user" runat="server" class="btn btn-sm btn-neutral" Text="Add User" OnClick="btn_add_user_Click" />
                </div>
              </div>
            <div class="table-responsive">
              <table class="table align-items-center table-dark table-flush">
                <thead class="thead-dark text-white">
                  <tr>
                    <th scope="col" class="sort" data-sort="name">Username</th>
                    <th scope="col" class="sort" data-sort="budget">Name</th>
                    <th scope="col" class="sort" data-sort="status">Email</th>
                    <th scope="col" data-sort="budget">Phone</th>
                    <th scope="col" class="sort" data-sort="budget">Role</th>
                    <th scope="col" class="sort" data-sort="status">State</th>
                    <th scope="col" class="sort" data-sort="status">Postal Code</th>
                    <th scope="col" class="sort" data-sort="status">Subscription</th>
                    <th scope="col" class="sort" data-sort="status">Status</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody class="list">
                  <asp:Repeater ID="list_users_data"  runat="server">
                      <ItemTemplate>
                          <tr>
                            <th scope="row">
                              <div class="media align-items-center">
                                <div class="media-body">
                                  <span class="name mb-0 text-sm"><%# Eval("Username") %></span>
                                </div>
                              </div>
                            </th>
                            <td class="budget">
                              <%# Eval("F_Name") %> <%# Eval("L_Name") %>
                            </td>
                            <td>
                                <%# Eval("Email_ID") %>
                            </td>
                            <td>
                              <%# Eval("Phone_no") %>
                            </td>
                            <td>
                              Customer
                            </td>
                            <td>
                                <%# Eval("State") %>
                            </td>
                            <td class="budget">
                              <%# Eval("Postal_Code") %>
                            </td>
                            <td>
                              <%# Eval("User_Subscription") %>
                            </td>
                            <td>
                              <span class="badge badge-dot mr-4">
                                 <%--<% if (Eval("Verification_Status").ToString() == "Verified") { %>
                                  <i class="bg-success"></i>
                                  <% }%>
                                  <% if (Eval("Verification_Status").ToString() == "Pending") { %>
                                  <i class="bg-danger"></i>
                                  <% }%>
                                  <% else{ %>
                                  <i class="bg-warning"></i>
                                  <% }%>--%>
                                  <i class="bg-success"></i>
                                <span class="status" id="user_status_span"><%# Eval("Verification_Status") %></span>
                              </span>
                            </td>
                            <td class="text-right">
                              <div class="dropdown">
                                <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  <i class="fas fa-ellipsis-v"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                  <a class="dropdown-item" href="<%# Eval("ID", "RegisteredUser.aspx?edit_user_ID={0}") %>">View / Edit</a>
                                  <a class="dropdown-item" href="<%# Eval("ID", "RegisteredUser.aspx?remove_user_ID={0}") %>">Delete</a>
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
    <!-- Page content user add-->
    <div class="container-fluid mt--6" style="padding : 5px 30px; margin-bottom : 10em;" id="user_add_div" runat="server">
      <div class="row">
        <div class="col-xl-10 order-xl-1">
          <div class="card">
            <div class="card-header">
              <div class="row align-items-center">
                <div class="col-10">
                  <h3 class="mb-0">Add User profile </h3>
                </div>
                <div class="col-2 text-center">
                    <asp:Button ID="btn_back_to_user_list" runat="server" class="btn btn-sm btn-primary" style="font-size : 14px;" Text="<< Back to user list" OnClick="btn_back_to_user_list_Click" />
                </div>
              </div>
            </div>
            <div class="card-body">
              <div>
                <h6 class="heading-small text-muted mb-4">User information</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Username</label>
                        <asp:TextBox ID="txt_add_Username" MaxLength="50" class="form-control" placeholder="Username" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">Email address</label>
                          <asp:TextBox ID="txt_add_email" MaxLength="100" class="form-control" placeholder="Email ID" runat="server"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Create Password</label>
                        <asp:TextBox ID="txt_add_pwd" MaxLength="20" TextMode="Password" class="form-control" placeholder="Password" runat="server"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name">First name</label>
                          <asp:TextBox ID="txt_add_f_name" class="form-control" placeholder="First name" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-last-name">Last name</label>
                          <asp:TextBox ID="txt_add_l_name" class="form-control" placeholder="Last name" runat="server"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4" />
                <!-- Address -->
                <h6 class="heading-small text-muted mb-4">Contact information</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">Phone No</label>
                          <asp:TextBox ID="txt_add_phone" class="form-control" placeholder="Phone No" textmode="Phone" MaxLength="10" MinLength="10" runat="server"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">Address</label>
                          <asp:TextBox ID="txt_add_address" class="form-control" placeholder="Home Address" value="Nerul, Navi Mumbai" textmode="MultiLine" runat="server"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-3">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_city">City</label>
                          <asp:TextBox ID="txt_add_city" class="form-control" placeholder="City" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-3">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_state">State</label>
                          <asp:TextBox ID="txt_add_state" class="form-control" placeholder="State" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-3">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_country">Country</label>
                          <asp:TextBox ID="txt_add_country" class="form-control" placeholder="Country" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-3">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_pin_code">Postal code</label>
                          <asp:TextBox ID="txt_add_pin_code" class="form-control" TextMode="Number" placeholder="Postal code" runat="server"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4" />
                <!-- Description -->
                <h6 class="heading-small text-muted mb-4">About me</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name">Designation</label>
                          <asp:TextBox ID="txt_add_designation" class="form-control" placeholder="Designation" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-last-name">Qulification</label>
                          <asp:TextBox ID="txt_add_qulification" class="form-control" placeholder="Qulification" runat="server"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="pl-lg-4">
                  <div class="form-group">
                    <label class="form-control-label">About Me</label>
                      <asp:TextBox ID="txt_add_about_user" textmode="MultiLine" rows="4" class="form-control" placeholder="A few words about you ..." runat="server"></asp:TextBox>
                  </div>
                </div>
                  <asp:Button ID="btn_add_user_save_details" class="btn btn-primary" style="float: right;" runat="server" Text="Add User" OnClick="btn_add_user_save_details_Click"/>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content User Edit -->
    <div class="container-fluid mt--6" style="padding : 5px 30px; margin-bottom : 10em;" id="user_edit_div" runat="server">
      <div class="row">
        <div class="col-xl-10 order-xl-1">
          <div class="card">
            <div class="card-header">
              <div class="row align-items-center">
                <div class="col-10">
                  <h3 class="mb-0">Edit profile</h3>
                </div>
                <div class="col-2 text-center">
                    <asp:Button ID="btn_edit_back_user_list" runat="server" class="btn btn-sm btn-primary" style="font-size : 14px;" Text="<< Back to user list" OnClick="btn_back_to_user_list_Click" />
                </div>
              </div>
            </div>
            <div class="card-body">
              <div>
                <h6 class="heading-small text-muted mb-4">User information</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Username</label>
                        <asp:TextBox ID="txt_edit_username" MaxLength="50" class="form-control" placeholder="Username" value="Username" runat="server" ReadOnly="true"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">Email address</label>
                          <asp:TextBox ID="txt_edit_email" MaxLength="100" class="form-control" placeholder="Email ID" value="Email ID" runat="server" ReadOnly="true"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name">First name</label>
                          <asp:TextBox ID="txt_edit_fname" class="form-control" placeholder="First name" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-last-name">Last name</label>
                          <asp:TextBox ID="txt_edit_lname" class="form-control" placeholder="Last name" runat="server"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4" />
                <!-- Address -->
                <h6 class="heading-small text-muted mb-4">Contact information</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">Phone No</label>
                          <asp:TextBox ID="txt_edit_phone" class="form-control" placeholder="Phone No" textmode="Phone" MaxLength="10" MinLength="10" runat="server"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">Address</label>
                          <asp:TextBox ID="txt_edit_address" class="form-control" placeholder="Home Address" value="Nerul, Navi Mumbai" textmode="MultiLine" runat="server"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-3">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_city">City</label>
                          <asp:TextBox ID="txt_edit_city" class="form-control" placeholder="City" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-3">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_state">State</label>
                          <asp:TextBox ID="txt_edit_state" class="form-control" placeholder="State" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-3">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_country">Country</label>
                          <asp:TextBox ID="txt_edit_country" class="form-control" placeholder="Country" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-3">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_pin_code">Postal code</label>
                          <asp:TextBox ID="txt_edit_pinciode" class="form-control" TextMode="Number" placeholder="Postal code" runat="server"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4" />
                <!-- Description -->
                <h6 class="heading-small text-muted mb-4">About me</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name">Designation</label>
                          <asp:TextBox ID="txt_edit_designation" class="form-control" placeholder="Designation" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-last-name">Qulification</label>
                          <asp:TextBox ID="txt_edit_qulifications" class="form-control" placeholder="Qulification" runat="server"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="pl-lg-4">
                  <div class="form-group">
                    <label class="form-control-label">About Me</label>
                      <asp:TextBox ID="txt_edit_bio" textmode="MultiLine" rows="4" class="form-control" placeholder="A few words about you ..." runat="server"></asp:TextBox>
                  </div>
                </div>
                <hr class="my-4" />
                <!-- Description -->
                <h6 class="heading-small text-muted mb-4">Admin Secssion</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name"><b>Update Verification Status : </b><span id="status_print" runat="server"></span></label>
                          <asp:DropDownList ID="drp_status" class="form-control" runat="server">
                              <asp:ListItem Value="0">-- Select your City--</asp:ListItem>  
                              <asp:ListItem>Pending</asp:ListItem>
                              <asp:ListItem>Verified</asp:ListItem>
                          </asp:DropDownList>
                          <%--<asp:TextBox ID="txt_status" class="form-control" placeholder="Status" runat="server"></asp:TextBox>--%>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name">Update Subscription</label>
                        <asp:TextBox ID="txt_subscription" class="form-control" placeholder="Subscription" ReadOnly="true" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name">Total Book Access</label>
                          <asp:TextBox ID="txt_access_book" class="form-control" placeholder="Books Access" runat="server" ReadOnly="true"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                </div>
                  <asp:Button ID="btn_edit_profile" class="btn btn-primary" style="float: right;" runat="server" Text="Save" OnClick="btn_edit_profile_Click"/>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
</asp:Content>
