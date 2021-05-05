<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="verification.aspx.cs" Inherits="Reading_Along.verification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
			<div class="wrap-login100 p-l-80 p-r-80 p-t-30 p-b-33">
				<div class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-13 p-t-13">
						Verify Account
					</span>
					<div class="p-t-21 p-b-9">
						<span class="txt1">
							Enter OTP
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "ORP is required">
                        <asp:TextBox ID="txt_set_otp" class="input100" textmode="phone" MaxLength="4" name="otp" runat="server" required="required"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>
					<asp:RegularExpressionValidator ID="reg_valid_otp" ControlToValidate="txt_set_otp" runat="server" 
						ErrorMessage="Only Numbers allowed!" ValidationExpression="\d+" style="color: #f00; padding: 5px 10px;">
</asp:RegularExpressionValidator>
					<div class="wrap-input100 validate-input" id="timer_div" runat="server" data-validate = "ORP is required">
                        <asp:ScriptManager runat="server" ID="ScriptManager1" />
						<asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000">
						</asp:Timer>
						<asp:UpdatePanel ID="UpdatePanel1" runat="server">
							<ContentTemplate>
								<asp:Label ID="Label1" runat="server" Text="1"></asp:Label>
							</ContentTemplate>
							<Triggers>
								<asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
							</Triggers>
						</asp:UpdatePanel>
					</div>
					<div class="wrap-input100 validate-input" id="resend_div" runat="server" data-validate = "ORP is required">
						<a href="verification.aspx?resend_code=codeotp">Resend OTP</a>
					</div>
					<div class="container-login100-form-btn m-t-17 m-b-17">
                        <asp:Button ID="btn_verify_btn" class="login100-form-btn" runat="server" Text="Verify" OnClick="btn_verify_btn_Click"/>
					</div>
				</div>
			</div>
		</div>
	</div>
		<asp:Timer ID="bg_timer" runat="server" Interval="60000" OnTick="bg_timer_Tick">
		</asp:Timer>
    </form>
</body>
</html>
