$(document).ready(function(){

  Parse.initialize('KbiojtFARJ6bWqwYq1jrzMD2hKdWEGQFvslr0jNs', 'Q7vZA4pflbvmZWNh7CReFxHdgWVbJgl09oa5NOeJ');

  $('#ContactForm').submit(function(e){
    e.preventDefault();

    var data = {
      name: document.getElementById('name').value,
      email: document.getElementById('email').value,
      message: document.getElementById('message').value
    }

    Parse.Cloud.run('sendEmail', data, {
      success: function(object) {
        $('#alert').html('Perfect! Your message has been sent.').addClass('alert-success').fadeIn('fast');
        $('.modal-wrapper').fadeOut('slow').removeClass('open-modal');
        $('#ContactForm input, #ContactForm textarea').val('');
      },

      error: function(object, error) {
        console.log(error);
        $('#alert').html('There was a small problem sending your message.').addClass('alert-danger').fadeIn('fast');
      }
    });
  });

});
