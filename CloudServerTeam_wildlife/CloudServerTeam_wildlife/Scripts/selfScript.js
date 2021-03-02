// JavaScript Document
function varDateTry() {
    var today = new Date(2015,0,14,13,12,45);
    //document.getElementById("outPut").innerHTML = today;
    var ArrayX = [2,3,4,5,6,7];
    var x=ArrayX.shift();
    //document.getElementById("outPut").innerHTML = x;
    document.getElementById("outPut").innerHTML = ArrayX[0];
}

//以下是AJAX的通用代码

//创建XMLHttpRequest对象 区分浏览器类型 如果是IE的话则创建ActiveXObject
var xmlHttp;  //全局的请求变量
function createXmlHttpRequestObj() {
    if(window.ActiveXObject){
        try{
            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        catch(e){
            xmlHttp = false;
        }
    }
    else {
        try{
            xmlHttp = new XMLHttpRequest();
        }
        catch(e){
            xmlHttp = false;
        }        
    }
    
    if(!xmlHttp){ alert("创建对象时发生错误"); }
    else{ return xmlHttp; }
}

function RequestHTML() {
    createXmlHttpRequestObj();            //创建请求对象 此处不用重新声明变量倒也是奇特 我说呢原来是全局
    xmlHttp.onreadystatechange = StatHandler_tamplate; //指定在状态变更时调用的函数
    xmlHttp.open("GET","example.html",true);  //指定请求的目标文件以及传输方式
    xmlHttp.send(null);  //传输请求
}

//被调用的函数 这可以根据需求换
function StatHandler_tamplate() {
    if(xmlHttp.readyState==4 && xmlHttp.status==200){
            document.getElementById("outPut").innerHTML=xmlHttp.responseText;
        }
}

//----以下是用于bootstrap结构的页面跳转函数，局部刷新------------------------------------------------------------
function RequestDesignFrame() {
	createXmlHttpRequestObj();
	xmlHttp.onreadystatechange = StatHandler_DesignFrame;
	xmlHttp.open("GET","bootstrap_study.html",true);
	xmlHttp.send(null);
}

function StatHandler_DesignFrame(){
	    if(xmlHttp.readyState==4 && xmlHttp.status==200){
            document.getElementById("default_frame").innerHTML=xmlHttp.responseText;
        }
}




