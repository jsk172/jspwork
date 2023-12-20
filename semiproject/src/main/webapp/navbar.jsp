<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../resources/css/navbar.css">
<div id="sideNav">
    <div class="lr_nav">
        <nav id="scroll_left">
            <button id="left_scroll_btn" onclick=lrBtn()><</button>
        </nav>
        <nav id="scroll_right">
            <div class="right_banner">
                <a class="btn_brandview" href="">브랜드</a>
            </div>
            <div class="quick_btn_cart">
                <div class="basket_title">장바구니</div>
            </div>
            <div class="scroll_right_cont">
                <div><p>최근 본 상품</p></div>
                <!-- <li class="view_empty">
                최근 본<br>
                상품이<br>
                없습니다.
                </li> -->
                <div class="justview"><img class="justview_pic" src="../resources/img/products/food1.jpg" alt=""></div>
                <div class="justview"><img class="justview_pic" src="../resources/img/products/house1.jpg" alt=""></div>
                <div class="justview"><img class="justview_pic" src="../resources/img/products/toy1.jpg" alt=""></div>
            </div>
            <div class="go_QnA">
                <a>문의 게시판</a>
            </div>
            <div class="go_review">
                <a>리뷰 게시판</a>
            </div>
            <div class="go_top_bottom">
                <button id="go_top" onclick=goTop()><i class="fa-solid fa-arrow-up"></i></button>
                <button id="go_bottom" onclick="goBottom()"><i class="fa-solid fa-arrow-down"></i></button>
            </div>
        </nav>
    </div>
</div>