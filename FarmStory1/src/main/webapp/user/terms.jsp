<%@page import="kr.co.farmstory1.bean.TermsBean"%>
<%@page import="kr.co.farmstory1.dao.UserDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	TermsBean tb = UserDAO.getInstnce().selectTerms();
	
%>
<script>
    document.addEventListener("DOMContentLoaded", function(){
        const $terms = document.getElementsByClassName("terms");
        const $privacy = document.getElementsByClassName("privacy");
        const $next = document.getElementsByClassName("next");
        $next[0].addEventListener("click", function(e){
            let term = false;
            let privacy = false;
            for (const t of $terms) {
                if(t.checked){
                    term = true;
                }
            }
            for (const p of $privacy) {
                if(p.checked){
                    privacy = true;
                }
            }
            if(term && privacy){
                e.defaultPrevented();
            }else{
                alert('약관에 모두 동의하셔야합니다.');                
                e.preventDefault();
            }
            
        });
    });
</script>
<main id="user" class="terms">
    <table>
        <caption>사이트 이용약관</caption>
        <tr>
            <td>
                <textarea class="terms" readonly><%=tb.getTerms() %></textarea>
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
                <textarea class="privacy" readonly><%=tb.getPrivacy() %></textarea>
                <label for="">
                    <input type="checkbox" class="privacy">&nbsp;동의합니다.
                </label>
            </td>
        </tr>
    </table>
    <p>
        <a href="./login.jsp" class="cancel">취소</a>
        <a href="./register.jsp" class="next">다음</a>
    </p>
</main>
<%@ include file="../_footer.jsp" %>