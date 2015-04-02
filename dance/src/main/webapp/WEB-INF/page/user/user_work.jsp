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
					<input type="hidden" value="company" name="act"> <input type="hidden" value="1" name="submit">
					<div class="user_right_border">
						<div class="l">公司名称：</div>
						<div class="c">
							<input type="text" value="" maxlength="20" name="company_name">
						</div>
					</div>
					<div class="user_right_border">
						<div class="l">公司性质：</div>
						<div class="c">
							<select id="company_type" name="company_type" class="jeinput"><option value="">请选择</option>
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
						<div class="l">职位状态：</div>
						<div class="c">
							<select id="company_office" name="company_office" class="jeinput"><option value="">请选择</option>
								<option value="77">财务总监</option>
								<option value="78">财务主管</option>
								<option value="79">审计/税务</option>
								<option value="80">总账/成本</option>
								<option value="81">会计人员</option>
								<option value="82">人力资源总监</option>
								<option value="83">人力资源经理/主管</option>
								<option value="84">招聘经理/主管</option>
								<option value="85">薪资福利经理/主管</option>
								<option value="86">财务经理</option>
								<option value="87">培训经理/主管</option>
								<option value="88">人事专员/助理</option>
								<option value="89">行长/副行长</option>
								<option value="90">信贷/信用管理</option>
								<option value="91">资产管理/评估</option>
								<option value="92">投融资项目/基金</option>
								<option value="93">外汇管理/国际结算</option>
								<option value="94">风险管理</option>
								<option value="95">证券/期货</option>
								<option value="96">客户经理/主管</option>
								<option value="97">核保/理赔</option>
								<option value="98">保险代理人/内勤</option>
								<option value="99">银行专员/柜台</option>
								<option value="100">精算师</option>
								<option value="101">编辑/记者/文案</option>
								<option value="102">版面设计</option>
								<option value="103">平面设计</option>
								<option value="104">装潢/陈列设计</option>
								<option value="105">纺织/服装设计</option>
								<option value="106">工艺品/珠宝设计</option>
								<option value="107">经理</option>
								<option value="108">主任</option>
								<option value="109">生物工程</option>
								<option value="110">药物注册</option>
								<option value="111">临床研究/协调</option>
								<option value="112">药物研发/分析工程师</option>
								<option value="113">化学工程师</option>
								<option value="114">环保工程师</option>
								<option value="115">化工人员</option>
								<option value="116">结构/建筑工程师</option>
								<option value="117">土建工程师/建造师</option>
								<option value="118">机电/给排水/暖通工程师</option>
								<option value="119">工程造价师/预决算</option>
								<option value="120">监理/安全工程师</option>
								<option value="121">房地产开发/策划</option>
								<option value="122">园林景观/城市规划师</option>
								<option value="123">物业管理</option>
								<option value="124">房地产评估/中介/交易</option>
								<option value="125">电子/电路工程师</option>
								<option value="126">电气工程师</option>
								<option value="127">半导体工程师</option>
								<option value="128">测试工程师</option>
								<option value="129">自动化工程师</option>
								<option value="130">光学工程师</option>
								<option value="131">电力工程师</option>
								<option value="132">水利/水电工程师</option>
								<option value="133">单片机/DLC/DSP/底层软件开发</option>
								<option value="134">其他工程师</option>
								<option value="135">技术人员</option>
								<option value="136">助理</option>
								<option value="137">厂长/副厂长</option>
								<option value="138">生产经理/车间主任</option>
								<option value="139">产品开发</option>
								<option value="140">工业/产品设计</option>
								<option value="141">生产/计划/调度</option>
								<option value="142">质量管理</option>
								<option value="143">项目管理</option>
								<option value="144">工程设备管理</option>
								<option value="145">安全/健康/环境管理</option>
								<option value="146">生产工艺/技术</option>
								<option value="147">技工</option>
								<option value="148">机械工程师</option>
								<option value="149">维修工程师</option>
								<option value="150">机械设计/制图</option>
								<option value="151">机电工程师</option>
								<option value="152">模具工程师</option>
								<option value="153">精密机械/仪器仪表</option>
								<option value="154">船舶工程师</option>
								<option value="155">冲压/注塑/焊接</option>
								<option value="156">餐饮/娱乐管理</option>
								<option value="157">酒店/宾馆管理</option>
								<option value="158">服务人员/领班</option>
								<option value="159">导游/旅行顾问/票务</option>
								<option value="160">营业员/收银员</option>
								<option value="161">技术总监/首席技术执行官</option>
								<option value="162">技术经理</option>
								<option value="163">项目经理</option>
								<option value="164">系统分析工程师</option>
								<option value="165">ERP应用顾问</option>
								<option value="166">数据库工程师/管理员</option>
								<option value="167">软件开发工程师</option>
								<option value="168">硬件开发工程师</option>
								<option value="169">信息支持/安全维护</option>
								<option value="170">网页设计/编辑</option>
								<option value="171">通讯工程师</option>
								<option value="172">多媒体/游戏开发</option>
								<option value="173">采购经理/主管</option>
								<option value="174">采购专员/助理</option>
								<option value="175">贸易经理/主管</option>
								<option value="176">市场咨询/调研</option>
								<option value="177">创意与策划</option>
								<option value="178">客服经理/主管</option>
								<option value="179">客服专员/助理</option>
								<option value="180">客户关系管理</option>
								<option value="181">客户咨询/热线支持</option>
								<option value="182">销售总监</option>
								<option value="183">销售经理</option>
								<option value="184">销售经理</option>
								<option value="185">业务拓展经理</option>
								<option value="186">销售主管/主任</option>
								<option value="187">售前/售后支持</option>
								<option value="188">销售工程师</option>
								<option value="189">销售代表</option>
								<option value="190">医药代表</option>
								<option value="191">销售助理</option>
								<option value="192">专业顾问</option>
								<option value="193">咨询师</option>
								<option value="194">调研员</option>
								<option value="195">英语翻译</option>
								<option value="196">日语翻译</option>
								<option value="197">德语翻译</option>
								<option value="198">法语翻译</option>
								<option value="199">俄语翻译</option>
								<option value="200">西班牙语翻译</option>
								<option value="201">其他翻译</option>
								<option value="202">董事/总经理/总裁</option>
								<option value="203">首席执行官/运营官</option>
								<option value="204">营运总监/经理</option>
								<option value="205">合伙人</option>
								<option value="206">行政总监</option>
								<option value="207">行政经理</option>
								<option value="208">主管/主任</option>
								<option value="209">助理/秘书</option>
								<option value="210">前台/文员</option>
								<option value="211">物流经理/主管</option>
								<option value="212">物流专员/助理</option>
								<option value="213">物料/仓库管理</option>
								<option value="214">供应链</option>
								<option value="215">供应链</option>
								<option value="216">单证/报关员</option>
								<option value="217">律师/法务</option>
								<option value="218">能源/动力</option>
								<option value="219">医疗/护理</option>
								<option value="220">科研人员</option>
								<option value="221">培训/教育</option>
								<option value="222">储备干部/培训生</option>
								<option value="223">在校学生</option>
								<option value="224">其他职位</option></select>
						</div>
					</div>
					<div class="user_right_border">
						<div class="l">月收入：</div>
						<div class="c">
							<select id="income" name="income" class="jeinput"><option value="">请选择</option>
								<option value="21">1000元以下</option>
								<option value="22">1001-2000</option>
								<option value="23">2001-3000</option>
								<option value="24">3001-4000</option>
								<option value="25">4001-5000</option>
								<option value="26">5001-8000</option>
								<option value="27">8001-10000</option>
								<option value="28">10001-30000</option>
								<option value="29">30001-50000</option>
								<option value="30">50000以上</option></select>
						</div>
					</div>
					<div class="user_right_border">
						<div class="l">公司规模：</div>
						<div class="c">
							<input type="text" value="" name="company_employee">
						</div>
					</div>
					<div class="user_right_border">
						<div class="l">公司电话：</div>
						<div class="c">
							<input type="text" value="" maxlength="20" name="company_tel">
						</div>
					</div>
					<div class="user_right_border">
						<div class="l">公司地址：</div>
						<div class="c">
							<input type="text" value="" maxlength="30" name="company_address">
						</div>
					</div>
					<div class="user_right_border">
						<div class="l">公司网站：</div>
						<div class="c">
							<input type="text" value="" maxlength="30" name="company_weburl">
						</div>
					</div>
					<div class="user_right_border">
						<p>直接亲属联系人1</p>
					</div>
					<div class="user_right_border">
						<div class="l">姓名：</div>
						<div class="c">
							<input type="text" value="" maxlength="10" name="linkman1">
						</div>
					</div>
					<div class="user_right_border">
						<div class="l">关系：</div>
						<div class="c">
							<select id="relation1" name="relation1" class="jeinput"><option value="">请选择</option>
								<option value="239">配偶</option>
								<option value="240">父亲</option>
								<option value="241">母亲</option>
								<option value="242">兄弟姐妹</option>
								<option value="243">子女</option></select>
						</div>
					</div>
					<div class="user_right_border">
						<div class="l">手机：</div>
						<div class="c">
							<input type="text" value="" maxlength="20" name="phone1">
						</div>
					</div>
					<div class="user_right_border">
						<p>直接亲属联系人2</p>
					</div>
					<div class="user_right_border">
						<div class="l">姓名：</div>
						<div class="c">
							<input type="text" value="" maxlength="10" name="linkman2">
						</div>
					</div>
					<div class="user_right_border">
						<div class="l">关系：</div>
						<div class="c">
							<select id="relation2" name="relation2" class="jeinput"><option value="">请选择</option>
								<option value="239">配偶</option>
								<option value="240">父亲</option>
								<option value="241">母亲</option>
								<option value="242">兄弟姐妹</option>
								<option value="243">子女</option></select>
						</div>
					</div>
					<div class="user_right_border">
						<div class="l">手机：</div>
						<div class="c">
							<input type="text" value="" maxlength="20" name="phone2">
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