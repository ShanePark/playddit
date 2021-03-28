$(function(){
	
	// 파일 업로드 버튼눌렀을때 input_imgs (파일업로드 input) 실행.css 때문에 우회
	$('#uploadForm').on('click','#fileBtn',function(){
		$('#input_imgs').click();
	})
	
	// 이미지 업로드시 미리보기 이벤트
	$("#input_imgs").on("change", handleImgsFilesSelect);
	
	// 업로드된 파일 개별 제거 이벤트
	$("#fileBox").on("click", ".deleteBtn", function(){
		alert("개별 파일 제거 기능은 아직 준비중입니다. 기능 구현때까지는 다시 업로드 하는 기능을 이용해주세요.");
//		let files = $('#input_imgs')[0].files;
//		let removeName = $(this).parent(".file").attr("name");
//		let removeIndex;
//		$.each(files, function(i,v){
//			if(v.name == removeName){
//				removeIndex = i;
//				return false;
//			}
//		})
//		console.log(removeIndex)
//		console.log(files[removeIndex])
//		files[removeIndex].remove();
//		files.splice(removeIndex,3);////////// 특정 idnex를 아직 삭제하지 못하고 있음 !
//		$(this).parent(".file").remove();
	});
	
	/**
		Keyup 시에 본문 글자수 세주는 이벤트
	 */	
	$('#content').on('keyup', function() {
		$('#bytes').html("("+$(this).val().length+"자 / 최대 700자)");

		if($(this).val().length > 700) {
			$(this).val($(this).val().substring(0, 700));
			$('#bytes').html("(700자 / 최대 700자)");
		}
	});
            
 
	/**
		업로드 버튼 이벤트 
	 */
    $("#uploadBtn a span").click(function() {
		
        var btn = $(this).parent().parent();
        var loadSVG = btn.children("a").children(".load");
        var loadBar = btn.children("div").children("span");
        var checkSVG = btn.children("a").children(".check");
        
        btn.children("a").children("span").fadeOut(200, function() {
          btn.children("a").animate({
            width: 56 
          }, 100, function() {
            loadSVG.fadeIn(300);
            btn.animate({
              width: 320  
            }, 200, function() {
              btn.children("div").fadeIn(200, function() {
                loadBar.animate({
                  width: "100%" 
                }, 1000, function() {
                  loadSVG.fadeOut(200, function() {
                    checkSVG.fadeIn(200, function() {
                      setTimeout(function() {
                        btn.children("div").fadeOut(200, function() {
                          loadBar.width(0);
                          checkSVG.fadeOut(200, function() {
                            btn.children("a").animate({
                              width: 150  
                            });
                            btn.animate({
                              width: 150
                            }, 300, function() {
                              btn.children("a").children("span").fadeIn(200);
                            });
                          });
                        });
                      }, 1000); 
                    });
                  });
                });
              });
            });
          });
        });

        setTimeout(function() {
			$('#uploadForm').submit()
		}, 2000);
        
    });	 
	
	
	
});


var sel_files = [];

function handleImgsFilesSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	// 사진 업로드 할때, 기존에 업로드 된 미리보기들은 제거. div가 따로 나눠져있지 않아서 필요한 두 개의 태그를 제외하고 삭제하도록 셀렉트
	$("#fileBox").children().not('#uploadBox').not('#input_imgs').remove();

	filesArr.forEach(function(f) {
		if(!f.type.match("image.*")) {
			alert("이미지만 업로드 하실 수 있습니다.");
			return;
		}

		sel_files.push(f);

		var reader = new FileReader();
		reader.onload = function(e) {
			var img_html = '<div name="'+f.name+'" class="file"><img src=\"' + e.target.result + '\" /><div class=\"deleteBtn\"><i class=\"far fa-trash-alt\"></i></div></div>';
			$("#fileBox").append(img_html);
		}
		reader.readAsDataURL(f);
	});
}