<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="Reading_Along.error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header_Footer_Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header_Footer_Body" runat="server">
    		<!--************************************
				Main Start
		*************************************-->
		<main id="tg-main" class="tg-main tg-haslayout">
			<!--************************************
					404 Error Start
			*************************************-->
			<div class="tg-sectionspace tg-haslayout">
				<div class="container">
					<div class="row">
						<div class="tg-404error">
							<div class="col-xs-12 col-sm-12 col-md-8 col-md-push-2 col-lg-6 col-lg-push-3">
								<div class="tg-404errorcontent">
									<span>Oops!!!</span>
									<h2>Something whent wrong.</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--************************************
					404 Error End
			*************************************-->
		</main>
		<!--************************************
				Main End
		*************************************-->
</asp:Content>
