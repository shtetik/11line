$ ->
  $('.js-menu-btn').on 'click', ->
    $('#js-menu').toggleClass('menu__list--open')

  $('.menu__list__item__link').on 'click', ->
    $('#js-menu').removeClass('menu__list--open')
