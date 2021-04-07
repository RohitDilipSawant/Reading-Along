<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Reading_Along.Admin_Panel.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    	<title>Reading Along | Admin Login</title>
	<link href="../favicon.jpg" rel="shortcut icon" type="image/x-icon" />
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="Admin_Design/Authethication/vendor/bootstrap/css/bootstrap.min.css"/>
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="Admin_Design/Authethication/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="Admin_Design/Authethication/fonts/iconic/css/material-design-iconic-font.min.css"/>
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="Admin_Design/Authethication/css/util.css"/>
		<link rel="stylesheet" type="text/css" href="Admin_Design/Authethication/css/main.css"/>
	<!--===============================================================================================-->
	<style>
	 #btn_Admin_Login:hover{
		 cursor : pointer;
	 }
	</style>
</head>
<body>
    <form id="form1" runat="server">
                <div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form validate-form">
					<span class="login100-form-title p-b-26">
						Welcome
					</span>
					<span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-font"></i>
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
						<asp:TextBox ID="txt_Uname" class="input100" type="text" name="username" runat="server"></asp:TextBox>
						<span class="focus-input100" data-placeholder="Email"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<asp:TextBox ID="txt_Pwd" class="input100" type="password" name="pass" runat="server"></asp:TextBox>
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
                            <asp:Button ID="btn_Admin_Login" class="login100-form-btn" Style="background-color : #000;" runat="server" Text="Log In" OnClick="btn_Admin_Login_Click" />
						</div>
					</div>

					<div class="text-center p-t-115">
						<span class="txt1">
							Don’t have an account?
						</span>

						<a class="txt2" href="#">
							Sign Up
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->
	<script src="Admin_Design/Authethication/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--====================================-->
	<script src="Admin_Design/Authethication/js/main.js"></script>
    </form>
</body>
</html>
