<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="Reading_Along.forgotpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
	<link href="favicon.png" rel="shortcut icon" type="image/x-icon" />
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="design/ForgotPassword/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="design/ForgotPassword/fonts/Linearicons-Free-v1.0.0/icon-font.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="design/ForgotPassword/css/util.css"/>
	<link rel="stylesheet" type="text/css" href="design/ForgotPassword/css/main.css"/>
<!--===============================================================================================-->
<style>
	.container-login100{
		background-position: center;
		background-size: cover;
		background-repeat: no-repeat;
	}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="limiter">
		<div class="container-login100" style="background-image: url('Design/Authethication/images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-65">
				<div id="get_Email_Section" runat="server" class="login100-form validate-form">
					<span class="login100-form-title p-b-33">
						Forgot Password!!!
					</span>
					<span class="login100-form-title p-b-33" style="font-size: 14px;">
						No worries just enter your registered Email ID below we will send you a verification mail. 
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                        <asp:TextBox ID="txt_get_email" class="input100" TextMode="Email" required="required" placeholder="Email" ValidationGroup="getEmail" runat="server"></asp:TextBox>
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
					<div class="container-login100-form-btn m-t-20">
						<asp:Button ID="btn_get_email" class="login100-form-btn" runat="server" ValidationGroup="getEmail" Text="Send OTP" OnClick="btn_get_email_Click" />
					</div>
				</div>
				<div id="verify_OTP_Section" runat="server" class="login100-form validate-form">
					<span class="login100-form-title p-b-33">
						Forgot Password!!!
					</span>
					<span class="login100-form-title p-b-33" style="font-size: 14px;">
						No worries just enter the OTP below which you received on your register email and reset your password.
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid OTP!!">
                        <asp:TextBox ID="txt_get_otp" class="input100" TextMode="Number" MaxLength="6" required="required" ValidationGroup="getOTP" placeholder="Enter OTP" runat="server"></asp:TextBox>
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
					<div class="container-login100-form-btn m-t-20">
						<asp:Button ID="btn_validate_OTP" class="login100-form-btn" ValidationGroup="getOTP" runat="server" Text="Verify" OnClick="btn_validate_OTP_Click" />
					</div>
				</div>
				<div id="get_new_pass_section" runat="server" class="login100-form validate-form">
					<span class="login100-form-title p-b-33">
						Forgot Password!!!
					</span>
					<span class="login100-form-title p-b-33" style="font-size: 14px;">
						No worries just enter your New Password below. 
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid new password">
                        <asp:TextBox ID="txt_get_new_pass" class="input100" TextMode="Password" required="required" placeholder="New Password" ValidationGroup="getNewPass" runat="server"></asp:TextBox>
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
					<asp:CompareValidator runat="server" id="cmp_pwd" controltovalidate="txt_re_enter_new_pass" controltocompare="txt_get_new_pass" operator="Equal" type="String" errormessage="Password Do Not Match!" />
					<div class="wrap-input100 validate-input" data-validate = "Valid re-enter password">
                        <asp:TextBox ID="txt_re_enter_new_pass" class="input100" TextMode="Password" required="required" placeholder="Re-Enter Password" ValidationGroup="getNewPass" runat="server"></asp:TextBox>
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
					<div class="container-login100-form-btn m-t-20">
                        <asp:Button ID="btn_change_pass" class="login100-form-btn" runat="server" ValidationGroup="getNewPass" Text="Change" OnClick="btn_change_pass_Click" />
					</div>
				</div>
			</div>
		</div>
	</div> 
    </form>
</body>
</html>
