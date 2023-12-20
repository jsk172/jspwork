function checkForm(){
	let form = document.member;
	let uid = form.uid.value;
	let passwd = form.passwd.value;
	let passwd2 = form.passwd2.value;
	let name = form.name.value;
	
	let regexPw1 = /[0-9]+/; 
	let regexPw2 = /[a-zA-Z]+/; 
	let regexPw3 = /[~!@#$%^&*()_+|]+/; 
	
	if(uid.length<5 || uid.length>12){
		alert("아이디는 5~12자 까지 입력 가능합니다.");
		uid.select();
		return false;
	}else if(passwd.length<7 || !regexPw1.test(passwd) || !regexPw2.test(passwd) || !regexPw3.test(passwd)){
		alert("비밀번호는 영문자, 숫자, 특수문자 포함해서 7자 이상 입력 가능합니다.");
		passwd.select();
		return false;
	}else if(passwd != passwd2){
		alert("비밀번호와 일치하지 않습니다.");
		passwd2.select();
		return false;
	}else if(regexPw1.test(name)){
		alert("이름은 숫자로 시작할 수 없습니다.");
		name.select();
		return false;
	}else{
		form.submit();
	}
}