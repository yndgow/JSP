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
let isEmailValiOK = false;
let isEmailAuthOK = false;

// 이메일 인증코드
let receiveCode = 0;

$(function(){
	// 아이디 중복 검사
	$('input[name=uid]').keydown(function(){
		isUidOK = false;
		$('.uidResult').text('');
	});
	
	$('#btnUidCheck').click(function(){
		let uid = $('input[name=uid]').val();
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
				if(data.result > 0)
				{
					isUidOK = false;
					$('.uidResult').css('color', 'red').text('이미 사용중인 아이디 입니다.');
				}
				else
				{
					isUidOK = true;
					$('.uidResult').css('color', 'blue').text('사용가능한 아이디입니다.');
				}
			}
		});
	});
	
	// 비밀번호 일치 확인
	$('input[name=pass1], input[name=pass2]').keydown(function(){
		$('.passResult').text('');
	});
	$('input[name=pass1], input[name=pass2]').focusout(function(){
		const pass1 = $('input[name=pass1]').val();
		const pass2 = $('input[name=pass2]').val();
		if(pass1!==pass2) {
			isPassOK = false;
			$('.passResult').css('color','red').text('비밀번호가 일치하지 않습니다.');
			return;
		}
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
			if(data.result > 0)	{
				isNickOK = false;
				$('.nickResult').css('color', 'red').text('이미 사용중인 별명입니다.');
			}
			else {
				isNickOK = true;
				$('.nickResult').css('color', 'blue').text('사용가능한 별명입니다.');
			}
		}, 'json');
	});
	
	// 이름 유효성 검사
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
	
	// 이메일 유효성 검사
	$('input[name=email]').focusout(function(){
		
		let email = $(this).val();
		
		if(!email.match(regEmail)){
			isEmailValiOK = false;
			$('.emailResult').css('color', 'red').text('이메일이 유효하지 않습니다.');
		}else{
			isEmailValiOK = true;
			$('.emailResult').text('');
		}
	});
	$('input[name=email]').keydown(()=>{
		isEmailOK = false;
		$('.emailResult').text('');
	});
	
	// 이메일 인증
	$('#btnEmail').click(emailAuth);
	$('.btnAuth').click(()=>{
		emailAuth('auth');
	});
	
	
	function emailAuth (btnName) {
		if(isEmailOK) return false; // 인증 성공 비활성화
		if(!isEmailValiOK) return false; // 유효성 실패 비활성화
		// 인증 실패 연속 시도 금지
		let email = $('input[name=email]').val();
		if(email == ''){
			alert('이메일을 입력하세요');
		}
		if(btnName === 'auth' ){
			$('input[name=auth]').attr('disabled', true);
		}		
		$('.emailResult').text('인증코드 전송 중 입니다. 잠시만 기다려주세요.');
		setTimeout(() => {
			$.ajax({
				url:'/JBoard2/user/emailAuth.do',
				method:'GET',
				data:{"email":email},
				dataType:'json',
				success:(data)=>{
					if(data.status > 0) // 메일전송 성공
					{
						$('.auth').show();
						$('.emailResult').text('이메일을 확인후 인증코드를 입력하세요.');
						isEmailAuthOK = true;
						receiveCode = data.code;
					}
					else  // 메일전송 실패
					{
						isEmailOK = false;
						alert('메일 전송이 실패했습니다. \n 다시 시도 하시기 바랍니다.');
					}
				}
			});	
		}, 1000);
	}
		
		
		
	// 인증번호 확인
	$('#btnAuth, .btnConfirm').click(()=>{
		if(!isEmailAuthOK) return false;
		if(isEmailOK) return false;
		let result = $('input[name=auth]').val();
		$('.emailResult').text('...');
		setTimeout(() => {
			if(result == receiveCode){
				$('.auth, #btnEmail').hide();
				$('.emailResult').css('color','blue').text('이메일이 인증되었습니다.');
				$('input[name=email]').attr('readonly', true);
				isEmailOK = true;
			}
			else{
				$('.emailResult').text('인증에 실패하였습니다.');
				isEmailOK = false;
			}
		}, 500);
	});
	
	// 휴대폰 유효성 검사
	$('input[name=hp]').focusout(function(){
		let hp = $(this).val();
		
		if(!hp.match(regHp)){
			isHpOK = false;
			$('.hpResult').css('color', 'red').text('휴대폰이 유효하지 않습니다.');
		}else{
			isHpOK = true;
			$('.hpResult').text('');
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
		if(!isNameOK){
			alert('이름을 확인하세요.')
			return false;
		}
		if(!isEmailOK){
			alert('이메일을 확인하세요.')
			return false;
		}
		if(!isHpOK){
			alert('휴대폰을 확인하세요.')
			return false;
		}
		
		// 최종 통과
		alert('회원가입해주셔서 감사합니다. 로그인해주시기바랍니다.');
		return true;
	});
	
	// 아이디찾기 유효성 검사
	$('.btnNext').click(()=>{
		if(!isNameOK){
			alert('이름을 확인하세요.');
			return false;
		}
		if(!isEmailOK){
			alert('이메일을 확인하세요.');
			return false;
		}
		$('.findId > form').submit();		
		return true;
	});
});