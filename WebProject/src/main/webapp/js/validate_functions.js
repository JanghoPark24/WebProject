/**
 * make validating functions with REGEX
 * 참고사이트: https://regexr.com/3bfsi
 */

let emailDomainRegex =/(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/g;
let emailRegex =/[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/g;
let passwordRegex =/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/gm;
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





