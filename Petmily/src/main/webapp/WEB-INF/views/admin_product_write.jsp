<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<form action="product_write" method="post" enctype="multipart/form-data" name="product_write">
   <img id="preview" style="width:500px"/>
   <br />
   <br />
   <input type="file" name="prod_img" onchange="readURL(this);"/>
   <br />
   <input type="text" name="prod_title" placeholder="상품 제목 입력"/>
   <br />
   <input type="text" name="prod_name" placeholder="상품 이름 입력"/>
   <br />
   <input type="text" name="prod_price" placeholder="상품 가격 입력"/>
   <br />
   <input type="text"  name="prod_solo" placeholder="상품 재고 입력"/>
   <br />
   <textarea name="prod_content" placeholder="상품 정보 입력"  style="width:500px;height:500px"></textarea>
   <br />
   <input type="submit" value="등록"/>

</form>
</body>
</html>