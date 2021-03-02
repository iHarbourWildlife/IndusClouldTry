<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="CloudServerTeam_wildlife.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>主页面</title>
    <!--尝试使用bootstrap构建页面布局-->
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/styleSheetForBTS.css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div class="container-fluid">
	<div class="row clearfix">
		<div class="col-md-8 column">
		  <h2 class="text-center"> 工业云监控平台 </h2>
        </div>
		<div class="col-md-4 column">
            <ul class="list-inline" style="float:right">
                <li class="list-group-item">用户名</li>
                <li class="list-group-item"><img src="images/AGV.jpg" alt="用户头像" width="30px" height="30px" /></li>
                <li class="list-group-item"><a href="#">信息更改</a></li>
                <li class="list-group-item"><a href="#">注销</a></li>
            </ul>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-1 column" id="navigate_div">
            <ul class="list-group" id="navigate_list">
                <li class="list-group-item active">商务</li>
                <li class="list-group-item leaf" onclick="business_bill()" role="button">订单</li>
                <li class="list-group-item leaf" role="button">投标</li>
                <li class="list-group-item leaf" role="button">生产</li>
                
                <li class="list-group-item active" >设计</li>
                <li class="list-group-item leaf" onclick="RequestThreeDisp()" role="button">CAD</li>
                <li class="list-group-item leaf" onclick="RequestDesignFrame()" role="button">CAE</li>
                <li class="list-group-item leaf" role="button">CAM</li>
                <li class="list-group-item leaf" role="button">Code</li>
                
                <li class="list-group-item active">监控</li>
                <li class="list-group-item leaf" onclick="loadChartFromXMLA()" role="button" >状态监控</li>
                <li class="list-group-item leaf" onclick="loadChartFromXMLB()" role="button">计划监控</li>
                <li class="list-group-item leaf" onclick="loadChartFromXMLC()" role="button">资源监控</li> 
                <li class="list-group-item leaf" onclick="RequestExpectionFrame()" role="button">异常监测</li>                
            </ul>
		</div>
        <!--这里的内容最事能替换的或者 此处应写在各个单独的框架里-->
		<div class="col-md-8 column" id="default_frame" style="border:thin #000000 dashed"> 
			<div class="row clearfix" id="overall_main">
				<div class="col-md-8 column" id="overall_chart" style="height:50%">
                    <div class="row clearfix" style="height:90%">
                        <div class="col-md-6 column" id="chart1div"><canvas id="chart1" width="4px" height="3px"></canvas></div>
                        <div class="col-md-6 column" id="chart2div"><canvas id="chart2" width="4px" height="3px"></canvas></div>
                    </div>
                    <div class="row clearfix"  style="height:10%">
                        <div class="col-md-6 column"><p id="explainA">可能需要的解释A</p>
                        </div>
                        <div class="col-md-6 column"><p id="explainB">可能需要的解释B</p>
                        </div>
                    </div>
				</div>
				<div class="col-md-4 column" id="overall_ctrl">
					<div class="btn-group">
						<button type="button" class="btn btn-default">控制选项1</button>
						<button type="button" class="btn btn-default">控制选项2</button>
						<button type="button" class="btn btn-default">控制选项3</button>
					</div>
					<form role="form">
						<div class="form-group">
							 <label for="exampleInputEmail1">全局控制参数1&nbsp;</label>
							 <input type="email" class="form-control" id="exampleInputEmail1" />
						</div>
						<div class="form-group">
							 <label for="exampleInputPassword1">全局控制参数2&nbsp;</label>
							 <input type="password" class="form-control" id="exampleInputPassword1" />
						</div>
						<div class="form-group">
							 <label for="exampleInputFile">全局配置文件&nbsp;</label>
							 <input type="file" id="exampleInputFile" />
							<p class="help-block">
								Example block-level help text here.
							</p>
						</div>
						<div class="checkbox">
							 <label><input type="checkbox" />Check me out</label>
						</div> <button type="submit" class="btn btn-default">更改提交&nbsp;</button>
					</form>
				</div>
			</div>
			<div class="row clearfix" style="margin-top:20px;" id="partly_main">
				<div class="col-md-8 column" id="partly_chart" style="height:50%">
                    <div class="row clearfix">
                        <div class="col-md-6 column" id="chart3div"><canvas id="chart3"></canvas></div>
                        <div class="col-md-6 column" id="chart4div"><canvas id="chart4" width="4px" height="3px"></canvas></div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-md-6 column"><p id="explainC">可能需要的解释C</p>
                        </div>
                        <div class="col-md-6 column"><p id="explainD">可能需要的解释D</p>
                        </div>
                    </div>
				</div>
				<div class="col-md-4 column" id="partly_ctrl">
					<div class="btn-group">
						<button type="button" class="btn btn-default">控制选项1</button>
						<button type="button" class="btn btn-default">控制选项2</button>
						<button type="button" class="btn btn-default">控制选项3</button>
					</div>
					<form role="form">
						<div class="form-group">
							 <label for="exampleInputEmail1">局部控制参数1&nbsp;</label>
							 <input type="email" class="form-control" id="exampleInputEmail2" />
						</div>
						<div class="form-group">
							 <label for="exampleInputPassword1">局部控制参数2&nbsp;</label>
							 <input type="password" class="form-control" id="exampleInputPassword2" />
						</div>
						<div class="form-group">
							 <label for="exampleInputFile">局部配置文件&nbsp;</label>
							 <input type="file" id="exampleInputFile2" />
							<p class="help-block">
								Example block-level help text here <br /> 控制参数的使用方法与解释,详细说明。
							</p>
						</div>
						<div class="checkbox">
							 <label><input type="checkbox" />Check me out</label>
						</div> <button type="submit" class="btn btn-default">Submit</button>
					</form>
				</div>
			</div>
		</div>
        
		<div class="col-md-3 column" id="main_info">
			<table class="table table-hover table-striped" id="factory_table">
				<thead>
					<tr>
						<th>
					    厂区名称&nbsp; </th>
						<th>
					    地址&nbsp; </th>
						<th>
					    主要产品&nbsp; </th>
						<th>
							当前状态
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Approved
						</td>
					</tr>
					<tr>
						<td>
							2
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							02/04/2012
						</td>
						<td>
							Declined
						</td>
					</tr>
					<tr>
						<td>
							3
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							03/04/2012
						</td>
						<td>
							Pending
						</td>
					</tr>
					<tr>
						<td>
							4
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							04/04/2012
						</td>
						<td>
							Call in to confirm
						</td>
					</tr>
				</tbody>
			</table>
          <div class="list-group-item">
		    <h4>
				选中厂区详细信息
			    </h4>
	        <p>此段为选中的厂区的详细信息 可能包括地址、建设时间、历史成产内容以及下属车间情况、具体物质资产等详细信息表格最好能整成两级的&nbsp;</p>
	        <p>这样一个表就足够了 这部分不在跟着左边的导航栏更新 暂时似乎没办法实现 还是俩表吧&nbsp;</p>
          </div>
            <table class="table table-hover" id="workshop_table">
				<thead>
					<tr>
						<th>
							车间编号
						</th>
						<th>
						  主要任务
						</th>
						<th>
							预计进度
						</th>
						<th>
							当前状态
						</th>
					</tr>
				</thead>
				<tbody>
					<tr class="success">
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Approved
						</td>
					</tr>
					<tr class="error">
						<td>
							2
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							02/04/2012
						</td>
						<td>
							Declined
						</td>
					</tr>
					<tr class="warning">
						<td>
							3
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							03/04/2012
						</td>
						<td>
							Pending
						</td>
					</tr>
					<tr class="info">
						<td>
							4
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							04/04/2012
						</td>
						<td>
							Call in to confirm
						</td>
					</tr>
				</tbody>
			</table>
            <div class="list-group-item">
			    <h4>
				    选中车间详细信息
			    </h4>
			    <p>
				    此段为选中车间的详细信息 可能包括人员信息、管理系统、物料储备、设备资源等详细信息
			    </p>
            </div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-6 column">
		</div>
		<div class="col-md-6 column">
		  <p>Powered By XJTU CGYT</p>
		</div>
	</div>
</div>
</form>
    
<!--以下是脚本添加区域-->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- 包括所有已编译的插件 -->
    <script src="Scripts/bootstrap.min.js"></script>
    <!--以下是自行编辑的脚本-->
    <script src="Scripts/drawChart.js" type="text/javascript"></script>
    <script src="Scripts/selfJsCgyt_vs.js" type="text/javascript"></script>
    <!--以下是包-->
    <script src="Scripts/Chart.js" type="text/javascript"></script>
    <script src="Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
    <!--以下是刘于写的脚本和应用的包 主要用于展示3d模型-->
    <script src="stlload/Scripts/three.js"></script>
    <script src="stlload/Scripts/OrbitControls.js"></script>
    <script src="stlload/Scripts/STLLoader.js"></script>
</body>
</html>
