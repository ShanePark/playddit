$(function(){

// 입력창에 아무 입력도 없을 경우 'Add comment'를 기본으로 세팅
 var input_area_default = $('#input_area').html();

 if(input_area_default == ''){
   var default_text = 'Add comment'
   $('#input_area').html(default_text)
 }

});


// 입력을 시작하면 기본 세팅인 'Add comment'를 제거
$(document).on("focus","#input_area",function() {

  var input_area_default = $('#input_area').html()

  if(input_area_default == 'Add comment'){
    $('#input_area').html('')
  }

});


// 이모지 버튼에 마우스 올리면 표정 바뀜
$(document).on("mouseenter",".emoji_pickup",function() {

    $('#emoji_pickup_before').css("display","none");
    $('#emoji_pickup_after').css("display","block");
  }).on("mouseleave",".emoji_pickup",function() {
    $('#emoji_pickup_after').css("display","none");
    $('#emoji_pickup_before').css("display","block");
  });


// 이모지 버튼 클릭시 이모지 목록 popup
$(document).on("click",".emoji_pickup",function(){
 var view = $("#emoji_popup").is(":visible");
	if(!view){
	  // popup div의 size를 가져와서 위치 선정에 활용
	  var popupdiv_width = $('#emoji_popup').width();
	  var popupdiv_height = $('#emoji_popup').height();

	  // popup div의 위치를 설정
	  var position = $('.emoji_pickup').position();
	  $('#emoji_popup').css("left", "0");
	  $('#emoji_popup').css("bottom", "70px");
	  $("#emoji_popup").css("background-color","#FFFFFF")
	  $('#emoji_popup').css("display","block");
	}else{
		$("#emoji_popup").css({"display":"none"});
	}
});

// input area에서 esc 누르면 popup div가 사라짐
$(document).on("keyup","body",function() {
  if (event.keyCode === 27) {
    $("#emoji_popup").css({"display":"none"});
 	  }
});

// emoji_picks
$(document).on("click",".emoji_list", function(e) {

  var input_area_default = $('#input_area').html()
  if(input_area_default == 'Add comment'){
    $('#input_area').html('')
  }

  var emoji_id = $(this).attr('id');
  var imgtag = '<img style="width:23px; height:23px" src="images/emoji/' + emoji_id + '.png">';
  $('#input_area').append(imgtag);

});


// Enter 키를 입력할 경우 전송처리
/*
$(document).on("keyup","#input_area",function() {

  var inputarea = $('#input_area');
  inputarea.scrollTop(inputarea[0].scrollHeight);

  if (event.keyCode === 13) {
    var input_area_default = $('#input_area').html();
    $('#input_area').html('');

 	  }

});			*/
