<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//데이터 건증에 사용할 정규표현식
	let regUid 		= /^[a-z]+[a-z0-9]{4,19}$/g;
	let regName 	= /^[가-힣]{2,4}$/;
	let regNick		= /^[가-힣a-zA-Z0-9]+$/;
	let regEmail 	= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	let regHp 		= /^\d{3}-\d{3,4}-\d{4}$/;
	let regPass 	= /^.*(?=^.{5,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	// 폼 데이터 검증 결과 상태변수
	let isUidOK 	= false;
	let isPassOK 	= false;
	let isNameOK 	= false;
	let isNickOK 	= false;
	let isEmailOK 	= false;
	let isHpOK 		= false;

	$(function(){
		// 아이디 중복 검사
		const uid = $('input[name=uid]').val();
		$('input[name=uid]').keydown(function(){
			isUidOK = false;
			$('.uidResult').text('');
		});
		
		$('#btnUidCheck').click(function(){
			if(isUidOK) return;
			if(!uid.match(regUid)){
				isUidOK = false;
				$('.uidResult').css('color', 'red').text('아이디가 유효하지 않습니다.')
				return;
			}
			$.ajax({
				url:'/JBoard2/user/checkUid.do',
				method:'GET',
				data:{"uid":uid},
				dataType:'json',
				success:function(data){
					if(data.result > 0){
						$('.uidResult').css('color', 'red').text('이미 사용중인 아이디 입니다.');
						isUidOK = false;
					}
					else{
						$('.uidResult').css('color', 'blue').text('사용가능한 아이디입니다.');
						isUidOK = true;
					}
				}
			});
		});
		
		// 비밀번호 일치 확인
		$('input[name=pass1], input[name=pass2]').keydown(function(){
			$('.passResult').text('');
		});
		$('input[name=pass2]').focusout(function(){
			const pass1 = $('input[name=pass1]').val();
			const pass2 = $(this).val();
			isPassOK = pass1 === pass2 ? true : false;
			
			if(pass2.match(regPass)){
				isPassOK = true;
				$('.passResult').css('color','green').text('비밀번호가 일치합니다.');
			}else{
				isPassOK = false;
				$('.passResult').css('color','red').text('영문, 숫자, 특수문자 조합 최소5자 이상이여야 합니다.');
			}
			
			
		});
		
		// 별명 중복검사
		$('input[name=nick]').keydown(function(){
			isNickOK = false;
			$('.nickResult').text('');
		});
		$('#checkNick').click(function(){
			let nick =$('input[name=nick]').val();
			if(!nick.match(regNick)){
				isNickOK = false;
				$('.nickResult').css('color', 'red').text('별명이 유효하지 않습니다.')
				return;
			}
			$.get('/JBoard2/user/checkNick.do?',{"nick":nick}, function(data){
				if(data.result > 0){
					$('.nickResult').css('color', 'red').text('이미 사용중인 별명입니다.');
					isNickOK = false;
				}
				else{
					$('.nickResult').css('color', 'blue').text('사용가능한 별명입니다.');
					isNickOK = true;
				}
			}, 'json');
		});
		
		$('input[name=name]').focusout(function(){
			
			let name = $(this).val();
			
			if(!name.match(regName)){
				isNameOK = false;
				$('.nameResult').css('color','red').text('이름은 한글 2자 이상 이어야 합니다.');			
			}else{
				isNameOK = true;
				$('.nameResult').text('');
			}
		});
		
		
		// 전체 유효성 검사
		////////////////////////////////////
		////////////validation//////////////
		////////////////////////////////////
		$('.register > form').submit(function(){
			if(!isUidOK){
				alert('아이디를 확인하세요.')
				return false;
			}
			if(!isPassOK){
				alert('비밀번호를 확인하세요.')
				return false;
			}
			if(!isNickOK){
				alert('별명을 확인하세요.')
				return false;
			}
			return true;
		});
	});
</script>
<main id="user">
    <section class="register">
        <form action="/JBoard2/user/register.do" method="post">
            <table border="1">
                <caption>사이트 이용정보 입력</caption>
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" name="uid" placeholder="아이디 입력"/>
                        <button type="button" id="btnUidCheck"><img src="../img/chk_id.gif" alt="중복확인"/></button>
                        <span class="uidResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td>
                    	<input type="password" name="pass1" placeholder="비밀번호 입력"/>
                    	<span class="passResult"></span>
                    </td>
                     
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" name="pass2" placeholder="비밀번호 입력 확인"/></td>
                </tr>
            </table>

            <table border="1">
                <caption>개인정보 입력</caption>
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" name="name" placeholder="이름 입력"/>
                        <span class="nameResult"></span>                        
                    </td>
                </tr>
                <tr>
                    <td>별명</td>
                    <td>
                        <p class="nickInfo">공백없는 한글, 영문, 숫자 입력</p>
                        <input type="text" name="nick" placeholder="별명 입력"/>
                        <button type="button" id="checkNick"><img src="../img/chk_id.gif" alt="중복확인"/></button>
                        <span class="nickResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        
                        <input type="email" name="email" placeholder="이메일 입력"/>
                        <button type="button"><img src="../img/chk_auth.gif" alt="인증번호 받기"/></button>
                        <div class="auth">
                            <input type="text" name="auth" placeholder="인증번호 입력"/>
                            <button type="button"><img src="../img/chk_confirm.gif" alt="확인"/></button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td><input type="text" name="hp" placeholder="휴대폰 입력"/></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <input type="text" name="zip" id="zip" placeholder="우편번호"/>
                        <button type="button" onclick="execDaumPostcode()"><img src="../img/chk_post.gif" alt="우편번호찾기"/></button>
                        <input type="text" name="addr1" id="addr1" placeholder="주소 검색"/>
                        <input type="text" name="addr2" id="addr2" placeholder="상세주소 입력"/>
                    </td>
                </tr>
            </table>
            <div>
                <a href="./login.do" class="btn btnCancel">취소</a>
                <input type="submit" value="회원가입" class="btn btnRegister"/>
            </div>
        </form>
    </section>
</main>
<jsp:include page="./_footer.jsp"/>