<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function(){
	 
	  $("#cart").on("click", function() {
	    $(".shopping-cart").fadeToggle( "fast");
	  });
	  
	})();
</script>
<style type="text/css">
.badge {
	background-color: #6394F8;
	border-radius: 10px;
	color: white;
	display: inline-block;
	font-size: 12px;
	line-height: 1;
	padding: 3px 7px;
	text-align: center;
	vertical-align: middle;
	white-space: nowrap;
}

.shopping-cart {
	margin: 20px 0;
	float: right;
	background: white;
	width: 320px;
	position: relative;
	border-radius: 3px;
	padding: 20px; . shopping-cart-header { border-bottom : 1px solid
	#E8E8E8;
	padding-bottom: 15px;
	.
	shopping-cart-total
	{
	float
	:
	right;
}

}
.shopping-cart-items {
	padding-top: 20px;
	li
	{
	margin-bottom
	:
	18px;
}

img {
	float: left;
	margin-right: 12px;
}

.item-name {
	display: block;
	padding-top: 10px;
	font-size: 16px;
}

.item-price {
	color: $main-color;
	margin-right: 8px;
}

.item-quantity {
	color: $light-text;
}

}
}
.shopping-cart:after {
	bottom: 100%;
	left: 89%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-bottom-color: white;
	border-width: 8px;
	margin-left: -8px;
}

.cart-icon {
	color: #515783;
	font-size: 24px;
	margin-right: 7px;
	float: left;
}

.button {
	background: $main-color;
	color: white;
	text-align: center;
	padding: 12px;
	text-decoration: none;
	display: block;
	border-radius: 3px;
	font-size: 16px;
	margin: 25px 0 15px 0;
	&:
	hover
	{
	background
	:
	lighten(
	$
	main-color
	,
	3%
	);
}

}
.clearfix:after {
	content: "";
	display: table;
	clear: both;
}
</style>
</head>
<body>
	<nav>
		<div class="container">
			<ul class="navbar-left">
				<li><a href="#">Home</a></li>
				<li><a href="#about">About</a></li>
			</ul>
			<!--end navbar-left -->

			<ul class="navbar-right">
				<li><a href="#" id="cart"><i class="fa fa-shopping-cart"></i>
						Cart <span class="badge">3</span></a></li>
			</ul>
			<!--end navbar-right -->
		</div>
		<!--end container -->
	</nav>


	<div class="container">
		<div class="shopping-cart">
			<div class="shopping-cart-header">
				<i class="fa fa-shopping-cart cart-icon"></i><span class="badge">3</span>
				<div class="shopping-cart-total">
					<span class="lighter-text">Total:</span> <span
						class="main-color-text">$2,229.97</span>
				</div>
			</div>
			<!--end shopping-cart-header -->

			<ul class="shopping-cart-items">
				<li class="clearfix"><img
					src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/cart-item1.jpg"
					alt="item1" /> <span class="item-name">Sony DSC-RX100M III</span>
					<span class="item-price">$849.99</span> <span class="item-quantity">Quantity:
						01</span></li>

				<li class="clearfix"><img
					src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/cart-item2.jpg"
					alt="item1" /> <span class="item-name">KS Automatic
						Mechanic...</span> <span class="item-price">$1,249.99</span> <span
					class="item-quantity">Quantity: 01</span></li>

				<li class="clearfix"><img
					src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/cart-item3.jpg"
					alt="item1" /> <span class="item-name">Kindle, 6"
						Glare-Free To...</span> <span class="item-price">$129.99</span> <span
					class="item-quantity">Quantity: 01</span></li>
			</ul>

			<a href="#" class="button">Checkout</a>
		</div>
		<!--end shopping-cart -->
	</div>
	<!--end container -->
</body>
</html>