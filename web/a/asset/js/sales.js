function getCurrentWeek() {
    const today = new Date();
    let dayOfweek = today.getDay();
    const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    const weekDays = [];
    for (var i = 0, max = -7; i > max; i--) {
        weekDays.push(days[dayOfweek--])
        if (dayOfweek < 0)
            dayOfweek = days.length-1;
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
window.onload = function () {
    var ctx2 = $(".line-chart")[0].getContext("2d");
    window.myLine = new Chart(ctx2).Line(lineChartData, {
        responsive: true,
        showTooltips: true,
        multiTooltipTemplate: "", // Fixed line
        maintainAspectRatio: false
    });
};