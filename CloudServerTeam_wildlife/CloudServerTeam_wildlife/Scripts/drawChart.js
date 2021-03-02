// JavaScript Document
// 这个脚本文件用来表
function business () {
    document.getElementById();
}

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

function RequestHTML(filestring) {
    createXmlHttpRequestObj();            //创建请求对象 此处不用重新声明变量倒也是奇特 我说呢原来是全局
    xmlHttp.onreadystatechange = StatHandler_tamplate; //指定在状态变更时调用的函数
    xmlHttp.open("GET",filestring,true);  //指定请求的目标文件以及传输方式
    xmlHttp.send(null);  //传输请求
}

//被调用的函数 这可以根据需求换
function StatHandler_tamplate() {
    if(xmlHttp.readyState==4 && xmlHttp.status==200){
            document.getElementById("outPut").innerHTML=xmlHttp.responseText;
        }
}

//----以下是用于bootstrap结构的页面跳转函数，局部刷新====================================================================
//设计框架 design frame------------------------------------------------------------
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

//监控框架 control frame------------------------------------------------------------
function RequestControlFrame() {
	createXmlHttpRequestObj();
	xmlHttp.onreadystatechange = StatHandler_DesignFrame;
	xmlHttp.open("GET","control_frame.html",true);
	xmlHttp.send(null);
}

function StatHandler_ControlFrame(){
	    if(xmlHttp.readyState==4 && xmlHttp.status==200){
            document.getElementById("default_frame").innerHTML=xmlHttp.responseText;
        }
}

//监控框架下属 异常框架 expection frame
function RequestExpectionFrame() {
	createXmlHttpRequestObj();
	xmlHttp.onreadystatechange = StatHandler_DesignFrame;
	xmlHttp.open("GET","expection_frame.html",true);
	xmlHttp.send(null);
}

function StatHandler_ControlFrame(){
	    if(xmlHttp.readyState==4 && xmlHttp.status==200){
            document.getElementById("default_frame").innerHTML=xmlHttp.responseText;
        }
}

//获取3D模型显示
function RequestThreeDisp(){
	createXmlHttpRequestObj();
	xmlHttp.onreadystatechange = StatHandler_ThreeDisp;
	xmlHttp.open("GET","stlload/stlload.html",true);
	xmlHttp.send(null);
}

function StatHandler_ThreeDisp(){
	    if(xmlHttp.readyState==4 && xmlHttp.status==200){
            document.getElementById("default_frame").innerHTML=xmlHttp.responseText;
        }
}

//--以下代码刘于写的
function draw() {
    /**
     * 创建场景对象Scene
     */
    var scene = new THREE.Scene();
    /**
     * 创建网格模型
     */
    // var geometry = new THREE.SphereGeometry(60, 40, 40); //创建一个球体几何对象
    /*var geometry = new THREE.BoxGeometry(100, 100, 100); //创建一个立方体几何对象Geometry
    var material = new THREE.MeshLambertMaterial({
        color: 0x0000ff
    }); //材质对象Material
    var mesh = new THREE.Mesh(geometry, material); //网格模型对象Mesh
    scene.add(mesh); //网格模型添加到场景中*/
    var loader = new THREE.STLLoader();
    loader.load("stlload/stl_file/六边形戒指.stl", function (geometry) {
        var material = new THREE.MeshLambertMaterial({
            color: 0x0000ff,
        }); //材质对象Material
        var mesh = new THREE.Mesh(geometry, material); //网格模型对象Mesh
        scene.add(mesh); //网格模型添加到场景中
    })

    /**
     * 光源设置
     */
    //点光源
    var point = new THREE.PointLight(0xffffff);
    point.position.set(400, 200, 300); //点光源位置
    scene.add(point); //点光源添加到场景中
    //环境光
    var ambient = new THREE.AmbientLight(0xffffff);
    scene.add(ambient);
    //console.log(scene)
    // console.log(scene.children)
    /**
     * 相机设置
     */
    var width = 600; //窗口宽度
    var height = 400; //窗口高度
    var k = width / height; //窗口宽高比
    var s = 200; //三维场景显示范围控制系数，系数越大，显示的范围越大
    //创建相机对象
    var camera = new THREE.OrthographicCamera(-s * k, s * k, s, -s, 1, 1000);
    camera.position.set(500, 300, 200); //设置相机位置
    camera.lookAt(scene.position); //设置相机方向(指向的场景对象)
    /**
     * 创建渲染器对象
     */
    var renderer = new THREE.WebGLRenderer();
    renderer.setSize(width, height);//设置渲染区域尺寸
    renderer.setClearColor(0xb9d3ff, 1); //设置背景颜色
    //document.body.appendChild; //body元素中插入canvas对象
    document.getElementById("second").appendChild(renderer.domElement);
    //执行渲染操作   指定场景、相机作为参数
    //renderer.render(scene, camera);
    function render() {
        renderer.render(scene, camera);//执行渲染操作
    }
    render();
    var controls = new THREE.OrbitControls(camera, renderer.domElement);//创建控件对象
    controls.addEventListener('change', render);//监听鼠标、键盘事件
}