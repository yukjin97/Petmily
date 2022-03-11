<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

	<jsp:include page="header.jsp" />

<section id="write_form" style="height:900px; text-align:center;">
<div  id="allform"  style="margin-top: 100px;">
<form action="admin_product_write" method="post" enctype="multipart/form-data" name="admin_product_write">
<div id="file" style="float:left;width:30%;height:500px;margin-left: 450px;margin-top: 0px;">
   <img id="preview" style="width:400px; height:400px;"/>
   <br />
   <br />
   <input type="file" name="file" onchange="readURL(this);"/>
   <br />
</div>
<div id="prod_info" style="float:left;width: 300px;height:500px">
   제목<br>
   <input type="text" name="prod_title" placeholder="상품 제목 입력"/>
   <br />
   이름<br>
   <input type="text" name="prod_name" placeholder="상품 이름 입력"/>
   <br />
   가격<br>
   <input type="text" name="prod_price" placeholder="상품 가격 입력"/>
   <br />
   재고<br>
   <input type="text"  name="prod_allamount" placeholder="상품 재고 입력"/>
   <br />
   카테고리<br>
   <select id="category" name="prod_category" onchange="selectBoxChange(this.value);">
   <option value="사료">사료</option>
   <option value="옷">옷</option>
   <option value="장난감">장난감</option>
   <option value="간식">간식</option>
   </select>
   <br />
</div>

<div id="prod_content" style="display:block;width: 750px;margin-left: 480px;">
   <br><br>내용<br>
   <textarea name="prod_content" placeholder="상품 정보 입력"  style="width:750px;height:200px"></textarea>
   <br />
   <input type="submit" value="등록"/>
</div>
</form>
</div>
</section>
	<jsp:include page="footer.jsp" />
	 <script>
      function readURL(input) {
         if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
               document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
         } else {
            document.getElementById('preview').src = "";
         }
      }
   </script>
	
<script>
	$(document).ready(function() {
	  $('li.active').removeClass('active');
	  $('a[href="' + "/admin_membership" + '"]').closest('li').addClass('active');
	});
</script>