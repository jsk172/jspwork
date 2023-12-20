function clearAddress() {
    var addressInputs = document.querySelectorAll(".deliver_address input[type='text']");
    var telephoneInputs = document.querySelectorAll("#telephone2 + input[type='text'], #telephone2 + input[type='text'] + input[type='text']");
    var mobilephoneInputs = document.querySelectorAll("#mobilephone2 + input[type='text'], #mobilephone2 + input[type='text'] + input[type='text']");

    // 여러 요소에 대해 반복하여 값을 빈 문자열로 설정
    addressInputs.forEach(function (input) {
        input.value = "";
    });

    telephoneInputs.forEach(function (input) {
        input.value = "";
    });

    mobilephoneInputs.forEach(function (input) {
        input.value = "";
    });
}

function copyAddress() {
    let copiedAd1 = document.querySelector(".copiedad1").value;
    let copiedAd2 = document.querySelector(".copiedad2").value;
    let copiedAd3 = document.querySelector(".copiedad3").value;

    let copiedt1 = document.querySelector(".copiedt1").value;
    let copiedt2 = document.querySelector(".copiedt2").value;

    let phoneNo1 = document.querySelector(".phoneNo1").value;
    let phoneNo2 = document.querySelector(".phoneNo2").value;

    document.querySelector(".copyAddress1").value = copiedAd1;
    document.querySelector(".copyAddress2").value = copiedAd2;
    document.querySelector(".copyAddress3").value = copiedAd3;
    
    document.querySelector(".copytel1").value = copiedt1;
    document.querySelector(".copytel2").value = copiedt2;

    document.querySelector(".copyphone1").value = phoneNo1;
    document.querySelector(".copyphone2").value = phoneNo2;
}

function calculator (){
    var num1 = parseFloat(document.querySelector(".p_price").innerText);
    var num2 = parseFloat(document.querySelector(".p_count").innerText);

    var num3 = num1 * num2;
    var num4 = num3 + 3000;

    document.querySelector(".result").innerText = num3;

    var finalResultElements = document.querySelectorAll(".final_result");

    finalResultElements.forEach(function(element) {
    element.innerText = num4;
    });
}

calculator();