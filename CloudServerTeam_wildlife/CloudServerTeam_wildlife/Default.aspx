<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CloudServerTeam_wildlife.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>此页应是用于登录的页面</title>
    <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
        <!--鉴于元素比较少 干脆直接在这里写style吧-->
    <style type="text/css">
        h1 {
            color: #eeeeee;
            margin:4em 1em;
        }
        
        .row > #head {
            height: 10em;
            margin-top: 5em;
           /* 
            border: solid 1px black;
            background-color: #C77F80;
            */
        }
        
        #loginInfo{
            height: 25em;
            background: rgba(200,200,200,0.7);
        }
        
        #loginInfo > table{
            height: 90%;
            width: 90%;      
        }
        
        #mainArea {        
            background-image: url("images/industrial revolutnon3.jpg");
        }
        #foot {
            margin-top: 2em;
        }
    </style>
</head>
<body>
    <form id="form_default" runat="server">
    <div class="container">
        <div class="row">
		    <div id="head" class="col-md-12 clearfix text-center"><h3>西安交通大学工业云平台-云端主控试验系统</h3></div>
        </div>
        <div id="mainArea" class="row clearfix">
            <div class="col-md-6 column">
                <h1>欢迎使用工业云监控平台</h1>
		    </div>
		    <div id="loginInfo" class="col-md-6 column">
                <table class="form-group">
                    <tbody >
                        <tr>
                            <td><label for="inputEmail3" class="col-sm-12 control-label">User Name&nbsp;</label></td>
                            <td>
                                <asp:TextBox ID="inputEmail3" class="form-control" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="inputPassword3" class="col-sm-12 control-label">Password</label></td>
                            <td>
                                <asp:TextBox ID="inputPassword3" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td><label><asp:CheckBox ID="rememberMeChk" runat="server" />&nbsp;Remember me</label></td>
                            <td><asp:Button ID="LoginBtn" class="btn btn-default" runat="server" Text="登 录" OnClick="LoginBtn_Clicked" /></td>
                        </tr>
                    </tbody>
                </table>
		    </div>
	    </div>
	    <div  id="foot"  class="row clearfix">
            <div class="col-md-4 column">
                <address>
                    <a href="mailto:764091925@qq.com">Contact</a><br />
                    想开咖啡馆的梧桐<br />
                    陕西省-西安市-长安区<br />
                    西安交通大学-创新港校区<br />
                    710049<br />
                </address>
            </div>
		    <div class="col-md-8 column text-right"><p>Powered by XJTU CGYT</p></div>
        </div>
    </div>
    </form>
    <!--增加必要的脚本-->
    <script src="https://code.jquery.com/jquery.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap.js" type="text/javascript"></script>
</body>
</html>
