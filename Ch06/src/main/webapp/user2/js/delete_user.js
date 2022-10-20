/**
 * 
 */
// user2 목록 불러오기
function delete_user(uid){
	$(function(){
		let jsonData = {"uid" : uid};
			$.ajax({
				url:'./json/delete_user.jsp',
				type:'get',
				dataType: 'json',
				data: jsonData,
				success:function(data){
					if(data.result == 1){
						alert('삭제 성공');
						list();
					}else{
						alert('삭제 실패');
					}
				},
			});
	});
}