/*
	날짜 : 2022/10/24
	이름 : 김지홍
	내용 : 회원가입 입력데이터 유효성 검증
*/

// 데이터 건증에 사용할 정규표현식
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
	
	// 아이디 유효성 검증 & 중복체크
	$('input[name=uid]').keydown(function(){
		isUidOK = false;
	});
	
	$('#btnUidCheck').click(function() {
		let uid = $('input[name=uid]').val();
		
		if(isUidOK){
			return;
		}
		
		if(!uid.match(regUid)){
			isUidOK = false;
			$('.resultUid').css('color', 'red').text('아이디가 유효하지 않습니다.')
			return;
		}
		
		let jsonData = {"uid":uid};
		
		$('.resultUid').css('color', 'black').text('...');
		
		setTimeout(()=>{
			
			$.ajax({
				url: './proc/checkUid.jsp',
				method: 'get',
				data: jsonData,
				dataType: 'json',
				success:function(data){
					//console.log(data);
					if(data.result == 0){
						isUidOK = true;
						$('.resultUid').css('color', 'green').text('사용 가능한 아이디 입니다.')
					}else{
						isUidOK = false;
						$('.resultUid').css('color', 'red').text('이미 사용중인 아이디 입니다.')
					}
				}
			});
		}, 500);
	});
	
	// 비밀번호 일치여부 확인
	$('input[name=pass2]').focusout(function(){
		let pass1 = $('input[name=pass1]').val();
		let pass2 = $(this).val();
		
		if(pass1 == pass2){
			
			if(pass2.match(regPass)){
				isPassOK = true;
				$('.resultPass').css('color','green').text('비밀번호가 일치합니다.');
			}else{
				isPassOK = false;
				$('.resultPass').css('color','red').text('영문, 숫자, 특수문자 조합 최소 5자 이상 이여야 합니다.');
			}
			
		}else{
			isPassOK = false;
			$('.resultPass').css('color','red').text('비밀번호가 일치 하지 않습니다.');
		}
	});
	
	// 이름 유효성 검증
	$('input[name=name]').focusout(function(){
		
		let name = $(this).val();
		
		if(!name.match(regName)){
			isNameOK = false;
			$('.resultName').css('color','red').text('이름은 한글 2자 이상 이어야 합니다.');			
		}else{
			isNameOK = true;
			$('.resultName').text('');
		}
	});
	
	// 별명 유효성 검사 & 중복체크
	$('input[name=nick]').keydown(function(){
		isNickOK = false;
	});
	
	$('#btnNickCheck').click(function(){
		let nick = $('input[name=nick]').val();
		
		if(isNickOK){
			return;
		}
		
		if(!nick.match(regNick)){
			isNickOK = false;
			$('.resultNick').css('color', 'red').text('별명이 유효하지 않습니다.')
			return;
		}
		
		let jsonData = {"nick":nick};
		
		$('.resultNick').css('color', 'black').text('...');
		
		setTimeout(()=>{
			$.ajax({
				url:'./proc/checkNick.jsp',
				method:'get',
				data: jsonData,
				dataType: 'json',
				success:function(data){
					// console.log(data);
					if(data.result == 1){
						isNickOK = false;
						$('.resultNick').css('color','red').text('이미 사용중인 별명입니다.');
					}else{
						isNickOK = true;
						$('.resultNick').css('color','green').text('사용 가능한 별명 입니다.');
					}
				},
			});	
		}, 500);
	});
	
	// 이메일 유효성 검사
	$('input[name=email]').focusout(function(){
		let email = $(this).val();
		
		if(!email.match(regEmail)){
			isEmailOK = false;
			$('.resultEmail').css('color', 'red').text('이메일이 유효하지 않습니다.');
		}else{
			isEmailOK = true;
			$('.resultEmail').text('');
		}
		
	});
	
	// 휴대폰 유효성 검사
	$('input[name=hp]').focusout(function(){
		let hp = $(this).val();
		
		if(!hp.match(regHp)){
			isHpOK = false;
			$('.resultHp').css('color', 'red').text('휴대폰이 유효하지 않습니다.');
		}else{
			isHpOK = true;
			$('.resultHp').text('');
		}
		
	});
	
	//  폼 전송이 시작될 때 실행되는 폼 이벤트(폼 전송 버튼을 클릭했을 때)
	$('.register > form').submit(function(){
		
		///////////////////////////////////////
		// 폼 데이터 유효성 검증(Validation)///
		///////////////////////////////////////
		
		// 아이디 검증
		if(!isUidOK){
			alert('아이디를 확인하십시오.');
			return false;
		}
		// 비밀번호 검증
		if(!isPassOK){
			alert('비밀번호를 확인하십시오.');
			return false;
		}			
		// 이름 검증
		if(!isNameOK){
			alert('이름을 확인하십시오.');
			return false;
		}
		// 별명 검증
		if(!isNickOK){
			alert('별명을 확인하십시오.');
			return false;
		}
		// 이메일 검증
		if(!isEmailOK){
			alert('이메일을 확인하십시오.');
			return false;
		}
		// 휴대폰 검증
		if(!isHpOK){
			alert('휴대폰을 확인하십시오.');
			return false;
		}
		// 최종 전송
		return true;
	});
});
