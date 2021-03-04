$(function(){
	user_id = getCookie("user_id");
	var feedno = getParameterByName('feedno');
	loadFeed(feedno);
	
	// 댓글 달기
	$('#viewRight').on('click', '#contIcon .comment', function(){
		$("#input_area").focus();	
	});
	// 대댓글 달기 버튼 
	$('#viewRight').on('click', '.replyBtn', function(){
		$("#input_area").focus();
	});
	
})

function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function loadFeed(feedno){
		$.ajax({
		url : '/playddit/feed/getOneFeed.do',
		type : 'post',
		error : function(xhr){
			alert("status : " + xhr.status);
		},
		data : {"feed_no" : feedno},
		success : function(res){
			// 사진이 없는 피드면 아래 div#slider를 다 지우시고 viewLeft 안에는 contTxt를 넣어주세요!-->
            // viewLeft안에 contTxt를 넣었다면 #cont안에 #contTxt를 지워주시면 됩니다.-->
			
			if(res.feedpic=== undefined){	// 사진이 없는경우
			
				$('#viewLeft').append(res.cont);

			}else{	// 사진이 첨부된 피드일 경우 
			
				var slides = '';
                slides += '<div class="slide"> <img src="images/feed2.png" /></div>'
                slides += '<div class="slide"> <img src="images/feed3.jpg" /></div>'
                slides += '<div class="slide"> <img src="images/feed3.jpg" /></div>'
				$('#slider').html(slides);
				
				$('#contTxt').html(res.cont);

			}
			
			if(res.ismine == 'true'){	// 피드가 내 글일때 붙일 내용들
				var mybutton='<button type="button" class="myFeed"><i class="fas fa-ellipsis-h"></i></button>'
				$('#userProfile').append(mybutton);
			}else{	// 피드가 내 글이 아닐떄 붙일 내용들
				var reportIcon = '<button type="button" class="report">'
                            +'<i class="fas fa-exclamation-circle"></i></button>';
				$('#contIcon').append(reportIcon);
			}
			
			if(res.islike == 1){
				var likeIcon = '<button type="submit" class="like on">'
                       		  + '<i class="fas fa-heart"></i></button>';
			}else{
				var likeIcon = '<button type="submit" class="like">'
                       		  + '<i class="far fa-heart"></i></button>';
			}
			$('#contIcon').prepend(likeIcon)	
			
			
			var userprofile ='<a href="'+res.id+'" id="userPic">'
						+ '<img src="images/profile/'+res.profile+'"+ /></a>'
						+ '<a href="'+res.id+'" id="userInfo"><p>'+res.nickname+'</p>'
						+ '<span>'+res.classname+'</span></a>';
			$('#userProfile').append(userprofile);
			$('#likeBtn').append('좋아요 <span>'+res.countlike+'</span>개');
			
			// 댓글들 출력
			$.each(res.replyList, function(i,v){
				var replyli = '<li class="comment">'
                            +'<a href="#"><img src="images/profile/'+v.profile+'" /></a>'
                            +'<p><a href="#">'+v.nickname+'</a>'
                            +'<span>'+v.comcont+'</span>'
				
				if(v.id == user_id){ //내가 쓴 댓글일때만 나타나는 버튼
					replyli+= '<button type="button" class="myComm"><i class="fas fa-ellipsis-h"></i></button>'	
				}
						
                replyli += '</p><button type="button" class="replyBtn">댓글달기</button>';

				if(v.repcount > 0){
                	replyli+='<button type="button" class="replyBtnView">'
                            +'댓글보기&#40;<span>'+v.repcount+'</span>개&#41;</button>';
					replyli+='<ul class="replyList">';
					
					$.each(v.replyList, function(j,comrep){	//대댓글들 출력
						var reprep ='<li class="reply"><a href="#">'
                                   + '<img src="images/profile/'+comrep.profile+'" /></a>'
                                   + '<p><a href="#">'+comrep.nickname+'</a>'
                                   + '<span>'+comrep.comcont+'</span>';
						
						if(comrep.id == user_id ){// 내가 쓴 대댓글일때만 나타나는 버튼
							reprep += '<button type="button" class="myReply"><i class="fas fa-ellipsis-h"></i></button>'
						}
						
						reprep += '</p></li>';
						replyli += reprep;
					})
					
					replyli+='</ul>';
				}
                replyli+= '</li>'
				$('#feedComm').children('ul').append(replyli);
			})
			
			////////////////////////// slick 시작
            $("#viewLeft #slider").slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                infinite: true,
                dots: true,
                prevArrow: "<button class='left slideBtn'><i class='fas fa-chevron-left'></i></button>",
                nextArrow: "<button class='right slideBtn'><i class='fas fa-chevron-right'></i></button>"
            }); 
            
            $.each($("#viewLeft"), function(i){
                if($(this).find(".slide").length <= 1){
                    $(this).find(".slick-dots").css("display", "none");
                }
            });
            
            $('.slick-dots li').html('<i class="far fa-circle"></i>');
            $('.slick-dots li.slick-active').html('<i class="fas fa-circle"></i>');
            
            $(".slick-dots li").on("click", function(){
                $(this).parents("#viewLeft").find(".slick-dots li").html('<i class="far fa-circle"></i>');
                $(this).html('<i class="fas fa-circle"></i>');
            });
            
            $(".slideBtn").each(function(){
                $(this).click(function(){
                    var index = $(this).parent("#viewLeft #slider").slick('slickCurrentSlide');
                    
                    $(this).parents("#viewLeft").find(".slick-dots li").html('<i class="far fa-circle"></i>');
                    $(this).parents("#viewLeft").find(".slick-dots li").eq(index).html('<i class="fas fa-circle"></i>');
                }); 
            }); 
			//////////////////////////// slick 끝 
			
		},
		dataType : 'json'
	})
}

function setCookie(name, value, exp){
	var date = new Date();
	date.setTime(date.getTime() + exp*24*60*60*1000);
	document.cookie = name+'='+escape(value)+';expires='+date.toUTCString()+';path=1';
}

function getCookie(name) {
  const value = `; ${document.cookie}`;
  const parts = value.split(`; ${name}=`);
  if (parts.length === 2) return unescape(parts.pop()).split(';').shift();
}

