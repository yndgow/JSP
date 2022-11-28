<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
		            <tr>
		                <td>1</td>
		                <td><a href="./view.jsp?group=&cate=&pg=&no=">제목[댓글수]</a></td>
		                <td>닉네임</td>
		                <td>00-00-00</td>
		                <td>조회수</td>
		            </tr>
		        </tbody>
		    </table>
		
		       <div class="page">
                    <a href="/FarmStory1/board/list.jsp?group=${group}&cate=${cate}&pg=" class="prev">이전</a>
                    <a href="/FarmStory1/board/list.jsp?group=${group}&cate=${cate}&pg=" class="num">1</a>
                    <a href="/FarmStory1/board/list.jsp?group=${group}&cate=${cate}&pg=" class="next">다음</a>
               </div>
		    <div>
		        <a href="./write.jsp?group=${group}&cate=${cate}" class="btnWrite">글쓰기</a>
		    </div>
		</main>
    </article>
  </section>
</div>
<jsp:include page="../_footer.jsp"/>