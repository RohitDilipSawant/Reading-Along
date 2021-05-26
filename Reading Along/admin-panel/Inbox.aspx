<%@ Page Title="" Language="C#" MasterPageFile="~/admin-panel/HeaderSidebarFooter.Master" AutoEventWireup="true" CodeBehind="Inbox.aspx.cs" Inherits="Reading_Along.admin_panel.Inbox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="admin_dashboard_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="admin_dashboard_body" runat="server">
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
                  <li class="breadcrumb-item active">Inbox</li>
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
                  <h3 class="text-white mb-0">All Messages</h3>
                </div>
                <%--<div class="col-2 text-right">
                    <asp:Button ID="btn_add_message_section" runat="server" class="btn btn-sm btn-neutral" Text="Add Author"/>
                </div>--%>
              </div>
            <div class="table-responsive">
              <table class="table align-items-center table-dark table-flush">
                <thead class="thead-dark text-white">
                  <tr>
                    <th scope="col" class="sort" data-sort="name">Name</th>
                    <th scope="col" class="sort" data-sort="name">Email</th>
                    <th scope="col" class="sort" data-sort="budget">Phone</th>
                    <th scope="col" class="sort" data-sort="status">Subject</th>
                    <th scope="col" class="sort" data-sort="status">Comment</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody class="list">
                  <asp:Repeater ID="list_inbox_data"  runat="server">
                      <ItemTemplate>
                          <tr>
                            <th scope="row">
                              <div class="media align-items-center">
                                <div class="media-body">
                                    <%# Eval("MessengerName") %>
                                </div>
                              </div>
                            </th>
                            <td>
                              <%# Eval("MessengerEmail") %>
                            </td>
                            <td>
                              <%# Eval("MessengerPhone") %>
                            </td>
                            <td>
                              <%# Eval("MessengerSubject") %>
                            </td>
                            <td>
                              <p><%# Eval("MessangerComment") %></p>
                            </td>

                            <td class="text-right">
                              <div class="dropdown">
                                <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  <i class="fas fa-ellipsis-v"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                  <%--<a class="dropdown-item" href="<%# Eval("ID", "Inbox.aspx?view_comment_ID={0}") %>">View / Edit</a>--%>
                                  <a class="dropdown-item" href="<%# Eval("ID", "Inbox.aspx?remove_comment_ID={0}") %>">Delete</a>
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
</asp:Content>
