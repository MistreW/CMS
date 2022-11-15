$.ajax({
	
	
	url: "salesByItem",

	success: function(result){
		/* line chart single starts here */
	    var category = JSON.parse(result).categories;
		var series = JSON.parse(result).series;
	    drawLineChart(category, series);
	}
	
});

/* for line chart */
function drawLineChart(category, series){
	Highcharts.chart('container', {
	    chart: {
	        type: 'column',
	        width: 600,
	        height:400,
	        zoomType: 'y'
	    },
	    
	    title: {
	        text: 'Sales Graph'
	    },
	
		yAxis: {
			title:{
			       text: 'Total Count'
			      }
		    },
	    
	    xAxis: {
	        categories: category
	    },
	    
	    tooltip: {
	        formatter: function() {
	          return '<strong>'+this.x+': </strong>'+ this.y;
	        }
	    },
	    
	    plotOptions: {
        series: {
            borderWidth: 2,
            borderColor: 'green',
         	 color: '#90EE90'
	        }
	    },
	    
		
		        
	    series: [{
	    name: 'Food Name',
	        data: series
	    }]
	});
}




