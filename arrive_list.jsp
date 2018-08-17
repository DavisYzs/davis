<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<style>
	.labelw{display:inline-block;}
	.inputW{width:150px;display:inline-block;}
</style>
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
						<!-- 检索  -->
						<form action="/Meeting/gomeetingperson.do" method="post" name="userForm" id="userForm">
							<input type="hidden" name="meetingid" id="meetingid" value="${pd.meetingid }" />
							<table style="margin-top:5px;">
								<tr>
									<%-- <td>
										<div class="nav-search">
										<span class="input-icon">
										<span style="display:inline-block;line-height:30px;">姓名:</span>
											<input class="" autocomplete="off" id="name" type="text" name="name" value="${pd.name }"  placeholder="输入姓名" style="height:30px;width:150px;"/>											
										</span>
										</div>
									</td>
									
									<td style="vertical-align:top;padding-left:2px;">
										<span style="display:inline-block;line-height:30px;">技师来源:</span>
									 	<select class="" name="jishitype" id="jishitype" data-placeholder="技师来源" style="vertical-align:top;width: 120px;">
											<option value="${pd.jishitype }">
											<c:if test="${pd.jishitype != 1 && pd.jishitype != 2 && pd.jishitype != 3  }">全部</c:if>
			                                <c:if test="${pd.jishitype == 1 }">前台录入</c:if>
			                                <c:if test="${pd.jishitype == 2 }">借调</c:if>
			                                <c:if test="${pd.jishitype == 3 }">招聘</c:if>
			                                </option>
			                                <c:if test="${pd.jishitype == 1 || pd.jishitype == 2 || pd.jishitype == 3 }"><option value="">全部</option></c:if>
			                                <option value="1">前台录入</option>
			                                <option value="2">借调</option>
			                                <option value="3">招聘</option>
									  	</select>
									</td>
									<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
									<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="fromExcel();" title="从EXCEL导入"><i id="nav-search-icon" class="ace-icon fa fa-cloud-upload bigger-110 nav-search-icon blue"></i></a></td> --%>
									<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i>导出</a></td>
								</tr>
							</table>
							
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<!-- <th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th> -->
									
									<th class="center">店员姓名</th>
									<th class="center">客户姓名</th>
									<th class="center">是否签到</th>
									<th class="center">客户姓名</th>
									<th class="center">是否签到</th>
									<%-- <c:if test="${pd.ROLE_ID == 'd7486429e337480b8f189618c78c7201'}"> --%>
									<th class="center">操作</th>
									<%-- </c:if> --%>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="user" varStatus="vs">
										<tr>
											<td class="center">${user.employeename }</td>
											<td class="center">${user.nameone }</td>
											<td class="center">${user.isarriveone }</td>
											<td class="center">${user.nametwo }</td>
											<td class="center">${user.isarrivetwo }</td>
											<%-- <c:if test="${pd.ROLE_ID == 'd7486429e337480b8f189618c78c7201'}"> --%>
											<td class="center">
												<div class="btn-group">
													<c:if test="${not empty pd.managerid && user.istime == 1}">
													<a class="btn btn-xs btn-success" title="编辑" onclick="editUser('${user.id}');">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
													</a>
													</c:if>
													 <a title="客户详情" class="btn btn-mini btn-info" style="line-height:22px;" onclick="details('${user.familyid}')">客户详情</a> 
												</div>
												<%-- <div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<li>
																<a style="cursor:pointer;" onclick="editUser('${user.id}');" class="tooltip-success" data-rel="tooltip" title="编辑">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
																	</span>
																</a>
															</li>
															 <li>
																<a style="cursor:pointer;" onclick="look('${user.id}');" class="tooltip-error" data-rel="tooltip" title="查看">
																	<span class="red">
																		<i class="ace-icon fa fa-search bigger-120"></i>
																	</span>
																</a>
															</li> 
														</ul>
													</div>
												</div> --%>
											</td>
											<%-- </c:if> --%>
										</tr>
									</c:forEach>
									
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<c:if test="${not empty pd.managerid}">
									<a class="btn btn-mini btn-success" id="removeA" href="javascript:add();">任务发布</a>											
									</c:if>
									<a class="btn btn-mini btn-success" id="removeA" href="javascript:history.go(-1);">返回</a>	
								</td>
								 <td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
						</form>
 						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</body>
 	<script type="text/javascript">
		$(top.hangge());
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		//检索
		function searchs(){
			top.jzts();
			$("#userForm").submit();
		}
		
		//去发送电子邮件页面
		function sendEmail(EMAIL){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="发送电子邮件";
			 diag.URL = '<%=basePath%>head/goSendEmail.do?EMAIL='+EMAIL+'&msg=appuser';
			 diag.Width = 660;
			 diag.Height = 470;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//去发送短信页面
		function sendSms(phone){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="发送短信";
			 diag.URL = '<%=basePath%>head/goSendSms.do?PHONE='+phone+'&msg=appuser';
			 diag.Width = 600;
			 diag.Height = 265;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//详情
		function details(id){
			window.location.href='<%=basePath%>mbMember/goView.do?familyid='+id+'&jsptype=1'+'&isfromarrive=1';
		}
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增任务";
			 diag.URL = '<%=basePath%>Meeting/goAdd.do';
			 diag.Width = 600;
			 diag.Height = 415;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//修改
		function editUser(user_id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改任务";
			 diag.URL = '<%=basePath%>Meeting/goEdit.do?id='+user_id;
			 diag.Width = 600;
			 diag.Height = 415;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		//查看
		function look(user_id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="会议详情";
			 diag.URL = '<%=basePath%>Meeting/goEdit.do?id='+user_id+'&look=';
			 diag.Width = 600;
			 diag.Height = 415;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function delUser(userId,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>happuser/deleteU.do?USER_ID="+userId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					var emstr = '';
					var phones = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  	
						  	if(emstr=='') emstr += document.getElementsByName('ids')[i].id;
						  	else emstr += ';' + document.getElementsByName('ids')[i].id;
						  	
						  	if(phones=='') phones += document.getElementsByName('ids')[i].alt;
						  	else phones += ';' + document.getElementsByName('ids')[i].alt;
						  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>happuser/deleteAllU.do?tm='+new Date().getTime(),
						    	data: {USER_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}else if(msg == '确定要给选中的用户发送邮件吗?'){
							sendEmail(emstr);
						}else if(msg == '确定要给选中的用户发送短信吗?'){
							sendSms(phones);
						}
						
					}
				}
			});
		}
		
		//导出excel
		function toExcel(){
			var meetingid = $("#meetingid").val();
			window.location.href='<%=basePath%>Meeting/arriveexcel.do?meetingid='+meetingid;
		}
		//打开上传excel页面
function fromExcel(){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="EXCEL 导入到数据库";
	 diag.URL = '<%=basePath%>mbMember/goUploadExcel';
	 diag.Width = 300;
	 diag.Height = 150;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			 if('${page.currentPage}' == '0'){
				 top.jzts();
				 setTimeout("self.location.reload()",100);
			 }else{
				 nextPage(${page.currentPage});
			 }
		}
		diag.close();
	 };
	 diag.show();
}

		</script>
</html>
