	$(function(){
 		$.get('/FarmStory1/board/proc/getLatestProc.jsp?cate=notice', function(data){
			$('#tabs-1 .loading').remove();
			for(let latest of data){
				let url = '/FarmStory1/board/view.jsp?group=community&cate=1&pg=1&no='+latest.no;
				$('#tabs-1 .txt').append("<li><a href='"+url+"'>"+latest.title+"</a></li>");
			}
		});
		
 		$.get('/FarmStory1/board/proc/getLatestProc.jsp?cate=qna', function(data){
			$('#tabs-2 .loading').remove();
			for(let latest of data){
				let url = '/FarmStory1/board/view.jsp?group=community&cate=4&pg=1&no='+latest.no;
				$('#tabs-2 .txt').append("<li><a href='"+url+"'>"+latest.title+"</a></li>");
			}
		});
		
		$.get('/FarmStory1/board/proc/getLatestProc.jsp?cate=faq', function(data){
			$('#tabs-3 .loading').remove();
			for(let latest of data){
				let url = '/FarmStory1/board/view.jsp?group=community&cate=5&pg=1&no='+latest.no;
				$('#tabs-3 .txt').append("<li><a href='"+url+"'>"+latest.title+"</a></li>");
			}
		}); 
			
	});