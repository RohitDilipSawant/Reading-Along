<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="mysubscription.aspx.cs" Inherits="Reading_Along.mysubscription" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header_Footer_Head" runat="server">
	    <link rel="stylesheet" type="text/css" href="Design/pricing/style.css" />
	<style>
		.btn:hover{
			background-color: #337ab7;
			color: #fff;
		}
		.planning_head{
			border-bottom: solid 2px #77b748; 
			width: 40%;
		}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header_Footer_Body" runat="server">
    <main id="tg-main" class="tg-main tg-haslayout">
	<section class="pricing-table" style="padding : 1% 8%; background-color: #eee;">
			<div class="contain_pricing">
				<div class="prising_heading" style="margin-bottom: 1%;">
					<h2 style="color: #4dbe3b;"><b>Your Subscription</b></h2>
					<span class="prising_heading_p">Grab an exclusive discount of ₹50 on Annual packs and enjoy the latest Books. Hurry, Annual Pack at just ₹449. Limited Period Offer. Subscribe Now!</span>
				</div>
				<div class="row justify-content-md-center">
					<div class="col-md-5 col-lg-4">

					</div>
					<div class="col-md-5 col-lg-4">
						<div class="item">
							<div class="ribbon">Your Plan</div>
							<div class="heading">
								<h3>PRO</h3>
							</div>
							<div class="price">
								<h4><sup>₹</sup>50<sub>/Mo</sub></h4>
							</div>
							<p class="prising_heading_p">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							<div class="features">
								<h4><span class="feature">Full Support</span> : <span class="value">Yes</span></h4>
								<h4><span class="feature">Duration</span> : <span class="value">60 Days</span></h4>
								<h4><span class="feature">Storage</span> : <span class="value">50GB</span></h4>
							</div>
							<button class="btn btn-block btn-primary" type="submit">BUY NOW</button>
						</div>
					</div>
					<div class="col-md-5 col-lg-4">
					</div>
				</div>
			</div>
		</section>
		</main>
</asp:Content>
