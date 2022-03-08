<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<!-- header include -->
<jsp:include page="header.jsp" />
<section class="ftco-section">
	<div class="mask d-flex align-items-center h-100 gradient-custom-3">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-9 col-lg-7 col-xl-6">
					<div class="card" style="border-radius: 15px;">
						<div class="card-body p-5">
							<h2 class="text-uppercase text-center mb-5">로그인</h2>
							<form action="login" method="post">
								<div class="form-outline mb-4">
									<input type="text" name="user_id" id="form3Example1cg"
										class="form-control form-control-lg" /> <label
										class="form-label" for="form3Example1cg">아이디</label>
								</div>

								<div class="form-outline mb-4">
									<input type="password" name="user_pwd" id="form3Example4cg"
										class="form-control form-control-lg" /> <label
										class="form-label" for="form3Example4cg">비밀번호</label>
								</div>

								<div class="d-flex justify-content-center">
									<button type="submit"
										class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">로그인</button>
								</div>

								<p class="text-center text-muted mt-5 mb-0">
									아이디가 없으신가요? <a href="join" class="fw-bold text-body"><u>회원가입하기</u></a>
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- footer include -->
<jsp:include page="footer.jsp" />
