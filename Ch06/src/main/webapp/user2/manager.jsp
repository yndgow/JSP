<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>user2 관리자</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="./js/list.js"></script>
	<script src="./js/register.js"></script>
	<script src="./js/submit.js"></script>
	<script src="./js/delete_user.js"></script>
	<script src="./js/modify.js"></script>
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
				let opt = 0;
				if($(this).val()=='등록'){
					opt = 1;
				}else{
					opt = 2;
				}
				submit(opt);
			});
			
			// user 삭제(delete_user)
			$(document).on('click', '#delete', function(e) {
				e.preventDefault();
				let uid = $(this).parents('tr').children('td:eq(0)').text();
				delete_user(uid);	
			});
			
			// user 수정(modify)
			$(document).on('click', '#modify', function(e) {
				e.preventDefault();
				let uid = $(this).parents('tr').children('td:eq(0)').text();
				modify(uid);
			});
			
			// user 수정(modify_user)
			
		});
	</script>
	</head>
	<body>
		<h3>user2 관리자</h3>
		<nav></nav>
		<div id="content"></div>
	</body>
</html>