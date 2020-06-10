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

    <title>奖助学金管理系统——学生</title>


      <% pageContext.setAttribute("APP_PATH",request.getContextPath()); //服务器项目的路径
      %>

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

<%--取消申请模态框--%>
  <div class="modal fade bs-example-modal-sm" id="studentDeleteAndModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title"  align="center" >是否取消申请</h4>
              </div>
              <div class="modal-footer" id="studentDeleteAndModal_btn">
                  <div align="center">
                  <button type="button" class="btn btn-default" data-dismiss="modal" id="cancel_btn">取消</button>
                  <button type="button" class="btn btn-primary confirm_btn" id="confirm_btn" >确定</button>
              </div>
                  </div>
          </div>
      </div>
  </div>


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


  <!-- 申请信息添加模态框 -->
  <div class="modal fade" id="studentAndModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="add_modal_label">申请信息填写</h4>
              </div>
              <div class="modal-body">
                  <form class="form-horizontal" id="studentForm">

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
                              <select class="form-control" name="stuClassId" id="class_select" ></select>
<%--                              <input type="text" name="class" class="form-control" id="class_input" readonly="true" style="width: 200px;">--%>
                          </div>
                      </div>


                      <div class="form-group">
                          <label  class="col-sm-2 control-label">性别</label>
                          <div class="col-sm-10">
                              <label class="radio-inline">
                                  <input type="radio" name="stuSex" id="sex1" value="男" checked="checked"> 男
                              </label>
                              <label class="radio-inline">
                                  <input type="radio" name="stuSex" id="sex2" value="女" > 女
                              </label>
                          </div>
                      </div>

                      <div class="form-group">
                          <label for="phone_input" class="col-sm-2 control-label">电话号码</label>
                          <div class="col-sm-10">
                              <input type="text" name="stuPhone" class="form-control" id="phone_input">
                          </div>
                      </div>

                      <div class="form-group">
                          <label for="address_input" class="col-sm-2 control-label">家庭地址</label>
                          <div class="col-sm-10">
                              <input type="text" name="stuAddress" class="form-control" id="address_input">
                          </div>
                      </div>

                      <div class="form-group">
                          <label for="rank_input" class="col-sm-2 control-label">班级排名</label>
                          <div class="col-sm-10">
                              <input type="text" name="rank" class="form-control" id="rank_input" disabled="disabled">
                          </div>
                      </div>

                      <div class="form-group">
                          <label for="punishment_input" class="col-sm-2 control-label">处分情况</label>
                          <div class="col-sm-10">
                              <input type="text" name="punishment" class="form-control" id="punishment_input" disabled="disabled">
                          </div>
                      </div>
                      <div class="form-group">
                          <label for="grad_input" class="col-sm-2 control-label">挂科情况</label>
                          <div class="col-sm-10">
                              <input type="text" name="grad" class="form-control" id="grad_input" disabled="disabled">
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
            <li id="scholarshiptitle"><a id="scholarship" class="scholarship">奖学金 <span class="sr-only">(current)</span></a></li>
            <li id="granttitle"><a id="grant" class="grant">助学金<span class="sr-only">(current)</span></a></li>
          </ul>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header"  id="page-header"></h1>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>学号</th>
                        <th>名字</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="user">

                    </tbody>

                </table>
            </div>
        </div>
      </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="${APP_PATH }/static/assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="${APP_PATH }/static/dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="${APP_PATH }/static/assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="${APP_PATH }/static/assets/js/ie10-viewport-bug-workaround.js"></script>

  <script type="text/javascript">

      $(function () {
          $.ajax({
              url:"${APP_PATH }/student/getStudent",
              type:"GET",
              success:function(result) {
                  var stuName = '欢迎你,' + result.stuName + '同学';
                  $("#page-header").html(stuName);
              }
          });
      });

          //在列表中显示奖学生信息
          $(document).on("click",".scholarship",function(){
              $.ajax({
                  url:"${APP_PATH }/student/getStudent",
                  type:"GET",
                  success:function(result) {
                      build__scholarship_table(result);
                  }
              });
          });


          //在列表中显示助学生信息
          $(document).on("click",".grant",function () {
              $.ajax({
                  url:"${APP_PATH }/student/getStudent",
                  type:"GET",
                  success:function(result) {
                      build__grant_table(result);
                  }
              });
          });


          //构建奖学金学生模块
      function build__scholarship_table(result){
              $("#user").empty();
              $("#granttitle").removeClass("active");
              $("#scholarshiptitle").addClass("active");
              var IdTd = $("<th></th>").attr("id","id").append(result.stuId);
              var NameTd = $("<th></th>").attr("id","name").append(result.stuName);
              var state = $("<th></th>");
              var editScholarshipBtn = $("<button></button>").attr("type","button").addClass("btn btn-primary btn-sm edit_Scholarship_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("  修改申请信息");
              editScholarshipBtn.attr("edit_scholarship_id",result.stuId);
              var deltScholarshipBtn = $("<button></button>").attr("type","button").addClass("btn btn-danger btn-sm delt_Scholarship_btn").append($("<span></span>").addClass("glyphicon glyphicon-remove-circle")).append("  取消申请");
              deltScholarshipBtn.attr("delt_scholarship_id",result.stuId);
              var addScholarshipBtn = $("<button></button>").attr("type","button").addClass("btn btn-primary btn-sm  add_Scholarship_btn").append($("<span></span>").addClass("glyphicon glyphicon-circle-arrow-up")).append("  申请奖学金");
              addScholarshipBtn.attr("add_scholarship_id",result.stuId);

              var first = $("<tr></tr>").append(IdTd).append(NameTd).append(state);
              if (result.scholarship==null) {
                  state.append("未申请");
                  first.append(addScholarshipBtn).appendTo("#user");
              } else if(result.scholarship.whether=="未审核"){
                  state.append("未审核");
                  first.append(editScholarshipBtn).append(deltScholarshipBtn).appendTo("#user");
              }else if(result.scholarship.whether=="不符合"){
                  state.append("不符合");
                  first.append("抱歉，您不符合奖学金要求").appendTo("#user");
              } else{
                  state.append("符合");
                  first.append(editScholarshipBtn).appendTo("#user");
              }
      }


      //构建助学金学生模块
     function build__grant_table(result) {
             $("#user").empty();
             $("#scholarshiptitle").removeClass("active");
             $("#granttitle").addClass("active");
             var IdTd = $("<th></th>").append(result.stuId);
             var NameTd = $("<th></th>").attr("id","id").append(result.stuName);
             var state = $("<th></th>");
             var editGrantBtn = $("<button></button>").attr("type","button").addClass("btn btn-primary btn-sm edit_Grant_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("  修改申请信息");
             editGrantBtn.attr("edit_grant_id",result.stuId);
             var deltGrantBtn = $("<button></button>").attr("type","button").addClass("btn btn-danger btn-sm  delt_Grant_btn").append($("<span></span>").addClass("glyphicon glyphicon-remove-circle")).append("  取消申请");
             deltGrantBtn.attr("delt_grant_id",result.stuId);
             var addGrantBtn = $("<button></button>").attr("type","button").addClass("btn btn-primary btn-sm  add_Grant_btn").append($("<span></span>").addClass("glyphicon glyphicon-circle-arrow-up")).append("  申请助学金");
             addGrantBtn.attr("add_grant_id",result.stuId);

             var first = $("<tr></tr>").append(IdTd).append(NameTd).append(state);

             if (result.grant==null) {
                 state.append("未申请");
                 first.append(addGrantBtn).appendTo("#user");
             }
            else  if(result.grant.whether=="未审核"){
                 state.append("未审核");
                 first.append(editGrantBtn).append(deltGrantBtn).appendTo("#user");
             }
            else if(result.grant.whether=="不符合"){
                 state.append("不符合");
                 first.append("抱歉，您不符合助学金要求").appendTo("#user");
             }
             else{
                 state.append("符合");
                 first.append(editGrantBtn).appendTo("#user");
             }
     }

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

//申请奖学金
          $(document).on("click",".add_Scholarship_btn",function(){

         getMessage();

          $(document).on("click",".sumbit_btn",function () {
              $("#class_select").removeAttr("disabled");
              $.ajax({
                  url:"${APP_PATH}/student/scholarshipSave",
                  type:"GET",
                  data:$("#studentForm").serialize(),
                  success:function (result) {
                      $("#studentAndModal").modal('hide');//关闭模态框
                      window.location.reload();
                  }
              });
          });
      });




      //申请助学金
          $(document).on("click",".add_Grant_btn",function(){

              getMessage();


          $(document).on("click",".sumbit_btn",function () {
       $("#class_select").removeAttr("disabled");
              $.ajax({
                  url:"${APP_PATH}/student/grantSave",
                  type:"GET",
                  data:$("#studentForm").serialize(),
                  success:function (result) {
                      $("#studentAndModal").modal('hide');//关闭模态框
                      window.location.reload();
                  }
              });
          });
          });





        //申请奖助学金时显示学生信息
          function getMessage() {
              getClas();
              $.ajax({
                  url:"${APP_PATH }/student/getStudent",
                  type:"GET",
                  success:function(result) {
              $("#id_input").attr("value", result.stuId);
              $("#name_input").attr("value", result.stuName);
              $("#class_select").val([result.stuClassId]).attr("disabled","disabled");
              $("#rank_input").attr("value", "第" + result.stuRank + "名");
              $("#punishment_input").attr("value", result.stuPunishment == false ? "有处分" : "无处分");
              $("#grad_input").attr("value", result.stuGrad == false ? "有挂科" : "无挂科");
          }
              });
              $("#studentAndModal").modal({
                  backdrop: "static"
              });
          };


      //删除奖学金方法
          $(document).on("click",".delt_Scholarship_btn",function () {
          var id=$(this).attr("delt_scholarship_id");
        $("#studentDeleteAndModal").modal({
            backdrop: "static"
        });
          $(document).on("click",".confirm_btn",function () {
              $.ajax({
                  url:"${APP_PATH}/student/deleteScholarship/"+id,
                  type:"POST",
                  success:function (result) {
                      $("#studentDeleteAndModal").modal('hide');//关闭模态框
                      window.location.reload();
                  }
              });
          });
          });

      //删除助学金方法
          $(document).on("click",".delt_Grant_btn",function () {
          var id=$(this).attr("delt_grant_id");
          $("#studentDeleteAndModal").modal({
              backdrop: "static"
          });
          $(document).on("click",".confirm_btn",function () {
              $.ajax({
                  url:"${APP_PATH}/student/deleteGrant/"+id,
                  type:"POST",
                  success:function (result) {
                      $("#studentDeleteAndModal").modal('hide');//关闭模态框
                      window.location.reload();
                  }
              });
          });
          });


      //修改奖学金信息
              $(document).on("click",".edit_Scholarship_btn",function(){
          getClas();
          showScholarshipStudent();//回显学生信息

          $(document).on("click",".sumbit_btn",function () {
              $("#class_select").removeAttr("disabled");
              $.ajax({
                  url:"${APP_PATH}/student/updateScholarshipStudent",
                  type:"POST",
                  data:$("#studentForm").serialize(),
                  success:function (result) {
                      $("#studentAndModal").modal('hide');//关闭模态框
                      window.location.reload();
                  }
              });
          });
      });


      //修改时显示奖学金用户的信息
      function showScholarshipStudent() {
          $.ajax({
              url:"${APP_PATH }/student/getStudent",
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
                  $("#rank_input").attr("value", "第" + result.stuRank + "名");
                  $("#punishment_input").attr("value", result.stuPunishment == false ? "有处分" : "无处分");
                  $("#grad_input").attr("value", result.stuGrad == false ? "有挂科" : "无挂科");
                  $("#phone_input").attr("value", result.scholarship.stuPhone);
                  $("#address_input").attr("value", result.scholarship.stuAddress);
      }
          });
          $("#studentAndModal").modal({
              backdrop: "static"
          });
      };



      //修改助学金信息
          $(document).on("click",".edit_Grant_btn",function () {
          getClas();
          showGrantStudent(); //回显学生信息

              $(document).on("click",".sumbit_btn",function () {
                  $("#class_select").removeAttr("disabled");
              $.ajax({
                  url:"${APP_PATH}/student/updateGrantStudent",
                  type:"POST",
                  data:$("#studentForm").serialize(),
                  success:function (result) {
                      $("#studentAndModal").modal('hide');//关闭模态框
                      window.location.reload();
                  }
              });
          });
      });


      //修改时显示助学金用户的信息
      function showGrantStudent() {
          $.ajax({
              url:"${APP_PATH }/student/getStudent",
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
                  $("#rank_input").attr("value", "第" + result.stuRank + "名");
                  $("#punishment_input").attr("value", result.stuPunishment == false ? "有处分" : "无处分");
                  $("#grad_input").attr("value", result.stuGrad == false ? "有挂科" : "无挂科");
                  $("#phone_input").attr("value", result.grant.stuPhone);
                  $("#address_input").attr("value", result.grant.stuAddress);
              }
          });
          $("#studentAndModal").modal({
              backdrop: "static"
          });
      };


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
