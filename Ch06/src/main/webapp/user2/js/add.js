/**
 * 
 */
 function add(){
	$(function (){
		// 데이터 가져오기
		// JSON 데이터 생성
		let jsonData = {
				"uid" 	: $('input[name=uid]').val(),
				"name" 	: $('input[name=name]').val(),
				"hp" 	: $('input[name=hp]').val(),
				"age" 	: $('input[name=age]').val()
		};
		
		// 데이터 전송
		$.ajax({
			url		:'./json/register.jsp',
			type	:'post',
			data	: jsonData,
			dataType:'json',
			success:function(data){
				if(data.result == 1){
					alert('등록 성공');
					list();
				}else{
					alert('등록 실패');
				}
			}
		});
	});
}