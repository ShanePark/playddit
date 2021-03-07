$(function(){
	user_id = getCookie("user_id");
	var feedno = getParameterByName('feedno');
	mytarget = 'feed';
	repTarget = 'comment';
	loadFeed(feedno);
	
	// 메시지 버튼 클릭시 채팅으로 이동
	$('.fa-envelope').on('click',function(){
		location.href="chat.jsp";
	})
	
	// 댓글 말풍선 버튼 
	$('#viewRight').on('click', '#contIcon .comment', function(){
		repTarget = 'comment';
		$("#input_area").empty();
		$("#input_area").focus();
	});
	
    // 대댓글 보기 버튼
	$('#viewRight').on('click', '.replyBtnView', function(){
		$(this).parent(".comment").children('.replyList').slideToggle(300);
	})
	
	// 대댓글 달기 버튼
	$('#viewRight').on('click', '.replyBtn', function(){
		comli = $(this).parent('.comment');
		comno = comli.attr("comno");
		comWriter = comli.children('p').find('a').text();
		
		repTarget = 'comrep';
		
		$("#input_area").html('@'+comWriter+'&nbsp;');
		$("#input_area").focus();
	});
	// 댓글 등록 버튼
	$('#viewRight').on('click', '#commentSend', function(){
		// 이모지 닫기
		$("#emoji_popup").css({"display":"none"});
		
		// 컨텐츠 내용 모아서 함수로보내기
		let content = document.getElementById('input_area').innerHTML;
		$(this).parent('.row').children('#input_area').empty();
		
		// 댓글인지 대댓글인지 확인해서 각각 분기시키기
		if(repTarget == 'comrep'){
			insertComReply(comno, content);
			repTarget = 'comment';
		}else if (repTarget == 'comment'){
			insertComment(feedno,content);
		}
		
		
	});

	$('#goDel').on('click', function(){
		// 해당하는 댓글 혹은 대댓글 li 를 제거한다.
		if(mytarget == 'comment'){
			comli.remove();			
		}else if(mytarget == 'comrep'){
			comrepli.remove();
		}else if(mytarget == 'feed'){
			delFeed(feedno);
		}
		
		// 모달 닫는 이벤트
		$("#feedDelModal").slideUp(500);
	    $("#feedDel").delay(200).hide();
	    $("#reportBack").hide();
	    modal2 = true;
	    $('body').removeClass('scrollOff').off('scroll touchmove mousewheel');
		
		// 댓글 삭제할건지 대댓글 삭제한건지 따라서 분기시키기
		if(mytarget == 'comment'){
			deleteComment(comno);		
		}else if(mytarget == 'comrep'){
			deleteComReply(comrepno);
		}
		
	});
	
	// 좋아요 버튼 이벤트
	$("#viewRight").on("click",".like", function(){	
		var likeCount = parseInt($(this).parents('#viewRight').find('#likeBtn').children('span').text()); 
		var like = $(this).hasClass("on");
	      
		if(like){	// 이미 좋아요가 있으면 unlike
			$(this).removeClass("on");
			$(this).html('<i class="far fa-heart"></i>');
			like = false;
			$(this).parents('#viewRight').find('#likeBtn').html(  '좋아요 <span>'+ (likeCount-1) +' </span>개 ');
	        deleteLike(feedno);
		}else{	// 좋아요 없으면 like 추가
	        $(this).addClass("on");
	        $(this).html('<i class="fas fa-heart"></i>');
	        like = true;
	        $(this).parents('#viewRight').find('#likeBtn').html(  '좋아요 <span>'+ (likeCount+1) +' </span>개 ');
	        insertLike(feedno);
	      }
	})
	
	
	/************************************************************************** 
	
								모달 이벤트 관련 함수들입니다
			
	 ***************************************************************************/
	
	// 피드 삭제하기 모달
	var modal2 = true;
	$('#viewRight').on('click', '.myFeed', function(){
		
		mytarget = 'feed';
		
		if(modal2){
			$('body').addClass('scrollOff').on('scroll touchmove mousewheel', function(e){
				e.preventDefault();
			});
			
			$("#feedDelModal p").text("피드를 삭제하시겠습니까?");
			
			$("#reportBack").show();
			$("#feedDel").show();
			$("#feedDelModal").slideDown(500);
			modal2 = true;
		}
	});
	
	// 내 댓글 삭제하기 모달
	var modal2 = true;
	$('#viewRight').on('click', '.myComm', function(){
		
		// 댓글 수정 혹은 삭제를 위해 comno에 기록합니다. comli로 comment li 도 기록합니다.
		comli = $(this).parents('.comment');
		comno = $(this).parents('.comment').attr("comno");
		mytarget = 'comment';
		
		if(modal2){
			$('body').addClass('scrollOff').on('scroll touchmove mousewheel', function(e){
				e.preventDefault();
			});
			
			$("#feedDelModal p").text("댓글을 삭제하시겠습니까?");
			
			$("#reportBack").show();
			$("#feedDel").show();
			$("#feedDelModal").slideDown(500);
			modal2 = true;
		}
	});
	
	//내 대댓글 삭제하기 모달[동적이벤트 수정 완료]
	$('#viewRight').on('click', '.myReply', function(){
		
		// 대댓글 수정 혹은 삭제를 위해 comrepli 에 기록합니다. 
		comrepli = $(this).parents('.reply');
		comrepno = $(this).parents('.reply').attr("comrepno");
		mytarget = 'comrep';
		
		if(modal2){
			$('body').addClass('scrollOff').on('scroll touchmove mousewheel', function(e){
				e.preventDefault();
			});
			
			$("#feedDelModal p").text("대댓글을 삭제하시겠습니까?");
			
			$("#reportBack").show();
			$("#feedDel").show();
			$("#feedDelModal").slideDown(500);
			modal2 = true;
		}
	});
	
	// 신고, 삭제 모달에서 취소 버튼 이벤트 
	$("#reportBack, #goCancel").click(function(){
        $("#feedDelModal").slideUp(500);
        $("#feedDel").delay(200).hide();
        $("#reportBack").hide();
        modal2 = true;
        $('body').removeClass('scrollOff').off('scroll touchmove mousewheel');
    });

})


/************************************************************************** 

							여기부터 함수 선언부입니다. 
		
 ***************************************************************************/

function delFeed(feedno){
	$.ajax({
		url : '/playddit/feed/deleteFeed.do',
		type : 'post',
		data : {'feedno' : feedno},
		error : function(xhr){
			 alert("status : " + xhr.status);
		 },
		 dataType : 'json'
   })

	window.location.href= 'myPage.jsp?feed_id='+user_id;
	
}

// 대댓글 등록
function insertComReply(comno, content){
	$.ajax({
		url : '/playddit/feed/insertCommentReply.do',
		type : 'post',
		data : {'comno' : comno, 'content' : content},
		success : function(comrep) {
			
			var reprep ='<li class="reply" comrepno="'+comrep.comno+'"><a href="#">'
                       + '<img src="images/profile/'+comrep.profile+'" /></a>'
                       + '<p><a href=myPage.jsp?feed_id='+comrep.id+'>'+comrep.nickname+'</a>'
                       + '<span>'+comrep.comcont+'</span>'
					   + '<button type="button" class="myReply"><i class="fas fa-ellipsis-h"></i></button>'
						+ '</p></li>';
			comli.find('ul').append(reprep);
			comli.children('.replyList').slideToggle(300);
			
		 },
		 error : function(xhr){
			 alert("status : " + xhr.status);
		 },
		 dataType : 'json'
   })
}
// 대댓글 삭제
function deleteComReply(comRepNo){

   $.ajax({
	 url : '/playddit/feed/deleteCommentReply.do',
	 type : 'post',
	 data : {'comRepNo' : comRepNo},
	 error : function(xhr){
		 alert("status : " + xhr.status);
	 }
   })
}

// 댓글 다는 함수
function insertComment(feedno,content){
	
   $.ajax({
	 url : '/playddit/feed/insertComment.do',
	 type : 'post',
	 data : {'feedno' : feedno, 'content' : content},
	 success : function(v) {
		
		let replyli = '<li class="comment" comno="'+v.comno+'">'
                    +	'<a href=myPage.jsp?feed_id='+v.id+'><img src="images/profile/'+v.profile+'" /></a>'
                    +	'<p>'
					+		'<a href=myPage.jsp?feed_id='+v.id+'>'+v.nickname+'</a>'
                    +		'<span>'+v.comcont+'</span>'
					+		'<button type="button" class="myComm">'
					+			'<i class="fas fa-ellipsis-h"></i>'
					+		'</button>'	
					+	'</p>'
					+	'<button type="button" class="replyBtn">댓글달기</button>'
					+	'<button type="button" class="replyBtnView">'
					+	'댓글보기&#40;<span>0</span>개&#41;</button>'
					+	'<ul class="replyList"></ul>'
					+'</li>';
		$('#feedComm').children('ul').append(replyli);
	 },
	 error : function(xhr){
		 alert("status : " + xhr.status);
	 },
	 dataType : 'json'
   })
}

function deleteComment(comno){
	
   $.ajax({
	 url : '/playddit/feed/deleteComment.do',
	 type : 'post',
	 data : {'comno' : comno},
	 error : function(xhr){
		 alert("status : " + xhr.status);
	 }
   })
}

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
			if(xhr.status == 500){
				location.href="index.html";
				return false;
			}
			alert("status : " + xhr.status);
		},
		data : {"feed_no" : feedno},
		success : function(res){
			// 사진이 없는 피드면 아래 div#slider를 다 지우시고 viewLeft 안에는 contTxt를 넣어주세요!-->
            // viewLeft안에 contTxt를 넣었다면 #cont안에 #contTxt를 지워주시면 됩니다.-->
			
			if(res.feedpic=== undefined){	// 사진이 없는경우
			
				var contText = '<div class="textOnly"><p id="contTxt">'+res.cont+'</p></div>'
				$('#viewLeft').append(contText);

			}else{	// 사진이 첨부된 피드일 경우 
			
				// 사진 문자열을 쉼표를 기준으로 쪼갠다.
				var pictures = res.feedpic.split(',');
				
				var slides = '';
				for(i=0; i<pictures.length; i++){
               		slides += '<div class="slide"> <img src="images/feed/'+pictures[i]+'" /></div>'
				}
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
			
			var userprofile ='<a href=myPage.jsp?feed_id='+res.id+' id="userPic">'
						+ '<img src="images/profile/'+res.profile+'"+ /></a>'
						+ '<a href="'+res.id+'" id="userInfo"><p>'+res.nickname+'</p>'
						+ '<span>'+res.classname+'</span></a>';
			$('#userProfile').append(userprofile);
			$('#likeBtn').append('좋아요 <span>'+res.countlike+'</span>개');
			
			// 댓글들 출력
			$.each(res.replyList, function(i,v){
				var replyli = '<li class="comment" comno="'+v.comno+'">'
                            +'<a href=myPage.jsp?feed_id='+v.id+'><img src="images/profile/'+v.profile+'" /></a>'
                            +'<p><a href=myPage.jsp?feed_id='+v.id+'>'+v.nickname+'</a>'
                            +'<span>'+v.comcont+'</span>'
				
				if(v.id == user_id){ //내가 쓴 댓글일때만 나타나는 버튼
					replyli+= '<button type="button" class="myComm"><i class="fas fa-ellipsis-h"></i></button>'	
				}
						
                replyli += '</p>'
						+'<button type="button" class="replyBtn">댓글달기</button>'
						+'<button type="button" class="replyBtnView">'
                        +'댓글보기&#40;<span>'+v.repcount+'</span>개&#41;</button>'
						+'<ul class="replyList">';
				
				$.each(v.replyList, function(j,comrep){	//대댓글들 출력
					var reprep ='<li class="reply" comrepno="'+comrep.comno+'"><a href="#">'
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

