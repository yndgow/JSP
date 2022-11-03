<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String pg = request.getParameter("pg");
	
	// dao
	ArticleBean article = ArticleDAO.getInstance().selectArticle(no);
	
%>
<%@ include file="./_header.jsp" %>
            <main id="board" class="modify">
                <form action="/JBoard1/proc/modifyProc.jsp" method="post">
                <input type="hidden" name="no" value="<%= no %>">
                <input type="hidden" name="pg" value="<%= pg %>">
                    <table border="0">      
                        <caption>글쓰기</caption>
                        <tbody>
                            <tr>
                                <th>제목</th>
                                <td><input type="text" name="title" id="title" value="<%= article.getTitle() %>"></td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td><textarea name="content" id="content"><%= article.getContent() %></textarea><td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div>
                        <a href="./view.jsp?no=<%= no %>" class="btn cancel">취소</a>
                        <input type="submit" value="수정완료" class="btn btnComplete">
                    </div>
                </form>
            </main>
<%@ include file="./_footer.jsp" %>