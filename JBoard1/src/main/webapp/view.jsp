<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String pg = request.getParameter("pg");

	// dao
	ArticleDAO dao = ArticleDAO.getInstance();
	
	// 글 조회수 카운트 +1
	dao.updateArticleHit(no);
	
	// 글 가져오기
	ArticleBean article = dao.selectArticle(no);
	
	// 댓글 가져오기
	List<ArticleBean> comments =  dao.selectComments(no);
	

%>
<%@ include file="./_header.jsp" %>
<script>
	$(document).ready(function(){
		// 댓글 삭제하기
		$(document).on('click', '.remove', function(e){
			e.preventDefault();
			let result = confirm("정말 삭제 하시겠습니까?");
			
			let no = $(this).attr('data-no');
			let article = $(this).parents('article');
			let tag = $(this);
			
			if(result){
				$.ajax({
					url:'/JBoard1/proc/commentRemoveProc.jsp?no='+no,
					type:'get',
					dataType:'json',
					success:function(data){
						if(data.result > 0){
							alert("댓글이 삭제되었습니다.");
							article.remove();
							if($('article').length == 0){
								$('.commentList').append("<p class=\"empty\">등록된 댓글이 없습니다.</p>");
							}
							//tag.parent().parent().hide();
							//tag.closest('article').hide();
						}
					},
				});
			}
			
		});
		
		
		// 댓글 수정하기
		$(document).on('click', '.modify', function(e){
			e.preventDefault();

			let txt = $(this).text();
			let p = $(this).parent().prev();
			
			if(txt == "수정"){
				// 수정모드
				$(this).text("수정완료");
				p.attr("contentEditable", true);
				p.focus();
				
			}else{
				// 수정완료
				$(this).text("수정");
				p.attr("contentEditable", false);
				
				let no = $(this).attr("data-no");
				let content = p.text();
				
				let jsonData = {
						content:content,
						no:no
				};
				
				$.ajax({
					url:"/JBoard1/proc/commentModifyProc.jsp",
					type:"post",
					data:jsonData,
					dataType:"json",
					success:function(data){
						if(data.result > 0){
							alert("댓글이 수정되었습니다.");
						}
					},
				});
			}
		});
		
		
		// 댓글 쓰기
		$(".commentForm > form").submit(function(){
			
			let pg 		 = $(this).children("input[name=pg]").val();
			let parent 	 = $(this).children("input[name=parent]").val();
			let uid 	 = $(this).children("input[name=uid]").val();
			let textarea = $(this).children("textarea[name=content]");
			let content  = textarea.val();
			
			let jsonData = {
					pg : pg,
					parent: parent,
			 		uid: uid,
			 		content: content
			};
			
			// console.log(jsonData);
			
 			$.ajax({
				url: "/JBoard1/proc/commentWriteProc.jsp",
				method: "POST",
				data: jsonData,
				dataType: "json",
				success: function(data){
					// console.log(data);
					
					let article = "<article>";
						article += "<span class='nick'>"+data.nick+"</span>";
						article += "<span class='date'>"+data.date+"</span>";
						article += "<p class='content'>"+data.content+"</p>";
						article += "<div>";
						article += "<a href='#' class='remove' data-no='"+data.no+"'>삭제</a>";
						article += "<a href='#' class='modify' data-no='"+data.no+"'>수정</a>";
						article += "</div>";
						article += "</article>";
						
						$(".commentList > .empty").hide();						
						$(".commentList").append(article);
						textarea.val('');
				},
			}); 
			return false;
		});
		
		
	});	

</script>
            <main id="board" class="view">
                <table>
                    <caption>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="title" value="<%= article.getTitle() %>"></td>
                        </tr>
                        <% if (article.getFile() == 1) {%>
                        <tr>
                            <th>파일</th>
                            <td>
	                            <a href="/JBoard1/proc/download.jsp?fno=<%= article.getFno() %>"><%= article.getOriName() %></a>
    	                        <span><%= article.getDownload() %></span>회 다운로드
                            </td>
                        </tr>
                        <% } %>
                        <tr>
                            <th>내용</th>
                            <td><textarea name="content" readonly><%= article.getContent() %></textarea></td>
                        </tr>
                    </caption>
                </table>
                <div>
                    <a href="#" class="btn btnRemove">삭제</a>
                    <a href="./modify.jsp" class="btn btnModify">수정</a>
                    <a href="./list.jsp?pg=<%= pg %>" class="btn btnList">목록</a>
                </div>

                <!-- 댓글목록 -->
                <section class="commentList">
                    <h3>댓글목록</h3>
                    <% for(ArticleBean comment : comments) { %>
                    <article>
                        <span class="nick"><%= comment.getNick() %></span>
                        <span class="date"><%= comment.getRdate() %></span>
                        <p class="content"><%= comment.getContent() %></p>
                        <div>
                            <a href="#" class="remove" data-no="<%= comment.getNo() %>">삭제</a>
                            <a href="#" class="modify" data-no="<%= comment.getNo() %>">수정</a>
                        </div>
                    </article>
					<% } %>
					
					<% if(comments.size() == 0) {%>
                    <p class="empty">등록된 댓글이 없습니다.</p>
                    <% } %>
                </section>

                <!-- 댓글쓰기 -->
                <section class="commentForm">
                    <h3>댓글쓰기</h3>
                    <form action="#" method="post"> 
                    	<input type="hidden" name="pg" value="<%= pg %>">
                    	<input type="hidden" name="parent" value="<%= no %>">
                    	<input type="hidden" name="uid" value="<%= sessUser.getUid() %>">
                        <textarea name="content" placeholder="댓글내용 입력"></textarea>
                        <div>
                            <a href="#" class="btn btnCancel">취소</a>
                            <input type="submit" value="작성완료" class="btn btnComplete">
                        </div>
                    </form>
                </section>
            </main>
<%@ include file="./_footer.jsp" %>