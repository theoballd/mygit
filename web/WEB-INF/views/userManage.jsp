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

    <title>奖助学金管理系统——用户管理</title>


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



<%--删除模态框--%>
<div class="modal fade bs-example-modal-sm" id="deletAndModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"  align="center" >是否删除用户</h4>
            </div>
            <div class="modal-footer" id="CheckAndModal_btn">
                <div align="center">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="cancel_btn">取消</button>
                    <button type="button" class="btn btn-primary confirm_btn" id="confirm_btn" >确定</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 学生修改模态框 -->
<div class="modal fade" id="studentAndModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="add_student_modal_label">学生信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="studentForm">

                    <div class="form-group" id="form-group1">
                        <label for="id_input" class="col-sm-2 control-label">学生学号</label>
                        <div class="col-sm-10">
                            <input type="text"  name="stuId" class="form-control" id="id_input">
                            <span id="helpBlock1" class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group" id="form-group2">
                        <label for="name_input" class="col-sm-2 control-label">学生名字</label>
                        <div class="col-sm-10">
                            <input type="text" name="stuName" class="form-control" id="name_input">
                            <span id="helpBlock2" class="help-block"></span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label  for="class_select" class="col-sm-2 control-label">班级</label>
                        <div class="col-sm-4" id="class_input_div">
                            <select class="form-control" name="stuClassId" id="class_select" ></select>
                        </div>
                    </div>


                    <div class="form-group" id="form-group3">
                        <label for="rank_select" class="col-sm-2 control-label">班级排名</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="stuRank" id="rank_select" ></select>
                            <span id="helpBlock3" class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="punishment_select" class="col-sm-2 control-label">处分情况</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="stuPunishment" id="punishment_select" >
                                <option value=false>有处分</option>
                                <option value=true>无处分</option>

                            </select>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="grad_select" class="col-sm-2 control-label">挂科情况</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="stuGrad" id="grad_select" >
                                <option value=false>有挂科</option>
                                <option value=true>无挂科</option>
                            </select>

                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer" id="studentAndModal_btn">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary sumbit_btn" id="sumbit_btn">提交</button>
            </div>
        </div>
    </div>
</div>


<!-- 老师信息模态框 -->
<div class="modal fade" id="teacherAndModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="add_teacher_modal_label">老师信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="teacherForm">

                    <div class="form-group" id="teacher_form-group1">
                        <label for="teaId_input" class="col-sm-2 control-label">老师工号</label>
                        <div class="col-sm-10">
                            <input type="text"  name="teaId" class="form-control" id="teaId_input">
                            <span id="teacher_helpBlock1" class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group" id="teacher_form-group2">
                        <label for="teaName_input" class="col-sm-2 control-label">老师名字</label>
                        <div class="col-sm-10">
                            <input type="text" name="teaName" class="form-control" id="teaName_input">
                            <span id="teacher_helpBlock2" class="help-block"></span>
                        </div>
                    </div>


                    <div class="form-group" id="teacher_form-group3">
                        <label  for="teaClass_select" class="col-sm-2 control-label">班级</label>
                        <div class="col-sm-4" id="teacher_class_input_div">
                            <select class="form-control" name="teaClassId" id="teaClass_select" ></select>
                            <span id="teacher_helpBlock3" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer" id="teacherAndModal_btn">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary sumbit_btn1" id="sumbit_btn1">提交</button>
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
            <a class="navbar-brand" href="#">用户管理</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar" >
                <li id="studenttitle"><a id="student" onclick="to_page1(1,'0','all')" >学生 <span class="sr-only">(current)</span></a></li>
                <li id="teachertitle"><a id="teacher" onclick="to_page2(1,'0','all')">老师<span class="sr-only">(current)</span></a></li>
            </ul>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="row">
                <h1 class="page-header" id="page-header"></h1>
            </div>


            <div  class="row">
                <div    class="col-md-6 col-md-offset-1">
                    <form class="navbar-form navbar-left">
                        <div class="form-group">
                            <label  for="class_select1" class="control-label">班级:</label>
                            <select class="form-control"name="class" id="class_select1" style="width:150px;"></select>
                        </div>
                        &nbsp &nbsp
                        <button type="button" class="btn btn-primary confirm_select" id="confirm_select">筛选</button>
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

                <button type="button" class="btn btn-primary " id="add_select">新增</button>
            </div>

            </br>
            </br>

            <div class="table-responsive row">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>名字</th>
                        <th>班级</th>
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
        getClas1();
    });


    function to_page1(pn,classs,searchText){
        $.ajax({
            url:"${APP_PATH }/userManage/getStudents",
            data:"pn="+pn+"&classs="+classs+"&searchText="+searchText,
            type:"GET",
            success:function(result) {
                build__student_table(result,classs,searchText);
            }
        });
    }


    function to_page2(pn,classs,searchText){
        $.ajax({
            url:"${APP_PATH }/userManage/getTeachers",
            data:"pn="+pn+"&classs="+classs+"&searchText="+searchText,
            type:"GET",
            success:function(result) {
                build__teacher_table(result,classs,searchText);
            }
        });
    }

    //构建学生模块
    function build__student_table(result,classs,searchText) {
        var Student = result.extend.pageInfo1;

        $("#user").empty();
        $("#page_info_area").empty();
        $("#teachertitle").removeClass("active");
        $("#studenttitle").addClass("active");
        $("#add_select").removeClass("add_teacher_select");
        $("#add_select").addClass("add_student_select");


        $("#class_select1").val([classs]);

        $.each(Student.list, function (index, item) {
            var IdTd = $("<td></td>").append(item.stuId);
            var NameTd = $("<td></td>").append(item.stuName);
            var ClassTd = $("<td></td>").append(item.clas.className);
            var editStudentBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_student_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
            editStudentBtn.attr("edit_student_id", item.stuId);
            var deletStudentBtn = $("<button></button>").addClass("btn btn-info btn-sm delet_student_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("删除");
            deletStudentBtn.attr("delet_student_id", item.stuId);
            var btnTd = $("<td></td>").append(editStudentBtn).append(deletStudentBtn);
            $("<tr></tr>").append(IdTd).append(NameTd).append(ClassTd).append(btnTd).appendTo("#user");
        });
        //分页信息
        $("#page_info_area").append("当前" + Student.pageNum + "页,总共" + Student.pages + "页,总共" + Student.total + "条记录");

        $("#page_nav_area").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        var firstPageLi=$("<Li></Li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi=$("<Li></Li>").append($("<a></a>").append("&laquo;"));
        if(Student.hasPreviousPage==false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else {
            firstPageLi.click(function () {
                to_page1(1,classs,searchText);
            });
            prePageLi.click(function () {
                to_page1(Student.pageNum-1,classs,searchText);
            });
        }

        var nextPageLi=$("<Li></Li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi=$("<Li></Li>").append($("<a></a>").append("末页").attr("href","#"));
        if(Student.hasNextPage==false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else {
            nextPageLi.click(function () {
                to_page1(Student.pageNum + 1,classs,searchText);
            });
            lastPageLi.click(function () {
                to_page1(Student.pages,classs,searchText);
            });
        }

        ul.append(firstPageLi).append(prePageLi);

        $.each(Student.navigatepageNums,function(index,item) {
            var numLi=$("<li></li>").append($("<a></a>").append(item));
            if(Student.pageNum == item){
                numLi.addClass("active");
            }

            numLi.click(function() {
                to_page1(item,classs,searchText);
            });
            ul.append(numLi);
        });

        ul.append(nextPageLi).append(lastPageLi);
        var navEle=$("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");


        $ ("#search_btn").attr("onclick","search_btn1()");

        $ ("#confirm_select").attr("onclick","confirm_select1()");
    }


    function confirm_select1() {
        var  classs=$("#class_select1 ").val();
        to_page1(1,classs,"all");
    }

    function search_btn1() {
        var searchText=$("#search_text").val();
        to_page1(1,'0',searchText)
    }


    //构建老师模块
    function build__teacher_table(result,classs,searchText) {
        var Teacher = result.extend.pageInfo2;

        $("#user").empty();
        $("#page_info_area").empty();
        $("#studenttitle").removeClass("active");
        $("#teachertitle").addClass("active");
        $("#add_select").removeClass("add_student_select");
        $("#add_select").addClass("add_teacher_select");

        $("#class_select1").val([classs]);

        $.each(Teacher.list, function (index, item) {
            var IdTd = $("<td></td>").append(item.teaId);
            var NameTd = $("<td></td>").append(item.teaName);
            var ClassTd = $("<td></td>").append(item.clas.className);
            var editTeacherBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_teacher_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
            editTeacherBtn.attr("edit_teacher_id", item.teaId);
            var deletTeacherBtn = $("<button></button>").addClass("btn btn-info btn-sm delet_teacher_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("删除");
            deletTeacherBtn.attr("delet_teacher_id", item.teaId);
            var btnTd = $("<td></td>").append(editTeacherBtn).append(deletTeacherBtn);
            $("<tr></tr>").append(IdTd).append(NameTd).append(ClassTd).append(btnTd).appendTo("#user");
        });
        //分页信息
        $("#page_info_area").append("当前" + Teacher.pageNum + "页,总共" + Teacher.pages + "页,总共" + Teacher.total + "条记录");

        $("#page_nav_area").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        var firstPageLi=$("<Li></Li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi=$("<Li></Li>").append($("<a></a>").append("&laquo;"));
        if(Teacher.hasPreviousPage==false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else {
            firstPageLi.click(function () {
                to_page2(1,classs,searchText);
            });
            prePageLi.click(function () {
                to_page2(Teacher.pageNum-1,classs,searchText);
            });
        }

        var nextPageLi=$("<Li></Li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi=$("<Li></Li>").append($("<a></a>").append("末页").attr("href","#"));
        if(Teacher.hasNextPage==false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else {
            nextPageLi.click(function () {
                to_page2(Teacher.pageNum + 1,classs,searchText);
            });
            lastPageLi.click(function () {
                to_page2(Teacher.pages,classs,searchText);
            });
        }

        ul.append(firstPageLi).append(prePageLi);

        $.each(Teacher.navigatepageNums,function(index,item) {
            var numLi=$("<li></li>").append($("<a></a>").append(item));
            if(Teacher.pageNum == item){
                numLi.addClass("active");
            }

            numLi.click(function() {
                to_page2(item,classs,searchText);
            });
            ul.append(numLi);
        });

        ul.append(nextPageLi).append(lastPageLi);
        var navEle=$("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");


        $ ("#search_btn").attr("onclick","search_btn2()");

        $ ("#confirm_select").attr("onclick","confirm_select2()");
    }


    function confirm_select2() {
        var  classs=$("#class_select1 ").val();
        to_page2(1,classs,"all");
    }

    function search_btn2() {
        var searchText=$("#search_text").val();
        to_page2(1,'0',searchText)
    }


    //修改学生信息
    $(document).on("click",".edit_student_btn",function(){
        var id=$(this).attr("edit_student_id");

        $("#rank_select").empty();

        showStudentMessage(id);//回显学生信息


        $(document).on("click",".sumbit_btn",function () {
            $("#form-grou1").removeClass("has-error");
            $("#helpBlock1").empty();
            $("#form-group2").removeClass("has-error");
            $("#helpBlock2").empty();
            $("#form-group3").removeClass("has-error");
            $("#helpBlock3").empty();

            if($("#id_input").val()==""){
                $("#form-group1").addClass("has-error");
                $("#helpBlock1").text("学号不能为空");
            }
            else if($("#name_input").val()==""){
                $("#form-group2").addClass("has-error");
                $("#helpBlock2").text("名字不能为空");
            }
            else {
            $.ajax({
                url:"${APP_PATH}/userManage/updateStudent/"+id,
                type:"POST",
                data:$("#studentForm").serialize(),
                success:function (result) {
                    if (result.msg == "学号已存在") {
                        $("#form-group1").addClass("has-error");
                        $("#helpBlock1").text("学号已存在");
                    } else if (result.msg == "名字已存在") {
                        $("#form-group2").addClass("has-error");
                        $("#helpBlock2").text("名字已存在");
                    } else if (result.msg == "排名已存在") {
                        $("#form-group3").addClass("has-error");
                        $("#helpBlock3").text("排名已存在");
                    } else {
                        $("#studentAndModal").modal('hide');//关闭模态框
                        window.location.reload();
                    }
                }
            });
            }
        });
    });



    //修改时显示学生信息
    function showStudentMessage(id) {
        getClas();
        $.ajax({
            url:"${APP_PATH}/userManage/getStudent/"+id,
            type:"GET",
            success:function(result) {
                $("#id_input").val(result.stuId)
                $("#name_input").val(result.stuName)
                $("#class_select").val([result.stuClassId]);
                for(i=1;i<51;i++) {
                  var optionEle = $("<option></option>").append(i).attr("value",i);
                 optionEle.appendTo("#rank_select");
                  };
                $("#rank_select").val([result.stuRank]);
                $("#punishment_select").val([result.stuPunishment]);
                $("#grad_select").val([result.stuGrad]);
            }
        });
        $("#studentAndModal").modal({
            backdrop: "static"
        });
    };

    //修改老师信息
    $(document).on("click",".edit_teacher_btn",function(){
        var id=$(this).attr("edit_teacher_id");


        showTeacherMessage(id);//回显l老师信息



        $(document).on("click",".sumbit_btn1",function () {
            $("#teacher_form-grou1").removeClass("has-error");
            $("#teacher_helpBlock1").empty();
            $("#teacher_form-group2").removeClass("has-error");
            $("#teacher_helpBlock2").empty();
            $("#teacher_form-group3").removeClass("has-error");
            $("#teacher_helpBlock3").empty();

            if($("#teaId_input").val()==""){
                $("#teacher_form-group1").addClass("has-error");
                $("#teacher_helpBlock1").text("工号不能为空");
            }
            else if($("#teaName_input").val()==""){
                $("#teacher_form-group2").addClass("has-error");
                $("#teacher_helpBlock2").text("名字不能为空");
            }
            else {
                $.ajax({
                    url:"${APP_PATH}/userManage/updateTeacher/"+id,
                    type:"POST",
                    data:$("#teacherForm").serialize(),
                    success:function (result) {
                        if (result.msg == "工号已存在") {
                            $("#teacher_form-group1").addClass("has-error");
                            $("#student_helpBlock1").text("工号已存在");
                        } else if (result.msg == "名字已存在") {
                            $("#teacher_form-group2").addClass("has-error");
                            $("#teacher_helpBlock2").text("名字已存在");
                        } else if (result.msg == "班级已存在") {
                            $("#teacher_form-group3").addClass("has-error");
                            $("#teacher_helpBlock3").text("班级已存在");
                        } else {
                            $("#teacherAndModal").modal('hide');//关闭模态框
                            window.location.reload();
                        }
                    }
                });
            }
        });
    });


    //修改时显示老师信息
    function showTeacherMessage(id) {

        getClas2();
        $.ajax({
            url:"${APP_PATH}/userManage/getTeacher/"+id,
            type:"GET",
            success:function(result) {
                $("#teaId_input").val(result.teaId);
                $("#teaName_input").val(result.teaName);
                $("#teaClass_select").val([result.teaClassId]);
            }
        });
        $("#teacherAndModal").modal({
            backdrop: "static"
        });
    };


    //筛选获取班级信息
    function getClas1() {
        $("#class_select1").empty();
        $.ajax({
            url:"${APP_PATH}/student/getClas",
            type:"GET",
            success:function (result) {
                var optionEle=$("<option></option>").append("全部").attr("value","0");
                optionEle.appendTo("#class_select1");
                $.each(result.extend.clas,function () {
                    var optionEle=$("<option></option>").append(this.className).attr("value",this.classId);
                    optionEle.appendTo("#class_select1");
                });
            }
        });
    }

    //模态框获取班级信息
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

    //模态框获取班级信息
    function getClas2() {
        $("#class_select").empty();
        $.ajax({
            url:"${APP_PATH}/student/getClas",
            type:"GET",
            success:function (result) {
                $.each(result.extend.clas,function () {
                    var optionEle=$("<option></option>").append(this.className).attr("value",this.classId);
                    optionEle.appendTo("#teaClass_select");
                });
            }
        });
    }


    //删除学生方法
    $(document).on("click",".delet_student_btn",function () {
        var id=$(this).attr("delet_student_id");
        $("#deletAndModal").modal({
            backdrop: "static"
        });
        $(document).on("click",".confirm_btn",function () {
            $.ajax({
                url:"${APP_PATH}/userManage/deletStudent/"+id,
                type:"POST",
                success:function (result) {
                    $("#deletAndModal").modal('hide');//关闭模态框
                    window.location.reload();
                }
            });
        });
    });


    //删除学生方法
    $(document).on("click",".delet_teacher_btn",function () {
        var id=$(this).attr("delet_teacher_id");
        $("#deletAndModal").modal({
            backdrop: "static"
        });
        $(document).on("click",".confirm_btn",function () {
            $.ajax({
                url:"${APP_PATH}/userManage/deletTeacher/"+id,
                type:"POST",
                success:function (result) {
                    $("#deletAndModal").modal('hide');//关闭模态框
                    window.location.reload();
                }
            });
        });
    });

    //新增学生
    $(document).on("click",".add_student_select",function(){

        $("#id_input").val("");
        $("#name_input").val("");

        $("#rank_select").empty();

        for(i=1;i<51;i++) {
            var optionEle = $("<option></option>").append(i).attr("value",i);
            optionEle.appendTo("#rank_select");
        };


        getClas();

        $("#studentAndModal").modal({
            backdrop: "static"
        });

        $(document).on("click",".sumbit_btn",function () {
            $("#form-grou1").removeClass("has-error");
            $("#helpBlock1").empty();
            $("#form-group2").removeClass("has-error");
            $("#helpBlock2").empty();
            $("#form-group3").removeClass("has-error");
            $("#helpBlock3").empty();

            if($("#id_input").val()==""){
                $("#form-group1").addClass("has-error");
                $("#helpBlock1").text("学号不能为空");
            }
            else if($("#name_input").val()==""){
                $("#form-group2").addClass("has-error");
                $("#helpBlock2").text("名字不能为空");
            }
            else {
            $.ajax({
                url:"${APP_PATH}/userManage/addStudent",
                type:"POST",
                data:$("#studentForm").serialize(),
                success:function (result) {
                    if (result.msg == "学号已存在") {
                        $("#form-group1").addClass("has-error");
                        $("#helpBlock1").text("学号已存在");
                    } else if (result.msg == "名字已存在") {
                        $("#form-group2").addClass("has-error");
                        $("#helpBlock2").text("名字已存在");
                    } else if (result.msg == "排名已存在") {
                        $("#form-group3").addClass("has-error");
                        $("#helpBlock3").text("排名已存在");
                    } else {
                        $("#studentAndModal").modal('hide');//关闭模态框
                        window.location.reload();
                    }
                }
            });
            }
        });
    });

    //新增老师
    $(document).on("click",".add_teacher_select",function(){

        $("#teaId_input").val("");
        $("#teaName_input").val("");

        getClas2();

        $("#teacherAndModal").modal({
            backdrop: "static"
        });

        $(document).on("click",".sumbit_btn1",function () {
            $("#teacher_form-grou1").removeClass("has-error");
            $("#teacher_helpBlock1").empty();
            $("#teacher_form-group2").removeClass("has-error");
            $("#teacher_helpBlock2").empty();
            $("#teacher_form-group3").removeClass("has-error");
            $("#teacher_helpBlock3").empty();

            if($("#teaId_input").val()==""){
                $("#teacher_form-group1").addClass("has-error");
                $("#teacher_helpBlock1").text("工号不能为空");
            }
            else if($("#teaName_input").val()==""){
                $("#teacher_form-group2").addClass("has-error");
                $("#teacher_helpBlock2").text("名字不能为空");
            }
            else {
                $.ajax({
                    url:"${APP_PATH}/userManage/addTeacher",
                    type:"POST",
                    data:$("#teacherForm").serialize(),
                    success:function (result) {
                        if (result.msg == "工号已存在") {
                            $("#teacher_form-group1").addClass("has-error");
                            $("#teacher_helpBlock1").text("工号已存在");
                        } else if (result.msg == "名字已存在") {
                            $("#teacher_form-group2").addClass("has-error");
                            $("#teacher_helpBlock2").text("名字已存在");
                        } else if (result.msg == "班级已存在") {
                            $("#teacher_form-group3").addClass("has-error");
                            $("#teacher_helpBlock3").text("班级已存在");
                        } else {
                            $("#teacherAndModal").modal('hide');//关闭模态框
                            window.location.reload();
                        }
                    }
                });
            }
        });
    });

</script>

</body>
</html>
