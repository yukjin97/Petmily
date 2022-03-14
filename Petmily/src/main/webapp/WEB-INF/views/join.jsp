<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- header include -->
<jsp:include page="header.jsp" />

<section class="ftco-section">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">회원가입</h2>
              <form action="join" method="post">
                <div class="form-outline mb-2">
                  <input type="text" id="user_id" class="form-control form-control-lg" name="user_id" />
                  <label class="form-label" for="user_id">아이디</label>
                  <div style="display:inline-block; float:right; margin-top:5px;" >
	              	<input class="btn btn-primary" id="id_check" type="button" value="중복 확인">
	              </div>
                </div>

                <div class="form-outline mb-2">
                  <input
                    type="text"
                    id="form3Example2cg"
                    class="form-control form-control-lg"
                    name="user_name"/>
                  <label class="form-label" for="form3Example3cg">이름</label>
                </div>

                <div class="form-outline mb-2">
                  <input type="email" id="user_email" class="form-control form-control-lg" name="user_email" />
                  <label class="form-label" for="user_email">이메일</label>
                  <div style="display:inline-block; float:right; margin-top:5px;" >
		              <input class="btn btn-primary" id="email_check" type="button" value="중복 확인">
    			 </div>
                </div>

                <div class="form-outline mb-2">
                  <input
                    type="password"
                    id="form3Example2cg"
                    class="form-control form-control-lg"
                    name="user_pwd"
                  />
                  <label class="form-label" for="form3Example3cg"
                    >비밀번호</label
                  >
                </div>

                <div class="form-outline mb-2">
                  <input
                    type="password"
                    id="form3Example2cdg"
                    class="form-control form-control-lg"
                  />
                  <label class="form-label" for="form3Example3cdg"
                    >비밀번호 확인</label
                  >
                </div>

                <div class="form-outline mb-2">
                  <input
                    type="text"
                    id="form3Example2cdg"
                    class="form-control form-control-lg"
                    name="user_nickname"
                  />
                  <label class="form-label" for="form3Example3cdg">닉네임</label>
                </div>

                <!--다음 주소 api  -->
                <div class="form-outline mb-2">
                  <input
                    id="member_post"
                    name="user_zipcode"
                    type="text"
                    class="form-control form-control-lg"
                    placeholder="우편번호 검색 Click"
                    readonly
                    onclick="findAddr()"
                  /><br />
                  <label class="form-label" for="form3Example3cdg">우편번호 검색</label>
                  <input
                    type="text"
                    name="user_address1"
                    class="form-control form-control-lg"
                    placeholder=""
                    id="address"
                  /><br />
                  <label class="form-label" for="form3Example3cdg">주소</label>
                  <input
                    id="detail"
                    name="user_address2"
                    type="text"
                    class="form-control form-control-lg"
                    placeholder="상세주소를 입력해주세요"
                  />
                  <label class="form-label" for="form3Example3cdg"
                    >상세주소</label
                  >
                </div>

                <br />

                <div class="form-outline mb-2">
                  <input
                    type="text"
                    name="user_phone"
                    id="form3Example2cdg"
                    class="form-control form-control-lg"
                    placeholder="000-0000-0000"
                  />
                  <label class="form-label" for="form3Example3cdg"
                    >핸드폰 번호</label
                  >
                </div>

                <div class="d-flex justify-content-center">
                  <button
                    type="submit"
                    class="btn btn-success btn-block btn-lg gradient-custom-4 text-body"
                  >
                    회원가입
                  </button>
                </div>

                <p class="text-center text-muted mt-5 mb-0">
                  이미 아이디가 있으신가요?
                  <a href="login" class="fw-bold text-body"><u>로그인 하기</u></a>
                </p>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  function findAddr() {
    new daum.Postcode({
      oncomplete: function (data) {
        console.log(data);

        var roadAddr = data.roadAddress;
        var jibunAddr = data.jibunAddress;
        document.getElementById('member_post').value = data.zonecode;
        if (roadAddr !== '') {
          document.getElementById('address').value = roadAddr;
        } else if (jibunAddr !== '') {
          document.getElementById('address').value = jibunAddr;
        }
      },
    }).open();
  }
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

/* 스윗얼럿 정의 */
$(function(){
	let sweetalert=(icon,title,contents)=>{
        Swal.fire({
            icon: icon,
            title: title,
            text: contents,
            confirmButtonText: "확인"
        })
    };
	$('#id_check').click(function () {
    	if($('#user_id').val()==""){
    		Swal.fire({
				title: "입력 오류",
				text: "아이디를 입력하세요",
				icon: "error",
				confirmButtonText: "확인"
			})
			$('#join').attr("disabled", true);
			return false;
		} 
		$.ajax({
			type:"post",
			dataType:"text",
			async:false,
			url:"http://localhost:8080/idoverlap",
			data:{ user_id:$('#user_id').val()},
			success: function(data, textStatus){
				if(data=="true"){
					Swal.fire({
						title: "사용 불가능",
						text: "사용 중인 아이디 입니다",
						icon: "error",
						confirmButtonText: "확인"
					})
					$('#join').attr("disabled", true);
				} else {
					Swal.fire({
						title: "사용 가능",
						text: "사용 가능한 아이디 입니다",
						icon: "success",
						confirmButtonText: "확인"
					})
					$('#join').attr("disabled", false);
				}
			}
		});
	});
	$('#email_check').click(function () {
    	if($('#user_email').val()==""){
    		Swal.fire({
				title: "입력 오류",
				text: "이메일을 입력하세요",
				icon: "error",
				confirmButtonText: "확인"
			})
			$('#join').attr("disabled", true);
			return false;
		} 
		$.ajax({
			type:"post",
			dataType:"text",
			async:false,
			url:"http://localhost:8080/emailoverlap",
			data:{ user_email:$('#user_email').val()},
			success: function(data, textStatus){
				if(data=="true"){
					Swal.fire({
						title: "사용 불가능",
						text: "사용 중인 이메일 입니다",
						icon: "error",
						confirmButtonText: "확인"
					})
					$('#join').attr("disabled", true);
				} else {
					Swal.fire({
						title: "사용 가능",
						text: "사용 가능한 이메일 입니다",
						icon: "success",
						confirmButtonText: "확인"
					})
					$('#join').attr("disabled", false);
				}
			}
		});
	});
});
</script>
<script>
	$(document).ready(function() {
	  $('li.active').removeClass('active');
	  $('a[href="' + "/join" + '"]').closest('li').addClass('active');
	});
</script>
<!-- footer include -->
<jsp:include page="footer.jsp" />
