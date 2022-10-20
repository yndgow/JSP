/**
 * 
 */
// user2 수정화면 불러오기
function modify (uid) {
	$(function (){
		$('nav').empty();
		$('#content').empty();
		
		$('#content').append("<h4>user2 수정</h4>");
		$('#content').append("<a href='#' class='list'>user2 목록</a>");
		
		let jsonData = {"uid" : uid};
		
		$.ajax({
			url:'./json/modify.jsp',
			type: 'get',
			data: jsonData,
			dataType: 'json',
			success:function(data){
						
						let tags = "<table border='1'>";
						tags += "<tr>";
						tags += "<td>아이디</td>";
						tags += "<td><input type='text' name='uid' readonly></td>";
						tags += "</tr>";
						tags += "<tr>";
						tags += "<td>이름</td>";
						tags += "<td><input type='text' name='name'></td>";
						tags += "</tr>";
						tags += "<tr>";
						tags += "<td>휴대폰</td>";
						tags += "<td><input type='text' name='hp'></td>";
						tags += "</tr>";
						tags += "<tr>";
						tags += "<td>나이</td>";
						tags += "<td><input type='text' name='age'></td>";
						tags += "</tr>";
						tags += "<tr>";
						tags += "<td colspan='2' align='right'>";
						tags += "<input type='submit' value='수정'/>"
						tags += "</td>";
						tags += "</tr>";
						tags += "</table>";
						
						$('#content').append(tags);
						
						$('input[name=uid]').val(data.uid);
						$('input[name=name]').val(data.name);
						$('input[name=hp]').val(data.hp);
						$('input[name=age]').val(data.age);
			},
		});
	});
}