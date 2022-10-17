<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
            <main id="board" class="list">
                <table border="0">      
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
                        <tr>
                            <td>1</td>
                            <td><a href="./view.jsp">테스트 제목입니다. [3]</a> </td>
                            <td>길동이</td>
                            <td>20-05-12</td>
                            <td>12</td>
                        </tr>
                    </tbody>
                </table>

                <div class="page">
                    <a href="#" class="prev">이전</a>
                    <a href="#" class="num current">1</a>
                    <a href="#" class="num">2</a>
                    <a href="#" class="num">3</a>
                    <a href="#" class="next">다음</a>
                </div>
                <div>
                    <a href="./write.jsp" class="btnWrite">글쓰기</a>
                </div>
            </main>
<%@ include file="./_footer.jsp" %>