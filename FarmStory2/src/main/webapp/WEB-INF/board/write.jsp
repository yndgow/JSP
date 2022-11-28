<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
<main id="board" class="write">
    <form action="/FarmStory1/board/proc/writeProc.jsp" method="post">
    <input type="hidden" name="group" value="">
    <input type="hidden" name="cate" value="">
    <input type="hidden" name="uid" value="">
    
        <table border="0">      
            <caption><img src="../img/sub_nav_tit_cate_tit.png" alt="글쓰기"></caption>
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
            <a href="./list.html" class="btn cancel">취소</a>
            <input type="submit" value="작성완료" class="btn btnComplete">
        </div>
    </form>
</main>
<jsp:include page="../_footer.jsp"/>