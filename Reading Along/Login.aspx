<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Reading_Along.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reading Along | Login</title>
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
	</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="limiter">
		<div class="container-login100" style="background-image: url('Design/Authethication/images/bg-01.jpg');">
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
				<div class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-35">
						Sign In With
					</span>

					<%--<a href="#" class="btn-face m-b-20">
						<i class="fa fa-facebook-official"></i>
						Facebook
					</a>

					<a href="#" class="btn-google m-b-20">
						<img src="Design/Authethication/images/icons/icon-google.png" alt="GOOGLE"/>
						Google
					</a>--%>
					
					<div class="p-t-315 p-b-9">
						<span class="txt1">
							Email 
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Username is required">
                        <asp:TextBox ID="txt_Uname" class="input100" type="text" name="username" runat="server"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>
					
					<div class="p-t-13 p-b-9">
						<span class="txt1">
							Password
						</span>

						<%--<a href="#" class="txt2 bo1 m-l-5">
							Forgot?
						</a>--%>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<asp:TextBox ID="txt_Pwd" class="input100" type="password" name="pass" runat="server"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>
					<div class="w-full text-left p-t-10">
						<input type="checkbox" id="chk_show_pass" onclick="myFunction()" value="" style="float : Left; height: 21px; width : 21px;"/>
						<label for="chk_show_pass" style="float : Left; margin-left : 10px;">Show Password</label>
					</div>
					<div class="container-login100-form-btn m-t-17">
                        <asp:Button ID="btn_Sign_In" class="login100-form-btn" runat="server" Text="Sign In" OnClick="btn_Sign_In_Click" />
					</div>
					<div class="w-full text-center p-t-10">
	                    <asp:Label ID="lbl_error_msg" runat="server" Text="" style="color: #ff0000;"></asp:Label>
					</div>
					<div class="w-full text-center p-t-35">
						<span class="txt2">
							Not a member?
						</span>

						<a href="SignUp.aspx" class="txt2 bo1">
							Sign up now
						</a>
					</div>
					<div class="w-full text-center p-t-15">
						<a href="Index.aspx" class="txt2 p-t-15" style="font-size: 2em;">
							SKIP >>>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
    </form>
	<script>
        function myFunction() {
            var x = document.getElementById("txt_Pwd");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
    </script>
</body>
</html>
