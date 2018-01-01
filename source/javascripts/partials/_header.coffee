$ ->
  # Scroll header animations
  colors =
    '#studio'    : '#a89494'
    '#directions': '#c6ada3'
    '#methods'   : '#a1aeb2'
    '#teacher'   : '#849aaf'
    '#contacts'  : '#656d7f'

  controller = new ScrollMagic.Controller

  for id, color of colors
    new ScrollMagic.Scene(triggerElement: id, offset: -100, duration: 100)
      .triggerHook(0)
      .setTween(TweenMax.to('.js-tween *', 1, { fill: color }))
      .addTo(controller)


  # Header menu open/close
  $('.js-menu-btn').on 'click', ->
    $('#js-menu').toggleClass('menu__list--open')

  $('.menu__list__item__link').on 'click', ->
    $('#js-menu').removeClass('menu__list--open')
