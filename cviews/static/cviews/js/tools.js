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
    $("#page-rows").html("")

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
    $("#content-area").html("")

    // 5. 更新当前Page指向的PageRow, 并获取新的页行对应的界面定义,创建页行界面
    // 如果页行没有对应的任务，则创建一个新的任务，作为默认选中
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

    // 6. 触发新的任务查询事件，填充数据

}

function afterChangePageRow(newPageRowId) {
    // 页行变换之后的操作，暂时没什么好执行的
}







// 清除当前活动Page的Active效果
function ClearCurrentPageActive() {
    val = $("#current_page").val()
    if(val.toString() !== "") {
        $("#"+val.toString()).removeClass("active")
    }
}

// 设置某一Page为Active
function SetPageActive(pageid) {
    ClearCurrentPageActive()
    $("#current_page").val(pageid.toString())
    $("#"+pageid.toString()).addClass("active")
    ClearAffix()
    FillAffix()
}

// 清空附加导航
function ClearAffix() {
    val = $("#current_page_row").val()
    if(val.toString() !== "") {
        SaveCurrentPluginContent()
    }
}

// 离开CurrentPluginContent的时候，需要调用该方法
function SaveCurrentPluginContent() {
    //判断是否为准备状态，如果是，则保存当前plugin-content数据
    //否则，不进行任何处理
}

// 填充附加导航
function FillAffix(pageid) {
    //依据pageid获取附加导航数据，并填充
}

// 设置某一PageRow为Active
function SetPageRowActive(pagerowid) {

}

function ClearCurrentPluginContent() {

}