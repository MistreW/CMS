<%@ include file="common/headers.jsp"%>
<%@ include file="common/footers.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible " content="IE=edge">
<meta name="view-port" content="width=device-width,initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/np,/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/dashboard.css">
</head>
<body>

	<nav class="nav">
		<br> <br>
		<ul class="menu">
		<li class="active"><a href="#"><i class="bi bi-house-fill"></i>Home</a></li>
		<li class=""><a href="/topTensales"><i class="bi bi-file-text"></i>Sales</a></li>
		<li class=""><a href="/topPurchase"><i class="bi bi-file-text"></i>Top Ten Purchase</a></li>
		<li class=""><a href="/topDisposed"><i class="bi bi-file-text"></i>Top Ten Disposal</a></li>
			
		</ul>
	</nav>

	<main class="content">
		<section class="section">
			<div class="container-fluid  container-content cards">

				<div class="row">
					<div class="col-xl-3 col-lg-6 col-12">
						<div class="card shadow">
							<div class="desc">
								<span style="font-size:18px;">${today} Birr</span>
								<p>Today's Sales</p>
							</div>
							<img src="img/sale.ico" alt="" width="30" height="30"
								class="d-inline-block align-text-center">
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-12">
						<div class="card shadow">
							<div class="desc">
								<span style="font-size:18px;">${inMOF} Birr</span>
								<p>Today Sales in MoF</p>
							</div>
							<img src="img/sale.ico" alt="" width="30" height="30"
								class="d-inline-block align-text-center">
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-12">
						<div class="card shadow">
							<div class="desc">
								<span style="font-size:18px;">${inPPA} Birr</span>
								<p>Today Sales in PPA</p>
							</div>
							<img src="img/sale.ico" alt="" width="30" height="30"
								class="d-inline-block align-text-center">
						</div>
					</div>

					<div class="col-xl-3 col-lg-6 col-12">
						<div class="card shadow">
							<div class="desc">
								<span style="font-size:18px;">${allSales} Birr</span>
								<p>Total Sales</p>
							</div>
							<img src="img/sale.ico" alt="" width="30" height="30"
								class="d-inline-block align-text-center">
						</div>
					</div>

				</div>

				<br>
				<div class="row">
				<div class="col-xl-3 col-lg-6 col-12">
						<div class="card shadow">
							<div class="desc">
								<span style="font-size:18px;">${thisMonthSales} Birr</span>
								<p>${month} Sales</p>
							</div>
							<img src="img/sale.ico" alt="" width="30" height="30"
								class="d-inline-block align-text-center">
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-12">
						<div class="card shadow">
							<div class="desc">
								<span style="font-size:18px;">${thisMonthPurchase} Birr</span>
								<p>${month} Purchase</p>
							</div>
							<img src="img/purchase.ico" alt="" width="30" height="30"
								class="d-inline-block align-text-center">
						</div>
					</div>
					
				<div class="col-xl-3 col-lg-6 col-12">
						<div class="card shadow">
							<div class="desc">
								<span>${disposed}</span>
								<p>Disposal Request</p>
							</div>
							<i class="fa fa-trash" aria-hidden="true"></i>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-12">
						<div class="card shadow">
							<div class="desc">
								<span>${food}</span>
								<p>Foods</p>
							</div>
							<i class="fa fa-cutlery" aria-hidden="true"></i>
						</div>
					</div>		

				</div>
				<br>
				<div class="row">
				
				<div class="col-xl-3 col-lg-6 col-12">
						<div class="card shadow">
							<div class="desc">
								<span>${itemCount}</span>
								<p>Total Item</p>
							</div>
							<img src="img/items.ico" alt="" width="30" height="30"
								class="d-inline-block align-text-center">
						</div>
					</div>

					<div class="col-xl-3 col-lg-6 col-12">
						<div class="card shadow">
							<div class="desc">
								<span>${itemBelowlist}</span>
								<p>Items Below Threshold</p>
							</div>
							<img src="img/threshold.ico" alt="" width="30" height="30"
								class="d-inline-block align-text-center">
						</div>
					</div>
					
				
					
					<div class="col-xl-3 col-lg-6 col-12">
						<div class="card shadow">
							<div class="desc">
								<span>${asset}</span>
								<p>Fixed Assets</p>
							</div>
							<i class="fa fa-car"></i> <i class="fa fa-industry"></i>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-12">
						<div class="card shadow">
							<div class="desc">
								<span>${activeAsset}</span>
								<p>Active Fixed Assets</p>
							</div>
							<i class="fa fa-car"></i> <i class="fa fa-industry"></i>
						</div>
					</div>

				</div>

			</div>
	<!-- 
		<div class="col-lg-6 col-md-6 col-6 offset-3" style="padding-bottom:40px;">
			<div class="card shadow">
				<div id="container">
					<canvas class="shadow align-text-center" id="container" width="200" height="100"></canvas>
				</div>
			</div>
		</div>
	 -->
	</section>
	</main>
	

	<script	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/gsap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/chart.js/3.1.1/chart.min.js"></script>
	<script src="js/dashboard.js"></script>
	<script src="js/graph/chighcharts.js"></script>
	<script src="js/graph/cjquery.js"></script>
	<script src="js/graph/salesByItem.js"></script>

</body>
</html>

