<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"/>
<script>
$(()=>{
	$('.btnNext').click((e)=>{
		e.preventDefault();
		$.ajax({
			url:'/JBoard2/user/info.do',
			method:'post',
			data:{
				"uid":$('input[name=uid]').val(),
				"pass":$('input[name=pass]').val()
				},
			dataType:'json',
			success:(data)=>{
				if(data.result > 0){
					alert('회원정보 수정페이지로 이동');
					location.href = '/JBoard2/user/myInfo.do';
				}else{
					alert('비밀번호가 일치하지 않습니다.');
				}
			}
			
		});
	});
});
</script>
<main id="user">
    <section class="find findId">
        <form action="#">
        	<input type="hidden" name="uid" value="${sessUser.uid}">
            <table>
                <caption>비밀번호 확인</caption>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="pass" placeholder="비밀번호 입력"/></td>
                </tr>
            </table>                                        
        </form>
        
        <p>
           회원님의 정보를 보호하기 위해 비밀번호를 다시 확인합니다.
        </p>

        <div>
            <a href="/JBoard2/list.do" class="btn btnCancel">취소</a>
            <a href="/JBoard2/user/myInfo.do" class="btn btnNext">다음</a>
        </div>
    </section>
</main>
<jsp:include page="./_footer.jsp"/>