$(()=>{
	$('.next').click((e)=>{
		e.preventDefault();
		let terms1 = $('.terms').is(':checked');
		let terms2 = $('.privacy').is(':checked');
		if(!(terms1 && terms2)){
			alert('모두 동의해주셔야합니다');
			return false;
		}else{
			location.href = "/FarmStory2/user/register.do"
		}
	});
});