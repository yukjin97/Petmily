<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:include page="header.jsp" />
<section class="ftco-section">
	<form class="container" action="/product/detail/${prod_num}/add"
		method="post">
		<div class="mask d-flex align-items-center h-100 gradient-custom-3 ">
			<div class="container h-100">
				<div class="row w-100">
					<div class="container px-5 px-lg-5 mt-5">
						<h2 class="display-5 mb-2 text-center">${prod_num}번상품 리뷰등록</h2>
						<!-- 				
		<table>
							<tr>
								<td>상품리뷰제목</td>
								<td><input type="text" name="review_title"
									placeholder="리뷰 제목 입력" /></td>
							</tr>
							<tr>
								<td>상품리뷰내용</td>
								<td><textarea id="review_content" name="review_content"
										cols="40" rows="15" required="required">						
								</textarea></td>
							</tr>

							<tr>
								<td><input type="submit" value="리뷰작성" /></td>
							</tr>
						</table> -->
						<div class="col-md-10 col-lg-10 mt-lg-n8"
							style="text-align: center; margin: auto;">
							<div class="bg-light rounded" style="padding: 30px;">
								<input type="text" class="form-control border-0 py-2 mb-2"
									name="review_title" placeholder="리뷰제목을 입력해주세요">
								<textarea class="form-control border-0 mb-2" rows="15"
									name="review_content" placeholder="리뷰내용을 입력해주세요"></textarea>
								<button type="submit" class="btn btn-primary w-100 py-2">리뷰
									작성</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</section>
<jsp:include page="footer.jsp" />