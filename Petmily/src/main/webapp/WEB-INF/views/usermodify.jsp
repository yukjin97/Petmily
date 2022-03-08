<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<!-- header include -->
<jsp:include page="header.jsp" />

<!-- 마이페이지 탭 메뉴 -->
<section>
   <ul class="nav nav-tabs justify-content-center" id="myTab"
      role="tablist">
      <li class="nav-item" role="presentation">
         <button class="nav-link active" id="myinfo-tab" data-bs-toggle="tab"
            data-bs-target="#myinfo" type="button" role="tab"
            aria-controls="myinfo" aria-selected="true">나의 정보</button>
      </li>
      <li class="nav-item" role="presentation">
         <button class="nav-link" id="subscribe-tab" data-bs-toggle="tab"
            data-bs-target="#subscribe" type="button" role="tab"
            aria-controls="subscribe" aria-selected="false">구독 관리</button>
      </li>
      <li class="nav-item" role="presentation">
         <button class="nav-link" id="order-tab" data-bs-toggle="tab"
            data-bs-target="#order" type="button" role="tab"
            aria-controls="order" aria-selected="false">주문 내역</button>
      </li>
      <li class="nav-item" role="presentation">
         <button class="nav-link" id="delivery-tab" data-bs-toggle="tab"
            data-bs-target="#delivery" type="button" role="tab"
            aria-controls="delivery" aria-selected="false">배송지 관리</button>
      </li>
   </ul>
   </section>
   
    <!-- 마이페이지 탭 내용 -->
   <div class="tab-content" id="myTabContent">
      <!-- 나의 정보 내용 -->
      <form id='form' method="get" action="usermodify">
      <div class="tab-pane fade show active" id="myinfo" role="tabpanel"
         aria-labelledby="myinfo-tab">
         <section class="ftco-section bg-white">
            <div class="item">
               <div class="table-responsive">
                  <table class="t_margin_auto width100 ds-table">
                     <colgroup>
                        <col style="width: 30%" />
                        <col style="width: 70%" />
                     </colgroup>
                     <tbody>
                        <tr>
                           <td class="bg">현재 비밀번호</td>
                          <td><input type="password" id=password name="user_pwd" placeholder="비밀번호를 입력하세요" required><br></td>
                        </tr>
                        <tr>
                           <td class="bg">새로운 비밀번호</td>
                           <td><input type="password" id=password2 name="user_pwd2" value=""><br></td>
                        </tr>
                        <tr>
                           <td class="bg">비밀번호 확인</td>
                           <td><input type="password" id=password_check value=""><br></td>
                        </tr>
                        <tr>
                           <td class="bg">닉네임</td>
                           <td><input type="text" id=nickname value="${user.user_nickname }" name="user_nickname" ><br></td>
                        </tr>
                        <tr>
                           <td class="bg">전화번호</td>
                           <td><input type="text" id=phone value="${user.user_phone }" name="user_phone"><br> </td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <div>
                  <input type="button" class="edit"
                     onclick="location.href='mypageinfo'" value="수정하기" />
               </div>
            </div>
         </section>
      </div>
        </form> 
       </div>
  
      
      <!-- footer include -->
<jsp:include page="footer.jsp" />
