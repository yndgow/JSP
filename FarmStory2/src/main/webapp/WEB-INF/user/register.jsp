<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
<main id="user" class="register">
    <form action="/FarmStory2/user/register.do" method="post">
        <table>
            <caption>사이트 이용정보 입력</caption>
            <tr>
                <th>아이디</th>
                <td>
                    <input type="text" id="uid" name="uid" placeholder="아이디 입력">
                    <button type="button" id="btnUidCheck"><img src="/FarmStory2/img/user/chk_id.gif" alt="중복확인"></button>
                    <span class="uidResult"></span>
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password" id="pass1" name="pass1" placeholder="비밀번호 입력">
                    <span class="passResult"></span>
                </td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td>
                    <input type="password" id="pass2" name="pass2" placeholder="비밀번호 확인 입력">
                </td>
            </tr>
        </table>

        <table>
            <caption>개인정보 입력</caption>
            <tr>
                <th>이름</th>
                <td>
                    <input type="text" id="name" name="name" placeholder="이름 입력">
                    <span class="nameResult"></span>
                </td>
            </tr>
            <tr>
                <th>별명</th>
                <td>
                    <p>공백없이 한글, 영문, 숫자 입력</p>
                    <input type="text" id="nick" name="nick" placeholder="별명 입력">
                    <button type="button" id="checkNick"><img src="/FarmStory2/img/user/chk_id.gif" alt=""></button>
                    <span class="nickResult"></span>
                </td>
            </tr>
            <tr>
                <th rowspan="2" id="_rowspan">이메일</th>
                <td>
                    <input type="email" id="email" name="email" placeholder="이메일 입력">
                    <button type="button" id="btnEmail"><img src="/FarmStory2/img/user/chk_auth.gif" alt="인증번호 받기"/></button>
                    <span class="emailResult"></span>
                </td>
            
            </tr>
            <tr class="auth">
                <td>
                	<input name="auth"/>
                	<button type="button" id="btnAuth"><img src="/FarmStory2/img/user/chk_confirm.gif" alt="확인"/></button>
                </td>
            </tr>
            
            <tr>
                <th>휴대폰</th>
                <td>
                    <input type="text" id="hp" name="hp" placeholder="- 포함 13자리 입력">
                    <span class="hpResult"></span>
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <input type="text" name="zip" id="zip" placeholder="우편번호 검색" readonly>
                    <button type="button" onclick="execDaumPostcode()"><img src="/FarmStory2/img/user/chk_post.gif" alt="우편번호찾기"></button>
                    <input type="text" name="addr1" id="addr1" placeholder="기본주소 검색" readonly>
                    <input type="text" name="addr2" placeholder="상세주소 검색">
                </td>
            </tr>
        </table>
        <div>
            <a href="./login.do" class="btnCancle">취소</a>
            <input type="submit" class="btnRegister" value="회원가입">
        </div>
    </form>
</main>
<jsp:include page="../_footer.jsp"/>