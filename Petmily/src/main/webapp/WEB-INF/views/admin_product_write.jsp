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
<form action="admin_product_write" method="post" enctype="multipart/form-data" name="admin_product_write">
   <img id="preview" style="width:500px"/>
   <br />
   <br />
   <input type="file" name="file" onchange="readURL(this);"/>
   <br />
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
   <input type="text"  name="prod_solo" placeholder="상품 재고 입력"/>
   <br />
   카테고리<br>
   <select id="category" name="prod_category" onchange="selectBoxChange(this.value);">
   <option value="사료">사료</option>
   <option value="옷">옷</option>
   <option value="장난감">장난감</option>
   <option value="간식">간식</option>
   </select>
   <br />
   내용<br>
   <textarea name="prod_content" placeholder="상품 정보 입력"  style="width:500px;height:500px"></textarea>
   <br />
   <input type="submit" value="등록"/>

</form>
</body>
</html>