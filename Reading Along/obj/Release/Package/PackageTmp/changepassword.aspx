<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="Reading_Along.changepassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reading Along</title>
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
            <p class="text-white mt-0 mb-5">Here You can change your password. Make sure you should not share your password with anyone. anyone from reading along will never ask you for your account password or suggest you to change the same.</p>
            <a href="Index.aspx" class="btn btn-neutral">Home</a>
            <a href="logout.aspx" class="btn btn-primary">Logout</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content -->
    <div class="container-fluid mt--6" style="padding : 5px 30px; margin-bottom : 10em;">
      <div class="row">
        <div class="col-xl-8 order-xl-1">
          <div class="card">
            <div class="card-header">
              <div class="row align-items-center">
                <div class="col-10">
                  <h3 class="mb-0">Change Password </h3>
                </div>
                <div class="col-2 text-right">
                  <a href="myaccount.aspx" class="btn btn-sm btn-primary" style="padding : 10px 30px;"> < Go Back</a>
                </div>
              </div>
            </div>
            <div class="card-body">
              <div>
                <h6 class="heading-small text-muted mb-4">Change Password</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_old_pass">Old Password</label>
                        <asp:TextBox ID="txt_old_pass" class="form-control" TextMode="Password" MaxLength="16" placeholder="Old Password"  runat="server" required="required"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_old_pass">&nbsp</label>
                        <asp:Label ID="lbl_old_pass_error" class="form-control" runat="server" Text="" Style="color:#ff0000; font-weight: bold; border: none;"></asp:Label>
                      </div>
                    </div>
                      
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_pass">New Password</label>
                          <asp:TextBox ID="txt_new_pass" class="form-control" TextMode="Password" MaxLength="16" placeholder="New Password" runat="server" required="required"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="txt_re_pass">Re-Enter New Password</label>
                          <asp:TextBox ID="txt_re_pass" class="form-control" TextMode="Password" MaxLength="16"  placeholder="Re-Enter New Password" runat="server" required="required"></asp:TextBox>
                      </div>
                    </div>
                      <asp:CompareValidator runat="server" id="cmp_change_pwd" controltovalidate="txt_re_pass" controltocompare="txt_new_pass" operator="Equal" type="String" errormessage="Password Do Not Match!" />
                  </div>
                </div>
                <hr class="my-4" />
                <!-- Address -->
                </div>
                <asp:Button ID="btn_change_pass" class="btn btn-primary" style="float: left;" runat="server" Text="Change" OnClick="btn_change_pass_Click" />
                </div>
              </div>
            </div>
          </div>
        </div>
        <asp:Timer ID="session_timer" runat="server" Interval="60000" OnTick="session_timer_Tick"></asp:Timer>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  <!-- Argon JS -->
  <script src="Design/profile/assets/js/argon.js?v=1.2.0"></script>
    </form>
</body>
</html>
