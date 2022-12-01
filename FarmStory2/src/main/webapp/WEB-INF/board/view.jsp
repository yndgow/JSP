<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"/>
<script>
$(()=>{
	$('.btnList').click(e=>{
		e.preventDefault();
		history.back();
	});	
});

</script>
<main id="board" class="view">
    <table>
        <caption>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" value="${vo.title}" readonly></td>
            </tr>
            <c:if test="${vo.oriName ne null}">
            <tr>
                <th>파일</th>
                <td><a href="/FarmStory2/board/downlaod.do?fno=${vo.fno}">${vo.oriName}</a><span>${vo.download}</span>회 다운로드</td>
            </tr>
            </c:if>
            <tr>
                <th>내용</th>
                <td><textarea name="content" readonly>${vo.content}</textarea></td>
            </tr>
        </caption>
    </table>
    <div>
        <a href="./delete.do" class="btn btnRemove">삭제</a>
        <a href="./modify.do" class="btn btnModify">수정</a>
        <a href="./list.do" class="btn btnList">목록</a>
    </div>

    <!-- 댓글목록 -->
    <section class="commentList">
        <h3>댓글목록</h3>
        <article>
            <span class="nick">길동이</span>
            <span class="date">20-05-13</span>
            <p class="content">댓글 샘플입니다.</p>
            <div>
                <a href="#" class="remove">삭제</a>
                <a href="#" class="modify">수정</a>
            </div>
        </article>

        <p class="empty">등록된 댓글이 없습니다.</p>
    </section>

    <!-- 댓글쓰기 -->
    <section class="commentForm">
        <h3>댓글쓰기</h3>
        <form action="">
            <textarea name="content" placeholder="댓글내용 입력"></textarea>
            <div>
                <a href="#" class="btn btnCancel">취소</a>
                <input type="submit" value="작성완료" class="btn btnComplete">
            </div>
        </form>
    </section>
</main>
<jsp:include page="../_footer.jsp"/>