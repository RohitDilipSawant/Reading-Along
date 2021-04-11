<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Reading_Along.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reading Along | Signup</title>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link href="favicon.png" rel="shortcut icon" type="image/x-icon" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Design/Authethication/vendor/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="Design/Authethication/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="Design/Authethication/fonts/Linearicons-Free-v1.0.0/icon-font.min.css"/>
	<link rel="stylesheet" type="text/css" href="Design/Authethication/css/util.css"/>
	<link rel="stylesheet" type="text/css" href="Design/Authethication/css/main.css"/>
<!--===============================================================================================-->
	<style>
		 #btn_Sign_In:hover{
			 cursor : pointer;
		 }
		 .input100{
			 height: 40px;
			 font-size : 16px;
		 }

		 .txt2{
			 color: #000;
		 }
	</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="limiter">
		<div class="container-login100" style="background-image: url('Design/Authethication/images/bg-01.jpg');">
			<div class="wrap-login100 p-l-80 p-r-80 p-t-45 p-b-45">
				<div class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-20">
						Sign Up Now
					</span>
					<hr />
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
							<div class="p-t-13 p-b-9">
								<span class="txt2">
									First Name
								</span>
							</div>
							<div class="wrap-input100 validate-input" data-validate = "Username is required">
								<asp:TextBox ID="txt_fname" class="input100" type="text" name="email" MaxLength="40" runat="server" required="required"></asp:TextBox>
								<span class="focus-input100"></span>
							</div>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
							<div class="p-t-13 p-b-9">
								<span class="txt2">
									Last Name
								</span>
							</div>
							<div class="wrap-input100 validate-input" data-validate = "Username is required">
								<asp:TextBox ID="txt_lname" class="input100" type="text" name="email" MaxLength="40" runat="server" required="required"></asp:TextBox>
								<span class="focus-input100"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
							<div class="p-t-17 p-b-9">
						<span class="txt2">
							Username
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Username is required">
                        <asp:TextBox ID="txt_User_Name" class="input100" type="text" name="username" MaxLength="20" placeholder="Username" runat="server" required="required"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
							<div class="p-t-17 p-b-9">
						<span class="txt2">
							Phone No.
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Username is required">
                        <asp:TextBox ID="txt_phone" class="input100" type="Phone" name="username" MaxLength="10" MinLength="10" placeholder="830 8787 756"
  pattern="[0-9]{10}" runat="server" required="required" ></asp:TextBox>
						<span class="focus-input100"></span>
					</div>
						</div>
					</div>
					<div class="p-t-17 p-b-9">
						<span class="txt2">
							Email
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Username is required">
                        <asp:TextBox ID="txt_email" class="input100" type="email" name="username" MaxLength="80" placeholder="xyz@domain.com" runat="server" ></asp:TextBox>
						<span class="focus-input100"></span>
					</div>
					
					<div class="row p-b-9">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
							<div class="p-t-17 p-b-9">
								<span class="txt2">
									Password
								</span>
							</div>
							<div class="wrap-input100 validate-input" data-validate = "Password is required">
								<asp:TextBox ID="txt_Pwd" class="input100" type="password" placeholder="Password" name="pass" MaxLength="16" MinLength="4" runat="server" required="required"></asp:TextBox>
								<span class="focus-input100"></span>
							</div>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
							<div class="p-t-17 p-b-9">
								<span class="txt2">
									Confirm Password
								</span>
							</div>
							<div class="wrap-input100 validate-input" data-validate = "Password is required">
								<asp:TextBox ID="txt_Re_Pwd" class="input100" type="password" placeholder="Re-Password" name="pass" MaxLength=" 16" runat="server" required="required"></asp:TextBox>
								<span class="focus-input100"></span>
							</div>
						</div>
					</div>
					<asp:CompareValidator runat="server" id="cmp_pwd" controltovalidate="txt_Re_Pwd" controltocompare="txt_Pwd" operator="Equal" type="String" errormessage="Password Do Not Match!" /><br />

					<div class="container-login100-form-btn m-t-13 p-b-17">
                        <asp:Button ID="btn_Sign_In" class="login100-form-btn" runat="server" Text="Sign In" OnClick="btn_Sign_In_Click" />
					</div>
					<div class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-15" style="font-size: 30px;">
						----- OR -----
					</span>

					<a href="#" class="btn-face m-b-10">
						<i class="fa fa-facebook-official"></i>
						Facebook
					</a>

					<a href="#" class="btn-google m-b-10">
						<img src="Design/Authethication/images/icons/icon-google.png" alt="GOOGLE"/>
						Google
					</a>
						</div>
					<div class="w-full text-center p-t-13">
						<span class="txt1">
							already a member?
						</span>

						<a href="Login.aspx" class="txt1 bo1">
							Log In now
						</a>
					</div>
					<div class="w-full text-center p-t-15">
						<a href="Index.aspx" class="txt2 p-t-15" style="font-size: 2em;">
							Not Now >>>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
    </form>
</body>
</html>
