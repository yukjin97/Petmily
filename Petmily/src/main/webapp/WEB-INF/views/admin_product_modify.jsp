<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
	<jsp:include page="header.jsp" />

<section id="write_form" style="height:800px; text-align:center;">

<div id="allform"  style="margin-top: 100px;">
<form action="admin_product_modify" method="post"  name="admin_product_modify">
<input type="hidden" name="prod_num" value="${modi.prod_num }">
<div id="file" style="float:left;width:30%;height:400px;margin-left: 450px;margin-top: 0px;">
   <img src="${path}/upload/${modi.prod_img}" style="width: 500px" />
   <br />
   <br />
</div>
<div id="prod_info" style="float:left;width: 300px;height:400px">
   제목<br>
   <input type="text" name="prod_title" value="${modi.prod_title }"/>
   <br />
   이름<br>
   <input type="text" name="prod_name" value="${modi.prod_name }"/>
   <br />
   가격<br>
   <input type="text" name="prod_price" value="${modi.prod_price}"/>
   <br />
   카테고리<br>
   <select id="category" name="prod_category" onchange="selectBoxChange(this.value);">
   <option value="${modi.prod_category }">선택중:${modi.prod_category }</option>
   <option value="사료">사료</option>
   <option value="옷">옷</option>
   <option value="장난감">장난감</option>
   <option value="간식">간식</option>
   </select>
   <br />
</div>

<div id="prod_content" style="display:block;width: 750px;margin-left: 480px;">
   <br><br>내용<br>
   <textarea name="prod_content" placeholder="상품 정보 입력"  style="width:750px;height:200px">
   ${modi.prod_content}
   </textarea>
   <br />
   <input type="submit" value="수정"/>
</div>
</form>
</div>
</section>
	<jsp:include page="footer.jsp" />
	
