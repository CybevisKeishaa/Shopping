function getCurrentWeek() {
    const today = new Date();
    const dayOfWeek = today.getDay(); // 0 (Sun) to 6 (Sat)
    const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    
    // Calculate the start of the week (Monday)
    const startOfWeek = new Date(today);
    startOfWeek.setDate(today.getDate() - ((dayOfWeek + 6) % 7));
    
    // Get the days of the current week
    const weekDays = [];
    for (let i = 0; i < 7; i++) {
        const currentDay = new Date(startOfWeek);
        currentDay.setDate(startOfWeek.getDate() + i);
        weekDays.push(days[currentDay.getDay()]);
    }
    
    return weekDays;
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