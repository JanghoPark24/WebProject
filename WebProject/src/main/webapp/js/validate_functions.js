/**
 * make validating functions with REGEX
 * 참고사이트: https://regexr.com/3bfsi
 */

var emailDomainRegex =/(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/g;
var emailRegex =/[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/g;
var passwordRegex =/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/gm;
var imgRegex = /^.*\.(jpeg|svg|jpg|png)$/ig;


function isValidEmail(email){
   
    let validEmail = email.search(emailRegex)
   
    return (validEmail==-1)? false:true;
    
}
function isValidEmailDomain(domain){
   
    let validEmailDomain = domain.search(emailDomainRegex)
   
    //if there's a matched Result return 
    return (validEmailDomain==-1)? false:true;
    
}

//대문자,소문자, 특수문자 조합만 가능
function isValidPW(password){
    let validPassword= password.search(passwordRegex)
    return validPassword==-1? false:true;
}

//이미지 파일만 입력
function isValidImg(imgName){
    let validImg = imgName.search(imgRegex)
    return validImg==-1? false:true;
}

// form에 대한 유효성 검사 확인하기
function validateEmptinessWithLabel(frm, type){
	
	var form_id = frm.id;
    var inputs = frm.getElementsByTagName('input')
   
    var iSize = inputs.length;
    

    for(var i = 0;i<iSize; i++){
    	
        //input 
        let inputE = inputs[i]
        let inputVal = inputE.value.trim();
        
        //input id가 없을 경우 넘어감
        if(inputE.id=="") continue;
		
        //라벨을 id에 따라 선택
        let selectedLabel = document.querySelector("label[for=" + (inputE.id)+ "]");
        
        if(selectedLabel!=null) 
        var labelVal = selectedLabel.innerText;//id에 따라 선택된 라벨이 있는 경우 안에 있는 텍스트 값 불러옴
        
        
        // 값이 없을 경우 리턴
        if(inputVal==""){
        	if(type=='default')
        		alertMessage='을/를 입력해야 합니다';
        	else if(type=='rate')
        		alertMessage='문항을/를 평가해야 합니다'
        			
            alert(labelVal+alertMessage)
            return false;
        }
        
    }
    return true;
    
    
}


//button에 대한 유효성 검사 확인하기 _t
function validateEmptinessWithLabelB(button_id){
	
	var frm = $("#"+button_id).closest('form');
    var form_id = frm.attr("id");
    var inputs = frm.getElementsByTagName('input')
   
    var iSize = inputs.length;
    

    for(var i = 0;i<iSize; i++){
    	
        //input 
        let inputE = inputs[i]
        
		
    	let inputVal = inputE.value.trim();
       
        //label Value for input id
        //let labelVal = $("label[for='"+inputE.id+"']").text();
        let labelVal = document.querySelector("label[for=" + (inputE.id)+ "]").innerText;
        
        // 값이 없을 경우 리턴
        if(inputVal==""){
            alert(labelVal+"을/를 입력해야 합니다.")
            return false;
        }
        
    }
    return true;
    
    
}

