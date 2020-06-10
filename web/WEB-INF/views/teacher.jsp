<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${APP_PATH }/static/favicon.ico">

    <title>奖助学金管理系统——老师</title>


    <% pageContext.setAttribute("APP_PATH",request.getContextPath()); //服务器项目的路径
    %>


    <%--引入jQuery--%>
    <script type="text/javascript"  src="${APP_PATH }/static/js/jquery-3.4.1.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="${APP_PATH }/static/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="${APP_PATH }/static/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${APP_PATH }/static/dist/css/dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="${APP_PATH }/static/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="${APP_PATH }/static/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>


<!-- 修改密码添加模态框-->
<div class="modal fade bs-example-modal-sm" id="editPasswordAndModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"  align="center" >修改密码</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="passwordForm">
                    <div class="form-group" id="form-group1">
                        <label for="firstPassword_input" class="col-sm-2 control-label">原密码</label>
                        <div class="col-sm-10">
                            <input type="text"  name="firstPassword" class="form-control" id="firstPassword_input">
                            <span id="helpBlock1" class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group" id="form-group2">
                        <label for="newPassword_input" class="col-sm-2 control-label">现密码</label>
                        <div class="col-sm-10">
                            <input type="text"  name="newPassword" class="form-control" id="newPassword_input">
                            <span id="helpBlock2" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer" id="editPasswordAndModal_btn">
                <div align="center">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="cancel1_btn">取消</button>
                    <button type="button" class="btn btn-primary confirm_btn sumbit1_btn" id="sumbit1_btn" >提交</button>
                </div>
            </div>
        </div>
    </div>
</div>


<%--审核模态框--%>
<div class="modal fade bs-example-modal-sm" id="CheckAndModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"  align="center" >是否符合要求</h4>
            </div>
            <div class="modal-footer" id="CheckAndModal_btn">
                <div align="center">
                    <button type="button" class="btn btn-warning deny_btn"  id="deny_btn">不符合</button>
                    <button type="button" class="btn btn-primary confirm_btn" id="confirm_btn" >符合</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 申请信息查看模态框 -->
<div class="modal fade" id="studentAndModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="add_modal_label">申请信息查看</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">

                    <div class="form-group">
                        <label for="id_input" class="col-sm-2 control-label">学生学号</label>
                        <div class="col-sm-10">
                            <input type="text"  name="stuId" class="form-control" id="id_input" readonly="true">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name_input" class="col-sm-2 control-label">学生名字</label>
                        <div class="col-sm-10">
                            <input type="text" name="stuName" class="form-control" id="name_input" readonly="true">
                        </div>
                    </div>


                    <div class="form-group">
                        <label  for="class_select" class="col-sm-2 control-label">班级</label>
                        <div class="col-sm-4" id="class_input_div">
                            <select class="form-control" name="stuClassId" id="class_select"></select>
                            <%--                              <input type="text" name="class" class="form-control" id="class_input" readonly="true" style="width: 200px;">--%>
                        </div>
                    </div>


                    <div class="form-group">
                        <label  class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="stuSex" id="sex1" value="男"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="stuSex" id="sex2" value="女" >女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="phone_input" class="col-sm-2 control-label">电话号码</label>
                        <div class="col-sm-10">
                            <input type="text" name="stuPhone" class="form-control" id="phone_input" readonly="true">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="address_input" class="col-sm-2 control-label">家庭地址</label>
                        <div class="col-sm-10">
                            <input type="text" name="stuAddress" class="form-control" id="address_input"readonly="true">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="rank_input" class="col-sm-2 control-label">班级排名</label>
                        <div class="col-sm-10">
                            <input type="text" name="rank" class="form-control" id="rank_input"readonly="true">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="punishment_input" class="col-sm-2 control-label">处分情况</label>
                        <div class="col-sm-10">
                            <input type="text" name="punishment" class="form-control" id="punishment_input"  readonly="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="grad_input" class="col-sm-2 control-label">挂科情况</label>
                        <div class="col-sm-10">
                            <input type="text" name="grad" class="form-control" id="grad_input" readonly="true">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer" id="studentAndModal_btn">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>


<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">奖助学金管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">

                <div style="margin-top:7px;">
                    <!-- Single button -->
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary dropdown-toggle glyphicon glyphicon-user " data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            账户管理<span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="editPassword">修改密码</a></li>
                            <li><a href="${APP_PATH }/login.jsp">退出登录</a></li>
                        </ul>
                    </div>
                </div>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar" >
                <li id="scholarshiptitle"><a id="scholarship" onclick="to_page1(1,'全部','all')" >奖学金 <span class="sr-only">(current)</span></a></li>
                <li id="granttitle"><a id="grant" onclick="to_page2(1,'全部','all')">助学金<span class="sr-only">(current)</span></a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div  class="row">
                        <h1 class="page-header" id="page-header"></h1>
            </div>

          <div  class="row">
<div    class="col-md-5 col-md-offset-1">
              <form class="navbar-form navbar-left">
                  <div class="form-group  ">
                    <label  for="identity_select" class="control-label">状态:</label>
                        <select class="form-control" name="identity" id="identity_select" style="width:100px;">
                            <option>全部</option>
                            <option>未审核</option>
                            <option>符合</option>
                            <option>不符合</option>
                        </select>
                  </div>
                <button type="button" class="btn btn-primary glyphicon glyphicon-hourglass  confirm_select" id="confirm_select">筛选</button>
              </form>
</div>


              <div  class="form-group  col-md-4">
              <form class="navbar-form navbar-left">
                  <div class="form-group">
                      <input type="text" class="form-control" placeholder="Search"  id="search_text" style="width:150px;">
                  </div>
                  <button type="button" class="btn btn-primary  glyphicon glyphicon-search search_btn"  id="search_btn">搜索</button>
              </form>
              </div>
          </div>

        </br>
        </br>

            <div class="table-responsive  row">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>学号</th>
                        <th>名字</th>
                        <th>班级</th>
                        <th>性别</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="user">

                    </tbody>

                </table>
            </div>
            <%--    显示分页信息--%>
            <div class="row"  style="padding-top:100px;">
                <%--        分页文字信息--%>
                <div class="col-md-6"  id="page_info_area">
                </div>
                <%--    分页条--%>

                <div class="col-md-6" id="page_nav_area">
                </div>
            </div>
        </div>
    </div>
</div>


<%--引入jQuery--%>
<script type="text/javascript"  src="${APP_PATH }/static/js/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="${APP_PATH }/static/assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="${APP_PATH }/static/dist/js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="${APP_PATH }/static/assets/js/vendor/holder.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="${APP_PATH }/static/assets/js/ie10-viewport-bug-workaround.js"></script>

<script type="text/javascript">
    $(function(){
        $.ajax({
            url:"${APP_PATH }/teacher/getTeacher",
            type:"GET",
            success:function(result) {
                var teaName='欢迎你,'+result.teaName+'老师';
                $("#page-header").html(teaName);
            }
        });
    });


    function to_page1(pn,identity,searchText){
        $.ajax({
            url:"${APP_PATH }/teacher/getScholarshipStudentMessage",
            data:"pn="+pn+"&identity="+identity+"&searchText="+searchText,
            type:"GET",
            success:function(result) {
                build__scholarship_table(result,identity,searchText);
                // build__grant_table(result);
                }
            });
    }



    function to_page2(pn,identity,searchText){
        $.ajax({
            url:"${APP_PATH }/teacher/getGrantStudentMessage",
            data:"pn="+pn+"&identity="+identity+"&searchText="+searchText,
            type:"GET",
            success:function(result) {
                // build__scholarship_table(result);
                build__grant_table(result,identity,searchText);
            }
        });
    }


//构建奖学金模块
    function build__scholarship_table(result,identity,searchText) {

        var Scholarship = result.extend.pageInfo1;

        $("#search_text").empty();
            $("#user").empty();
            $("#page_info_area").empty();
            $("#granttitle").removeClass("active");
            $("#scholarshiptitle").addClass("active");

            $.each(Scholarship.list, function (index, item) {
                var IdTd = $("<td></td>").append(item.stuId);
                var NameTd = $("<td></td>").append(item.stuName);
                var ClassTd = $("<td></td>").append(item.clas.className);

                var SixTd = $("<td></td>").append(item.stuSex == '男' ? "男" : "女");
                var State = $("<td></td>").append(item.whether);
                var checkBtn = $("<button></button>").addClass("btn btn-primary btn-sm check_scholarship_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("审核");
                checkBtn.attr("check_scholarship_id", item.stuId);
                var messageBtn = $("<button></button>").addClass("btn btn-info btn-sm scholarship_Message_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看");
                messageBtn.attr("scholarship_Message_id", item.stuId);
                var first =  $("<tr></tr>").append(IdTd).append(NameTd).append(ClassTd).append(SixTd).append(State);
                if(item.whether=="未审核"){
                    first.append(checkBtn).append(messageBtn).appendTo("#user");
                }else {
                    first.append(messageBtn).appendTo("#user");
                }
            });
            //分页信息
            $("#page_info_area").append("当前" + Scholarship.pageNum + "页,总共" + Scholarship.pages + "页,总共" + Scholarship.total + "条记录");

        $("#page_nav_area").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        var firstPageLi=$("<Li></Li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi=$("<Li></Li>").append($("<a></a>").append("&laquo;"));
        if(Scholarship.hasPreviousPage==false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else {
            firstPageLi.click(function () {
                to_page1(1,identity,searchText);
            });
            prePageLi.click(function () {
                to_page1(Scholarship.pageNum-1,identity,searchText);
            });
        }

        var nextPageLi=$("<Li></Li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi=$("<Li></Li>").append($("<a></a>").append("末页").attr("href","#"));
        if(Scholarship.hasNextPage==false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else {
            nextPageLi.click(function () {
                to_page1(Scholarship.pageNum + 1,identity,searchText);
            });
            lastPageLi.click(function () {
                to_page1(Scholarship.pages,identity,searchText);
            });
        }

        ul.append(firstPageLi).append(prePageLi);

        $.each(Scholarship.navigatepageNums,function(index,item) {
            var numLi=$("<li></li>").append($("<a></a>").append(item));
            if(Scholarship.pageNum == item){
                numLi.addClass("active");
            }

            numLi.click(function() {
                to_page1(item,identity,searchText);
            });
            ul.append(numLi);
        });

        ul.append(nextPageLi).append(lastPageLi);
        var navEle=$("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");


        $ ("#confirm_select").attr("onclick","confirm_select1()");

        $ ("#search_btn").attr("onclick","search_btn1()");

    }


    //筛选功能
    function confirm_select1() {
        var identity=$("#identity_select option:selected").text();
        to_page1(1,identity,"all");
    }


//搜索功能
    function search_btn1() {
        var searchText=$("#search_text").val();
        to_page1(1,"全部",searchText)
    }



    //构建助学金模块
    function build__grant_table(result,identity,searchText) {

        var Grant = result.extend.pageInfo2;

        $("#search_text").empty();
            $("#user").empty();
            $("#page_info_area").empty();
            $("#scholarshiptitle").removeClass("active");
            $("#granttitle").addClass("active");

            $.each(Grant.list, function (index, item) {
                var IdTd = $("<td></td>").append(item.stuId);
                var NameTd = $("<td></td>").append(item.stuName);
                var ClassTd = $("<td></td>").append(item.clas.className);
                var SixTd = $("<td></td>").append(item.stuSex == '男' ? "男" : "女");
                var State = $("<td></td>").append(item.whether);
                var checkBtn = $("<button></button>").addClass("btn btn-primary btn-sm check_grant_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("审核");
                checkBtn.attr("check_grant_id", item.stuId);
                var messageBtn = $("<button></button>").addClass("btn btn-info btn-sm grant_Message_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("查看");
                messageBtn.attr("grant_Message_id", item.stuId);
                var first =  $("<tr></tr>").append(IdTd).append(NameTd).append(ClassTd).append(SixTd).append(State);
                if(item.whether=="未审核"){
                    first.append(checkBtn).append(messageBtn).appendTo("#user");
                }else {
                    first.append(messageBtn).appendTo("#user");
                }
            });
            //分页信息
            $("#page_info_area").append("当前" + Grant.pageNum + "页,总共" + Grant.pages + "页,总共" + Grant.total + "条记录");

        $("#page_nav_area").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        var firstPageLi=$("<Li></Li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi=$("<Li></Li>").append($("<a></a>").append("&laquo;"));
        if(Grant.hasPreviousPage==false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else {
            firstPageLi.click(function () {
                to_page2(1,identity,searchText);
            });
            prePageLi.click(function () {
                to_page2(Grant.pageNum-1,identity,searchText);
            });
        }

        var nextPageLi=$("<Li></Li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi=$("<Li></Li>").append($("<a></a>").append("末页").attr("href","#"));
        if(Grant.hasNextPage==false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else {
            nextPageLi.click(function () {
                to_page2(Grant.pageNum + 1,identity,searchText);
            });
            lastPageLi.click(function () {
                to_page2(Grant.pages,identity,searchText);
            });
        }

        ul.append(firstPageLi).append(prePageLi);

        $.each(Grant.navigatepageNums,function(index,item) {
            var numLi=$("<li></li>").append($("<a></a>").append(item));
            if(Grant.pageNum == item){
                numLi.addClass("active");
            }

            numLi.click(function() {
                to_page2(item,identity,searchText);
            });
            ul.append(numLi);
        });

        ul.append(nextPageLi).append(lastPageLi);
        var navEle=$("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");

        $ ("#confirm_select").attr("onclick","confirm_select2()");

        $ ("#search_btn").attr("onclick","search_btn2()");
    }

    function confirm_select2(){
        var identity=$("#identity_select option:selected").text();
        to_page2(1,identity,"all");
    }

    function search_btn2() {
        var searchText=$("#search_text").val();
        to_page2(1,"全部",searchText)
    }

    //审核奖学金
    $(document).on("click",".check_scholarship_btn",function () {

        var id=$(this).attr("check_scholarship_id");


        $("#CheckAndModal").modal({
            backdrop: "static"
        });

        $(document).on("click",".deny_btn", function () {
            var identity="不符合";
            $.ajax({
                url:"${APP_PATH}/teacher/checkScholarship/"+id,
                type:"POST",
                data:"identity="+identity,
                success:function(result) {
                    $("#CheckAndModal").modal('hide');//关闭模态框
                    window.location.reload();
                }
            });
        });

        $(document).on("click",".confirm_btn", function () {
            var identity="符合";
            $.ajax({
                url:"${APP_PATH}/teacher/checkScholarship/"+id,
                type:"POST",
                data:"identity="+identity,
                success:function(result) {
                    $("#CheckAndModal").modal('hide');//关闭模态框
                    window.location.reload();
                }
            });
        });
    });

    //审核助学金
    $(document).on("click",".check_grant_btn",function () {

        var id=$(this).attr("check_grant_id");


        $("#CheckAndModal").modal({
            backdrop: "static"
        });

        $(document).on("click",".deny_btn", function () {
            var identity="不符合";
            $.ajax({
                url:"${APP_PATH}/teacher/checkGrant/"+id,
                type:"POST",
                data:"identity="+identity,
                success:function(result) {
                    $("#CheckAndModal").modal('hide');//关闭模态框
                    window.location.reload();
                }
            });
        });

        $(document).on("click",".confirm_btn", function () {
            var identity="符合";
            $.ajax({
                url:"${APP_PATH}/teacher/checkGrant/"+id,
                type:"POST",
                data:"identity="+identity,
                success:function(result) {
                    $("#CheckAndModal").modal('hide');//关闭模态框
                    window.location.reload();
                }
            });
        });
    });

    //查看奖学生信息
    $(document).on("click",".scholarship_Message_btn",function () {
        var id=$(this).attr("scholarship_Message_id");

        getClas();

        $("#studentAndModal").modal({
            backdrop: "static"
        });
        $.ajax({
            url:"${APP_PATH}/teacher/getStudent/"+id,
            type:"GET",
            success:function(result) {
                $("#id_input").attr("value", result.stuId);
                $("#name_input").attr("value", result.stuName);
                if(result.scholarship.stuSex=="男"){
                    $("#sex1").attr("checked", true);
                    $("#sex2").remove("checked");
                }else {
                    $("#sex2").attr("checked", true);
                    $("#sex1").remove("checked");
                }
                $("#class_select").val([result.stuClassId]).attr("disabled","disabled");
                $("#rank_input").val("第" + result.stuRank + "名");
                $("#punishment_input").val(result.stuPunishment == false ? "有处分" : "无处分");
                $("#grad_input").val(result.stuGrad == false ? "有挂科" : "无挂科");
                $("#phone_input").val(result.scholarship.stuPhone);
                $("#address_input").val(result.scholarship.stuAddress);
            }
        });
    });

    //查看助学生信息
    $(document).on("click",".grant_Message_btn",function () {
        var id=$(this).attr("grant_Message_id");

        getClas();

        $("#studentAndModal").modal({
            backdrop: "static"
        });
        $.ajax({
            url:"${APP_PATH}/teacher/getStudent/"+id,
            type:"GET",
            success:function(result) {
                $("#id_input").attr("value", result.stuId);
                $("#name_input").attr("value", result.stuName);
                if(result.grant.stuSex=="男"){
                    $("#sex1").attr("checked", true);
                    $("#sex2").remove("checked");
                }else {
                    $("#sex2").attr("checked", true);
                    $("#sex1").remove("checked");
                }
                $("#class_select").val([result.stuClassId]).attr("disabled","disabled");
                $("#rank_input").val("第" + result.stuRank + "名");
                $("#punishment_input").val(result.stuPunishment == false ? "有处分" : "无处分");
                $("#grad_input").val(result.stuGrad == false ? "有挂科" : "无挂科");
                $("#phone_input").val(result.grant.stuPhone);
                $("#address_input").val(result.grant.stuAddress);
            }
        });
    });







    //获取班级信息
    function getClas() {
        $("#class_select").empty();
        $.ajax({
            url:"${APP_PATH}/student/getClas",
            type:"GET",
            success:function (result) {
                $.each(result.extend.clas,function () {
                    var optionEle=$("<option></option>").append(this.className).attr("value",this.classId);
                    optionEle.appendTo("#class_select");
                });
            }
        });
    }

    //修改密码
    $(document).on("click",".editPassword",function () {

        $("#form-group1").removeClass("has-error");
        $("#helpBlock1").empty();
        $("#firstPassword_input").val("");
        $("#form-group2").removeClass("has-error");
        $("#helpBlock2").empty();
        $("#newPassword_input").val("");

        $("#editPasswordAndModal").modal({
            backdrop: "static"
        });

        $(document).on("click",".sumbit1_btn",function () {

            $("#form-grou1").removeClass("has-error");
            $("#helpBlock1").empty();
            $("#form-group2").removeClass("has-error");
            $("#helpBlock2").empty();

            if($("#firstPassword_input").val()==""){
                $("#form-group1").addClass("has-error");
                $("#helpBlock1").text("密码不能为空");
            }
            else if($("#newPassword_input").val()==""){
                $("#form-group2").addClass("has-error");
                $("#helpBlock2").text("密码不能为空");
            }
            else {
                $.ajax({
                    url:"${APP_PATH}/student/editPassword",
                    type:"POST",
                    data:$("#passwordForm").serialize(),
                    success:function (result) {
                        if(result.msg=="原密码错误"){
                            $("#form-group1").addClass("has-error");
                            $("#helpBlock1").text("原密码错误");
                        }else {
                            $("#editPasswordAndModal").modal('hide');//关闭模态框
                            window.location.href ="${APP_PATH }/login.jsp";
                        }
                    }
                });
            }
        });
    });


</script>
</body>
</html>

