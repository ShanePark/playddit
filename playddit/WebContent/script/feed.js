$(function(){
	loadFeed();
})

var loadFeed = function(){
	$.ajax({
		url : '/playddit/feed/getFeed.do',
		dataType : 'json',
		success : function(res) {
			
			$.each(res, function(i,v){
				
				var feed = '<div class="feed">';
				v.cont = v.cont.replace(/\n/g,"<br>");
				
				feed += '<div class="proBox" action="'+v.id+'">'
				   	 + '<div class="proCir"><img src="images/profile/'+v.profile+'" alt="프로필사진" /></div>'
                     + '<p class="proName">'+v.nickname
                     + '<span class="proClass">6기 - 302호</span></p>';
				
				 if(v.ismine == "true"){	// 내가 쓴 글이면 출력될 버튼
				    feed += '<button type="button" class="myFeed"><i class="fas fa-ellipsis-h"></i></button>';
				   }
				
				feed += '</div>'	// proBox 닫음.
					 + '<div class="feedPic">'
				
				if(v.feedpic != "none") {	// feedpic이 null 이면 none이 반환되도록 쿼리를 짰음.
					// 이미지 경로를 ',' 를 기준으로 쪼갠다음 반복문을 돌리며 넣어준다.
					var images = v.feedpic.split(",");
			   		feed += '<div class="slider">';
		
			   		for(j = 0; j < images.length; j++){
						var img = '<div class="slide">'
								+ '<img src="images/feed/'+images[j]+'"/></div>';
						feed += img;
			   		}
		
			        feed += '</div>'	//slider 닫음.
				}else{	// 이미지가 없을 경우에는 그 자리에 본문을 찍습니다.
					feed += '<p class="txtCont">'+v.cont+'</p>';
				}
				
				feed += '</div>'	// feedPic 닫음.
				feed += '<div class="icon">'
				
				if(v.islike == 0){
				  	feed += ' <button type="submit" class="like">'
			        feed += ' <i class="far fa-heart"></i></button>'
				}else {
					feed += '<button type="submit" class="like on">'
			        feed += '<i class="fas fa-heart"></i></button>'
				}
				
				feed += '<button type="button" class="comment">'
                     + '<i class="far fa-comment-dots"></i></button>'
					 + '<button type="button" class="dm">'
                     + '<i class="fas fa-paper-plane"></i></button>';
				if(v.ismine == "false"){	// 내 글이 아닐때만 신고버튼 활성화
					feed += '<button type="button" class="report">'
					     + '<i class="fas fa-exclamation-circle"></i></button>'
				}
				feed += '</div>'
                     + '<div class="likeCount">'
                     + '좋아요 <span>' +v.countlike +'</span>개</div>'
                
           		if(v.feedpic != "none") {
					feed += '<div class="txt">'
						 + '<a href="#" class="proName"> '+v.nickname+'</a>'
						 + '<p class="txtCont">'+v.cont +'</p></div>';
				}
				
				feed += '<div class="countComm">댓글 <span class="count">'+v.comcount+'</span>개</div>'
					 + '<div class="commentBox"><ul>'                          
                            
				$.each(v.replyList, function(i,v){
					feed += '<li class="comm"><a href="#" class="commUser">'+v.nickname+'</a>'
						 + '<span>'+v.comcont+'</span></li>'
				})
                feed += '</ul></div>'
					 +'</div>';	// feed 닫음.
           
				$('#feedBox').append(feed);
				
			})
				//////////////feed slick
                $(".feedPic .slider").slick({
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    infinite: true,
                    dots: true,
                    prevArrow: "<button class='left slideBtn'><i class='fas fa-chevron-left'></i></button>",
                    nextArrow: "<button class='right slideBtn'><i class='fas fa-chevron-right'></i></button>"
                }); 
                
                $.each($(".feedPic"), function(i){
                    if($(this).find(".slide").length <= 1){
                        $(this).find(".slick-dots").css("display", "none");
                    }
                });
                
                $('.slick-dots li').html('<i class="far fa-circle"></i>');
                $('.slick-dots li.slick-active').html('<i class="fas fa-circle"></i>');
                
                $(".slick-dots li").on("click", function(){
                    $(this).parents(".feedPic").find(".slick-dots li").html('<i class="far fa-circle"></i>');
                    $(this).html('<i class="fas fa-circle"></i>');
                });
                
                $(".slideBtn").each(function(){
                    $(this).click(function(){
                        var index = $(this).parent(".feedPic .slider ").slick('slickCurrentSlide');
                        
                        $(this).parents(".feedPic").find(".slick-dots li").html('<i class="far fa-circle"></i>');
                        $(this).parents(".feedPic").find(".slick-dots li").eq(index).html('<i class="fas fa-circle"></i>');
                    }); 
                });
				//////////////feed slick끝 
			
		},
		error : function(xhr) {
			alert("status : " + xhr.status);
		}
	})
		
}