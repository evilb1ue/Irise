// 依赖jquery库

// 页面加载完成后执行的动作
$(function () {
    // 初始化数据
    $("#current-page-id").val('')
    $("#current-page-row-id").val('')

    // 初始化点击
    page = $("#page1")
    if(page.length > 0) {
        page.trigger('click')
    }

})

//  Page

function handleChangePage(newPageId) {
    beforeChangePage(newPageId)
    changePage(newPageId)
    afterChangePage(newPageId)
}

function beforeChangePage(newPageId) {
    // 可以在这里保存准备状态的ContentArea，但是应该交给页行变换的事件来处理
    // 所以此时什么也没做
}

function changePage(newPageId) {

    // 1. 清除之前的页选择样式
    oldPageId = $("#current-page-id").val()
    if(oldPageId.toString() !== ""){
        // 正常情况下，这里的page页一定存在
        $("#page" + oldPageId.toString()).removeClass("active")
    }

    // 2. 存储newPageId
    $("#current-page-id").val(newPageId)

    // 3. 设置newPageId页为选择样式
    $("#page" + newPageId.toString()).addClass("active")

    // 4. 清空现有页行,实现一个清空动作，在ajax获取之前表现出程序已进行处理的效果，实际没什么用
    // $("#page-rows").html("")   // 使用这个界面会有一个一闪而过的效果，并不理想，放弃

    // 5. 获取新的页行,并填充
    // 返回的是deferred对象，可以进行链式操作
    flag = false
    $.ajax({
        // 默认设置下，所有请求均为异步请求（也就是说这是默认设置为 true ）
        // 如果需要发送同步请求，请将此选项设置为 false
        // 同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行
        async: false,
        method: "POST",
        url: "/cviews/page_rows/",
        // 发送到服务器的数据。它被转换成一个查询字符串,如果已经是一个字符串的话就不会转换。
        // 如果这个参数值是一个数组，将自动转化为一个同名的多值查询字符串
        // 如 {foo:["bar1", "bar2"]} 转换为 '&foo=bar1&foo=bar2'
        data: { "page_id": newPageId.toString()},
        // 从服务器返回你期望的数据类型
        // default: Intelligent Guess (xml, json, jsonp, script, text or html)
        dataType: "html",
        // 0 表示没有超时
        timeout: 0,
        // 当将数据发送到服务器时，使用该内容类型
        // 默认值是"application/x-www-form-urlencoded; charset=UTF-8"，适合大多数情况,这里显示使用
        // 其它内容类型有 multipart/form-data, text/plain 等等
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        //headers: {"X-CSRFToken": $.cookie('csrftoken')},
    }).done(function (pageRows) {
        $("#page-rows").html(pageRows)
        flag = true
    }).fail(function (jqXHR, textStatus, errorThrown) {
        // Function( jqXHR jqXHR, String textStatus, String errorThrown )
        // jqXHR (在 jQuery 1.4.x前为XMLHttpRequest) 对象、描述发生错误类型的一个字符串 和 捕获的异常对象
        // 如果发生了错误，错误信息（第二个参数）除了得到null之外，还可能是"timeout", "error", "abort" ，和 "parsererror"
        alert("Request failed: "+textStatus)
        flag = false
    })
    if(flag === false)
        return;

    // 6. 触发新的页行切换事件
    // 获取新页上次选择的page_row的id,成功后依据返回结果触发页行切换事件
    $.ajax({
        async: false,
        method: "POST",
        url: "/cviews/selected_page_row/",
        data: { "page_id": newPageId.toString()},
        dataType: "text",
        timeout: 0,
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
    }).done(function (selectedPageRowID) {
        target = $("#page-row"+selectedPageRowID.toString())
        // length大于0代表查找对象存在，0代表不存在
        if(target.length > 0){
            target.trigger("click")
        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        alert("Request failed: "+textStatus)
    })
}

function afterChangePage(newPageId) {
    // 页面变换之后的操作，暂时没什么需要执行的
}


// PageRow

function handleChangePageRow(newPageRowId) {
    beforeChangePageRow(newPageRowId)
    changePageRow(newPageRowId)
    afterChangePageRow(newPageRowId)
}

function beforeChangePageRow(newPageRowId) {
    // 1. 判断ContentArea是否有内容
    // 如果没有内容，什么也不做
    // 如果有内容，判断状态是否为准备状态，如果是就进行保存，否则什么也不做
    saveTask()
}

function changePageRow(newPageRowId) {
    // 1. 清除之前的页行选择样式
    oldPageRowId = $("#current-page-row-id").val()
    if(oldPageRowId.toString() !== ""){
        oldPageRow =  $("#page-row" + oldPageRowId.toString())
        if(oldPageRow.length > 0){
            // 旧行存在，没有变更页，清除之前的样式
            oldPageRow.removeClass("active")
        }else {
            // 旧行不存在，已经变更页，无需清楚任何样式
        }
    }

    // 2. 存储newPageRowId
    $("#current-page-row-id").val(newPageRowId)

    // 3. 设置newPageRowId页行为选择样式
    $("#page-row" + newPageRowId.toString()).addClass("active")

    // 4. 清空现有ContentArea,实现一个清空动作，在ajax获取之前表现出程序已进行处理的效果，实际没什么用
    // $("#content-area").html("")   // 使用这个界面会有一个一闪而过的效果，并不理想，放弃

    // 5. 更新当前Page指向的PageRow, 并获取新的页行对应的界面定义,创建页行界面
    // 正常情况下该page-id一定存在，不然就是什么地方出现问题了
    pageId = $("#current-page-id").val()
    flag = false
    $.ajax({
        async: false,
        method: "POST",
        url: "/cviews/update_page_and_fetch_view/",
        data: { "page_id": pageId.toString(), "page_row_id": newPageRowId.toString()},
        dataType: "html",
        timeout: 0,
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
    }).done(function (html) {
        $("#content-area").html(html)
        flag = true
    }).fail(function (jqXHR, textStatus, errorThrown) {
        alert("Request failed: "+textStatus)
        flag = false
    })
    if(flag === false)
        return;

    // 6. 触发新的任务查询事件，填充数据
    // 首先获取任务id
    taskId = $("#current-page-row-tid")
    // 判断前一步是否fail出现问题
    if(taskId.length > 0 ){
        // 未出现问题
        pageRowTid = taskId.val()
        if ( pageRowTid.toString() === (-1).toString()){
            // 说明未指定任务，什么也不用做
        }else {
            // 依据任务id查询数据并填充
            $.ajax({
                async: false,
                method: "POST",
                url: "/cviews/fetch_config_and_content/",
                data: {"page_row_id": newPageRowId.toString(), "page_row_tid": pageRowTid.toString()},
                dataType: "text",
                timeout: 0,
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            }).done(function (ret) {

                // 将获取的配置进行保存，为保存操作提供解析信息，不需要再次查询
                $("#current-page-row-config").val(ret)

                // alert(ret.toString())
                ret = $.parseJSON( ret )
                config = ret.Config
                // alert(JSON.stringify(config))
                cmd = ret.Cmd
                // alert(JSON.stringify(cmd))
                input = ret.Input
                // alert(JSON.stringify(input))
                output = ret.Output
                // alert(JSON.stringify(output))
                for(count =0; count < 3; count++){
                    conf = null
                    sconf = ""
                    switch (count) {
                        case 0:
                            conf = cmd
                            sconf = "Cmd"
                            break
                        case 1:
                            conf = input
                            sconf = "Input"
                            break
                        case 2:
                            conf = output
                            sconf = "Output"
                            break
                    }
                    // alert(JSON.stringify(config[sconf]))
                    for(var key in config[sconf]){
                        viewType = config[sconf][key].View.Type
                        // alert(viewType)
                        viewValue = conf[key]
                        // alert(viewValue)
                        if(viewType.toString() === "radio"){
                            targets = $("input[name=\""+ key +"\"]")
                            // alert(targets[0].id)
                            // alert(targets[0].value)
                            // alert(targets.length)
                            for(i=0; i<targets.length; i++){
                                t = targets[i]
                                if(t.value.toString() === viewValue.toString()) {
                                    //执行点击
                                    // alert(t.id.toString().substring(6))
                                    $("#label_" + t.id.toString().substring(6)).trigger("click")
                                    break
                                }
                            }
                            // alert('radio_after')
                        }
                        else if(viewType.toString() === 'checkbox'){
                            targets = $("input[name=\""+ key +"\"]")
                            // alert(viewValue)
                            selects = eval(viewValue) // 获取一个数组对象
                            // alert(selects)
                            // alert(targets.length)
                            // alert(targets[1])
                            for(i=0; i< targets.length; i++){
                                t = targets[i]
                                // alert(t.value)
                                isIn = false
                                for(j=0; j<selects.length; j++){

                                    if(t.value.toString() === selects[j].toString()){
                                        isIn = true
                                        break
                                    }
                                }

                                if(isIn === true) {
                                    //执行点击
                                    // alert(t.id.toString().substring(9))
                                    $("#label_" + t.id.toString().substring(9)).trigger("click")
                                }
                                // alert('checkbox_after')
                            }
                        }
                        else if(viewType.toString() === "text"){
                            // alert(viewValue.toString())
                            $("#text_"+key.toString()+"1").val(viewValue.toString())
                        }else if(viewType.toString() === "textarea"){
                            // alert(viewValue.toString())
                            $("#textarea_"+key.toString()+"1").val(viewValue.toString())
                        }
                    }
                }

            }).fail(function (jqXHR, textStatus, errorThrown) {
                alert("Request failed: " + textStatus)
            })
        }
    }
}

function afterChangePageRow(newPageRowId) {
    // 页行变换之后的操作，暂时没什么好执行的
}

function saveTask() {
    // 1. 判断ContentArea是否有内容，可以查看任务对象是否存在，不存在说明未加载任何任务，什么都不用做
    taskId = $("#current-page-row-tid")
    if(taskId.length > 0 ) {
        // 获取任务对象的tid
        pageRowTid = taskId.val()
        if (pageRowTid.toString() === (-1).toString()) {
            // 说明未指定任务，什么也不用做
        } else {
            // 说明任务对象存在，将数据页面数据提交给后台，由后台来判断是否保存
            retInput = $("#current-page-row-config")
            // 判断是否为正常的content-area界面，正常情况下存在该对象
            if(retInput.length>0){
                // 获取config string形式
                ret = retInput.val()
                // 解析config为Json对象
                ret = $.parseJSON( ret )
                // config应该始终一致
                config = ret.Config
                // cmd input output  内容应该依据界面数据进行修改
                cmd = ret.Cmd
                input = ret.Input
                output = ret.Output
                // 依据界面内容进行修改
                for(count =0; count < 3; count++) {
                    conf = null
                    sconf = ""
                    switch (count) {
                        case 0:
                            conf = cmd
                            sconf = "Cmd"
                            break
                        case 1:
                            conf = input
                            sconf = "Input"
                            break
                        case 2:
                            conf = output
                            sconf = "Output"
                            break
                    }

                    for(var key in config[sconf]) {
                        viewType = config[sconf][key].View.Type
                        // alert(viewType)

                        if(viewType.toString() === "radio"){
                            targets = $("input[name=\""+ key +"\"]:checked")
                            // alert(targets.length)
                            targets.each(function (index, item) {
                                // alert(index)
                                // alert($(this).val())
                                // alert(item.value)
                                conf[key] = $(this).val().toString()
                            })
                        }
                        else if(viewType.toString() === 'checkbox'){
                            targets = $("input[name=\""+ key +"\"]:checked")
                            // alert(targets.length)
                            arr = []
                            targets.each(function (index, item) {
                                // alert(index)
                                // alert($(this).val())
                                // alert(item.value)
                                arr.push($(this).val().toString())
                            })
                            // alert(JSON.stringify(arr))
                            // 转换成字符串后再保存,arr为空数组也没有问题
                            conf[key] = JSON.stringify(arr)
                        }
                        else if(viewType.toString() === "text"){
                            // alert($("#text_"+key+"1").val())
                            conf[key] = $("#text_"+key+"1").val()
                        }
                        else if(viewType.toString() === "textarea"){
                            // alert($("#textarea_"+key+"1").val())
                            conf[key] = $("#textarea_"+key+"1").val()
                        }
                    }
                }

                // 将修改后的ret转换成字符串形式提交
                retStr = JSON.stringify(ret)
                // alert(retStr)

                $.ajax({
                    async: false,
                    method: "POST",
                    url: "/cviews/save_task/",
                    data: { "task_id": pageRowTid.toString(), "json_data": retStr},
                    dataType: "text",
                    timeout: 0,
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                }).done(function (ret) {
                    if(ret.toString() !== ""){
                        alert(ret)
                    }

                }).fail(function (jqXHR, textStatus, errorThrown) {
                    alert("Request failed: "+textStatus)
                })
            }
        }
    }
}


// 新建
function newTask() {

    // 1. 依据cid对应的config默认数据创建新任务，并使得新建任务为页行的选中
    // 正常情况下pageRowId存在
    pageRowId = $("#current-page-row-id").val()
    flag = false
    $.ajax({
        async: false,
        method: "POST",
        url: "/cviews/new_task/",
        data: { "page_row_id": pageRowId.toString()},
        dataType: "html",
        timeout: 0,
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
    }).done(function (ret) {
        if(ret.toString() === ""){
            flag = true
        }else{
            alert(ret.toString())
            flag = false
        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        alert("Request failed: "+textStatus)
        flag = false
    })
    if(flag === false)
        return;

    // 2. 执行左侧页面点击
    target = $("#page-row"+pageRowId.toString())
    // length大于0代表查找对象存在，0代表不存在
    if(target.length > 0){
        target.trigger("click")
    }
}

function searchTask(){
    // 搜索，实际上就是等同再次点击当前页行
    pageRowId = $("#current-page-row-id").val()
    if(pageRowId.toString() !== ""){
        target =  $("#page-row" + pageRowId.toString())
        // length大于0代表查找对象存在，0代表不存在
        if(target.length > 0){
            target.trigger("click")
        }
    }
}

function changeTask(tid) {
    // 变换任务，等效为修改page-row 对应的tid，并再次进行searchTask
    // 1. 修改page-row对应的任务id
    flag = false
    $.ajax({
        async: false,
        method: "POST",
        url: "/cviews/change_task/",
        data: { "task_id": tid.toString()},
        dataType: "html",
        timeout: 0,
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
    }).done(function (ret) {
        if(ret.toString() === ""){
            flag = true
        }else{
            alert(ret.toString())
            flag = false
        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        alert("Request failed: "+textStatus)
        flag = false
    })
    if(flag === false)
        return;

    // 2. 再次进行searchTask
    searchTask()
}

function excuteTask() {
    // 执行任务，拆分： 1保存任务数据(saveTask，仅保存准备态数据) 2提交任务id，服务器获取代码启动新线程异步执行，改变状态为执行
    // 3仅仅等待300ms获取当前任务数据(实际searchTask即可)

    // 1 保存任务数据
    saveTask()
    // 2 提交并执行任务
    taskId = $("#current-page-row-tid")
    if(taskId.length > 0 ) {
        // 获取任务对象的tid
        pageRowTid = taskId.val()
        if (pageRowTid.toString() === (-1).toString()) {
            // 说明未指定任务，什么也不用做
        }else {
            flag = false
            $.ajax({
                async: false,
                method: "POST",
                url: "/cviews/excute_task/",
                data: { "task_id": pageRowTid.toString()},
                dataType: "html",
                timeout: 0,
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            }).done(function (ret) {
                if(ret.toString() === ""){
                    flag = true
                }else{
                    alert(ret.toString())
                    flag = false
                }
            }).fail(function (jqXHR, textStatus, errorThrown) {
                alert("Request failed: "+textStatus)
                flag = false
            })

            // 3 等待300ms并获取当前任务数据
            if(flag)
                setTimeout(searchTask, 300)
        }
    }
}

function task_clear() {

    // 依据选择，清除页行对应的任务
    targets = $("input[name=\"radio_clear_task_way_cview\"]:checked")
    select = ""
    targets.each(function (index, item) {
        select= $(this).val().toString()
    })

    info = ""
    if(select !== "") {
        // 提交清除任务
        // 正常情况下,该任务id一定存在
        taskId = $("#current-page-row-tid")
        if (taskId.length > 0) {
            pageRowTid = taskId.val()
            if (pageRowTid.toString() === (-1).toString()) {
                // 说明未指定任务，什么也不用做
                info = "任务Id不存在！"
            } else {
                flag = false
                $.ajax({
                    async: false,
                    method: "POST",
                    url: "/cviews/clear_task/",
                    data: {"task_id": pageRowTid.toString(), "way": select.toString()},
                    dataType: "html",
                    timeout: 0,
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                }).done(function (ret) {
                    if (ret.toString() === "") {
                        info = "清除成功！"
                        flag = true
                    } else {
                        info = ret.toString()
                        flag = false
                    }
                }).fail(function (jqXHR, textStatus, errorThrown) {
                    info = "Request failed: " + textStatus
                    flag = false
                })
            }
        } else {
            info = "页面存在错误！"
        }
    }else{
        info = "未选择清除方式！"
    }
    // 关闭原有clear_modal模态框
    $('#clear-modal').modal('toggle')
    // 插入提示信息
    $("#info_content_btn").html(info)
    // 显示提示信息
    if(info !== "")
        $('#info-modal').modal('toggle')

    // 执行左侧页面点击
    // 正常情况下pageRowId存在
    pageRowIdObj = $("#current-page-row-id")
    if(pageRowIdObj.length > 0){
        pageRowId = pageRowIdObj.val()
        target = $("#page-row"+pageRowId.toString())
        // length大于0代表查找对象存在，0代表不存在
        if(target.length > 0){
            target.trigger("click")
        }
    }

}