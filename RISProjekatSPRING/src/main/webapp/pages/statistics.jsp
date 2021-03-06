<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<title>Aukcinjo</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-sidebar a {
	font-family: "Roboto", sans-serif
}

body, h1, h2, h3, h4, h5, h6, .w3-wide {
	font-family: "Montserrat", sans-serif;
}
</style>
<body class="w3-content" style="max-width: 1200px">

	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top"
		style="z-index: 3; width: 250px" id="mySidebar">
		<div class="w3-container w3-display-container w3-padding-16">
			<i onclick="w3_close()"
				class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
			<h3 class="w3-wide">
				<b> <a href="/Aukcinjo/pages/home.jsp" style="text-decoration: none"> AUKCINJO </a> </b>
			</h3>
		</div>
		<div class="w3-padding-64 w3-large w3-text-grey"
			style="font-weight: bold">
		</div>

	</nav>

	<!-- Top menu on small screens -->
	<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
		<div class="w3-bar-item w3-padding-24 w3-wide">AUKCINJO</div>
		<a href="javascript:void(0)"
			class="w3-bar-item w3-button w3-padding-24 w3-right"
			onclick="w3_open()"><i class="fa fa-bars"></i></a>
	</header>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large" onclick="w3_close()"
		style="cursor: pointer" title="close side menu" id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 250px">

		<!-- Push down content on small screens -->
		<div class="w3-hide-large" style="margin-top: 83px"></div>

		<!-- Top header -->
		<header class="w3-container w3-xlarge">
			<c:if test="${empty loggedInUser}">
				<p class="w3-left">Aukcije</p>
			</c:if>
			<c:if test="${!empty loggedInUser}">
				<p class="w3-left">Hello, <a href="/Aukcinjo/serviceUserController/showUserDetails?idUser=${loggedInUser.idServiceUser}"> ${loggedInUser.firstName} </a> </p>
			</c:if>

			<p class="w3-right">
				<c:if test="${empty loggedInUser}">
					<a href="/Aukcinjo/pages/login.jsp"
						style="text-decoration: none; margin-right: 10px"> LOGIN </a>
					<a href="/Aukcinjo/pages/register.jsp"
						style="text-decoration: none"> REGISTER </a>
				</c:if>
				<c:if test="${!empty loggedInUser}">
					<a href="/Aukcinjo/pages/addNewAuction.jsp"
						style="text-decoration: none;"> Add a new auction </a>
					<a href="/Aukcinjo/serviceUserController/logoutUser"
						style="text-decoration: none; margin-left: 10px"> LOGOUT </a>
				</c:if>

			</p>
		</header>

		<h2> Statistics for ${loggedInUser.username}</h2>
		<h3> from <fmt:formatDate value="${startingDate}" pattern = "HH:mm - dd.MM.yyyy"/> until <fmt:formatDate value="${endDate}" pattern = "HH:mm - dd.MM.yyyy"/></h3>
		<p> Number of auctions - ${allBids.size()} </p> <br><br>	
		
		<c:forEach items="${allBids}" var="bid">
			<div style="border: 3px solid black; border-radius: 5px; margin-bottom: 5px;">
				<p> Auction name - <b> ${bid.item.name} </b> </p>
				<c:if test="${bid.endDate == null}">
					<p> Current price of the auction - <b> ${bid.currentPrice} € </b> </p>
				</c:if>
				<c:if test="${bid.endDate != null}">
					<p> Sold to user - <b> ${bid.serviceuser.username} </b> on <b> <fmt:formatDate value="${bid.endDate}" pattern = "HH:mm - dd.MM.yyyy"/> </b> for <b> ${bid.currentPrice} € </b> </p>
				</c:if>
			</div>
		</c:forEach>
		
		<br><br>

		<!-- Subscribe section -->
		<div class="w3-container w3-black w3-padding-32">
			<h1>Subscribe</h1>
			<p>To get special offers and VIP treatment:</p>
			<p>
				<input class="w3-input w3-border" type="text"
					placeholder="Enter e-mail" style="width: 100%">
			</p>
			<button type="button" class="w3-button w3-red w3-margin-bottom">Subscribe</button>
		</div>

		<!-- Footer -->
		<footer class="w3-padding-64 w3-light-grey w3-small w3-center"
			id="footer">
			<div class="w3-row-padding">
				<div class="w3-col s4">
					<h4>Contact</h4>
					<p>Questions? Go ahead.</p>
					<form action="/action_page.php" target="_blank">
						<p>
							<input class="w3-input w3-border" type="text" placeholder="Name"
								name="Name" required>
						</p>
						<p>
							<input class="w3-input w3-border" type="text" placeholder="Email"
								name="Email" required>
						</p>
						<p>
							<input class="w3-input w3-border" type="text"
								placeholder="Subject" name="Subject" required>
						</p>
						<p>
							<input class="w3-input w3-border" type="text"
								placeholder="Message" name="Message" required>
						</p>
						<button type="submit" class="w3-button w3-block w3-black">Send</button>
					</form>
				</div>

				<div class="w3-col s4">
					<h4>About</h4>
					<p>
						<a href="#">About us</a>
					</p>
					<p>
						<a href="#">We're hiring</a>
					</p>
					<p>
						<a href="#">Support</a>
					</p>
					<p>
						<a href="#">Find store</a>
					</p>
					<p>
						<a href="#">Shipment</a>
					</p>
					<p>
						<a href="#">Payment</a>
					</p>
					<p>
						<a href="#">Gift card</a>
					</p>
					<p>
						<a href="#">Return</a>
					</p>
					<p>
						<a href="#">Help</a>
					</p>
				</div>

				<div class="w3-col s4 w3-justify">
					<h4>Store</h4>
					<p>
						<i class="fa fa-fw fa-map-marker"></i> Company Name
					</p>
					<p>
						<i class="fa fa-fw fa-phone"></i> 0044123123
					</p>
					<p>
						<i class="fa fa-fw fa-envelope"></i> ex@mail.com
					</p>
					<h4>We accept</h4>
					<p>
						<i class="fa fa-fw fa-cc-amex"></i> Amex
					</p>
					<p>
						<i class="fa fa-fw fa-credit-card"></i> Credit Card
					</p>
					<br> <i
						class="fa fa-facebook-official w3-hover-opacity w3-large"></i> <i
						class="fa fa-instagram w3-hover-opacity w3-large"></i> <i
						class="fa fa-snapchat w3-hover-opacity w3-large"></i> <i
						class="fa fa-pinterest-p w3-hover-opacity w3-large"></i> <i
						class="fa fa-twitter w3-hover-opacity w3-large"></i> <i
						class="fa fa-linkedin w3-hover-opacity w3-large"></i>
				</div>
			</div>
		</footer>

		<div class="w3-black w3-center w3-padding-24">
			Powered by <a href="https://www.w3schools.com/w3css/default.asp"
				title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a>
		</div>

		<!-- End page content -->
	</div>

	<!-- Newsletter Modal -->
	<div id="newsletter" class="w3-modal">
		<div class="w3-modal-content w3-animate-zoom" style="padding: 32px">
			<div class="w3-container w3-white w3-center">
				<i
					onclick="document.getElementById('newsletter').style.display='none'"
					class="fa fa-remove w3-right w3-button w3-transparent w3-xxlarge"></i>
				<h2 class="w3-wide">NEWSLETTER</h2>
				<p>Join our mailing list to receive updates on new arrivals and
					special offers.</p>
				<p>
					<input class="w3-input w3-border" type="text"
						placeholder="Enter e-mail">
				</p>
				<button type="button"
					class="w3-button w3-padding-large w3-red w3-margin-bottom"
					onclick="document.getElementById('newsletter').style.display='none'">Subscribe</button>
			</div>
		</div>
	</div>

	<script>
		// Accordion 
		function myAccFunc() {
			var x = document.getElementById("demoAcc");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}

		// Click on the "Jeans" link on page load to open the accordion for demo purposes
		document.getElementById("myBtn").click();

		// Open and close sidebar
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}

		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}
	</script>

</body>
</html>
