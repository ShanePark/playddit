$(function(){
	loadFeed();
	
	// 피드 삭제
	$('.cen').on('click','#goDel',function() {
		// 해당하는 feed 화면에서 제거
		// $('.feed[idx=feedno]').remove()로 제거해야 하는데,찾질 못해서 임시로 each문 돌립니다
		$(this).parents('.cen').find('.feed').each(function(){
			if($(this).attr("idx") == feedno){
				this.remove();
				return false;
			}
		})
		// 실제로 피드를 제거하는 함수
		delFeed(feedno);
   	});
	
	// 좋아요 버튼 이벤트
	$("#feedBox").on("click",".like", function(){	
		var likeCount = parseInt($(this).parents('.feed').find('.likeCount').children('span').text()); 
		var like = $(this).hasClass("on");
		feedno = $(this).parents(".feed").attr("idx");
	      
		if(like){	// 이미 좋아요가 있으면 unlike
			$(this).removeClass("on");
			$(this).html('<i class="far fa-heart"></i>');
			like = false;
			$(this).parents('.feed').find('.likeCount').html(  '좋아요 <span>'+ (likeCount-1) +' </span>개 ');
	        deleteLike(feedno);
		}else{	// 좋아요 없으면 like 추가
	        $(this).addClass("on");
	        $(this).html('<i class="fas fa-heart"></i>');
	        like = true;
	        $(this).parents('.feed').find('.likeCount').html(  '좋아요 <span>'+ (likeCount+1) +' </span>개 ');
	        insertLike(feedno);
	      }
	})
	
	// 댓글 버튼 이벤트 -> 상세 피드정보 페이지로 넘긴다.
	$("#feedBox").on("click",".comment", function(){
		feedno = $(this).parents(".feed").attr("idx");
		var feedUrl = 'feedView.jsp?feedno='+feedno;
		window.location.href=feedUrl;
	});
	
	////////////////////////// 모달 이벤트 관련 함수 시작 /////////////////////////////
	// 내 피드 삭제하기 모달
    var modal2 = true;
    $("#feedBox").on("click",".myFeed", function(){
    	feedno = $(this).parents(".feed").attr("idx");
    	
        if(modal2){
            $("#feedDel").show();
            $("#feedDelModal").slideDown(500);
            modal2 = true;
        }
    });

    // 피드 삭제 취소 모달 닫기
    $("#reportBack, #goCancel").click(function(){
        $("#feedDelModal").slideUp(500);
        $("#feedDel").delay(200).hide();
        $("#reportBack").hide();
        modal2 = true;
        $('body').removeClass('scrollOff').off('scroll touchmove mousewheel');
    });

	//신고 모달
    var modal = true;
    $("#feedBox").on("click",".report", function(){
        if(modal){
            $('body').addClass('scrollOff').on('scroll touchmove mousewheel', function(e){
                e.preventDefault();
            });
            $("#reportBack").show();
            $("#reportWrap").show();
            $("#reportModal").slideDown(500);
            modal = true;
        }
    });

    // 신고 취소 모달 닫기
    $("#reportBack, #cancel").click(function(){
        $("#reportModal").slideUp(500);
        $("#reportWrap").delay(200).hide();
        $("#reportBack").hide();
        modal = true;
        $('body').removeClass('scrollOff').off('scroll touchmove mousewheel');
    });

	////////////////////////// 모달 이벤트 관련 함수 끝 /////////////////////////////
	
})

/************************************************************************** 

							여기부터 함수 선언부입니다. 
		
 ***************************************************************************/


var loadFeed = function(){
	$.ajax({
		url : '/playddit/feed/getFeed.do',
		dataType : 'json',
		success : function(res) {
			
			$.each(res, function(i,v){
				
				var feed = '<div class="feed" idx="'+v.feedno+'">';
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
				//////////////////////////// feed slick//////////////////////////// 
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
				//////////////////////////// feed slick 끝 //////////////////////////// 
				
				// 더보기 기능 적용 
				$("#feedBox").find('.txt').each(function(){
				    var content = $(this).children('.txtCont');
				    var index = content.width();
				    var content_txt = content.text();
				    var content_txt_short = content_txt.substring(0,100)+"...";
				    var btn_more = $('<a href="javascript:void(0)" class="more">더보기</a>');
				    $(this).append(btn_more);
				    if(content_txt.length >= 200){
				        content.html(content_txt_short);
				    }else{
				        btn_more.hide();
				    }
				    btn_more.click(toggle_content);
				    function toggle_content(){
				        if($(this).hasClass('short')){
				            // 접기 상태
				            $(this).html('더보기');
				            content.html(content_txt_short)
				            $(this).removeClass('short');
				        }else{
				            // 더보기 상태
				            $(this).html('접기');
				            content.html(content_txt);
				            $(this).addClass('short');
				        }
				    }
				});	
			
		},
		error : function(xhr) {
			alert("status : " + xhr.status);
		}
	})
		
}

var insertLike = function(feedno){
	   $.ajax({
		 url : '/playddit/feed/insertLike.do',
		 type : 'post',
		 data : {'feedno' : feedno},
		 success : function(res) {
		 },
		 error : function(xhr){
			 alert("status : " + xhr.status);
		 },
		 dataType : 'json'
	   })
}

var deleteLike = function(feedno){
	$.ajax({
		url : '/playddit/feed/deleteLike.do',
		type : 'post',
		data : {'feedno' : feedno},
		success : function(res) {
		},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
		dataType : 'json'
	})
}

var delFeed = function(feedno){
	
	$.ajax({
	url : '/playddit/feed/deleteFeed.do',
	type : 'post',
	data : {'feedno' : feedno},
	success : function(res) {
		
		// 마이 피드 모달 끄기
		$("#feedDelModal").slideUp(500);
        $("#feedDel").delay(200).hide();
        $("#reportBack").hide();
        modal2 = true;
        $('body').removeClass('scrollOff').off('scroll touchmove mousewheel');
		
	},
	error : function(xhr){
		alert("status : " + xhr.status);
	},
	dataType : 'json'
	});
	
}





