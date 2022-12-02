<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
<main id="board" class="modify">
    <form action="/FarmStory2/board/modify.do" method="post">
    	<input type="hidden" name="no" value="${vo.no}">
    	<input type="hidden" name="group" value="${group}">
    	<input type="hidden" name="cate" value="${cate}">
    	<input type="hidden" name="pg" value="${pg}">
        <table>      
            <caption>글 수정하기</caption>
            <tbody>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" id="title" value="${vo.title}"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea name="content" id="content">${vo.content}</textarea><td>
                </tr>
            </tbody>
        </table>
        
        <div>
            <a href="./view.do?no=${vo.no}&group=${group}&cate=${cate}&pg=${pg}" class="btn btnCancel">취소</a>
            <input type="submit" value="수정완료" class="btn btnComplete">
        </div>
    </form>
</main>
<jsp:include page="../_footer.jsp"/>