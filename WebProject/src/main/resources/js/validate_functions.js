/**
 * make validating functions with REGEX
 * 참고사이트: https://regexr.com/3bfsi
 */

var emailRegex =/[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/g;
var passwordRegex =/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/gm;
var imgRegex = /^.*\.(jpeg|svg|jpg|png)$/ig;


function isValidEmail(email){
    let validEmail = emailRegex.search(email)
    //if there's a matched Result return 
    return (validEmail==-1)? false:true;
    
}

//대문자,소문자, 특수문자 조합만 가능
function isValidPW(password){
    let validPW = passwordRegex.search(password)
    return (validPW==-1)? false:true;
}

//이미지 파일만 입력
function isValidImg(imgName){
    let validImg = imgRegex.search(imgName)
    return (validImg==-1)? false:true;
}

// form id에 대한 유효성 검사 확인하기
function validateWithLabel(form_id){
    
    var frm = $(form_id);
    var inputs = $(form_id+' input')
    
    var iSize = inputs.length;
    
    
    for(var i = 0; i< iSize; i++){
        
        //input 
        var inputE = inputs.eq(i)
        var inputVal = inputE.val()
        //label Value for input id
        var labelVal = $("label[for='"+inputE.attr('id')+"']").text();
        
        //전송되는 name
        var iName = inputE.attr("name");
        
        console.log(inputE)
        console.log(labelVal)
        
        // type이 file인 것을 제외하고 input값을 모두 비교
        // 값이 없을 경우 리턴
        if(inputE.val()==""){
    
            alert(labelVal+"을 입력해야 합니다.")
            return;
        //이메일일 경우
        }else if(iName=="univ_domain"){
            
            if(isValidEmailDomain(inputVal)==false) 
                alert("이메일 형식이 올바르지 않습니다.")
            return;
        }
    }
    if(validateLectureFile(frm)==false){
        return;
    }
    frm.submit();
    
    
}

function validateLectureFile(frm){
    var form_id = frm.attr('id')
    var inputFileVal;
    
    //form에 따른 value
    if(form_id="insertUniv")
        inputFileVal=$("#i_univ_logo_d").val();
    
    
    if(inputFileVal==""){
        alert("파일을 선택해 주세요");
    }
    else if(isValidImg(inputFileVal)==false){ 
        alert("파일 형식이 올바르지 않습니다.")
        return false;
    }
    
    return true;
}

