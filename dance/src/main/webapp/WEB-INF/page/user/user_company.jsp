<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/header.jsp"%>
<div class="user-content">
	<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
	<x:js path="date" />
	<div class="user-content-right">
		<div class="content">
			<%@ include file="/WEB-INF/page/tab/user_tab.jsp"%>
			<div class="product post-form">
			<div class="message">请认真填写用户信息。</div>
				<form id="myform">
					<input type="hidden" value="qiye" name="act"> <input type="hidden" value="1" name="submit">
					<div class="user_right_border">
						<div class="l">企业性质：</div>
						<div class="c">
							<select id="qiye_type" name="qiye_type" class="jeinput"><option value="">请选择</option>
								<option value="47">政府机关</option>
								<option value="48">国有企业</option>
								<option value="49">台（港，奥）资企业</option>
								<option value="50">外资企业</option>
								<option value="51">合资企业</option>
								<option value="52">个体户</option>
								<option value="53">事业性单位</option>
								<option value="475">私营企业</option></select>
						</div>
					</div>
					<div class="user_right_border">
						<div class="l">企业名称：</div>
						<div class="c">
							<input type="text" value="" name="qiye_name">
						</div>
					</div>
					<div class="user_right_border">
						<div class="l">企业规模：</div>
						<div class="c">
							<input type="text" value="" name="qiye_employee">
						</div>
					</div>
					<div class="user_right_border">
						<div class="l">注册资本：</div>
						<div class="c">
							<input type="text" value="" maxlength="20" name="zhuce">
						</div>
					</div>
					<div class="user_right_border">
						<div class="l">经营状况：</div>
						<div class="c">
							<textarea style="width:560px; height:100px; margin-top:15px;" class="pubinput" name="nianjian"></textarea>
						</div>
					</div>
					<div class="user_right_border">
						<div class="l">经营范围：</div>
						<div class="c">
							<textarea style="width:560px; height:100px; margin-top:15px;" class="pubinput" name="fanwei"></textarea>
						</div>
					</div>
					<div class="user_right_border">
						<div class="l">企业背景：</div>
						<div class="c">
							<textarea style="width:560px; height:180px; margin-top:15px;" class="pubinput" name="qiye_background"></textarea>
						</div>
					</div>
					<div class="user_right_border">
						<div class="l"></div>
						<div class="c">
							<input type="button" onclick="toSubmit();" value="确认提交" size="30" class="little_button">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>