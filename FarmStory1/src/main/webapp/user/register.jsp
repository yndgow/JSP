<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<script>
	document.addEventListener("DOMContentLoaded", function(){
		let uidPass = false;
	    let nickPass = false;
		
		const checkUid = document.getElementById("checkUid");
	    let uid = document.getElementById("uid");
	    let uidResult = document.getElementsByClassName("uidResult");
	    checkUid.addEventListener("click", function(){
	        fetch("./proc/checkUid.jsp?uid="+uid.value)
	        .then(res => res.json())
	        .then(function(data){
	        	uidResult[0].textContent = "......";
	        	setTimeout(() => {
	        		if(data.result == 1){
                		uidResult[0].textContent = "이미 사용중인 아이디입니다.";    
		        		uidPass = false;
		        	}else{
	        			uidResult[0].textContent = "사용가능한 아이디입니다.";    
		        		uidPass = true;
		        	}
                }, 500);
	        });
	    });
	});
	
	$(function(){
	    let pass1 = $('#pass1').val();
	    let pass2 = $('#pass2').val();
	    
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
                    <input type="text" id="uid" placeholder="아이디 입력">
                    <button type="button" id="checkUid"><img src="./img/chk_id.gif" alt="중복확인"></button>
                    <span class="uidResult"></span>
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password" id="pass1" placeholder="비밀번호 입력">
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
                    <input type="text" id="name" placeholder="이름 입력">
                </td>
            </tr>
            <tr>
                <th>별명</th>
                <td>
                    <p>공백없이 한글, 영문, 숫자 입력</p>
                    <input type="text" id="nick" placeholder="별명 입력">
                    <button type="button" id="checkNick"><img src="./img/chk_id.gif" alt=""></button>
                    <span class="nickResult"></span>
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="email" id="email" placeholder="이메일 입력">
                </td>
            </tr>
            <tr>
                <th>휴대폰</th>
                <td>
                    <input type="text" id="uphone" placeholder="- 포함 13자리 입력">
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <input type="text" name="zip" placeholder="우편번호 검색" readonly>
                    <button type="button"><img src="./img/chk_post.gif" alt="우편번호찾기"></button>
                    <input type="text" name="addr1" placeholder="기본주소 검색" readonly>
                    <input type="text" name="addr2" placeholder="상세주소 검색">
                </td>
            </tr>
        </table>
        <div>
            <a href="./login.html" class="btnCancle">취소</a>
            <input type="submit" class="btnRegister" value="회원가입">
        </div>
    </form>
</main>
<%@ include file="../_footer.jsp" %>