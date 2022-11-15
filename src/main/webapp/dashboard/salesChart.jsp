<%@ include file="/common/headers.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible " content="IE=edge">
<meta name="view-port" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedheader/3.1.7/css/fixedHeader.dataTables.min.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/np,/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/dashboard.css">
</head>

<body>
	<nav class="nav">
	<br> <br>
		<ul class="menu">
			
		<li class=""><a href="/home"><i class="bi bi-house-fill"></i>Home</a></li>
		<li class="active"><a href="#"><i class="bi bi-file-text"></i>Sales</a></li>
		<li class=""><a href="/topPurchase"><i class="bi bi-file-text"></i>Top Ten Purchase</a></li>
		<li class=""><a href="/topDisposed"><i class="bi bi-file-text"></i>Top Ten Disposal</a></li>	
		</ul>
	</nav>
	
	<main>
	<section>
	
	<div class="col-lg-8 col-md-8 col-8 offset-3">
			<div class="card shadow">
				<div id="container">
					<canvas class="shadow align-text-center" id="container" width="400" height="200"></canvas>
				</div>
			</div>
		</div>
		
		
	</section>
	</main>

<%@ include file="/common/footers.jsp"%>
<script src="js/dashboard.js"></script>
<script src="js/graph/chighcharts.js"></script>
<script src="js/graph/cjquery.js"></script>
<script src="js/graph/topTenSales.js"></script>
<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.print.min.js"></script>

</body>
</html>