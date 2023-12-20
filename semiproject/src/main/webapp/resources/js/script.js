// 변수 설정
let topTopMenu = document.querySelector(".top-top-menu");
let miniShortcut = document.querySelector(".mini-shortcut");
let topBottomMenu = document.querySelector(".top-btm-menu");
let addUl = document.createElement("ul");
let addLi = document.createElement("li");
let addA = document.createElement("a");
let addInput = document.createElement("input");
addMsShortcut();

// addTtmMenu();
// addtbMenu();

changeAd();
moveNav();
mainProdPicChange();

function addMsShortcut() {
    let addUl = document.createElement("ul");
    window.addEventListener("scroll", removeBtn);

    addUl.className = "ms-list";

    // 배열사용 목록 정의
    let itemList = [
        { text: "youtube", link: "https://www.youtube.com", target: "_black", src: "../resources/img/icon/youtube.png"},
        { text: "instagram", link: "https://www.instagram.com", target: "_black", src: "../resources/img/icon/insta.png" },
        { text: "twitter", link: "https://www.twitter.com", target: "_black", src: "../resources/img/icon/twitter.png" }
    ];
    // 각 항목 목록에 추가
    itemList.forEach(function (item) {
        let addLi = document.createElement("li");
        let addA = document.createElement("a");
        let img = document.createElement("img");
        addA.href = item.link;
        addA.textContent = item.text;
        addA.target = item.target;
        img.src = item.src;
        addA.appendChild(img);
        addLi.appendChild(addA);
        addUl.appendChild(addLi);
    })
    // div에 추가
    miniShortcut.appendChild(addUl);
}

// function addTtmMenu() {
//     let addUl = document.createElement("ul");
//     addUl.className = "ttm-list";
//     let itemsList = [
//         { text: "JOIN", link: "/join.do" },
//         { text: "LOG-IN", link: "/login.do" },
//         { text: "MY-PAGE", link: "/mypage.do" },
//         { text: "BASKET", link: "/basket.do" },
//         { text: "ORDER-INQUIRY", link: "/orderinquiry.do" },
//         { text: "BOARD", link: "/board.do" }
//     ];
//     itemsList.forEach(function (item) {
//         let addLi = document.createElement("li");
//         let addA = document.createElement("a");
//         addA.href = item.link;
//         addA.textContent = item.text;
//         addLi.appendChild(addA);
//         addUl.appendChild(addLi);
//     });
//     // 검색창 설정
//     addInput.type = "text";
//     addInput.id = "search";
//     addLi.appendChild(addInput);
//     addLi.innerHTML += " 🔍";

//     // 검색창 목록에 추가
//     addUl.appendChild(addLi);
//     topTopMenu.appendChild(addUl);
// }

// function addtbMenu() {
//     let addUl = document.createElement("ul");
//     addUl.className = "tbm-list";
//     let allMenuAddLi = document.createElement("li");
//     let allMenuAddA = document.createElement("a");
//     let addIcon = document.createElement("i");
//     allMenuAddLi.className = "view-all-menu";
//     addIcon.className = "fa-solid fa-bars";
//     allMenuAddA.textContent = "전체 메뉴 "
//     allMenuAddA.href = "/allmenu.do"
//     allMenuAddA.appendChild(addIcon);
//     allMenuAddLi.appendChild(allMenuAddA);
//     addUl.appendChild(allMenuAddLi);
//     topBottomMenu.appendChild(addUl);
//     let AllMenu = document.querySelector(".view-all-menu");
//     let itemsList = [
//         { title: "강이지 먹거리", link: "/Dfood.do", items: ["사료", "간식", "영양제"], subLinks: ["/dfood.do", "/dsnack.do", "/dhealth.do"] },
//         { title: "강이지 용품", link: "/Dthings.do", items: ["집", "장난감", "밥그릇", "옷", "산책용품"], subLinks: ["/dhouse.do", "/dplay.do", "/dbowl.do", "/dcloth.do", "/doutdoor.do"] },
//         { title: "고양이 먹거리", link: "/Cfood.do", items: ["사료", "간식", "영양제"], subLinks: ["/cfood.do", "/csnack.do", "/chealth.do"] },
//         { title: "고양이 용품", link: "/Cthings.do", items: ["집", "장난감", "밥그릇", "옷", "방콕용품"], subLinks: ["/chouse.do", "/cplay.do", "/cbowl.do", "/ccloth.do", "/cindoor.do"] },
//         { title: "햄스터 먹거리", link: "/Hfood.do", items: ["사료", "간식", "영양제"], subLinks: ["/hfood.do", "/hsnack.do", "/hhealth.do"] },
//         { title: "햄스터 용품", link: "/Hthings.do", items: ["집", "장난감", "밥그릇", "챗바퀴", "이갈이"], subLinks: ["/hhouse.do", "/hplay.do", "/hbowl.do", "/hwheel.do", "/htooth.do"] },
//         { title: "이벤트 상품", link: "/eventproduct.do", items: ["기간 할인 상품", "신상품 할인 이벤트", "시즌 한정 상품"] }
//     ]
//     itemsList.forEach(function (menu) {
//         let addLi = document.createElement("li");
//         let addA = document.createElement("a");
//         addLi.className = "tbm-list-li";
//         addA.textContent = menu.title;
//         addA.href = menu.link;
//         let subMenuUl = document.createElement("ul");
//         subMenuUl.className = "sub_menu";
//         menu.items.forEach(function (item, index) {
//             let addSubLi = document.createElement("li");
//             let addSubA = document.createElement("a");

//             addSubA.textContent = item;
//             if (menu.subLinks && menu.subLinks[index]) {
//                 addSubA.href = menu.subLinks[index];
//             }

//             subMenuUl.appendChild(addSubLi);
//             addSubLi.appendChild(addSubA);
//         })
//         addLi.appendChild(addA);
//         addLi.appendChild(subMenuUl);
//         addUl.appendChild(addLi);
//     })
//     topBottomMenu.appendChild(addUl);
//     function viewAllMenu() {
//         let addDiv = document.createElement("div");
//         addDiv.className = "sub_all_menu";
//         itemsList.forEach(function (menu) {
//             let addUl = document.createElement("ul");
//             let addA = document.createElement("a");
//             addA.textContent = menu.title;
//             addA.href = menu.link;
//             addUl.appendChild(addA);

//             menu.items.forEach(function (item, index) {
//                 let addSubLi = document.createElement("li");
//                 let addSubA = document.createElement("a");

//                 addSubA.textContent = item;
//                 if (menu.subLinks && menu.subLinks[index]) {
//                     addSubA.href = menu.subLinks[index];
//                 }

//                 addSubLi.appendChild(addSubA);
//                 addUl.appendChild(addSubLi);
//             })
//             addDiv.appendChild(addUl);
//             AllMenu.appendChild(addDiv);
//         })
//     }
//     viewAllMenu();
// }

function moveNav() {
    document.addEventListener('scroll', onScroll, { passive: true });
    let top = document.querySelector("#top");
    let height = top.clientHeight;
    function onScroll() {
        let scrollPosition = pageYOffset;
        let topNav = document.querySelector("#top-btm");
        let lSideNav = document.querySelector("#scroll_left");
        let rSideNav = document.querySelector("#scroll_right");
        let lNavBtn = document.querySelector("#left_scroll_btn");
        if (height <= scrollPosition) {
            topNav.classList.add('top-btm_fixed');
            lSideNav.style.transition = "position 0.3s ease-in-out, top 0.3s ease-in-out";
            rSideNav.style.transition = "position 0.3s ease-in-out, top 0.3s ease-in-out";
            lNavBtn.style.transition = "all 0.3s ease-in-out";
            lSideNav.style.position = "fixed";
            rSideNav.style.position = "fixed";
            lSideNav.style.top = "70px";
            rSideNav.style.top = "70px";
            lNavBtn.classList.add('fixed_btn');
            lNavBtn.classList.remove('fix_btn');
        } else {
            topNav.classList.remove('top-btm_fixed');
            lSideNav.style.transition = "position 0.3s ease-in-out, top 0.3s ease-in-out";
            rSideNav.style.transition = "position 0.3s ease-in-out, top 0.3s ease-in-out";
            lNavBtn.style.transition = "all 0.3s ease-in-out";
            lSideNav.style.position = "absolute";
            rSideNav.style.position = "absolute";
            lSideNav.style.top = "0";
            rSideNav.style.top = "0";
            lNavBtn.classList.remove('fixed_btn');
            lNavBtn.classList.add('fix_btn');
        }
    }
}

function changeAd() {
    let nav = document.querySelector("#scroll_left");
    let addList = [
        { id: "ad1", link: "/ad1.do", class: "advertisement", src: "../resources/img/ad/광고_02_advertisement1.jpg" },
        { id: "ad2", link: "/ad2.do", class: "advertisement", src: "../resources/img/ad/광고_02_advertisement2.jpg" }
    ]

    addList.forEach(function (element) {
        let addDiv = document.createElement("div");
        let addA = document.createElement("a");
        let addImg = document.createElement("img");
        addImg.className = element.class;
        addImg.src = element.src;
        addA.href = element.link;
        addDiv.id = element.id;
        addA.appendChild(addImg);
        addDiv.appendChild(addA);
        nav.appendChild(addDiv);
    })

    let turn = "on";
    function AdChange() {
        let ad1 = document.querySelector("#ad1");
        let ad2 = document.querySelector("#ad2");
        ad1.style.transition = "opacity 1s ease-in-out";
        ad2.style.transition = "opacity 1s ease-in-out";
        if (turn == "on") {
            ad1.style.opacity = 0;
            ad2.style.opacity = 1;
            turn = "off";
        } else {
            ad1.style.opacity = 1;
            ad2.style.opacity = 0;
            turn = "on";
        }
    }
    setInterval(AdChange, 3500);
}

function lrBtn() {
    let btn = document.querySelector("#left_scroll_btn");
    let nav = document.querySelector("#scroll_left");
    let currentLeft = parseInt(nav.style.left) || 0;
    if (isNaN(currentLeft)) {
        currentLeft = 0;
        nav.style.left = currentLeft + "px";
    }
    let newLeft = currentLeft === 0 ? -200 : 0;

    nav.style.transition = "left 0.5s ease-in-out";
    nav.style.left = newLeft + "px";

    setTimeout(() => {
        nav.style.transition = "none";
    }, 500);
    if (currentLeft == 0) {
        btn.textContent = ">";
    } else {
        btn.textContent = "<";
    }
}

function goTop() {
    window.scrollTo({ top: 0, behavior: "smooth" });
}
function goBottom() {
    let height = document.body.scrollHeight;
    window.scrollTo({ top: height, behavior: "smooth" });
}
function removeBtn() {
    let btn = document.querySelector("#go_bottom");
    let viewportHeight = window.innerHeight;
    let maxHeight = document.body.offsetHeight;
    let currentHeight = window.scrollY;
    let nowHeight = currentHeight + viewportHeight;
    if (maxHeight <= nowHeight) {
        btn.classList.add("fadeOut");
        setTimeout(() => {
            btn.classList.remove("fadeOut");
        }, 500);
        btn.style.opacity = "0";
    } else {
        setTimeout(() => {
            btn.classList.add("fadeIn");
            setTimeout(() => {
                btn.classList.remove("fadeIn");
            }, 500);
            btn.style.opacity = "1";
        }, 0);
    }
}

window.addEventListener("scroll", removeBtn);

// 세션 확인 코드
// let uid = '<%= session.getAttribute("sessionId") %>';
// document.addEventListener("DOMContentLoaded", function() {
//     let ul = document.querySelector(".ttm-list");
//     if (ul) {
//         let loginLi = ul.getElementsByTagName("li");
//         if (uid !== "null" && loginLi[1]) {
//             loginLi[1].innerHTML = '<a href="/logout.do">LOG-OUT</a>';
//             loginLi[0].remove();
//         }
//     }
// });


function checkMember(){
	let form = document.member;
	let id = form.id.value;
	let pw = form.passwd.value;
	let pw2 = form.passwd2.value;
	let name = form.name.value;
	
	//정규표현식
	let regexid = /^[a-zA-z0-9]+$/;
	let regexpw = /[0-9]+/;
	let regexpw2 = /[a-zA-Z]+/
	let regexpw3 = /[~!@#$%^&*()_+|]+/
	let regexname = /^[가-힣]+$/
	
	if(id.length < 8 || id.length > 14 || !regexid.test(id)){
		alert("아이디는 영문,숫자 포함 8~ 14자까지만 입력가능합니다.")
		id.select();
		return false;
	}else if(pw.length < 10 || !regexpw.test(pw) ||
		!regexpw2.test(pw) || !regexpw3.test(pw)){
		alert("비밀번호는 영문자 , 숫자, 특수문자 포함해서 10자 이상 입력해주세요.");
		pw.select();
		return false;
	}else if(pw != pw2){
		alert("비밀번호와 일치하지 않습니다 다시 입력해주세요.")
		pw2.select();
		return false;
	}else if(!regexname.test(name)){
		alert("이름은 한글로만 입력해주세요.");
		return false;
	}else{
		form.submit();
	}
}


function mainProdPicChange() {
    let pic1 = document.querySelector("#main-prod-pic1");
    let pic2 = document.querySelector("#main-prod-pic2");
    let pic3 = document.querySelector("#main-prod-pic3");
    let pic4 = document.querySelector("#main-prod-pic4");
    let pic5 = document.querySelector("#main-prod-pic5");
    let pics = [pic1, pic2, pic3, pic4, pic5];

    pics.forEach((pic, index) => {
        if (index === 0) {
            pic.style.opacity = 1;
        } else {
            pic.style.opacity = 0;
        }
    });

    pics.forEach(pic => {
        pic.style.transition = "opacity 1s ease-in-out";
    });

    let currentIndex = 1;

	

    setInterval(() => {
        pics[currentIndex].style.opacity = 1;

        for (let i = 0; i < pics.length; i++) {
            if (i !== currentIndex) {
                pics[i].style.opacity = 0;
            }
        }
        updateButtonColors(currentIndex);
        currentIndex = (currentIndex + 1) % pics.length;
    }, 3000);
}

function selectPic(index) {
    let pic1 = document.querySelector("#main-prod-pic1");
    let pic2 = document.querySelector("#main-prod-pic2");
    let pic3 = document.querySelector("#main-prod-pic3");
    let pic4 = document.querySelector("#main-prod-pic4");
    let pic5 = document.querySelector("#main-prod-pic5");
    let pics = [pic1, pic2, pic3, pic4, pic5];

    pics.forEach((pic, i) => {
        if (i === index) {
            pic.style.opacity = 1;
        } else {
            pic.style.opacity = 0;
        }
    });
    pic1.style.transition = "opacity 0.5s ease-in-out";
    pic2.style.transition = "opacity 0.5s ease-in-out";
    pic3.style.transition = "opacity 0.5s ease-in-out";
    pic4.style.transition = "opacity 0.5s ease-in-out";
    pic5.style.transition = "opacity 0.5s ease-in-out";

    updateButtonColors(index);
}

function updateButtonColors(selectedIndex) {
    let buttons = document.querySelectorAll(".main-pic-button button");;
	
    buttons.forEach((button, i) => {
        if (i === selectedIndex) {
            button.style.background = "#951";
        } else {
            button.style.background = "#fff";
        }
    });
}

updateButtonColors(0);