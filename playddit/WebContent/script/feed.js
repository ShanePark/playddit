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
				
				feed += '</div>'
				
				if(v.feedpic != "none") {	// feedpic이 null 이면 none이 반환되도록 쿼리를 짰음.
					
					// 이미지 경로를 ',' 를 기준으로 쪼갠다음 반복문을 돌리며 넣어준다.
					var images = v.feedpic.split(",");
			   		feed += '<div class="feedPic"><div class="slider">'
			   		for(j = 0; j < images.length; j++){
						var img = '<div class="slide">';
								+ '<img src="../images/feed/'+images[j]+'"/></div>';
			   		}
			        feed += '</div> </div>'
				}else{	// 이미지가 없을 경우에는 그 자리에 본문을 찍습니다.
					feed += '<div class="txt"><p class="txtCont">'+v.cont+'</p></div>'
				}
				

                            <div class="icon">
                                <button type="submit" class="like">
                                    <i class="far fa-heart"></i>
                                </button>
                                <button type="button" class="comment">
                                    <i class="far fa-comment-dots"></i>
                                </button>
                                <button type="button" class="dm">
                                    <i class="fas fa-paper-plane"></i>
                                </button>

                                <button type="button" class="report">
                                    <i class="fas fa-exclamation-circle"></i>
                                </button>
                            </div>
                            
                            <div class="likeCount">
                                좋아요 <span>100</span>개
                            </div>

                            <div class="txt">
                                <a href="#" class="proName">Scarl-ett</a>
                                <p class="txtCont">
                                    프로그래머스 문제풀이 중..ㅠ<br /> 어떤 경우에 틀렸는지 좀 알려주세요...ㅠㅠ
                                </p>
                            </div>

                            <div class="countComm">
                                댓글 <span class="count">13</span>개
                            </div>

                            <div class="commentBox">
                                <ul>
                                    <li class="comm"><a href="#" class="commUser">summer</a> <span>프로그래머스
                                            언제 다하죠?ㅠ</span>
                                    <li class="comm"><a href="#" class="commUser">홍길동</a> <span>화이팅~!</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
				
				
				
				$('#feedBox').append(feed);
			})
			
		},
		error : function(xhr) {
			alert("status : " + xhr.status);
		}
	})
		
}