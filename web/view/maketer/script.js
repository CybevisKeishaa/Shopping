$(document).ready(function () {
    var table = $('#datatables-example').DataTable({

        "searching": false, // Tắt tìm kiếm mặc định
        "paging": true, // Bật phân trang
        "pageLength": 6, // Số hàng trên mỗi trang
        "lengthChange": false   // Tắt "Show ... entries"
    });
    // Tìm kiếm theo Full Name
    $('#custom-search').on('keyup', function () {
        var searchTerm = this.value.toLowerCase();
        table.rows().every(function (rowIdx, tableLoop, rowLoop) {
            var data = this.data();
            var fullName = data[1].toLowerCase(); // Full Name
            if (fullName.includes(searchTerm)) {
                this.show();
            } else {
                this.hide();
            }
        });
        table.draw();
    });
});