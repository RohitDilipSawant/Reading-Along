<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="Reading_Along.contactus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header_Footer_Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header_Footer_Body" runat="server">
    		<!--************************************
				Inner Banner Start
		*************************************-->
		<div class="tg-innerbanner tg-haslayout tg-parallax tg-bginnerbanner" data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll" data-image-src="images/parallax/bgparallax-07.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="tg-innerbannercontent">
							<h1>Contact Us</h1>
							<ol class="tg-breadcrumb">
								<li><a href="javascript:void(0);">home</a></li>
								<li class="tg-active">Contact Us</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--************************************
				Inner Banner End
		*************************************-->
		<!--************************************
				Main Start
		*************************************-->
		<main id="tg-main" class="tg-main tg-haslayout">
			<!--************************************
					Contact Us Start
			*************************************-->
			<div class="tg-sectionspace tg-haslayout">
				<div class="container">
					<div class="row">
						<div class="tg-contactus">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<div class="tg-sectionhead">
									<h2><span>Say Hello!</span>Get In Touch With Us</h2>
								</div>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d60335.65026386993!2d73.02459307671779!3d19.064698646049113!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7c21a53e30b83%3A0xa766b29f687709d7!2sKharghar%2C%20Navi%20Mumbai%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1618118549696!5m2!1sen!2sin" style="border:0; height : 50em;" allowfullscreen="" loading="lazy"></iframe>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<div class="tg-formtheme tg-formcontactus">
									<fieldset>
										<div class="form-group">
                                            <asp:TextBox ID="txt_name" type="text" name="first-name" class="form-control" placeholder="First Name*" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="req_validator_contact_us_1" CssClass="text-danger" ControlToValidate="txt_name" ValidationGroup="contact_us_validator" runat="server" ErrorMessage="Name Required!!!"></asp:RequiredFieldValidator>
										</div>
										<div class="form-group">
											<asp:TextBox ID="txt_email" textmode="email" name="email" class="form-control" placeholder="Email*" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="req_validator_contact_us_2" CssClass="text-danger" ControlToValidate="txt_email" ValidationGroup="contact_us_validator" runat="server" ErrorMessage="Email Required!!!"></asp:RequiredFieldValidator>
										</div>
										<div class="form-group">
											<asp:TextBox ID="txt_phone" textmode="phone" name="phone" class="form-control" placeholder="Phone No.*" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="req_validator_contact_us_3" CssClass="text-danger" ControlToValidate="txt_phone" ValidationGroup="contact_us_validator" runat="server" ErrorMessage="Phone No. Required!!!"></asp:RequiredFieldValidator>
										</div>
										<div class="form-group">
											<asp:TextBox ID="txt_subject" textmode="SingleLine" name="subject" class="form-control" placeholder="Subject (optional)" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="req_validator_contact_us_4" CssClass="text-danger" ControlToValidate="txt_subject" ValidationGroup="contact_us_validator" runat="server" ErrorMessage="Subject Required!!!"></asp:RequiredFieldValidator>
										</div>
										<div class="form-group tg-hastextarea">
											<asp:TextBox ID="txt_comment" textmode="multiline" name="comment" class="form-control" placeholder="Comment" runat="server" columns="30"></asp:TextBox>
											<asp:RequiredFieldValidator ID="req_validator_contact_us_5" CssClass="text-danger" ControlToValidate="txt_comment" ValidationGroup="contact_us_validator" runat="server" ErrorMessage="Comment Required!!!"></asp:RequiredFieldValidator>
										</div>
										<div class="form-group">
                                            <asp:Button ID="btn_submit_contactus" class="tg-btn tg-active" ValidationGroup="contact_us_validator" runat="server" Text="Submit" OnClick="btn_submit_contactus_Click" />
										</div>
									</fieldset>
								</div>
								<div class="tg-contactdetail">
									<div class="tg-sectionhead">
										<h2>Get In Touch With Us</h2>
									</div>
									<ul class="tg-contactinfo">
										<li>
											<i class="icon-apartment"></i>
											<address>Kharghar, Navi-Mumbai, Maharashtra, India - 410210.</address>
										</li>
										<li>
											<i class="icon-phone-handset"></i>
											<span>
												<em>022 9999 - 88 - 76</em>
												<em>+91 9999 - 8888 - 76</em>
											</span>
										</li>
										<li>
											<i class="icon-clock"></i>
											<span>Serving 7 Days A Week From 9am - 5pm</span>
										</li>
										<li>
											<i class="icon-envelope"></i>
											<span>
												<em><a href="mailto:support@domain.com">support@domain.com</a></em>
												<em><a href="mailto:info@domain.com">info@domain.com</a></em>
											</span>
										</li>
									</ul>
									<ul class="tg-socialicons">
										<li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
										<li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
										<li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
										<li class="tg-googleplus"><a href="javascript:void(0);"><i class="fa fa-google-plus"></i></a></li>
										<li class="tg-rss"><a href="javascript:void(0);"><i class="fa fa-rss"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--************************************
					Contact Us End
			*************************************-->
		</main>
		<!--************************************
				Main End
		*************************************-->
</asp:Content>
