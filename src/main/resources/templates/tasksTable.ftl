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
        <tr>
            <td>${list.job_execution_id}</td>
            <td class="center">${list.job_instance_id}</td>
            <td class="center">${list.job_name}</td>
            <td class="center">${list.start_time}</td>
            <td class="center">${list.end_time}</td>
            <td class="center">
                <#if "COMPLETED" == list.status>
                    <span class="label label-success">${list.status}</span>
                <#elseif "FAILED" == list.status>
                    <span class="label label-important">${list.status}</span>
                <#elseif "NOOP" == list.status>
                    <span class="label label-warning">${list.status}</span>
                <#else >
                    <span class="label">${list.status}</span>
                </#if>
            </td>
            <td class="center" style="text-align:center">
                <#if "" != list.exit_message >
                    <a class="btn btn-success" href="#" onclick="alert('${list.exit_message}')">
                        <i class="halflings-icon white zoom-in"></i>
                    </a>
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

