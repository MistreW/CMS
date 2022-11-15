$.ajax({
	
	
	url: "topTenDisposedItems",

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
	        height:400
	    },
	    
	    title: {
	        text: 'Disposal Graph'
	    },
	    
	    yAxis: {
			title:{
			       text: 'Repetition'
			      }
		    },
	
	    xAxis: {
	        categories: category
	         },
	    
	    tooltip: {
	        formatter: function() {
	          return '<strong>'+this.x+': </strong>'+ this.y + ' Times';
	        }
	    },
	    
	    plotOptions: {
        series: {
            borderWidth: 2,
            borderColor: 'green',
            color: 'brown'
            
	        }
	    },
	
	    series: [{
	    	name: 'Item Name',
	        data: series
	    }]
	});
}



