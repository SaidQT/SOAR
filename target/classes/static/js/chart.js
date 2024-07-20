document.addEventListener('DOMContentLoaded', function() {
	const ctx = document.getElementById('shopsPerCityChart').getContext('2d');

	const shopsPerCityChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: chartData.labels,
			datasets: [{
				label: 'Number of Shops',
				data: chartData.data,
				backgroundColor: '#F9F3EC',
				borderColor: '#DEAD6F',
				borderWidth: 2 // No border width
			}]
		},
		options: {
			scales: {
				x: {
					grid: {
						display: false // Hide x-axis grid lines inside the chart
					},
					border: {
						display: true // Keep x-axis border line
					},
					title: {
						display: true,
						text: 'Cities',
						color: '#000',
						font: {
							size: 16,
							weight: 'bold'
						}
					}
				},
				y: {
					beginAtZero: true,
					ticks: {
						stepSize: 1,
						callback: function(value) {
							return Number(value).toFixed(0);
						}
					},
					grid: {
						display: false // Hide y-axis grid lines inside the chart
					},
					border: {
						display: true // Keep y-axis border line
					},
					title: {
						display: true,
						text: 'Number of Shops',
						color: '#000',
						font: {
							size: 16,
							weight: 'bold'
						}
					},
					min: 0,
					max: Math.max(...chartData.data) + 1
				}
			},
			plugins: {
				legend: {
					display: false // Hide the legend if needed
				},
				tooltip: {
					enabled: true // Show tooltips
				}
			}
		}
	});
});
