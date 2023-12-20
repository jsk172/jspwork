<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 글보기</title>
<link rel="stylesheet" href="../resources/css/boardview.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	 <div id="mid">
      <div class="board_zone_sec">
        <div class="board_zone_tit">
          <h2>상품후기</h2>
        </div>
        <div class="board_zone_cont">
          <div class="board_zone_view">

            <div class="board_view_tit">
              <h3>
                저희 햄스터가 맛있게 먹어요
              </h3>
            </div>
            <div class="board_view_info">
              <span class="view_info_idip">
                <b>회원 구매자</b>
                <em>(IP: )</em> </span>
              <span class="view_info_day">
                <em>2023.11.08 08:56:05</em>
              </span>
              <span class="view_info_hits">
                <b>조회수</b> 14
              </span>
            </div>

            <div class="board_view_content">

              <div class="view_goods_select">
                <div class="view_goods_select_item">
                  <span class="view_select_item_img">
                    <a href="#" target="_blank">
                      <img src="img/[비타크래프트]메뉴 바이탈 햄스터사료 400g.png">
                    </a>
                  </span>
                  <span class="view_select_item_info">
                    <em>[비타크래프트]메뉴 바이탈 햄스터사료 400g</em>
                    <span class="text_type_cont"></span>
                    <b>판매금액 2,400원</b>
                  </span>
                </div>
              </div>

              <div class="seem_cont">
                <div style="margin:10px 0 10px 0">
                  <br>
                  <p class="word">제가 모르고 먹어봤는데도 맛있어요, 혹시 내가(?)<br>
                    <br>
                    <img src="img/[비타크래프트]메뉴 바이탈 햄스터사료 400g.png" class="photo"><br>
                    <br><br>
                  </p>
                </div>
              </div>
            </div>

            <div class="board_view_comment">
              <div class="view_comment js_comment_area" data-bdid="goodsreview" data-sno="2871">
                <div class="view_comment_top">
                  <span class="comment_num">총 댓글 <b>0</b></span>
                  <span class="rating_star_box">
                    <em>별점</em>
                    <span class="rating_star">
                      <span style="width:100%;">&nbsp;</span>
                    </span>
                  </span>
                </div>
            
                <div class="board_comment_box_js_form_write">
                  댓글 권한이 없습니다.
                </div>
            
                <div class="button-container">
                  <button class="edit-button">수정</button>
                  <button class="delete-button">삭제</button>
                  <button class="confirm-button">확인</button>
                </div>
              </div>
            </div>
            
          </div>
          <div class="btn_right_box">
            <button type="button" class="btn_board_list" onclick="gd_btn_list('goodsreview')"><b>목록</b></button>
          </div>
        </div>
      </div>
	<jsp:include page="../footer.jsp" />
</body>
</html>