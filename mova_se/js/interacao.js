//carrossel 
$(document).ready(function(){
    $('#destaque').slick({
        dots:true,
        autoplay: true,
        autoplaySpeed: 3000,
        arrows: false

    });
});

//modal

var modalBtn = document.getElementById("modal");
const modal = document.querySelector(".modal-overlay");
const closeBtn = document.querySelector(".close-btn");

modalBtn.addEventListener("click", function () {
  modal.classList.add("open-modal");
});
closeBtn.addEventListener("click", function () {
  modal.classList.remove("open-modal");
});