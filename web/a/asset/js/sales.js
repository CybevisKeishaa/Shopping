function getCurrentWeek() {
    const today = new Date();
    let dayOfweek = today.getDay();
    const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    const weekDays = [];
    for (var i = 0, max = -7; i > max; i--) {
        weekDays.push(days[dayOfweek--])
        if (dayOfweek < 0)
            dayOfweek = days.length - 1;
    }

    return weekDays.reverse();
}

var lineChartData = {
    labels: getCurrentWeek(),
    datasets: [{
            label: "Order bought count",
            fillColor: "rgba(21,113,186,0.5)",
            strokeColor: "rgba(151,187,205,1)",
            pointColor: "rgba(151,187,205,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: orderBoughtData
        }]
};
var doughnutMap = {
    "Cancelled": {
        "color": "#FF0000",
        "highlight": "#CC0000",
    },
    "Completed": {
        "color": "#4CAF50",
        "highlight": "#81C784",
    },
    "Confirmed": {
        "color": "#2196F3",
        "highlight": "#64B5F6",
    },
    "Pending": {
        "color": "#FFEB3B",
        "highlight": "#FFF176",
    },
    "Shipping": {
        "color": "#FF9800",
        "highlight": "#FFB74D",
    },
    "CancelRequest": {
        "color": "#FF4C4C",
        "highlight": "#FF7F7F",
    }
};
var statusElem = document.querySelectorAll('.status-display i.fa')
statusElem.forEach(elem => elem.style.color = doughnutMap[elem.dataset.status].color)
window.onload = function () {
    var ctx2 = $(".line-chart")[0].getContext("2d");
    window.myLine = new Chart(ctx2).Line(lineChartData, {
        responsive: true,
        showTooltips: true,
        multiTooltipTemplate: "", // Fixed line
        maintainAspectRatio: false
    });
    var ctx4 = $(".doughnut-chart")[0].getContext("2d");
    var ctx4Data = statusTotals.map((statusTotal) => {
        // Get the color and highlight from doughnutMap
        var statusInfo = doughnutMap[statusTotal.status];
        return {
            label: statusTotal.status,
            value: statusTotal.total,
            color: statusInfo ? statusInfo.color : "#000000", // Fallback color
            highlight: statusInfo ? statusInfo.highlight : "#FFFFFF" // Fallback highlight
        };
    });
    window.myDoughnut2 = new Chart(ctx4).Doughnut(ctx4Data, {
        responsive: true,
        showTooltips: true

    });
};