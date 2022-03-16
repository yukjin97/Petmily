<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:include page="header.jsp" />

<!-- Section-->
<section>
  <div class="grid2">
    <ul class="nav justify-content-center">
      <li>
        <form action="/product" method="post">
          <input
            type="submit"
            value="전체보기"
            class="nav-link btn btn-outline-success justify-content-center"
            style="
              width: 100px;
              height: 50px;
              margin: auto;
              margin-top: 25px;
              margin-left: 10px;
            "
            id=""
          />
        </form>
      </li>

      <li>
        <form action="/product/pop" method="post">
          <input
            type="submit"
            value="인기순"
            class="nav-link btn btn-outline-success justify-content-center"
            style="
              width: 100px;
              height: 50px;
              margin: auto;
              margin-top: 25px;
              margin-left: 10px;
            "
            id=""
          />
        </form>
      </li>

      <li>
        <form action="/product/lowprice" method="post">
          <input
            type="submit"
            value="낮은가격순"
            class="nav-link btn btn-outline-success justify-content-center"
            style="
              width: 100px;
              height: 50px;
              margin: auto;
              margin-top: 25px;
              margin-left: 10px;
            "
            id=""
          />
        </form>
      </li>

      <li>
        <form action="/product/highpirce" method="post">
          <input
            type="submit"
            value="높은가격순"
            class="nav-link btn btn-outline-success justify-content-center"
            style="
              width: 100px;
              height: 50px;
              margin: auto;
              margin-top: 25px;
              margin-left: 10px;
            "
            id=""
          />
        </form>
      </li>
      <li>
        <form action="/product/" method="post">
          <input type="hidden" name="prod_category" value="사료" />
          <input
            type="submit"
            value="사료"
            id="prod_category"
            class="nav-link btn btn-outline-success justify-content-center"
            style="
              width: 100px;
              height: 50px;
              margin: auto;
              margin-top: 25px;
              margin-left: 10px;
            "
            id=""
          />
        </form>
      </li>

      <li>
        <form action="/product/" method="post">
          <input type="hidden" name="prod_category" value="장난감" />
          <input
            type="submit"
            value="장난감"
            id="prod_category"
            class="nav-link btn btn-outline-success justify-content-center"
            style="
              width: 100px;
              height: 50px;
              margin: auto;
              margin-top: 25px;
              margin-left: 10px;
            "
            id=""
          />
        </form>
      </li>

      <li>
        <form action="/product/" method="post">
          <input type="hidden" name="prod_category" value="간식" />
          <input
            type="submit"
            value="간식"
            id="prod_category"
            class="nav-link btn btn-outline-success justify-content-center"
            style="
              width: 100px;
              height: 50px;
              margin: auto;
              margin-top: 25px;
              margin-left: 10px;
            "
            id=""
          />
        </form>
      </li>

      <li>
        <form action="/product/" method="post">
          <input type="hidden" name="prod_category" value="옷" />
          <input
            type="submit"
            value="옷"
            id="prod_category"
            class="nav-link btn btn-outline-success justify-content-center"
            style="
              width: 100px;
              height: 50px;
              margin: auto;
              margin-top: 25px;
              margin-left: 10px;
            "
            id=""
          />
        </form>
      </li>
    </ul>
  </div>
  <c:choose>
    <c:when test="${articleList!=null && pageInfo.listCount>0 }">
      <div class="container px-5 px-lg-5 mt-5">
        <div
          class="row gx-5 gx-lg-5 row-cols-5 row-cols-md-5 row-cols-xl-5 justify-content-center"
        >
          <c:forEach var="p" items="${articleList }">
            <div class="col mb-7">
              <div class="card h-100">
                <!-- Product image-->
                <img
                  class="card-img-top"
                  style="width: 200px; height: 200px; margin: auto"
                  src="${path }/upload/${p.prod_img}"
                  alt="..."
                />
                <!-- Product details-->
                <div class="card-body p-3">
                  <div class="text-center">
                    <!-- Product name-->
                    <h5 class="fw-bolder">${p.prod_title}</h5>
                    <!-- Product price-->
                    <span class="text-muted text-decoration-line-through"
                      ><strong>${p.prod_price}</strong></span
                    >
                  </div>
                </div>
                <!-- Product actions-->
                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                  <div class="text-center card-footer">
                    <button class="btn.btn-primary">
                      <a
                        class="btn btn-primary-outline mt-auto"
                        href="/product/detail/${p.prod_num}"
                        >구경하기</a
                      >
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </c:when>
  </c:choose>
</section>

<section id="pageList">
  <div
    class="container px-5 px-lg-5 mt-5 block-center"
    style="text-align: center"
  >
    <c:choose>
      <c:when test="${pageInfo.page<=1}"> [이전]&nbsp; </c:when>
      <c:otherwise>
        <a href="product?page=${pageInfo.page-1}&">[이전]</a>&nbsp;
      </c:otherwise>
    </c:choose>
    <c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage }">
      <c:choose>
        <c:when test="${pageInfo.page==i }">[${i }]</c:when>
        <c:otherwise>
          <a href="../product?prod_category=${prod_category }&page=${i}"
            >[${i }]</a
          >
        </c:otherwise>
      </c:choose>
    </c:forEach>
    <c:choose>
      <c:when test="${pageInfo.page>=pageInfo.maxPage }"> [다음] </c:when>
      <c:otherwise>
        <a href="product?page=${pageInfo.page+1}">[다음]</a>
      </c:otherwise>
    </c:choose>
  </div>
</section>

<!-- footer include -->
<jsp:include page="footer.jsp" />
<script>
  $(document).ready(function () {
    $('li.active').removeClass('active');
    $('a[href="' + '/product' + '"]')
      .closest('li')
      .addClass('active');
  });
</script>
