<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:include page="header.jsp" />
<section class="ftco-section">
	<form class="container" action="/product/detail/${prod_num}/add" method="post">
		<div class="mask d-flex align-items-center h-100 gradient-custom-3">
			<div class="container h-100">
				<div class="row w-100">
					<div class="col-lg-12 col-md-12 col-12">
						<h3 class="display-5 mb-2 text-center">${prod_num}번 리뷰 등록</h3>
							<table>
								<tr>
									<td>상품리뷰제목</td>
									<td><input type="text" name="review_title"
										placeholder="리뷰 제목 입력" /></td>
								</tr>
								<tr>
									<td>상품리뷰내용</td>
									<td>
									<textarea id="review_content" name="review_content" cols="40"
										rows="15" required="required">						
								</textarea>
									</td>
								</tr>
								 	
								<tr>
								<td><input type="submit" value="리뷰작성"/> </td>
								</tr>
							</table>
					</div>
				</div>
			</div>
		</div>
	</form>
</section>
<jsp:include page="footer.jsp" />