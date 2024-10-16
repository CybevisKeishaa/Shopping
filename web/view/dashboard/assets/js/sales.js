$(function () {
// -----------------------------------------------------------------------
    // Sales Data
    // -----------------------------------------------------------------------
    var now = new Date();
    now.setDate(now.getDate() - 6) ;
    var dayMap = {
        0: "Sun",
        1: "Mon",
        2: "Tue",
        3: "Wed",
        4: "Thu",
        5: "Fri",
        6: "Sat"
    };
    var categories = [];

    // Loop through the last 7 days
    for (var i = 0; i < 7; i++) {
        var day = now.getDay(); // Get the day of the week (0-6)
        categories.push(dayMap[day]); // Get the day name from dayMap
        now.setDate(now.getDate() + 1); // Move to the next day
    }

    var chart = {
        series: series,
        chart: {
            toolbar: {
                show: false,
            },
            type: "line",
            fontFamily: "inherit",
            foreColor: "#adb0bb",
            height: 320,
            stacked: false,
        },
        colors: ["var(--bs-primary)"],
        plotOptions: {},
        dataLabels: {
            enabled: false,
        },
        legend: {
            show: false,
        },
        stroke: {
            width: 2,
        },
        grid: {
            borderColor: "rgba(0,0,0,0.1)",
            strokeDashArray: 3,
            xaxis: {
                lines: {
                    show: false,
                },
            },
        },
        yaxis: {
            title: {
                // text: 'Age',
            },
        },
        xaxis: {
            axisBorder: {
                show: false,
            },
            axisTicks: {
                show: false,
            },
            categories: categories,
        },
        yaxis: {
            tickAmount: 4,
        },
        markers: {
            strokeColor: ["var(--bs-primary)"],
            strokeWidth: 2,
        },
        tooltip: {
            theme: "light",
        },
    };

    var chart = new ApexCharts(
            document.querySelector("#traffic-overview"),
            chart
            );
    chart.render();
})