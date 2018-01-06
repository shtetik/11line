$ ->
  # Scroll bottom button
  controller = new ScrollMagic.Controller

  new ScrollMagic.Scene(triggerElement: $('#main'), offset: 0, duration: 80)
    .triggerHook(0)
    .setTween(TweenMax.fromTo('.js-arrow', 1, { opacity: 1 }, { opacity: 0 }))
    .addTo(controller)
    .on 'leave', ->
      $('.js-arrow').addClass('arrow--hide')
    .on 'enter', ->
      $('.js-arrow').removeClass('arrow--hide')

  $('.js-arrow').on 'click', ->
    TweenMax.to(window, 1, { scrollTo: { y: $('#main').height() }, ease: Expo.easeOut })
