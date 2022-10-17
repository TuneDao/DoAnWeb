var slideIndex;
function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }

    slides[slideIndex].style.display = "block";  
    dots[slideIndex].className += " active";
    //chuyển đến slide tiếp theo
    slideIndex++;
    //nếu đang ở slide cuối cùng thì chuyển về slide đầu
    if (slideIndex > slides.length - 1) {
      slideIndex = 0
    }    
    //tự động chuyển đổi slide sau 5s
    setTimeout(showSlides, 5000);
}
//mặc định hiển thị slide đầu tiên 
showSlides(slideIndex = 0);
function currentSlide(n) {
  showSlides(slideIndex = n);
}
var slideHot;
function actionSlides(){
    var i;
    var hots=document.getElementsByClassName("slide");
    var spans=document.getElementsByClassName("btn");
    for(i=0;i<hots.length;i++){
        hots[i].style.display="none";
    }
    for(i=0;i<spans.length;i++){
        spans[i].className=spans[i].className.replace("active","");
    }
    hots[slideHot].style.display="block";
    spans[slideHot].className+="active";
    slideHot++;
    if(slideHot>hots.length-1){
        slideHot=0;
    }
}
actionSlides(slideHot=0);
function slideNow(n){
    actionSlides(slideHot=n);
}