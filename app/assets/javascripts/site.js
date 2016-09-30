$(document).on('turbolinks:load', function(){
  $('.img-zoom').elevateZoom({
    zoomType: "lens",
    lensShape: "round",
    lensSize: 180,
    scrollZoom: true,
    lensFadeIn: 800,
    lensFadeOut: 800
  });
  $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
  $('.rated').raty({ path: '/assets',
  readOnly: true,
  score: function() {
    return $(this).attr('data-score');
  }
});
});
