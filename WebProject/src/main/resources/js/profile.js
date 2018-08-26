//화면출력
$(function () {
	 $("#p").click(function(){
			alert("저장되었습니다");
		});
        });   


//이미지 업로드
var upload = document.getElementsByTagName('input')[0],
holder = document.getElementById('holder'),
state = document.getElementById('status');

if (typeof window.FileReader === 'undefined') {
state.className = 'fail';
} else {
state.className = 'success';
state.innerHTML = '';
}

upload.onchange = function (e) {
e.preventDefault();

var file = upload.files[0],
  reader = new FileReader();
reader.onload = function (event) {
var img = new Image();
img.src = event.target.result;
// note: no onload required since we've got the dataurl...I think! :)
if (img.width < 100000) { // holder width
  img.width = 95;
  img.height = 195;
}
holder.innerHTML = '';
holder.appendChild(img);
};
reader.readAsDataURL(file);

return false;
};