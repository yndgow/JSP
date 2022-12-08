<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
<script>
let success = ${success};
if(success == "100"){
	alert('회원정보가 일치하지 않거나 가입하지 않은 회원입니다.');
}
</script>
<main id="user" class="login">
    <form action="/FarmStory2/user/login.do" method="post">
        <table>
            <tr>
                <td><img src="/FarmStory2/img/login_ico_id.png" alt="로그인"></td>
                <td><input type="text" name="uid" placeholder="아이디 입력"></td>
            </tr>
            <tr>
                <td><img src="/FarmStory2/img/login_ico_pw.png" alt="로그인"></td>
                <td><input type="password" name="pass" placeholder="비밀번호 입력"></td>
            </tr>
        </table>
        <input type="submit" class="btnLogin" value="로그인">
    </form>

    <div class="info">
        <h3>회원 로그인 안내</h3>
        <p>
            아직 회원이 아니시면 회원으로 가입하세요.
        </p>
        <a href="./terms.do">회원가입</a>
    </div>
</main>
<jsp:include page="../_footer.jsp"/>