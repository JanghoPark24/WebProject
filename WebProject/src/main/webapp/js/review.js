$(function (req, res, next) {
  if (req.url && req.url.indexOf('.jsp') > -1) {
    res.header('Content-Type', 'text/html');
  }
 
});

//처음에 답글 쓰기 모두 숨김


$(function(){
   
    $(".list-group-item .button_block").on("click",function(){
        $(this).parent().parent().parent(".re-reply-form").hide();
    })
    $(".re-reply").on("click",function(){
        $(this).siblings(".re-reply-form").toggle("display");
    })
    
    // 답글 숨기기 답글 보기
    $(".show-hide-replies").on("click",function(){
        
        //컨테이너가 보이지 않을 경우
        var $re_container =$(this).siblings(".re-reply-container")
        if($re_container.css("display")!="none"){
            $(this).text("답글 보기");
            $re_container.hide();
        }
        else{
            $(this).text("답글 숨기기");
            $re_container.show();
        }
    })
    //취소 누를 시에 댓글창 닫기
})

