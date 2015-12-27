#= require jquery

# NAVIGATION ON HOMEPAGE
$(document).ready ->
  if location.pathname == '/'
    $('nav').addClass 'home'

# OPEN MOBILE NAVIGATION
$ ->
  $('nav .mobile_menu_btn a, nav.mobile_menu .close').click ->
    $('body').toggleClass 'show_mobile_nav'
$ ->
  $('[data-nav-toggle]').click ->
    $('html').toggleClass 'nav-expanded'