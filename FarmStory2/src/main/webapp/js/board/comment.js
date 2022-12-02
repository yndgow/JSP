$(()=>{
	
	// 댓글작성
	$('.btnCompleteComment').click(e=>{
		e.preventDefault();
		let jsonData = {
			"content": $('.commentForm textarea[name=content]').val(),
			"uid":$('input[name=uid]').val(),
			"parent":$('input[name=no]').val()
		}
		$.ajax({
			url:'/FarmStory2/board/commentWrite.do',
			type:'post',
			data: jsonData,
			dataType:'json',
			success:(data)=>{
				console.log(data);
				if(data != null){
  					$('.empty').remove();
					let tag = 
					`<article>
            			<span class="nick">${data.nick}</span>
			            <span class="date">${data.rdate}</span>
			            <p class="content">${data.content}</p>
			            <div>
			                <a href="#" class="remove">삭제</a>
			                <a href="#" class="modify">수정</a>
			            </div>
			       	 </article>`;
			       
					$('.commentList').append(tag);
				}		        
			}
		});
	});
});