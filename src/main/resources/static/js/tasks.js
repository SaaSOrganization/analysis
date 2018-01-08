tasks = {
    getTasks: function (pageNo) {
        var url = "/tasks/getTasks";
        $.ajax({
            url: url,
            type: "GET",
            data: {"pageNo": pageNo, "pageSize": 18},
            success: function (result) {
                $("#tasks_table").empty().append(result);
            },
            error: function () {

            }
        })
    }
};
