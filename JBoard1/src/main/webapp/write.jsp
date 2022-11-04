<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>

            <main id="board" class="write">
                <form action="/JBoard1/proc/writeProc.jsp" method="post" enctype="multipart/form-data">
                <input type="hidden" name="uid" value="<%= sessUser.getUid() %>">
                    <table border="0">      
                        <caption>글쓰기</caption>
                        <tbody>
                            <tr>
                                <th>제목</th>
                                <td><input type="text" name="title" id="title" placeholder="제목을 입력하세요"></td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <!-- <td><textarea name="content" id="content"></textarea></td> -->
                                <td><textarea name="content" id="content" rows="10" cols="100"></textarea></td>
                            </tr>
                            <tr>
                                <th>파일</th>
                                <td><input type="file" name="fname"></td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div>
                        <a href="./list.jsp" class="btn cancel">취소</a>
                        <input type="submit" value="작성완료" class="btn btnComplete" onclick="submitContents()"/>
                    </div>
                </form>
            </main>
            <script type="text/javascript" src="./se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
            <script type="text/javascript">
				var oEditors = [];
				nhn.husky.EZCreator.createInIFrame({
				 oAppRef: oEditors,
				 elPlaceHolder: "content",
				 sSkinURI: "./se2/SmartEditor2Skin.html",
				 fCreator: "createSEditor2"
				});
				
				// ‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
				function submitContents(elClickedObj) {
				 // 에디터의 내용이 textarea에 적용된다.
				 oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

				 // 에디터의 내용에 대한 값 검증은 이곳에서
				 // document.getElementById("content").value를 이용해서 처리한다.
				}
				 try {
				     elClickedObj.form.submit();
				 } catch(e) {}
				</script>
<%@ include file="./_footer.jsp" %>