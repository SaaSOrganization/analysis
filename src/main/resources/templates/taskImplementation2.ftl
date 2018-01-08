<header class="panel-heading">
    <h3>任务执行情况（数据采集日期：${collectionTime}）</h3>
</header>

<div class="row-fluid sortable">
    <div class="box span12">
        <div class="box-header" data-original-title>
            <h2><i class="halflings-icon white user"></i><span class="break"></span>任务执行情况</h2>
            <div class="box-icon">
                <a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
                <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
            </div>
        </div>
        <div class="box-content" id="tasks_table">
            <table class="table table-striped table-bordered bootstrap-datatable datatable">
                <thead>
                <tr>
                    <th>任务ID</th>
                    <th>实例ID</th>
                    <th>任务名</th>
                    <th>任务开始时间</th>
                    <th>任务状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <#if tasks.list ?? && tasks.list?size != 0>
                    <#list tasks.list as list>
                    <tr>
                        <td>${list.job_execution_id}</td>
                        <td class="center">${list.job_instance_id}</td>
                        <td class="center">${list.job_name}</td>
                        <td class="center">${list.start_time}</td>
                        <td class="center">${list.status}</td>
                        <td class="center">
                            <span class="label label-success">Active</span>
                        </td>
                    </tr>
                    </#list>
                <#else >
                <tr>
                    <td colspan="5" class="center">没有可显示的数据</td>
                </tr>
                </#if>
                </tbody>
            </table>
            <div class="pagination pagination-centered" style="float:right;">
                <ul>
                <#if tasks.total == 1>
                    <li><a href="#">Prev</a></li>
                    <li class="active">
                        <a href="#">1</a>
                    </li>
                    <li><a href="#">Next</a></li>
                <#else>
                    <#assign count=tasks.pages/>
                    <#if tasks.pageNum==1>
                        <li><a href="#">Prev</a></li>
                    <#else >
                        <li><a href="#" onclick="tasks.getTasks(${tasks.pageNum-1})">Prev</a></li>
                    </#if>
                    <#list 1..count as i>
                        <#if tasks.pageNum == i>
                        <li class="active">
                        <#else >
                        <li>
                        </#if>
                        <a href="#" onclick="tasks.getTasks(${i})">${i}</a>
                    </li>
                    </#list>
                    <#if tasks.pageNum == count>
                        <li><a href="#">Next</a></li>
                    <#else >
                        <li><a href="#" onclick="tasks.getTasks(${tasks.pageNum+1})">Next</a></li>
                    </#if>
                </#if>
                </ul>
            </div>
        </div>
    </div><!--/span-->
</div><!--/row-->

<link id="base-style" href="css/task-style.css" rel="stylesheet">
<script type="text/javascript" src="/js/tasks.js"></script>
<script src="js/tasksTable/jquery-1.9.1.min.js"></script>
<script src="js/tasksTable/jquery-migrate-1.0.0.min.js"></script>
<script src="js/tasksTable/jquery-ui-1.10.0.custom.min.js"></script>
<script src="js/tasksTable/bootstrap.min.js"></script>
<script src='js/tasksTable/jquery.dataTables.min.js'></script>
<script src="js/tasksTable/jquery.chosen.min.js"></script>
<script src="js/tasksTable/jquery.uniform.min.js"></script>
<script src="js/tasksTable/jquery.cleditor.min.js"></script>
<script src="js/tasksTable/jquery.elfinder.min.js"></script>
<script src="js/tasksTable/jquery.raty.min.js"></script>
<script src="js/tasksTable/jquery.uploadify-3.1.min.js"></script>
<script src="js/tasksTable/custom.js"></script>
<script>

</script>