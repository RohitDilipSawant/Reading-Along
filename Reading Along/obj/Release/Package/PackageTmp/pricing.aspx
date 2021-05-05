<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="pricing.aspx.cs" Inherits="Reading_Along.pricing" %>
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
		td{
			border : none!important;
		}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header_Footer_Body" runat="server">
    <main id="tg-main" class="tg-main tg-haslayout">
	<section class="pricing-table" style="padding : 1% 10%; background-color: #eee;">
			<div class="contain_pricing">
				<div class="prising_heading" style="margin-bottom: 1%;">
					<h2 style="color: #4dbe3b;"><b>Our Pricing</b></h2>
					<span class="prising_heading_p">Grab an exclusive discount of ₹50 on Annual packs and enjoy the latest Books. Hurry, Annual Pack at just ₹449. Limited Period Offer. Subscribe Now!</span>
				</div>
				<div id="div_list" runat="server" class="row justify-content-md-center">
					<asp:ListView ID="list_Free" runat="server">
						<ItemTemplate>
							<div class="col-md-5 col-lg-4"></div>
							<div class="col-md-5 col-lg-4">
								<div class="item">
									<div class="heading">
										<h3><%# Eval("SubscriptionName") %></h3>
									</div>
									<div class="price">
										<h4 style="margin : 20px 0px 0px 0px; padding : 10px 0px 0px 0px; font-weight: bold;"><sup>Free</sub></h4>
									</div>
									<p class="prising_heading_p" style ="margin-top: 0px;"><%# Eval("SubscriptionDescription") %></p>
									<div class="features">
										<h4><span class="feature" style="font-size : 28px;"><%# Eval("NoOfBooksAccess") %></span></h4>
										<h4><span class="feature">No Of Days</span> : <span class="value"><%# Eval("NoOfDays") %></span></h4>
									</div>
									<button class="btn btn-block btn-outline-primary" type="submit">Signup Now</button>
								</div>
							</div>
						</ItemTemplate>
					</asp:ListView>
				</div>
				<center>
					<div class="prising_heading planning_head">
						<h3>Monthly</h3>
					</div>
				</center>
				<div class="row justify-content-md-center">
					<asp:ListView ID="list_monthly_plan" runat="server">
						<ItemTemplate>
							<div class="col-md-5 col-lg-4">
								<div class="item">
									<div class="ribbon"><%# Eval("tags") %></div>
									<div class="heading">
										<h3><%# Eval("SubscriptionName") %></h3>
									</div>
									<div class="price">
										<h4><sup>₹</sup><%# Eval("SubscriptionPrice") %><sub>/Mo</sub></h4>
									</div>
									<p class="prising_heading_p"><%# Eval("SubscriptionDescription") %></p>
									<div class="features">
										<h4><span class="feature">No Of Books</span> : <span class="value"><%# Eval("NoOfBooksAccess") %></span></h4>
										<h4><span class="feature">No Of Days</span> : <span class="value"><%# Eval("NoOfDays") %></span></h4>
									</div>
									<button class="btn btn-block btn-outline-primary" type="submit">BUY NOW</button>
								</div>
							</div>
						</ItemTemplate>
					</asp:ListView>
				</div>
				<center>
				<div class="prising_heading planning_head">
					<h3>Quarterly</h3>
				</div>
				</center>
				<div class="row justify-content-md-center">
                <asp:ListView ID="list_quater_plan" runat="server">
					<ItemTemplate>
						<div class="col-md-5 col-lg-4">
							<div class="item">
								<div class="ribbon"><%# Eval("tags") %></div>
								<div class="heading">		
									<h3><%# Eval("SubscriptionName") %></h3>
								</div>
								<div class="price">
									<h4><sup>₹</sup><%# Eval("SubscriptionPrice") %><sub>/Qt</sub></h4>
								</div>
								<p class="prising_heading_p"><%# Eval("SubscriptionDescription") %></p>
								<div class="features">
									<h4><span class="feature">No Of Books</span> : <span class="value"><%# Eval("NoOfBooksAccess") %></span></h4>
									<h4><span class="feature">No Of Days</span> : <span class="value"><%# Eval("NoOfDays") %></span></h4>
								</div>
								<button class="btn btn-block btn-outline-primary" type="submit">BUY NOW</button>
							</div>
						</div>
					</ItemTemplate>
                </asp:ListView>
				</div>
				<center>
					<div class="prising_heading planning_head">
						<h3>Yearly</h3>
					</div>
				</center>
				<div class="row justify-content-md-center">
					<asp:ListView ID="list_yearly_plan" runat="server">
						<ItemTemplate>
							<div class="col-md-5 col-lg-4">
								<div class="item">
									<div class="ribbon"><%# Eval("tags") %></div>
									<div class="heading">		
										<h3><%# Eval("SubscriptionName") %></h3>
									</div>
									<div class="price" style="text-align : center;">
										<h4 style="margin-bottom : 0px;"><sup>₹</sup><%# Eval("SubscriptionPrice") %><sub>/Yr</sub></h4>
										<h5><del>600</del></h5>
									</div>
									<p class="prising_heading_p"><%# Eval("SubscriptionDescription") %></p>
									<div class="features">
										<h4><span class="feature">No Of Books</span> : <span class="value"><%# Eval("NoOfBooksAccess") %></span></h4>
										<h4><span class="feature">No Of Days</span> : <span class="value"><%# Eval("NoOfDays") %></span></h4>
									</div>
									<button class="btn btn-block btn-outline-primary" type="submit">BUY NOW</button>
								</div>
							</div>
						</ItemTemplate>
					</asp:ListView>
				</div>
			</div>
		</section>
		</main>
</asp:Content>
