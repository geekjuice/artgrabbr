jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  order.setupForm()

order =
  setupForm: ->
    $('#new_order').submit ->
      $('input[type=submit]').attr('enabled', true)
      if $('#card_number').length
        order.processCard()
        false
      else
        true
  
  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, order.handleStripeResponse)
  
  handleStripeResponse: (status, response) ->
    if status == 200
      $('#order_stripe_card_token').val(response.id)
      $('#new_order')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)
