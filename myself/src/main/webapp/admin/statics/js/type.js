// ===========================删除=======================
/**
 * 	"删除"按钮绑定点击事件（传递参数：类型ID）
		1、弹出提示框询问用户是否确认删除
		2、如果是，发送ajax请求后台（类型ID）
			resultInfo对象
			如果删除失败	code=0
				提示用户失败，msg=xxx	
			如果删除成功	code=1
				移除指定tr记录
					给table元素设置id属性值
					判断是否有多条类型记录
						1、通过id属性值，得到表格对象
						2、得到表格对象的子元素tr的数量
						3、判断tr的数量是否等于
							如果等于2，表示只有一条类型集合，删除整个表格，并设置提示内容
							如果大于2，表示有多条类型记录，删除指定tr对象
 * @param typeId
 */

function deleteType(typeId){
	// 弹出提示框询问用户是否确认删除
	swal({ 
		  title: "",  // 标题
		  text: "<h3>您确认要删除该记录吗？</h3>", // 内容
		  type: "warning", // 图标  error	  success	info  warning
		  showCancelButton: true,  // 是否显示取消按钮
		  confirmButtonColor: "orange", // 确认按钮的颜色
		  confirmButtonText: "确定", // 确认按钮的文本
		  cancelButtonText: "取消" // 取消按钮的文本
	}).then(function() {
		// 如果用户确认删除，则发送ajax请求
		$.ajax({
			type:"post",
			url:"type",
			data:{
				actionName:"delete",
				typeId:typeId
			},
			success:function (result) {
				// 判断是否删除成功
				if (result.code == 1){
					// 提示用户成功
					swal("","<h3>删除成功！</h3>","success");
					// 执行删除成功之后的DOM操作
					deleteDom(typeId);
				}else {
					// 提示用户失败
					swal("","<h3>"+result.msg+"</h3>","error");
				}
			}
		})
	});
}


function deleteDom(typeId) {
	// 1、通过id属性值，得到表格对象
	var myTable = $("#myTable");
	// 2、得到table元素的子元素的tr的数量
	var trLength = $("#myTable tr").length;
	// 3、判断tr的数量（判断是否有多条类型记录）
	if (trLength == 2){
		// 如果tr的数量等于2，表示只有一条记录，删除整个表格对象并提示信息
		$("#myTable").remove();
		$("#myDiv").html("<h2>暂未查询到相关数据,请添加！！！</h2>")
	}else{
		// 如果tr的数量大于2，则表示有多条类型记录，删除指定的tr对象
		$("#tr_" + typeId).remove();
	}

	// 2、删除左侧类型分组的导航列表项
	// 给li元素设置id属性值
	// 通过id选择器获取指定的li元素，并移除
	$("#li_" + typeId).remove();
}

/**
 打开添加模态窗口
 	绑定添加类型按钮点击事件
 */
$("#addBtn").click(function () {
	// 设置添加模态窗口的名字
	$("#myModalLabel").html("新增类型");

	// 清空文本框信息 以及隐藏域的ID属性值
	$("#typeId").val("");
	$("#typeName").val("");

	// 清空提示信息
	$("#msg").html("");

	// 打开模态窗口
	$("#myModal").modal("show");
});

/**
 打开修改模态窗口
 	绑定修改按钮的点击事件
 		设置模态窗口的类型名称的文本框中的id属性值、设置类型id对应的隐藏域，并指定id属性值
 */
function openUpdateDialog(typeId) {
	// 设置修改类型名称
	$("#myModalLabel").html("修改类型");

	// 得到当前修改按钮对应的类型记录
	// 通过id选择器，获取当前的tr对象
	var tr = $("#tr_" + typeId)
	// 得到tr具体的单元格的值（第二个td，下标是1）
	var typeName = tr.children().eq(1).text();
	// 将类型名称设置到模态窗口的文本框
	$("#typeName").val(typeName);
	// 得到tr具体的单元格的值（第1个td，下标是0）
	var typeId = tr.children().eq(0).text();
	// 将类型名称设置到模态窗口的文本框
	$("#typeId").val(typeId);

	// 清空提示信息
	$("#msg").html("");
	// 打开修改模态窗口
	$("#myModal").modal("show");
}

/**

 */
// 给保存按钮绑定鼠标单击事件
$("#btn_submit").click(function () {

	// 获取参数信息
	var typeName = $("#typeName").val();
	var typeId = $("#typeId").val();

	// 判断类型名称是否为空，如果为空提示信息并return
	if (isEmpty(typeName)){
		$("#msg").html("类型名称不能为空，请输入");
		return;
	}

	// 程序执行到此处说明类型名称不等于空,发送Ajax请求后台执行更新操作
	$.ajax({
		type:"post",
		url: "type",
		data: {
			actionName:"addOrUpdate",
			typeId:typeId,
			typeName:typeName
		},
		success: function (result) {
			// 判断是否更新成功
			if (result.code == 1){
				// 成功 首先要关闭模态窗口
				$("#myModal").modal("hide");
				// 判断类型ID是否为空
				if(isEmpty(typeId)){
					// 执行添加的DOM操作
					addDom(typeName,result.result)
				}else {
					// 执行修改的DOM操作
					updateDom(typeName,typeId);
				}
			}else {
				// 失败给用户提示信息
				$("#msg").html(result.msg);
			}
		}
	})
});

/**
 * 修改DOM操作
 * 		1.修改指定的tr记录
 * 			1.1通过id选择器，得到tr对象
 * 			1.2修改tr只当单元格的值
 * @param typeName
 * @param typeId
 */
function updateDom(typeName,typeId) {
	// 1.1通过id选择器，得到tr对象
	var tr = $("#tr_" + typeId);
	// 1.2修改tr只当单元格的值
	tr.children().eq(1).text(typeName);

	// 给左侧类型名称设置span标签，并指定id属性值，修改span元素的文本值
	$("#sp_" + typeId).text(typeName)
}

/**
 添加DOM操作
 */
function addDom(typeName,typeId) {
	/* 1.添加tr记录*/
	// 1.1. 拼接tr标签
	var tr = '<tr id="tr_'+typeId+'"><td>'+typeId+'</td><td>'+typeName+'</td>';
	tr += '<td><button class="btn btn-primary" type="button" onclick="openUpdateDialog('+typeId+')">修改</button>&nbsp;';
	tr += '<button class="btn btn-danger del" type="button" onclick="deleteType('+typeId+')">删除</button></td></tr>';

	// 1.2.通过id属性值,获取table对象
	var myTable = $("#myTable");

	// 1.3 判断table是否存在，（长度大于0）
	if (myTable.length > 0){
		// 1.4.将tr标签追加到表格对象中
		myTable.append(tr);
	} else {
		// 1.5.如果table不存在我们就要先拼接一个table
		myTable = '<table id="myTable" class="table table-hover table-striped ">';
		myTable += '<tbody><tr><th>编号</th><th>类型</th><th>操作</th></tr>';
		myTable += tr + '</tbody></table>';
		$("#myDiv").html(myTable)
	}

	// 2.添加左侧类型分组导航栏的列表项
	// 2.1.拼接li元素
	var li = '<li id="li_'+typeId+'"><a href=""><span id="sp_'+typeId+'">'+typeName+'</span> <span class="badge">0</span></a></li>';
	// 2.3 设置ul标签的id属性值，将li元素追加到ul中
	$("#typeUL").append(li);
}