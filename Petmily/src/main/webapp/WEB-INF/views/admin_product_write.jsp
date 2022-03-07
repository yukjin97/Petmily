<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet" />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<link rel="stylesheet" href="${path }/resource/css/animate.css" />

<link rel="stylesheet" href="${path }/resource/css/owl.carousel.min.css" />
<link rel="stylesheet"
	href="${path }/resource/css/owl.theme.default.min.css" />
<link rel="stylesheet" href="${path }/resource/css/magnific-popup.css" />

<link rel="stylesheet"
	href="${path }/resource/css/bootstrap-datepicker.css" />
<link rel="stylesheet"
	href="${path }/resource/css/jquery.timepicker.css" />

<link rel="stylesheet" href="${path }/resource/css/flaticon.css" />
<link rel="stylesheet" href="${path }/resource/css/style.css" />
<link rel="stylesheet" href="${path }/resource/css/petmily.css" />

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="${path }/resource/fonts/icomoon/style.css">
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

</head>

<body>

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
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
        <circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
    </svg>
	</div>

	<script src="${path }/resource/js/jquery.min.js"></script>
	<script src="${path }/resource/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${path }/resource/js/popper.min.js"></script>
	<script src="${path }/resource/js/bootstrap.min.js"></script>
	<script src="${path }/resource/js/jquery.easing.1.3.js"></script>
	<script src="${path }/resource/js/jquery.waypoints.min.js"></script>
	<script src="${path }/resource/js/jquery.stellar.min.js"></script>
	<script src="${path }/resource/js/jquery.animateNumber.min.js"></script>
	<script src="${path }/resource/js/bootstrap-datepicker.js"></script>
	<script src="${path }/resource/js/jquery.timepicker.min.js"></script>
	<script src="${path }/resource/js/owl.carousel.min.js"></script>
	<script src="${path }/resource/js/jquery.magnific-popup.min.js"></script>
	<script src="${path }/resource/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${path }/resource/js/google-map.js"></script>
	<script src="${path }/resource/js/main.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script>
		function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('ordercheck[]');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
  
}
		</script>

</body>
</html>
