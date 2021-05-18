<%@ Page Title="" Language="C#" MasterPageFile="~/admin-panel/HeaderSidebarFooter.Master" AutoEventWireup="true" CodeBehind="SubscriptionPlans.aspx.cs" Inherits="Reading_Along.admin_panel.SubscriptionPlans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="admin_dashboard_head" runat="server">
    <style>
        .validation_class{
            color : red;
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
                  <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                  <li class="breadcrumb-item active">Subscription</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content Subscription list -->
    <div class="container-fluid mt--6" id="Subscription_list_div" runat="server">
      <!-- Dark table -->
      <div class="row">
        <div class="col-12">
          <div class="card bg-default shadow">
              <div class="card-header bg-transparent row align-items-center">
                <div class="col-10">
                  <h3 class="text-white mb-0">All Subscription Plans</h3>
                </div>
                <div class="col-1 text-left">
                    <asp:Button ID="btn_add_SubscriptionPlans" runat="server" class="btn btn-sm btn-primary" Text="Add New Plan" OnClick="btn_add_SubscriptionPlans_Click"/>
                </div>
              </div>
            <div class="table-responsive">
              <table class="table align-items-center table-dark table-flush">
                <thead class="thead-dark text-white">
                  <tr>
                    <th scope="col" class="sort" data-sort="name">Subscription Name</th>
                    <th scope="col" class="sort" data-sort="name">Price</th>
                    <th scope="col" class="sort" data-sort="name">Accessible Books</th>
                    <th scope="col" class="sort" data-sort="name">Validity</th>
                    <th scope="col" class="sort" data-sort="name">Type</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody class="list">
                  <asp:Repeater ID="list_SubscriptionPlan_data"  runat="server">
                      <ItemTemplate>
                          <tr>
                            <th scope="row">
                              <div class="media align-items-center">
                                <div class="media-body">
                                    <%# Eval("SubscriptionName") %>
                                </div>
                              </div>
                            </th>
                            <td><%# Eval("SubscriptionPrice") %></td>
                            <td><%# Eval("NoOfBooksAccess") %></td>
                            <td><%# Eval("NoOfDays") %></td>
                            <td><%# Eval("SubscriptionType") %></td>
                            <td class="text-right">
                              <div class="dropdown">
                                <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  <i class="fas fa-ellipsis-v"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                  <a class="dropdown-item" href="<%# Eval("ID", "SubscriptionPlans.aspx?edit_SubscriptionPlans_ID={0}") %>">View / Edit Plans</a>
                                  <a class="dropdown-item" href="<%# Eval("ID", "SubscriptionPlans.aspx?remove_SubscriptionPlans_ID={0}") %>">Delete</a>
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
    </div>
    <!-- add Subscription -->
    <div class="container-fluid mt--6" style="padding : 5px 30px; margin-bottom : 10em;" id="Subscription_add_div" visible="false" runat="server">
      <div class="row">
        <div class="col-xl-10 order-xl-1">
          <div class="card">
            <div class="card-header">
              <div class="row align-items-center">
                <div class="col-10">
                  <h3 class="mb-0">Add New Subscription</h3>
                </div>
                <div class="col-2 text-center">
                    <asp:Button ID="btn_back_to_Subscription_list" runat="server" class="btn btn-sm btn-primary" style="font-size : 14px;" Text="<< Back to list" CausesValidation="False" OnClick="btn_back_to_Subscription_list_Click"/>
                </div>
              </div>
            </div>
            <div class="card-body">
              <div>
                <h6 class="heading-small text-muted mb-4">Subscription Plan</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Subscription Name</label>
                        <asp:TextBox ID="txt_add_Subscription_Name" MaxLength="150" class="form-control" ValidationGroup="AddSubscriptionValidationGroup" placeholder="Enter Subscription Name" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="req_validator_Subscription_name"
                              controltovalidate="txt_add_Subscription_Name"
                              validationgroup="AddSubscriptionValidationGroup"
                              errormessage="Subscription Name is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Subscription Price (In ₹)</label>
                        <asp:TextBox ID="txt_add_Subscription_Price" MaxLength="10" class="form-control" TextMode="Number" ValidationGroup="AddSubscriptionValidationGroup" placeholder="Enter Subscription Price" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="req_validator_Subscription_price"
                              controltovalidate="txt_add_Subscription_Price"
                              validationgroup="AddSubscriptionValidationGroup"
                              errormessage="Price is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Subscription Type</label>
                          <asp:DropDownList ID="drp_Subscription_Type" validationgroup="AddSubscriptionValidationGroup" class="form-control" runat="server">
                              <asp:ListItem>--Select--</asp:ListItem>
                              <asp:ListItem>Monthly</asp:ListItem>
                              <asp:ListItem>Quarterly</asp:ListItem>
                              <asp:ListItem>Yearly</asp:ListItem>
                          </asp:DropDownList>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator2"
                              controltovalidate="drp_Subscription_Type"
                              validationgroup="AddSubscriptionValidationGroup"
                              errormessage="Subscription Type is required." 
                              InitialValue="--Select--"
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                  </div>                                                     
              </div>
                <hr />
                <h6 class="heading-small text-muted mb-4">Subscription Description</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-12">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Description:</label>
                        <asp:TextBox ID="txt_add_Subscription_Description" MaxLength="150" TextMode="MultiLine" class="form-control" ValidationGroup="AddSubscriptionValidationGroup" placeholder="Enter Subscription Description" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator6"
                              controltovalidate="txt_add_Subscription_Description"
                              validationgroup="AddSubscriptionValidationGroup"
                              errormessage="Description Name is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                  </div>  
                </div>
                <hr />                
                <h6 class="heading-small text-muted mb-4">Subscription Conditions</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">No Of Accesible Books</label>
                        <asp:TextBox ID="txt_add_Accesible_Books" MaxLength="150" class="form-control" ValidationGroup="AddSubscriptionValidationGroup" placeholder="Enter Subscription Name" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator3"
                              controltovalidate="txt_add_Accesible_Books"
                              validationgroup="AddSubscriptionValidationGroup"
                              errormessage="No Of Books is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Validity (No. Of Days)</label>
                        <asp:TextBox ID="txt_add_validity" MaxLength="10" class="form-control" TextMode="Number" ValidationGroup="AddSubscriptionValidationGroup" placeholder="Enter Subscription Price" runat="server"></asp:TextBox>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator4"
                              controltovalidate="txt_add_validity"
                              validationgroup="AddSubscriptionValidationGroup"
                              errormessage="Validity no. of days is required."
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Subscription Tag</label>
                          <asp:DropDownList ID="drp_subscription_tag" validationgroup="AddSubscriptionValidationGroup" class="form-control" runat="server">
                              <asp:ListItem>--Select--</asp:ListItem>
                              <asp:ListItem>Best Selling</asp:ListItem>
                              <asp:ListItem>Most Recommended</asp:ListItem>
                              <asp:ListItem>Best Value</asp:ListItem>
                          </asp:DropDownList>
                          <asp:requiredfieldvalidator id="Requiredfieldvalidator5"
                              controltovalidate="drp_subscription_tag"
                              validationgroup="AddSubscriptionValidationGroup"
                              errormessage="Subscription Tag is required." 
                              InitialValue="--Select--"
                              class="validation_class"
                              runat="Server">
                            </asp:requiredfieldvalidator>
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4" />
                <asp:Button ID="btn_add_SubscriptionPlan" class="btn btn-primary" style="float: right;" validationgroup="AddSubscriptionValidationGroup" runat="server" Text="Save" OnClick="btn_add_SubscriptionPlan_Click"/>                                                     
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
