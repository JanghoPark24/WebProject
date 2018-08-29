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


