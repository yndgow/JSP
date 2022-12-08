<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"/>
<script>
$(()=>{
	$('.btnRemove').click(e=>{
		let result = confirm('삭제하시겠습니까?');
		if(!result){
			return false;
		}
	});
});
</script>
<main id="board" class="view">

    <table>
    <caption><img src="../img/sub_nav_tit_cate${groupNum}_tit${cate}.png" alt="글보기"></caption>
        <caption>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" value="${vo.title}" readonly></td>
            </tr>
            <c:if test="${vo.oriName ne null}">
            <tr>
                <th>파일</th>
                <td><a href="/FarmStory2/board/download.do?fno=${vo.fno}">${vo.oriName}</a><span>&emsp;${vo.download}</span>회 다운로드</td>
            </tr>
            </c:if>
            <tr>
                <th>내용</th>
                <td><textarea name="content" readonly>${vo.content}</textarea></td>
            </tr>
        </caption>
    </table>
    <div>
        <a href="/FarmStory2/board/remove.do?no=${vo.no}&group=${group}&cate=${cate}&pg=${pg}" class="btn btnRemove">삭제</a>
        <a href="/FarmStory2/board/modify.do?no=${vo.no}&group=${group}&cate=${cate}&pg=${pg}" class="btn btnModify">수정</a>
        <a href="./list.do?group=${group}&cate=${cate}&pg=${pg}" class="btn btnList">목록</a>
    </div>

    <!-- 댓글목록 -->
    <section class="commentList">
        <h3>댓글목록</h3>
        <c:forEach var="co" items="${comments}">
        <article>
            <span class="nick">${co.nick}</span>
            <span class="date">${co.rdate}</span>
            <p class="content">${co.content}</p>
            <div>
                <a href="#" class="remove">삭제</a>
                <a href="#" class="modify">수정</a>
            </div>
        </article>
		</c:forEach>
		<c:if test="${empty comments}">
        <p class="empty">등록된 댓글이 없습니다.</p>
        </c:if>
    </section>

    <!-- 댓글쓰기 -->
    <section class="commentForm">
        <h3>댓글쓰기</h3>
        <form action="#">
        	<input type="hidden" name="uid" value="${sessUser.uid}">
        	<input type="hidden" name="no" value="${vo.no}">
            <textarea name="content" placeholder="댓글내용 입력"></textarea>
            <div>
                <a href="./list.do?group=${group}&cate=${cate}&pg=${pg}" class="btn btnCancel">취소</a>
                <input type="submit" value="작성완료" class="btn btnCompleteComment">
            </div>
        </form>
    </section>
</main>
<jsp:include page="../_footer.jsp"/>