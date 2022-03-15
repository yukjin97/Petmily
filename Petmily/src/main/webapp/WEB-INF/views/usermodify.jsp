<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<style>
@media screen and (min-width:670px) {
	#grid1 {
		display: none;
	}
	#grid2 {
		display: block;
	}
}

@media screen and (max-width:670px) {
	#grid1 {
		display: block;
	}
	#grid2 {
		display: none;
	}
}
</style>
<!-- header include -->
<jsp:include page="header.jsp" />
<!-- nav -->
<div class="container" style="margin-top: 30px">
	<div class="row no-gutters slider-text align-items-end">
		<div class="col-md-9 ftco-animate pb-5">
			<p class="breadcrumbs mb-2">
				<span class="mr-2">myinfo <i class="ion-ios-arrow-forward"></i></span>
			</p>
			<h1 class="mb-0 bread">MyPage</h1>
		</div>
	</div>
</div>
<!-- END nav -->
<section>
	<div id="grid1" class="container">
		<ul class="nav justify-content-center">
			<li class="nav-item dropdown">
				<button type="button"
					class="nav-link dropdown-toggle btn btn-outline-success "
					data-toggle="collapse" data-target="#demo" style="width: 400px;"></button>
				<div class="collapse" id="demo">
					<button type="button" class="nav-link btn btn-outline-success"
						id="myinfo-tab1" style="width: 400px;">나의 정보</button>
					<button type="button" class="nav-link btn btn-outline-success"
						id="subscribe-tab1" style="width: 400px;">구독 내역</button>
					<button type="button" class="nav-link btn btn-outline-success"
						id="order-tab1" style="width: 400px;">주문 내역</button>
					<button type="button" class="nav-link btn btn-outline-success"
						id="delivery-tab1" style="width: 400px;">배송지 관리</button>
				</div>
			</li>
		</ul>
	</div>
	<div id="grid2">
		<ul class="nav justify-content-center">
			<li class="nav-item" role="presentation" style="margin-right: 10px;">
				<button type="button"
					class="nav-link active btn btn-outline-success " id="myinfo-tab"
					style="width: 150px;">나의 정보</button>
			</li>
			<li class="nav-item" role="presentation" style="margin-right: 10px;">
				<button type="button" class="nav-link btn btn-outline-success"
					id="subscribe-tab" style="width: 150px;">구독 내역</button>
			</li>
			<li class="nav-item" role="presentation" style="margin-right: 10px;">
				<button type="button" class="nav-link btn btn-outline-success"
					id="order-tab" style="width: 150px;">주문 내역</button>
			</li>
			<li class="nav-item" role="presentation" style="margin-right: 10px;">
				<button type="button" class="nav-link btn btn-outline-success"
					id="delivery-tab" style="width: 150px;">배송지 관리</button>
			</li>
		</ul>
	</div>
</section>

<!-- 주문 내역 수정 내용 -->
<div class="tab-content mx-5" id="myTabContent">
	<div class="row d-flex justify-content-center align-items-center h-100">
		<div style="height: 700px; width: 500px; margin-top: 100px">
			<div id="myinfoPage" class="pageSection">
				<div class="table-responsive">
					<form id=form action="usermodify" method="post">
						<div class="form-group">
							<label for="InputPassword1">현재 비밀번호</label> <input
								type="password" class="form-control" id="InputPassword1"
								placeholder="Enter Password" name="user_pwd">
						</div>
						<div class="form-group">
							<label for="InputPassword2">새로운 비밀번호</label> <input
								type="password" class="form-control" id="InputPassword2"
								placeholder="Enter New Password" name="user_pwd2">
						</div>
						<div class="form-group">
							<label for="password_check">비밀번호 확인</label> <input
								type="password" class="form-control" id="password_check"
								placeholder="Re-Password" value="">
						</div>
						<div class="form-group">
							<label for="InputNick">닉네임</label> <input type="text"
								class="form-control" id="InputNick" placeholder="Enter Nickname"
								value="${user.user_nickname }" name="user_nickname">
						</div>
						<div class="form-group">
							<label for="InputPhone">전화번호</label> <input type="text"
								class="form-control" id="InputPhone" placeholder="Enter Phone"
								value="${user.user_phone }" name="user_phone">
						</div>
						<div>
							<input type="submit" class="btn btn-success" id=modify
								value="저장하기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- footer include -->
<jsp:include page="footer.jsp" />

<script>
	// dropdown
	$('#myinfo-tab1').click(function() {
		$('.pageSection').css('display', 'none');
		$('#myinfoPage').css('display', 'block');
	});

	$('#subscribe-tab1').click(function() {
		$('.pageSection').css('display', 'none');
		$('#subPage').css('display', 'block');
	});

	$('#order-tab1').click(function() {
		$('.pageSection').css('display', 'none');
		$('#orderPage').css('display', 'block');
	});

	$('#delivery-tab1').click(function() {
		$('.pageSection').css('display', 'none');
		$('#deliveryPage').css('display', 'block');
	});

	$(document).ready(function() {
		$('li.active').removeClass('active');
		$('a[href="' + "/mypageinfo" + '"]').closest('li').addClass('active');
	});

	$('#form').submit(function() {
		let InputPassword1 = $('#InputPassword1').val();
		if (InputPassword1 == '') {
			alert("현재 비밀번호를 입력하세요.");
			$('#InputPassword1').focus();
			return false;
		}
		let InputPassword2 = $('#InputPassword2').val();
		if (InputPassword2 == '') {
			alert("변경할 비밀번호를 입력하세요.");
			$('#InputPassword2').focus();
			return false;
		}
		let InputNick = $('#InputNick').val();
		if (InputNick == '') {
			alert("닉네임을 입력하세요.");
			$('#InputNick').focus();
			return false;
		}
		let InputPhone = $('#InputPhone').val();
		if (InputPhone == '') {
			alert("전화번호를 입력하세요.");
			$('#InputPhone').focus();
			return false;
		}
		let password_check = $('#password_check').val();
		if (InputPassword2 != password_check) {
			alert("비밀번호 확인이 일치하지 않습니다.")
			$('#password_check').focus();
			return false;
		}
	});
</script>
