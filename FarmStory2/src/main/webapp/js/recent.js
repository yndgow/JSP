	$(function(){
 		/*$.get('/FarmStory2/board/getLatest.do?cate=notice', function(data){
			$('#tabs-1 .loading').remove();
			for(let latest of data){
				let url = '/FarmStory2/board/view.do?group=community&cate=1&pg=1&no='+latest.no;
				$('#tabs-1 .txt').append("<li><a href='"+url+"'>"+latest.title+"</a></li>");
			}
			if(data == null){
				$('#tabs-1 .txt').append("<p>최근 등록된 글이 없습니다.</p>");
			}
		});*/
		$.ajax({
			url:'/FarmStory2/board/getLatest.do?cate=notice',
			dataType:'json',
			complete: 'poll',
			timeout: 30000,
			success:(data)=>{
				$('#tabs-1 .loading').remove();
				for(let latest of data){
					let url = '/FarmStory2/board/view.do?group=community&cate=1&pg=1&no='+latest.no;
					$('#tabs-1 .txt').append("<li><a href='"+url+"'>"+latest.title+"</a></li>");
				}
				if(data == null){
					$('#tabs-1 .txt').append("<p>최근 등록된 글이 없습니다.</p>");
				}
			}
		});
		$.ajax({
			url:'/FarmStory2/board/getLatest.do?cate=qna',
			dataType:'json',
			complete: 'poll',
			timeout: 30000,
			success:(data)=>{
				$('#tabs-2 .loading').remove();
				for(let latest of data){
					let url = '/FarmStory2/board/view.do?group=community&cate=4&pg=1&no='+latest.no;
					$('#tabs-2 .txt').append("<li><a href='"+url+"'>"+latest.title+"</a></li>");
				}
				if(data == null){
					$('#tabs-2 .txt').append("<p>최근 등록된 글이 없습니다.</p>");
				}
			}
		});
		$.ajax({
			url:'/FarmStory2/board/getLatest.do?cate=faq',
			dataType:'json',
			complete: 'poll',
			timeout: 30000,
			success:(data)=>{
				$('#tabs-3 .loading').remove();
				for(let latest of data){
					let url = '/FarmStory2/board/view.do?group=community&cate=5&pg=1&no='+latest.no;
					$('#tabs-3 .txt').append("<li><a href='"+url+"'>"+latest.title+"</a></li>");
				}
				if(data == null){
					$('#tabs-3 .txt').append("<p>최근 등록된 글이 없습니다.</p>");
				}
			}
		});
		
 		/*$.get('/FarmStory2/board/getLatest.do?cate=qna', function(data){
			$('#tabs-2 .loading').remove();
			for(let latest of data){
				let url = '/FarmStory2/board/view.do?group=community&cate=4&pg=1&no='+latest.no;
				$('#tabs-2 .txt').append("<li><a href='"+url+"'>"+latest.title+"</a></li>");
			}
			if(data == null){
				$('#tabs-2 .txt').append("<p>최근 등록된 글이 없습니다.</p>");
			}
		});
		
		$.get('/FarmStory2/board/getLatest.do?cate=faq', function(data){
			$('#tabs-3 .loading').remove();
			for(let latest of data){
				let url = '/FarmStory2/board/view.do?group=community&cate=5&pg=1&no='+latest.no;
				$('#tabs-3 .txt').append("<li><a href='"+url+"'>"+latest.title+"</a></li>");
			}
			if(data == null){
				$('#tabs-3 .txt').append("<p>최근 등록된 글이 없습니다.</p>");
			}
		}); */
			
	});