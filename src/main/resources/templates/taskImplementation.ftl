<header class="panel-heading">
    <h3>任务执行情况（数据采集日期：${collectionTime}）</h3>
</header>

<div class="row-fluid sortable">
    <div class="box span12">
        <div class="box-header">
            <h2><i class="halflings-icon white align-justify"></i><span class="break"></span>任务执行情况</h2>
            <div class="box-icon">
                <a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
                <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
            </div>
        </div>
        <div class="box-content" id="tasks_table">
            <table class="table table-bordered table-striped table-condensed">
                <thead>
                <tr>
                    <th>任务ID</th>
                    <th>实例ID</th>
                    <th>任务名</th>
                    <th>任务开始时间</th>
                    <th>任务结束时间</th>
                    <th>任务状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <#if tasks.list ?? && tasks.list?size != 0>
                    <#list tasks.list as list>
                    <tr height="46px">
                        <td>${list.job_execution_id}</td>
                        <td class="center" style="vertical-align:middle;">${list.job_instance_id}</td>
                        <td class="center" style="vertical-align:middle;">${list.job_name}</td>
                        <td class="center" style="vertical-align:middle;">${list.start_time}</td>
                        <td class="center" style="vertical-align:middle;">${list.end_time}</td>
                        <td class="center" style="vertical-align:middle;">
                            <#if "COMPLETED" == list.status>
                                <span class="label label-success" style="vertical-align:middle;">${list.status}</span>
                            <#elseif "FAILED" == list.status>
                                <span class="label label-important" style="vertical-align:middle;">${list.status}</span>
                            <#elseif "NOOP" == list.status>
                                <span class="label label-warning" style="vertical-align:middle;">${list.status}</span>
                            <#else >
                                <span class="label" style="vertical-align:middle;">${list.status}</span>
                            </#if>
                        </td>
                        <td class="center" style="text-align:center">
                            <#if "" != list.exit_message>
                                <#if list.exit_message?length lte 200>
                                    <a class="btn btn-success" href="#" onclick="alert('${list.exit_message?html}')">
                                        <i class="halflings-icon white zoom-in"></i>
                                    </a>
                                <#else>
                                    <a class="btn btn-success" href="#"
                                       onclick="alert('${list.exit_message?html?substring(0,200)?replace("\'","\\\\")}......')">
                                        <i class="halflings-icon white zoom-in"></i>
                                    </a>
                                </#if>
                            </#if>
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
            <div class="pagination pagination-centered" style="float:right ">
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
<script>

</script>