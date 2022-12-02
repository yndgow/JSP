<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
		<main id="board" class="list">
		    <table>      
		        <caption>글목록</caption>
		        <thead>
		            <tr>
		                <th>번호</th>
		                <th>제목</th>
		                <th>글쓴이</th>
		                <th>날짜</th>
		                <th>조회</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach var="article" items="${articles}">
		            <tr>
		                <td>${pageStartNum = pageStartNum-1}</td>
		                <td><a href="./view.do?group=${group}&cate=${cate}&pg=${pg}&no=${article.no}">${article.title}[${article.comment}]</a></td>
		                <td>${article.nick}</td>
		                <td>${article.rdate}</td>
		                <td>${article.hit}</td>
		            </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		
		       <div class="page">
		       		<c:if test="${pageGroupStart > 1}">
                    <a href="/FarmStory2/board/list.do?group=${group}&cate=${cate}&pg=${pageGroupStart-1}&search=${search}" class="prev">이전</a>
                    </c:if>
                    <c:forEach var="num" begin="${pageGroupStart}" end="${pageGroupEnd}">
                    <a href="/FarmStory2/board/list.do?group=${group}&cate=${cate}&pg=${num}&search=${search}" class="num ${num == currentPage ? 'current' : 'off'}">${num}</a>
                    </c:forEach>
                    <c:if test="${pageGroupEnd < lastPageNum}">
                    <a href="/FarmStory2/board/list.do?group=${group}&cate=${cate}&pg=${pageGroupEnd+1}&search=${search}" class="next">다음</a>
                    </c:if>
               </div>
		    <div>
		        <a href="./write.do?group=${group}&cate=${cate}&groupNum=${groupNum}&pg=${pg}" class="btnWrite">글쓰기</a>
		    </div>
		</main>
    </article>
  </section>
</div>
<jsp:include page="../_footer.jsp"/>