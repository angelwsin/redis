<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<style type="text/css">
.post-form label{width:300px;}
.post-form .toolbar{padding-left:"300px;}
</style>
<div class="post-form long">
	<h3>${__title}</h3>
	<p>当单位选择为<span style="color:blue;">小时</span>的时候候，系统会自动转化为<span style="color:blue;">分钟</span>。</p>
	<form>
		<c:forEach items="${map}" var="siteMap">
			<div>
				<c:if test="${siteMap.key ne 'ssl' && siteMap.key ne 'interval'}">
					<x:text property="siteMap.value" name="siteMap.${siteMap.key}" label="${siteMap.value.group}" />
				</c:if>
				<c:if test="${siteMap.key eq 'interval'}">
					<x:text property="siteMap.value" name="siteMap.${siteMap.key}" label="${siteMap.value.group}" cssClass="short" />
					<select cssClass="short" id="unit">
					  <option value ="1" selected="selected">分钟</option>
					  <option value ="2">小时</option>
					</select>
					<input type="hidden" id="minute" name="minute"/>
				</c:if>
				<c:if test="${siteMap.key eq 'port'}">
					<span style="color: red">(不填默认为25)</span>
				</c:if>
				<c:if test="${siteMap.key eq 'ssl'}">
					<x:checkbox name="siteMap.${siteMap.key}" items="{'true':'启用'}" label="${siteMap.value.group}" values="${siteMap.value.label}" />
				</c:if>
			</div>
		</c:forEach>
		<div class="toolbar button">
			<input type="button" id="registerBtn" value="修改">
		</div>
	</form>
</div>
<x:script>
	<script>
		$(function() {
			var timeInterval = $("input[name='siteMap.interval']");
			$("#minute").val(timeInterval.val());
			function updateHidden(){
				if($("#unit").val()=="2"){
					$("#minute").val(timeInterval.val()*60);
				}else{
					$("#minute").val(timeInterval.val());
				}
			}
			timeInterval.change(function(){
				updateHidden();
			});
			$("#unit").change(function(){
				updateHidden();
			});
			$("#registerBtn").click(function() {
				timeInterval.val($("#minute").val());//把值转化为分钟进行保存
				$.ajaxMessage("${metaType}", $("form").serialize());
				$("#unit option").eq(0).attr('selected', 'true');
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>