$(document).on('turbolinks:load', function() {
  $fill_star = $('input[name="review[rate]"]');
  $('.starrr').starrr();

  function rate() {
    $fill_star.hide();
    $('#stars').on('starrr:change', function(e, value) {
      e.preventDefault();
      $fill_star.val(value);
    });
  }
  rate();
  $(function() {
    $('.review-item').slice(0, 4).show();
    $('#loadMore').on('click', function(e) {
      e.preventDefault();
      $('.review-item:hidden').slice(0, 4).slideDown();
      if ($('.review-item:hidden').length == 0) {
        $('#loadMore').fadeOut('slow');
      }
      $('html,body').animate({
        scrollTop: $(this).offset().top
      }, 1500);
    });
  });
  $('a[href="#top"]').click(function() {
    $('body,html').animate({
      scrollTop: 0
    }, 600);
    return false;
  });
  $(window).scroll(function() {
    if ($(this).scrollTop() > 50) {
      $('.totop').fadeIn();
      $('.totop a').fadeIn();
    } else {
      $('.totop').fadeOut();
      $('.totop a').fadeOut();
    }
  });

  function isEmpty(el) {
    return !$.trim(el.html())
  }
  if (isEmpty($('.no-rating'))) {
    $('.no-rating').hide();
  }
  $('[data-toggle="tooltip"]').tooltip();
});
