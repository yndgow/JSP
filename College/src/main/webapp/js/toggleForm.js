  document.addEventListener("DOMContentLoaded", function () {
	// 등록 폼 토글
    const callForm = document.getElementById("callForm");
    const form = document.getElementById("form");
    callForm.addEventListener("click", function () {
      form.style.visibility = "visible";
    });
    const closeForm = document.getElementById("closeForm");
	const resetForm = document.getElementById("resetForm");
    closeForm.addEventListener("click", function () {
    	resetForm.reset();
		form.style.visibility = "hidden";
      
    });
  });
  $().ready(function(){
	  // 강좌 등록
	  $(document).on('click', '.submitLecture', function(e){
		let jsonData = {
				lecNo : $('input[name=lecNo]').val(),
				lecName : $('input[name=lecName]').val(),
				lecCredit : $('input[name=lecCredit]').val(),
				lecTime : $('input[name=lecTime]').val(),
				lecClass : $('input[name=lecClass]').val()
	  	};
		e.preventDefault();
		$.ajax({
			url:'./json/insertLectureProc.jsp',
    		type:'post',
    		data:jsonData,
    		dataType:'json',
    		success:function(data){
	    		//console.log(data);
	    		$('.contentTr').remove();
	    		let tag = "";
	    		for (var i = 0; i < data.length; i++) {
					tag += "<tr>";
    	    		tag += "<td>"+data[i].lecNo+"</td>";
    	    		tag += "<td>"+data[i].lecName+"</td>";
    	    		tag += "<td>"+data[i].lecCredit+"</td>";
    	    		tag += "<td>"+data[i].lecTime+"</td>";
    	    		tag += "<td>"+data[i].lecClass+"</td>";
    	    		tag += "</tr>";
				}
	    		$('#contentTable').append(tag);
	    		resetForm.reset();
			},
		});  
	})
	  
  	// 검색
	$(document).on('click', '#search', function(e){
		e.preventDefault();
		let jsonData = {
			regStdNo : $('input[name=regStdNo]').val()
		};
  		  
		$.ajax({
			url:'./json/selectRegisterRegStdNoProc.jsp',
			type:'post',
			data:jsonData,
			dataType:'json',
			success:function(data){
				//console.log(data);
				$('tr.contentTr').remove();
				let tag = "";
				for (var i = 0; i < data.length; i++) {
					tag += "<tr>";
					tag += "<td>"+data[i].regStdNo+ "</td>";
					tag += "<td>"+data[i].stdName+ "</td>";
					tag += "<td>"+data[i].lecName+ "</td>";
					tag += "<td>"+data[i].regLecNo+ "</td>";
					tag += "<td>"+data[i].regMidScore+ "</td>";
					tag += "<td>"+data[i].regFinalScore+ "</td>";
					tag += "<td>"+data[i].regTotalScore+ "</td>";
					tag += "<td>"+data[i].regGrade+ "</td>";
					tag += "</tr>";
				}
				$('table#contentTable').append(tag);
			},
		});
	});
	
	// 수강신청
	$(document).on('click', '.submitRegister', function(e){
		e.preventDefault();
	 	let jsonData = {
	 			regStdNo : $('input[name=regStdNo]').val(),
	 			stdName  : $('input[name=stdName]').val(),
	 			regLecNo : $('select[name=lecture]').val()
	 	};
	 	
 		$.ajax({
			url:'./json/insertRegisterProc.jsp',
 	    	type:'post',
 	    	data:jsonData,
 	    	dataType:'json',
 	    	success:function(data){
 	    		//console.log(data);
			},
		});  
	});
	
	// 학생 등록
	$(document).on('click', '.submitStudent', function(){
		let jsonData = {
			stdNo : $('input[name=stdNo]').val(),
			stdName : $('input[name=stdName]').val(),
			stdHp : $('input[name=stdHp]').val(),
			stdYear : $('select[name=stdYear]').val(),
			stdAddress : $('input[name=stdAddress]').val()
		}
		
		$.ajax({
			url:'./json/insertStudent.jsp',
			type:'post',
			data:jsonData,
			dataType:'json',
			success:function(data){
				//console.log(data);
				$('.contentTr').remove();
				let tag = '';
				for(let i=0; i<data.length; i++){
					tag += '<tr class=\'contentTr\'>';
					tag += '<td>'+ data[i].stdNo +'</td>'
					tag += '<td>'+ data[i].stdName +'</td>'
					tag += '<td>'+ data[i].stdHp +'</td>'
					tag += '<td>'+ data[i].stdYear +'</td>'
					tag += '<td>'+ data[i].stdAddress +'</td>'
					tag += '</tr>';
				}
				$('.contentTable').append(tag);
			},
		});
		return false;
	});
  });