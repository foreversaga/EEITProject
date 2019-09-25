<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 日期選擇scriptCSS -->
<script src="/path/to//jquery.min.js"></script>
<script src="/path/to/bootstrap.js"></script>
<script src="/path/to/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="/path/to/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/path/to/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css" />
<script>
//密碼驗證
document.addEventListener("DOMContentLoaded",function(){
document.getElementById("mPassword").addEventListener("blur",checkPwd)
});
function checkPwd(){
    let theAge = document.getElementById("mPassword").value;
    let re =/^(?=.*\d)([a-z|A-Z]).{8,}\S$/;   //(?=.*\d)必須有0-9數字，英文大小寫皆可[a-z|A-Z]。
    if (re.test(theAge))                              //(?=.*\W)必須有特殊字元，{8,}\S>>8個字以上不可有空白
    //window.alert("正確");
    document.getElementById("passwordidentify").innerHTML="";
    else
   // window.alert("請重新檢查輸入格式");
    document.getElementById("passwordidentify").innerHTML="請重新檢查輸入格式";
}
//Email驗證
document.addEventListener("DOMContentLoaded",function(){
document.getElementById("mEmail").addEventListener("blur",checkPwd)
});
function checkPwd(){
    let theAge = document.getElementById("mEmail").value;
    let re =/^(?=.*\d)([a-z|A-Z]).{8,}\S$/;  
    if (re.test(theAge))                              
    //window.alert("正確");
    document.getElementById("Emailidentify").innerHTML="";
    else
   // window.alert("請重新檢查輸入格式");
    document.getElementById("Emailidentify").innerHTML="請重新檢查輸入格式";
}
// 生日日期驗證
 document.addEventListener("DOMContentLoaded",function(){
        document.getElementById("datepicker").addEventListener("blur",chkDate)
        });
        function chkDate() {
            let theDate = document.getElementById("datepicker").value;
            let re = /^\d{4}[- /.](0?[1-9]|1[012])[- /.](0?[1-9]|[12][0-9]|3[01])$/;
            // \d{4}比對yyyy是否都是0-9且必須出現4次 +-/.三種符號皆可+ (0?月份可以補0或沒有0)，比對1-9or10.11.12 +-/.三種符號皆可 +
            //日期可以補0或沒有0，比對1-9or10~20.20~29or30.31
            if (re.test(theDate))
                //window.alert("日期正確");
                document.getElementById("dateidentify").innerHTML="";
            else
                //window.alert("請重新檢查輸入格式");
                document.getElementById("dateidentify").innerHTML="請重新檢查輸入格式";
        }
 //日期選擇
 $('[type="date"]').datepicker({
    format: "yyyy-mm-dd",
    autoclose: true,
    startDate: "today",
    clearBtn: true,
    calendarWeeks: true,
    todayHighlight: true,
    language: 'zh-TW'
});
</script>
<style>
.registerBackground {			/*使圖片隨著瀏覽器尺寸自動縮放，不因大小出現縫隙*/
	position: fixed;
	top: 0;
	left: 0;			
	bottom: 0;
	right: 0;
	z-index: -999;
}

.registerBackground img {
	min-height: 100%;
	width: 100%;
}

@media screen and (max-width: 2000px) {/*使圖片保持長寬比不能變形，2000是圖片原始寬度*/
	img.registerBackground {
		left: 50%;
		margin-left: -500px;
	}
}

body {
	background: #eee !important;
}

.wrapper {
	margin: 200px auto;
	opacity:0.8;/*配合背景調整半透明 */
}

.form-signup {
	max-width: 380px;
	padding: 15px 35px 45px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.1);
	.
	form-signin-heading
	,
	.checkbox
	{
	margin-bottom
	:
	30px;
}

.checkbox {
	font-weight: normal;
}

.form-control {
	position: relative;
	font-size: 16px;
	height: auto;
	padding: 10px;
	@
	include
	box-sizing(border-box);
	&:
	focus
	{
	z-index
	:
	2;
}

}
input[type="text"] {
	margin-bottom: -1px;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}

radiobutton {
	margin-bottom: -1px;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}

input[type="password"] {
	margin-bottom: 20px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
}
</style>
<meta charset="UTF-8">
<title>註冊畫面</title>

</head>
<body>
	<div class="registerBackground">
		<img src="<c:url value='/img/registerBackground.jpg'/>">
	</div>
	<div class="wrapper">
		<form:form class="form-signup" method="POST" enctype="multipart/form-data" modelAttribute="MemberBean">
			<h2 class="form-signin-heading">Sign up</h2>
			<form:input id="mAccount" path="mAccount" type="text" class="form-control" placeholder="帳號"  name="txtUrl" required="required"/>
			<br>
			<form:input id="mPassword" path="mPassword" type="password" class="form-control" placeholder="密碼須含英文大小寫,數字.8個字以上"  name="txtUrl" required="required"/>
			<span id="passwordidentify"style="color:red"></span>
			<br>

			<form:input id="mEmail" path="mEmail" class="form-control" type="text" placeholder="電子信箱"  name="txtUrl" required="required"/>
			<span id="Emailidentify"style="color:red"></span>
			<br>

			<form:input id="mName" path="mName" class="form-control" type="text" placeholder="姓名"  name="txtUrl" required="required"/>
			<br>
			<tr>
				<td>性別</td>
				<td><label> <form:radiobutton value="male" id="mGender" path="mGender"  name="txtUrl" required="required"/>男
				</label> <label><form:radiobutton value="female" id="mGender" path="mGender"  name="txtUrl" required="required"/>女</label></td>
			</tr>
			<form:input path="mDate" id="datepicker" class="form-control" type="date" placeholder="出身年-月-日"  name="txtUrl" required="required"/>
			<span id="dateidentify"style="color:red"></span>
			<br>
			<form:input id="mPhone" path="mPhone" class="form-control" type="text" placeholder="電話號碼"  name="txtUrl" required="required"/>
			<br>

			<form:input id="mAddress" path="mAddress" class="form-control" type="text" placeholder="地址"  name="txtUrl" required="required"/>
			<br>

			<form:input id="mId" path="mId" type="text" class="form-control" placeholder="身分證"  name="txtUrl" required="required"/>
			<br>
			
			<form:input id="memberImage" path="memberImage" type="file" class="form-control btn btn-outline-dark btn-block" placeholder="護照上傳" />
			<br>
			<button class="btn btn-lg btn-primary btn-block" type="submit">register</button>

		</form:form>
	</div>
</body>
</html>