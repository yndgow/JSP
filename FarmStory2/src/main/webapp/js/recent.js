	$(function(){
 		$.get('/FarmStory2/board/getLatestProc.do?cate=notice', function(data){
			$('#tabs-1 .loading').remove();
			for(let latest of data){
				let url = '/FarmStory2/board/view.do?group=community&cate=1&pg=1&no='+latest.no;
				$('#tabs-1 .txt').append("<li><a href='"+url+"'>"+latest.title+"</a></li>");
			}
		});
		
 		$.get('/FarmStory2/board/getLatestProc.do?cate=qna', function(data){
			$('#tabs-2 .loading').remove();
			for(let latest of data){
				let url = '/FarmStory2/board/view.do?group=community&cate=4&pg=1&no='+latest.no;
				$('#tabs-2 .txt').append("<li><a href='"+url+"'>"+latest.title+"</a></li>");
			}
		});
		
		$.get('/FarmStory2/board/getLatestProc.do?cate=faq', function(data){
			$('#tabs-3 .loading').remove();
			for(let latest of data){
				let url = '/FarmStory2/board/view.do?group=community&cate=5&pg=1&no='+latest.no;
				$('#tabs-3 .txt').append("<li><a href='"+url+"'>"+latest.title+"</a></li>");
			}
		}); 
			
	});