$(function(){
    var stat = false;

    $("#curChatBtn").click(function(){
        if(!stat){
            $("#mask").fadeIn();
            $("#chatBack").fadeIn(200); $("#chatUserBox").delay(100).animate({marginRight : 0}, 300);
            stat = true;
        }else{
            $("#mask").fadeOut();
            $("#chatUserBox").animate({marginRight : "-80%"}, 300);
            $("#chatBack").delay(100).fadeOut(200); 
            stat = false;
        }
    });

    $("#chatBack, #mask").click(function(){
        $("#mask").fadeOut();
        $("#chatUserBox").animate({marginRight : "-80%"}, 300);
        $("#chatBack").delay(100).fadeOut(200); 
        stat = false;
    });

    $("#chatUserBox h3").on("click","button",function(){
        $("#outWrap").fadeIn(200);
        $("#outModal").delay(200).animate({marginTop:"0"}, 400);
    });

    $("#cancel, #outWrap").click(function(){
        $("#outModal").animate({marginTop:"100px"}, 400);
        $("#outWrap").delay(200).fadeOut(200);
    });
});