<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myaccount.aspx.cs" Inherits="Reading_Along.myaccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Reading Along | My Account</title>
  <!-- Favicon -->
  <link rel="icon" href="favicon.png" type="image/png"/>
  <!-- Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"/>
  <!-- Argon CSS -->
  <link rel="stylesheet" href="Design/profile/assets/css/argon.css?v=1.2.0" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
          <!-- Main content -->
    <!-- Header -->
    <div class="header pb-6 d-flex align-items-center" style="min-height: 500px; background-image: url(Design/profile/assets/img/theme/profile-cover.jpg); background-size: cover; background-position: center top; padding: 10px 30px;">
      <!-- Mask -->
      <span class="mask bg-gradient-default opacity-8"></span>
      <!-- Header container -->
      <div class="container-fluid d-flex align-items-center">
        <div class="row">
          <div class="col-lg-7 col-md-10">
            <h1 class="display-2 text-white">Hello, <asp:Label ID="lbl_user_name" runat="server" Text=""></asp:Label></h1>
            <p class="text-white mt-0 mb-5">This is your profile page. You can see your profile details and can manage it as well.</p>
            <a href="Index.aspx" class="btn btn-neutral">Home</a>
            <a href="logout.aspx" class="btn btn-primary">Logout</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content -->
    <div class="container-fluid mt--6" style="padding : 5px 30px; margin-bottom : 10em;">
      <div class="row">
        <div class="col-xl-4 order-xl-2">
          <div class="card card-profile">
            <img src="Design/profile/assets/img/theme/img-1-1000x600.jpg" alt="Image placeholder"/>
            <div class="row justify-content-center">
              <div class="col-lg-3 order-lg-2">
                <div class="card-profile-image">
                  <a href="#">
                      <asp:Image ID="img_profile" class="rounded-circle" runat="server" />
                  </a>
                </div>
              </div>
            </div>
            <div class="card-header text-left border-0 pt-8 pt-md-4 pb-0 pb-md-4">
              <div class="d-flex justify-content-between">
                <a href="#" class="btn btn-sm btn-default float-left">Message</a>
              </div>
            </div>
            <div class="card-body pt-0">
              <div class="row">
                <div class="col">
                  <div class="card-profile-stats d-flex justify-content-center">
                    <div>
                      <span class="heading"><asp:Label ID="lbl_books_access" runat="server" Text="0"></asp:Label></span>
                      <span class="description">Books Access</span>
                    </div>
                    <div>
                      <span class="heading">89</span>
                      <span class="description">Days Remaining</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="text-center">
                <h5 class="h3">
                    <asp:Label ID="lbl_user_name_2" runat="server" Text="Label" Style="font-size: 24px"></asp:Label><span class="font-weight-light"></span>
                </h5>
                <div class="h5 font-weight-300">
                  <i class="ni location_pin mr-2"></i>
                    <asp:Label ID="lbl_location" runat="server" Text="Label" Style="font-size: 18px"></asp:Label>
                </div>
                <div class="h5 mt-4">
                  <i class="ni business_briefcase-24 mr-2"></i>
                    <asp:Label ID="lbl_designation" runat="server" Text="Label" Style="font-size: 18px"></asp:Label> 
                </div>
                <div>
                  <i class="ni education_hat mr-2"></i>
                    <asp:Label ID="lbl_qulification" runat="server" Text="Label" Style="font-size: 16px"></asp:Label>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-8 order-xl-1">
          <div class="card">
            <div class="card-header">
              <div class="row align-items-center">
                <div class="col-6">
                  <h3 class="mb-0">Edit profile </h3>
                </div>
                <div class="col-3 text-right">
                  <a href="mysubscription.aspx" class="btn btn-sm btn-primary" style="color: #fff; padding : 5% 21%;">My Subscription</a>
                </div>
                <div class="col-3 text-right">
                    <a href="changepassword.aspx" class="btn btn-sm btn-primary" style="background-color:#808080; padding : 5% 21%; border-color: #fff;">Chage Password</a>
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
                        <asp:TextBox ID="txt_my_Username" MaxLength="50" class="form-control" placeholder="Username" value="Username" runat="server" readonly="true"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">Email address</label>
                          <asp:TextBox ID="txt_my_email" MaxLength="100" class="form-control" placeholder="Email ID" value="Email ID" runat="server" readonly="true"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name">First name</label>
                          <asp:TextBox ID="txt_f_name" class="form-control" placeholder="First name" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-last-name">Last name</label>
                          <asp:TextBox ID="txt_l_name" class="form-control" placeholder="Last name" runat="server"></asp:TextBox>
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
                          <asp:TextBox ID="txt_phone" class="form-control" placeholder="Phone No" textmode="Phone" MaxLength="10" MinLength="10" runat="server"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">Address</label>
                          <asp:TextBox ID="txt_address" class="form-control" placeholder="Home Address" value="Nerul, Navi Mumbai" textmode="MultiLine" runat="server"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-3">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_city">City</label>
                          <asp:TextBox ID="txt_city" class="form-control" placeholder="City" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-3">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_state">State</label>
                          <asp:TextBox ID="txt_state" class="form-control" placeholder="State" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-3">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_country">Country</label>
                          <asp:TextBox ID="txt_country" class="form-control" placeholder="Country" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-3">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_pin_code">Postal code</label>
                          <asp:TextBox ID="txt_pin_code" class="form-control" TextMode="Number" placeholder="Postal code" runat="server"></asp:TextBox>
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
                          <asp:TextBox ID="txt_designation" class="form-control" placeholder="Designation" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-last-name">Qulification</label>
                          <asp:TextBox ID="txt_qulification" class="form-control" placeholder="Qulification" runat="server"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="pl-lg-4">
                  <div class="form-group">
                    <label class="form-control-label">About Me</label>
                      <asp:TextBox ID="txt_about_user" textmode="MultiLine" rows="4" class="form-control" placeholder="A few words about you ..." runat="server"></asp:TextBox>
                  </div>
                </div>
                  <asp:Button ID="btn_save_details" class="btn btn-primary" style="float: right;" runat="server" Text="Save" OnClick="btn_save_details_Click" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  <!-- Argon JS -->
  <script src="Design/profile/assets/js/argon.js?v=1.2.0"></script>
    </form>
</body>
</html>
