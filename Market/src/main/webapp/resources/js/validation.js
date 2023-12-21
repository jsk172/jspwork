/**
 * 상품 등록 유효성 검사
 * 상품코드는 p와숫자를 조합하면 5~12자로 입력
 * 상품명은 4~20자로 입력
 * 가격 및 재고수는 숫자만 입력
 */
let checkProduct = function(){
	let pid = document.getElementById("pid");
	let pname = document.getElementById("pname");
	let price = document.getElementById("price");
	let pstock = document.getElementById("pstock");
	
	let regexPid = /P[0-9]{4,11}/
	
	if(!regexPid.test(pid.value)){
		alert("상품코드는 P와숫자를 조합하여 5~12자로 입력해주세요");
		pid.select();
		return false;
	}else if(pname.value.length<4 || pname.value.length>20){
		alert("상품명은 4~20자 까지 입력");
		pname.select();
		return false;
	}else if(price.value.length==0 || isNaN(price.value) || price.value<0){
		alert("가격은 숫자만 입력");
		price.select();
		return false;
	}else if(pstock.value.length==0 || isNaN(pstock.value) || pstock.value<0){
		alert("재고수는 숫자만 입력");
		pstock.select();
		return false;
	}else{
		document.newProduct.submit();
	}
}