$("#joinForm #join").on("click",function(){
    if($("#userID").val().length<=0) {
        alert("ID는 필수 입력 사항입니다.");
        $("#userID").focus();
        return;
    }else if($("#userName").val().length<=0){
        alert("이름은 필수 입력 사항입니다.");
        $("#userName").focus();
    } else if($("#userPassword").val().length<=0){
        alert("password는 필수 입력 사항입니다.");
        $("#userPassword").focus();
        return;
    }  else if($("#userEmail").val().length<=0){
        alert("이메일은 필수 입력 사항입니다.");
        $("#userEmail").focus();
        return;
    } else if($("#userPhone").val().length<=0){
        alert("전봐번호는 필수 입력 사항입니다.");
        $("#userPhone").focus();
        return;
    } else {
        $("#joinForm").submit();
    }
});