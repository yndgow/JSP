<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<main id="board" class="view">
    <table>
        <caption>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" readonly></td>
            </tr>
            <tr>
                <th>파일</th>
                <td><a href="#">2020년 상반기 매출자료.xls</a><span>7</span>회 다운로드</td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="content" readonly>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas deleniti dolore doloribus accusamus asperiores, quam fugiat repudiandae quibusdam assumenda enim nesciunt non voluptatum aspernatur officia necessitatibus, veritatis saepe perferendis nobis accusantium! Voluptate eligendi omnis consectetur ad hic alias exercitationem voluptas quam ipsam. Labore, facere mollitia odit, modi excepturi possimus animi quis harum exercitationem quibusdam quasi optio molestiae accusantium voluptatum itaque id dignissimos nemo nostrum voluptas eaque nulla ea qui. Quidem nesciunt adipisci recusandae error ut eveniet, voluptatibus dolore doloremque deserunt, in quo exercitationem porro molestiae cum ipsum corporis, qui eius. Assumenda possimus delectus enim nihil ea facilis quam corrupti similique!</textarea></td>
            </tr>
        </caption>
    </table>
    <div>
        <a href="#" class="btn btnRemove">삭제</a>
        <a href="./modify.html" class="btn btnModify">수정</a>
        <a href="./list.html" class="btn btnList">목록</a>
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
<%@ include file="../_footer.jsp" %>