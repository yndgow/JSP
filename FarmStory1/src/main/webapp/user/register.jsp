<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>

<script>
	//데이터 검증에 사용할 정규표현식
	let regUid 		= /^[a-z]+[a-z0-9]{4,19}$/g;
	let regName 	= /^[가-힣]{2,4}$/;
	let regNick		= /^[가-힣a-zA-Z0-9]+$/;
	let regEmail 	= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	let regHp 		= /^\d{3}-\d{3,4}-\d{4}$/;
	let regPass 	= /^.*(?=^.{5,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	let uidPass = false;
    let nickPass = false;
    let equalPass = false;

	document.addEventListener("DOMContentLoaded", function(){
		
		const checkUid = document.getElementById("checkUid");
	    let uid = document.getElementById("uid");
	    let uidResult = document.getElementsByClassName("uidResult")[0];
	    
	    uid.addEventListener("keydown",()=>{
	    	uidPass = false;
	    	uidResult.textContent = "";
	    });
	    
	    checkUid.addEventListener("click", function(){
	    	
	    	if(uidPass){
	    		return;
	    	}
	    	
	    	if(!(uid.value).match(regUid)){
	    		uidResult.classList.add("loading");
	    		setTimeout(()=>{
	    		uidResult.textContent = "아이디가 유효하지 않습니다.";
	    		uidPass = false;
	    		},500);
	    		return;
	    	}
	    	
	    	uidResult.textContent = "......";
	        fetch("./proc/checkUid.jsp?uid="+uid.value)
	        .then(res => res.json())
	        .then(function(data){
	        	setTimeout(() => {
	        		if(data.result == 1){
                		uidResult.textContent = "이미 사용중인 아이디입니다.";    
		        		uidPass = false;
		        	}else{
	        			uidResult.textContent = "사용가능한 아이디입니다.";    
		        		uidPass = true;
		        	}
                }, 500);
	        });
	    });
	    
	    let p1 = document.getElementById("pass1");
        let p2 = document.getElementById("pass2");
        let resultPass = document.getElementsByClassName("resultPass")[0];
        function evalPass() {
		  resultPass.textContent = ".........";
          setTimeout(() => {
            if (p1.value == p2.value) {
              resultPass.classList.add("blue");
              resultPass.classList.remove("red");
              resultPass.textContent = "비밀번호가 동일힙니다.";
              equalPass = true;
            } else {
              resultPass.classList.remove("blue");
              resultPass.classList.add("red");
              resultPass.textContent = "비밀번호가 동일하지 않습니다.";
              equalPass = false;
            }
          }, 500);
        }
        p1.addEventListener("focusout", evalPass);
        p2.addEventListener("focusout", evalPass);
	    
	});
	
	$(function(){
	    $('#checkNick').click(function(){
	    	let nick = $('#nick').val();
	    	let nickResult = $('.nickResult');
	    	$.get("./proc/checkNick.jsp?nick="+nick, function(data){
	    		nickResult.text("......");
	        	setTimeout(() => {
	        		if(data.result == 1){
	        			nickResult.text("이미 사용중인 별명입니다.");    
		        		uidPass = false;
		        	}else{
		        		nickResult.text("사용가능한 별명입니다.");    
		        		uidPass = true;
		        	}
                }, 500);	    		
	    	});	
	    });
	});
</script>
<main id="user" class="register">
    <form action="/FarmStory1/user/proc/registerProc.jsp" method="post">
        <table>
            <caption>사이트 이용정보 입력</caption>
            <tr>
                <th>아이디</th>
                <td>
                    <input type="text" id="uid" name="uid" placeholder="아이디 입력">
                    <button type="button" id="checkUid"><img src="./img/chk_id.gif" alt="중복확인"></button>
                    <span class="uidResult"></span>
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password" id="pass1" name="pass" placeholder="비밀번호 입력">
                    <span class="resultPass"></span>
                </td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td>
                    <input type="password" id="pass2" placeholder="비밀번호 확인 입력">
                </td>
            </tr>
        </table>

        <table>
            <caption>개인정보 입력</caption>
            <tr>
                <th>이름</th>
                <td>
                    <input type="text" id="name" name="name" placeholder="이름 입력">
                </td>
            </tr>
            <tr>
                <th>별명</th>
                <td>
                    <p>공백없이 한글, 영문, 숫자 입력</p>
                    <input type="text" id="nick" name="nick" placeholder="별명 입력">
                    <button type="button" id="checkNick"><img src="./img/chk_id.gif" alt=""></button>
                    <span class="nickResult"></span>
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="email" id="email" name="email" placeholder="이메일 입력">
                </td>
            </tr>
            <tr>
                <th>휴대폰</th>
                <td>
                    <input type="text" id="hp" name="hp" placeholder="- 포함 13자리 입력">
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <input type="text" name="zip" id="zip" placeholder="우편번호 검색" readonly>
                    <button type="button" onclick="execDaumPostcode()"><img src="./img/chk_post.gif" alt="우편번호찾기"></button>
                    <input type="text" name="addr1" id="addr1" placeholder="기본주소 검색" readonly>
                    <input type="text" name="addr2" placeholder="상세주소 검색">
                </td>
            </tr>
        </table>
        <div>
            <a href="./login.jsp" class="btnCancle">취소</a>
            <input type="submit" class="btnRegister" value="회원가입">
        </div>
    </form>
</main>
<%@ include file="../_footer.jsp" %>