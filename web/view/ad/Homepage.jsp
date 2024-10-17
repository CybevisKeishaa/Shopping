<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="description" content="Miminium Admin Template v.1">
        <meta name="author" content="Isna Nur Azis">
        <meta name="keyword" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Miminium</title>

        <!-- start: Css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/a/asset/css/bootstrap.min.css">

        <!-- plugins -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/a/asset/css/plugins/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/a/asset/css/plugins/simple-line-icons.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/a/asset/css/plugins/animate.min.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/a/asset/css/plugins/fullcalendar.min.css"/>
        <link href="${pageContext.request.contextPath}/a/asset/css/style.css" rel="stylesheet">
        <!-- end: Css -->

        <link rel="shortcut icon" href="${pageContext.request.contextPath}/a/asset/img/logomi.png">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body id="mimin" class="dashboard">
        <!-- start: Header -->
        <nav class="navbar navbar-default header navbar-fixed-top">
            <div class="col-md-12 nav-wrapper">
                <div class="navbar-header" style="width:100%;">
                    <div class="opener-left-menu is-open">
                        <span class="top"></span>
                        <span class="middle"></span>
                        <span class="bottom"></span>
                    </div>
                    <a href="index.html" class="navbar-brand"> 
                        <b>MIMIN</b>
                    </a>

                    <ul class="nav navbar-nav search-nav">
                        <li>
                            <div class="search">
                                <span class="fa fa-search icon-search" style="font-size:23px;"></span>
                                <div class="form-group form-animate-text">
                                    <input type="text" class="form-text" required>
                                    <span class="bar"></span>
                                    <label class="label-search">Type anywhere to <b>Search</b> </label>
                                </div>
                            </div>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right user-nav">
                        <li class="user-name"><span>Akihiko Avaron</span></li>
                        <li class="dropdown avatar-dropdown">
                            <img src="${pageContext.request.contextPath}/a/asset/img/avatar.jpg" class="img-circle avatar" alt="user name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"/>
                            <ul class="dropdown-menu user-dropdown">
                                <li><a href="#"><span class="fa fa-user"></span> My Profile</a></li>
                                <li><a href="#"><span class="fa fa-calendar"></span> My Calendar</a></li>
                                <li role="separator" class="divider"></li>
                                <li class="more">
                                    <ul>
                                        <li><a href=""><span class="fa fa-cogs"></span></a></li>
                                        <li><a href=""><span class="fa fa-lock"></span></a></li>
                                        <li><a href=""><span class="fa fa-power-off "></span></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li ><a href="#" class="opener-right-menu"><span class="fa fa-coffee"></span></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- end: Header -->

        <div class="container-fluid mimin-wrapper">

            <!-- start:Left Menu -->
            <div id="left-menu">
                <div class="sub-left-menu scroll">
                    <ul class="nav nav-list">
                        <li><div class="left-bg"></div></li>
                        
                        <li class="active ripple">
                            <a href = "homepage" class="tree-toggle nav-header"><span class="fa-home fa"></span> Dashboard 
                            </a>
                        </li>
                        
                        <li class="ripple"><a class="tree-toggle nav-header"><span class="fa fa-table"></span> Tables  <span class="fa-angle-right fa right-arrow text-right"></span> </a>
                            <ul class="nav nav-list tree">
                                <li><a href="userlist">User List</a></li>
                                <li><a href="employeelist">Employees List</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- end: Left Menu -->


            <!-- start: content -->
            <div id="content">
                <div class="col-md-12" style="padding:20px;">
                    <div class="col-md-12 card-wrap padding-0">
                        <div class="col-md-6">
                            <div class="panel">
                                <div class="panel-heading bg-white border-none" style="padding:20px;">
                                    <div class="col-md-6 col-sm-6 col-sm-12 text-left">
                                        <h4>Line Chart</h4>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-sm-12">
                                        <div class="mini-onoffswitch pull-right onoffswitch-danger" style="margin-top:10px;">
                                            <input type="checkbox" name="onoffswitch2" class="onoffswitch-checkbox" id="myonoffswitch1" checked>
                                            <label class="onoffswitch-label" for="myonoffswitch1"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body" style="padding-bottom:50px;">
                                    <div id="canvas-holder1">
                                        <canvas class="line-chart" style="margin-top:30px;height:200px;"></canvas>
                                    </div>
                                    <div class="col-md-12" style="padding-top:20px;">
                                        <div class="col-md-4 col-sm-4 col-xs-6 text-center">
                                            <h2 style="line-height:.4;">$100.21</h2>
                                            <small>Total Laba</small>
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-xs-6 text-center">
                                            <h2 style="line-height:.4;">2000</h2>
                                            <small>Total Barang</small>
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-xs-12 text-center">
                                            <h2 style="line-height:.4;">$291.1</h2>
                                            <small>Total Pengeluaran</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="panel">
                                <div class="panel-heading bg-white border-none" style="padding:20px;">
                                    <div class="col-md-6 col-sm-6 col-sm-12 text-left">
                                        <h4>Orders</h4>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-sm-12">
                                        <div class="mini-onoffswitch pull-right onoffswitch-primary" style="margin-top:10px;">
                                            <input type="checkbox" name="onoffswitch3" class="onoffswitch-checkbox" id="myonoffswitch3" checked>
                                            <label class="onoffswitch-label" for="myonoffswitch3"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body" style="padding-bottom:50px;">
                                    <div id="canvas-holder1">
                                        <canvas class="bar-chart"></canvas>
                                    </div>
                                    <div class="col-md-12 padding-0" >
                                        <div class="col-md-4 col-sm-4 hidden-xs" style="padding-top:20px;">
                                            <canvas class="doughnut-chart2"></canvas>
                                        </div>
                                        <div class="col-md-8 col-sm-8 col-xs-12">
                                            <h4>Progress Produksi barang</h4>
                                            <p>Sed hendrerit. Curabitur blandit mollis lacus. Duis leo. Sed libero.fusce commodo aliquam arcu..</p>
                                            <div class="progress progress-mini">
                                                <div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;">
                                                    <span class="sr-only">60% Complete</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="panel bg-green text-white">
                            <div class="panel-body">
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <canvas class="doughnut-chart hidden-xs"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end: content -->


            <!-- start: right menu -->
            <div id="right-menu">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a data-toggle="tab" href="#right-menu-user">
                            <span class="fa fa-comment-o fa-2x"></span>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#right-menu-notif">
                            <span class="fa fa-bell-o fa-2x"></span>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#right-menu-config">
                            <span class="fa fa-cog fa-2x"></span>
                        </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="right-menu-user" class="tab-pane fade in active">
                        <div class="search col-md-12">
                            <input type="text" placeholder="search.."/>
                        </div>
                        <div class="user col-md-12">
                            <ul class="nav nav-list">
                                <!-- User items here -->
                            </ul>
                        </div>
                    </div>

                    <div id="right-menu-notif" class="tab-pane fade">
                        <!-- Notification items here -->
                    </div>

                    <div id="right-menu-config" class="tab-pane fade">
                        <!-- Configuration items here -->
                    </div>
                </div>
            </div>  
            <!-- end: right menu -->

        </div>

        <!-- start: Mobile -->
        <div id="mimin-mobile" class="reverse">
            <div class="mimin-mobile-menu-list">
                <div class="col-md-12 sub-mimin-mobile-menu-list animated fadeInLeft">
                    <ul class="nav nav-list">
                        <!-- Mobile menu items here -->
                    </ul>
                </div>
            </div>       
        </div>
        <button id="mimin-mobile-menu-opener" class="animated rubberBand btn btn-circle btn-danger">
            <span class="fa fa-bars"></span>
        </button>
        <!-- end: Mobile -->

        <!-- start: Javascript -->
        <script src="${pageContext.request.contextPath}/a/asset/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/jquery.ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/bootstrap.min.js"></script>

        <!-- plugins -->
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/fullcalendar.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/jquery.nicescroll.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/jquery.vmap.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/maps/jquery.vmap.world.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/jquery.vmap.sampledata.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/chart.min.js"></script>

        <!-- custom -->
        <script src="${pageContext.request.contextPath}/a/asset/js/main.js"></script>
        <script type="text/javascript">
            (function (jQuery) {

                // start: Chart =============

                Chart.defaults.global.pointHitDetectionRadius = 1;
                Chart.defaults.global.customTooltips = function (tooltip) {
                    var tooltipEl = $('#chartjs-tooltip');

                    if (!tooltip) {
                        tooltipEl.css({ opacity: 0 });
                        return;
                    }

                    tooltipEl.removeClass('above below');
                    tooltipEl.addClass(tooltip.yAlign);

                    var innerHtml = '';
                    if (undefined !== tooltip.labels && tooltip.labels.length) {
                        for (var i = tooltip.labels.length - 1; i >= 0; i--) {
                            innerHtml += [
                                '<div class="chartjs-tooltip-section">',
                                '   <span class="chartjs-tooltip-key" style="background-color:' + tooltip.legendColors[i].fill + '"></span>',
                                '   <span class="chartjs-tooltip-value">' + tooltip.labels[i] + '</span>',
                                '</div>'
                            ].join('');
                        }
                        tooltipEl.html(innerHtml);
                    }

                    tooltipEl.css({
                        opacity: 1,
                        left: tooltip.chart.canvas.offsetLeft + tooltip.x + 'px',
                        top: tooltip.chart.canvas.offsetTop + tooltip.y + 'px',
                        fontFamily: tooltip.fontFamily,
                        fontSize: tooltip.fontSize,
                        fontStyle: tooltip.fontStyle
                    });
                };
                var randomScalingFactor = function () {
                    return Math.round(Math.random() * 100);
                };
                var lineChartData = {
                    labels: ["January", "February", "March", "April", "May", "June", "July"],
                    datasets: [{
                            label: "My First dataset",
                            fillColor: "rgba(21,186,103,0.4)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(66,69,67,0.3)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(220,220,220,1)",
                            data: [18, 9, 5, 7, 4.5, 4, 5, 4.5, 6, 5.6, 7.5]
                        }, {
                            label: "My Second dataset",
                            fillColor: "rgba(21,113,186,0.5)",
                            strokeColor: "rgba(151,187,205,1)",
                            pointColor: "rgba(151,187,205,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(151,187,205,1)",
                            data: [4, 7, 5, 7, 4.5, 4, 5, 4.5, 6, 5.6, 7.5]
                        }]
                };

                var doughnutData = [
                    {
                        value: 300,
                        color: "#129352",
                        highlight: "#15BA67",
                        label: "Alfa"
                    },
                    {
                        value: 50,
                        color: "#1AD576",
                        highlight: "#15BA67",
                        label: "Beta"
                    },
                    {
                        value: 100,
                        color: "#FDB45C",
                        highlight: "#15BA67",
                        label: "Gamma"
                    },
                    {
                        value: 40,
                        color: "#0F5E36",
                        highlight: "#15BA67",
                        label: "Peta"
                    },
                    {
                        value: 120,
                        color: "#15A65D",
                        highlight: "#15BA67",
                        label: "X"
                    }
                ];

                var doughnutData2 = [
                    {
                        value: 100,
                        color: "#129352",
                        highlight: "#15BA67",
                        label: "Alfa"
                    },
                    {
                        value: 250,
                        color: "#FF6656",
                        highlight: "#FF6656",
                        label: "Beta"
                    },
                    {
                        value: 100,
                        color: "#FDB45C",
                        highlight: "#15BA67",
                        label: "Gamma"
                    },
                    {
                        value: 40,
                        color: "#FD786A",
                        highlight: "#15BA67",
                        label: "Peta"
                    },
                    {
                        value: 120,
                        color: "#15A65D",
                        highlight: "#15BA67",
                        label: "X"
                    }
                ];

                var barChartData = {
                    labels: ["January", "February", "March", "April", "May", "June", "July"],
                    datasets: [
                        {
                            label: "My First dataset",
                            fillColor: "rgba(21,186,103,0.4)",
                            strokeColor: "rgba(220,220,220,0.8)",
                            highlightFill: "rgba(21,186,103,0.2)",
                            highlightStroke: "rgba(21,186,103,0.2)",
                            data: [65, 59, 80, 81, 56, 55, 40]
                        },
                        {
                            label: "My Second dataset",
                            fillColor: "rgba(21,113,186,0.5)",
                            strokeColor: "rgba(151,187,205,0.8)",
                            highlightFill: "rgba(21,113,186,0.2)",
                            highlightStroke: "rgba(21,113,186,0.2)",
                            data: [28, 48, 40, 19, 86, 27, 90]
                        }
                    ]
                };

                window.onload = function () {
                    var ctx = $(".doughnut-chart")[0].getContext("2d");
                    window.myDoughnut = new Chart(ctx).Doughnut(doughnutData, {
                        responsive: true,
                        showTooltips: true
                    });

                    var ctx2 = $(".line-chart")[0].getContext("2d");
                    window.myLine = new Chart(ctx2).Line(lineChartData, {
                        responsive: true,
                        showTooltips: true,
                        multiTooltipTemplate: "<%= 'value' %>",  // Fixed line
                        maintainAspectRatio: false
                    });

                    var ctx3 = $(".bar-chart")[0].getContext("2d");
                    window.myLine = new Chart(ctx3).Bar(barChartData, {
                        responsive: true,
                        showTooltips: true
                    });

                    var ctx4 = $(".doughnut-chart2")[0].getContext("2d");
                    window.myDoughnut2 = new Chart(ctx4).Doughnut(doughnutData2, {
                        responsive: true,
                        showTooltips: true
                    });
                };

                //  end:  Chart =============

            })(jQuery);
        </script>
        <!-- end: Javascript -->
    </body>
</html>
