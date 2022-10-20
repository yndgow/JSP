<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>user2 관리자</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="./js/list.js"></script>
	<script src="./js/register.js"></script>
	<script src="./js/add.js"></script>
	<script>
		$(function() {
			
			// 처음 user 목록 불러오기
			list();

			// user 목록보기
			$(document).on('click', '.list', function(e) {
				e.preventDefault();
				list();
			});
			
			// user 등록하기
			$(document).on('click', '.register', function(e) {
				e.preventDefault();
				register();
			});
			
			// user 등록(submit)
			$(document).on('click', 'input[type=submit]', function(e) {
				e.preventDefault();
				add();
			});
			
			// user 삭제(delete_user)
			$(document).on('click', '#delete', function(e) {
				e.preventDefault();
				
				$.ajax({
					url:'./json/delete_user.jsp',
					type:'put',
					dataType: 'json',
					success:function(data){
						if(data.result == 1){
							alert('삭제 성공');
							list();
						}else{
							alert('삭제 실패');
						}
						
					},
				});
				//delete_user();
			});
			
		});
	</script>
	</head>
	<body>
		<h3>user2 관리자</h3>
		<nav></nav>
		<div id="content"></div>
	</body>
</html>