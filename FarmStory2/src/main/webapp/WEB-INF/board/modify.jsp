<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
<main id="board" class="modify">
    <form action="#">
        <table border="0">      
            <caption>글쓰기</caption>
            <tbody>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" id="title" placeholder="제목을 입력하세요"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea name="content" id="content"></textarea><td>
                </tr>
                <tr>
                    <th>파일</th>
                    <td><input type="file" name="file" id="fileUpload"></td>
                </tr>
            </tbody>
        </table>
        
        <div>
            <a href="./view.html" class="btn cancel">취소</a>
            <input type="submit" value="수정완료" class="btn btnComplete">
        </div>
    </form>
</main>
<jsp:include page="../_footer.jsp"/>