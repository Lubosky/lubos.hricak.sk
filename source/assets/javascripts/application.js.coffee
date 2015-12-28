#= require jquery

# NAVIGATION ON HOMEPAGE
$(document).ready ->
  if location.pathname == '/'
    $('nav').addClass 'home'

# STICKY BUTTON
$(document).scroll ->
  y = $(this).scrollTop()
  if y > 320
    $('html').addClass 'scrolled'
  else
    $('html').removeClass 'scrolled'

# OPEN MOBILE NAVIGATION
$ ->
  $('nav .mobile_menu_btn a, nav.mobile_menu .close').click ->
    $('body').toggleClass 'show_mobile_nav'
$ ->
  $('[data-nav-toggle]').click ->
    $('html').toggleClass 'nav-expanded'

# OPEN CATEGORY DROPDOWN
$ ->
  $('#category_dd').click ->
    $('.wrapper-dropdown').toggleClass 'active'

# OPEN CONTACT FORM
$(document).ready ->
  $('.trigger-modal').click ->
    $('html').removeClass 'nav-expanded'
    setTimeout (->
      $('.modal-wrapper').fadeIn(200).addClass 'open-modal'), 300

# CLOSE CONTACT FORM
$(document).ready ->
  $('.modal-close').click ->
    $('.modal-wrapper').fadeOut().removeClass 'open-modal'
    $('input, textarea').val ''

# CLOSE CONTACT FORM 'ESC'
$(document).keyup (e) ->
  if e.keyCode == 27
    $('.modal-wrapper').fadeOut().removeClass 'open-modal'
    $('input, textarea').val ''
