<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>

<main id="user" class="terms">
    <table>
        <caption>사이트 이용약관</caption>
        <tr>
            <td>
                <textarea class="terms" readonly></textarea>
                <label for="">
                    <input type="checkbox" class="terms">&nbsp;동의합니다.
                </label>
            </td>
        </tr>
    </table>
    <table>
        <caption>개인정보 취급 방침</caption>
        <tr>
            <td>
                <textarea class="privacy" readonly></textarea>
                <label for="">
                    <input type="checkbox" class="privacy">&nbsp;동의합니다.
                </label>
            </td>
        </tr>
    </table>
    <p>
        <a href="./login.do" class="cancel">취소</a>
        <a href="./register.do" class="next">다음</a>
    </p>
</main>
<jsp:include page="../_footer.jsp"/>