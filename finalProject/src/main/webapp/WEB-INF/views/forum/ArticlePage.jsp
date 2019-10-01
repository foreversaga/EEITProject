<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>討論區</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
function DeleteItem(clicked_id) {
	var url = "<c:url value='/DeleteCartProduct?pId=" + clicked_id + "'/>";
	$.ajax({
		url : url,
		type : "get",
		success : function(data) {
			$("div.modal-body").html(data);
		}
	});
};

function CheckOutButton(){
	if(${empty shoppingCart.content}){
		alert("購物車內無商品");
		return;
	}else{
		location.href = "<c:url value='/CheckOut'/>";
	}
};
</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<div class="container">
			<a class="navbar-brand" href="<c:url value='/'/>">旅遊趣</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="<c:url value='/'/>" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="<c:url value='/products/1'/>" class="nav-link">Products</a></li>
					<c:if test="${empty LoginOK}">
						<li class="nav-item"><a href="<c:url value='/login'/>" class="nav-link">Login</a></li>
						<li class="nav-item"><a href="<c:url value='/register/add'/>" class="nav-link">Register</a></li>
					</c:if>
					<c:if test="${!empty LoginOK}">
						<li class="nav-item"><a href="<c:url value='/UserDashboard'/>" class="nav-link">會員中心</a></li>
						<li class="nav-item"><a href="<c:url value='/logout'/>" class="nav-link">Logout</a></li>
					</c:if>
				</ul>
				<ul class="navbar-nav mr-right">
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
						id="navbarDropdown" role="button" data-toggle="modal" aria-haspopup="true"
						aria-expanded="false" data-target="#shoppingCartMenu">購物車</a> <!-- 						<div id="shoppingCartMenu" class="dropdown-menu" aria-labelledby="navbarDropdown"></div> -->
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Modal -->
	<div class="modal fade" id="shoppingCartMenu" tabindex="-1" role="dialog"
		aria-labelledby="shoppingCartMenuTitle" aria-hidden="true" data-backdrop="false">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="shoppingCartMenuTitle">
						<c:choose>
							<c:when test="${!empty LoginOK}">
						${LoginOK.mName}的購物車
						</c:when>
							<c:otherwise>
						你的購物車
						</c:otherwise>
						</c:choose>
					</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<c:if test="${empty shoppingCart.content }">
						<p style="text-align: center; margin-top: 10%">購物車內已無商品</p>
					</c:if>
					<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content }">
						<img style="width: 80px; float: left; vertical-align: center; margin-right: 1%;"
							src="<c:url value='/showPic/${cart.value.pId}'/>">
						<p style="line-height: 10px">${cart.value.pName}</p>
						<span style="line-height: 5px">數量:${cart.value.iQty} 價格:${cart.value.pPrice}</span>
						<span><input class="btn btn-outline-danger" id="${cart.value.pId}" type="button"
								onclick="DeleteItem(this.id)" value="刪除" /> </span>
						<c:choose>
							<c:when test="${vs.last}">
							</c:when>
							<c:otherwise>
								<hr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-dark" data-dismiss="modal">繼續購物</button>
					<button type="button" onclick="CheckOutButton()" class="btn btn-success">結帳</button>
				</div>
			</div>
		</div>
	</div>
	<div style="margin: 5% auto; width: 1000px;">
		<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#NewArticle"
			aria-expanded="false" aria-controls="NewArticle">發表新文章</button>
		<button class="btn btn-success" type="button" data-toggle="collapse" data-target="#ReplyArticle"
			aria-expanded="false" aria-controls="ReplyArticle">回覆文章</button>
		<c:if test="${LoginOK.mId==ArticleBean.mId}">
			<button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#EditArticle"
				aria-expanded="false" aria-controls="EditArticle">修改文章</button>
		</c:if>

		<!-- 			發表文章表單 -->
		<div class="collapse" id="NewArticle">
			<div class="card card-body">
				<form:form method="POST" action="${pageContext.request.contextPath}/PostArticle"
					modelAttribute="ArticleBean">
					<div class="form-group row">
						<label for="aTitle" class="col-sm-2 col-form-label">標題</label>
						<div class="col-sm-10">
							<form:input type="text" id="aTitle" class="form-control" path="aTitle" placeholder="標題" />
						</div>
					</div>
					<div class="form-group row">
						<label for="arContent" class="col-sm-2 col-form-label">內文</label>
						<div class="col-sm-10">
							<textarea rows="5" class="form-control" id="arContent" name="arContent" placeholder="文章內容"></textarea>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-10">
							<button type="submit" class="btn btn-primary">送出文章</button>
						</div>
					</div>
					<form:input type="hidden" path="aDisplay" value="1" />
				</form:form>
			</div>
		</div>
		<!-- 	發表文章表單結尾	 -->

		<!-- 	回覆文章表單 -->
		<div class="collapse" id="ReplyArticle">
			<div class="card card-body">
				<form:form method="POST" action="${pageContext.request.contextPath}/ReplyArticle"
					modelAttribute="ArticleReplyBean">
					<div class="form-group row">
						<label for="arContent" class="col-sm-2 col-form-label">回覆內容</label>
						<div class="col-sm-10">
							<textarea rows="5" class="form-control" id="arContent" name="arContent" placeholder="文章內容"></textarea>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-10">
							<button type="submit" class="btn btn-primary">回覆文章</button>
						</div>
					</div>
					<form:input type="hidden" path="arDisplay" value="1" />
					<input type="hidden" name="aId" value="${ArticleBean.aId}" />
				</form:form>
			</div>
		</div>
		<!-- 	回覆文章表單結尾	 -->
		<!-- 			修改文章表單 -->
		<div class="collapse" id="EditArticle">
			<div class="card card-body">
				<form:form method="POST" action="${pageContext.request.contextPath}/EditArticle"
					modelAttribute="ArticleBean">
					<div class="form-group row">
						<label for="aTitle" class="col-sm-2 col-form-label">標題</label>
						<div class="col-sm-10">
							<form:input type="text" id="aTitle" class="form-control" path="aTitle" placeholder="標題" />
						</div>
					</div>
					<div class="form-group row">
						<label for="arContent" class="col-sm-2 col-form-label">內文</label>
						<div class="col-sm-10">
							<textarea rows="5" class="form-control" id="aContent" name="aContent" placeholder="文章內容">${ArticleBean.aContent}</textarea>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-10">
							<button type="submit" class="btn btn-primary">修改文章</button>
						</div>
					</div>
					<form:input type="hidden" path="aDisplay" value="1" />
					<form:input type="hidden" path="aId" value="${ArticleBean.aId}" />
					<form:input type="hidden" path="aAddTime" value="${ArticleBean.aAddTime}" />
				</form:form>
			</div>
		</div>
		<!-- 	修改文章表單結尾	 -->

	</div>
	<div style="width: 1000px; margin: 0% auto;">

		<div style="width: 1000px; margin: 0 auto;">
			<div class="container mt-5 border">
				<div class="row">
					<div class="col-md-3 border">
						<img style="margin: 6% 0" width="100%" src="<c:url value='/showmPic/${ArticleBean.mId}'/>">
						<div class="row">
							<div style="text-align: center;" class="col-md-12">good button</div>
						</div>
					</div>
					<div class="col-md-9">
						<div class="row">
							<div class="col-md-7">
								<p style="font-size: 30px;">${ArticleBean.aTitle}</p>

							</div>
							<div style="text-align: right; font-size: 25px;" class="col-md-5">
								<div class="row">
									<div class="col-md-4"></div>
									<div class="col-md-4"></div>
									<div class="col-md-4">test</div>
								</div>
								<div class="row">
									<div class="col">
										<span>用戶:${ArticleBean.mName}</span>
									</div>

								</div>
							</div>
						</div>
						<div class="row border-bottom">
							<div class="col-md-9"></div>
						</div>
						<div style="height: 80px;" class="col-md-9">
							<p style="font-size: 20px;">${ArticleBean.aContent}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${!empty ReplyList}">
			<c:forEach varStatus="vs" var="ReplyBean" items="${ReplyList}">
				<div style="width: 800px;">
					<div class="container mt-3 border">
						<div class="row">
							<div class="col-md-2 border">
								<img style="margin: 6% 0" width="100%" src="<c:url value='/showmPic/${ReplyBean.mId}'/>">
								<div class="row">
									<div style="text-align: center;" class="col-md-12">good button</div>
								</div>
							</div>
							<div class="col-md-10">
								<div class="row">
									<div class="col-md-5">
										<span style="font-size: 25px;">用戶:${ReplyBean.mName}</span>
									</div>
									<div style="text-align: right; font-size: 25px;" class="col-md-7">
										<div class="row">
											<div class="col-md-6"></div>
											<div class="col-md-2"></div>
											<c:if test="${LoginOK.mId==ReplyBean.mId}">
												<div class="col-md-4">
													<button class="btn btn-danger" type="button" data-toggle="collapse"
														data-target="#EditReply${ReplyBean.arId}" aria-expanded="false" aria-controls="EditReply${ReplyBean.arId}">修改文章</button>
												</div>
											</c:if>
										</div>
										<div class="row">
											<div class="col-ml-3"></div>
											<div class="col-mr-9"></div>
										</div>
									</div>
								</div>
								<div class="row border-bottom">
									<div class="col-md-8"></div>
								</div>
								<div style="height: 80px;" class="col-md-9">
									<p style="font-size: 20px;">${ReplyBean.arContent}</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 			修改回覆表單 -->
				<c:if test="${LoginOK.mId==ReplyBean.mId}">
					<div style="width: 800px;">
						<div class="collapse" id="EditReply${ReplyBean.arId}">
							<div class="card card-body">
								<form:form method="POST" action="${pageContext.request.contextPath}/EditReply"
									modelAttribute="ArticleReplyBean">
									<div class="form-group row">
										<label for="arContent" class="col-sm-2 col-form-label">內文</label>
										<div class="col-sm-10">
											<textarea rows="5" class="form-control" id="arContent" name="arContent" placeholder="文章內容">${ReplyBean.arContent}</textarea>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-10">
											<button type="submit" class="btn btn-primary btn-sm">修改回覆</button>
										</div>
									</div>
									<form:input type="hidden" path="arDisplay" value="1" />
									<input type="hidden" name="aId" value="${ArticleBean.aId}" />
									<form:input type="hidden" path="arId" value="${ReplyBean.arId}" />
									<form:input type="hidden" path="arAddTime" value="${ReplyBean.arAddTime}" />
								</form:form>
							</div>
						</div>
					</div>
				</c:if>
				<!-- 	修改回覆表單結尾	 -->

			</c:forEach>
		</c:if>
	</div>
</body>
</html>