function goToJoin2() {
	let personAgree = document.getElementById('person_agree');
	let useAgree = document.getElementById('use_agree');

	if (personAgree.checked && useAgree.checked) {
		window.location.href = '/join2.do';
	} else {
		alert('개인정보 및 이용약관에 동의해주세요.');
	}
}

function goToMain() {
  window.location.href = '/main.do';
}

function registerUser() {
    let id = document.getElementById('id');
    let pw = document.getElementById('passwd');
    let pw2 = document.getElementById('passwd2');
    let name = document.getElementById('name');

    // 정규표현식
    let regexid = /^[a-zA-z0-9]+$/;
    let regexpw = /[0-9]+/;
    let regexpw2 = /[a-zA-Z]+/;
    let regexpw3 = /[~!@#$%^&*()_+|]+/;
    let regexname = /^[가-힣]+$/;

    if (id.value.length < 4 || id.value.length > 20 || !regexid.test(id.value) || id.value.trim() === '') {
        alert("아이디는 영문, 숫자 포함 4~20자까지만 입력 가능합니다.");
        id.focus();
        return false;
    } else if (pw.value.length < 10 || !regexpw.test(pw.value) ||
        !regexpw2.test(pw.value) || !regexpw3.test(pw.value) || pw.value.trim() === '') {
        alert("비밀번호는 영문자, 숫자, 특수문자를 포함해서 10자 이상 입력해주세요.");
        pw.focus();
        return false;
    } else if (pw.value !== pw2.value) {
        alert("비밀번호와 일치하지 않습니다. 다시 입력해주세요.");
        pw2.focus();
        return false;
    } else if (!regexname.test(name.value) || name.value.trim() === '') {
        alert("이름은 한글로만 입력해주세요.");
        name.focus();
        return false;
    } else {
        document.getElementById('mid_form').submit();
    }
}

function goBack() {
    history.back();
}
