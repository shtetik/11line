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

  isCanOpenWhenHover = false
  scrollPosition = 0

  closeMenu = ->
    $('#js-menu').removeClass('menu__list--open')

  openMenu = ->
    $('#js-menu').addClass('menu__list--open')

  toggleMenu = ->
    $('#js-menu').toggleClass('menu__list--open')

  setScrollPosition = ->
    scrollPosition = $(window).scrollTop()

  # Header menu open/close
  $('.js-menu-btn').on 'click', ->
    isCanOpenWhenHover = false
    toggleMenu()

  $('.js-menu-btn--hoverable').on 'mouseenter', ->
    if isCanOpenWhenHover
      setScrollPosition()
      openMenu()

  $('.js-menu-btn--hoverable').on 'mouseover', ->
    isCanOpenWhenHover = true

  $('.menu__list__item__link').on 'click', ->
    closeMenu()

  $(window).on 'scroll', ->
    scroll = $(window).scrollTop()
    screenHeight = $(window).height()
    if Math.abs(scroll - scrollPosition) > screenHeight / 2
      isCanOpenWhenHover = true
      setScrollPosition()
      closeMenu()
