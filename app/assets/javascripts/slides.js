var carosuel = $('.carosuel').slick({
  slidesToShow: 3,
  slidesToScroll: 1,
  autoplay: true,
  autoplaySpeed: 4500,
});

window.onload = () => {
  carosuel()
}