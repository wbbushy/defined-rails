$(document).ready(bindEvents)

function bindEvents() {
  showSignUp()
  showSignIn()
}

function showSignUp() {
  $('#create-account').click( function() {
    $('#signup').css({'display': 'block'})
    hideSignIn()
  })
}

function hideSignIn() {
  $('#signin').css({'display': 'none'})
}

function showSignIn() {
  $('#already-member').click( function() {
    $('#signin').css({'display': 'block'})
    hideSignUp()
  })
}

function hideSignUp() {
  $('#signup').css({'display': 'none'})
}
