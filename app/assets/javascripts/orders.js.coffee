# NEW ORDER WAIT 
$ ->	
	$("#new_order").submit ->
		$("a#inquirycancel").hide()
		$("input#inquirysubmit").replaceWith('<div class="btn-modal btn-custom-disabled">Please wait...</div>');
		true

# NEW ARTWORK IMAGE WAIT
$ ->  
  $("#new_artwork_image").submit ->
    $("a#newimagecancel").hide()
    $("input#newimagesubmit").replaceWith('<div class="btn-modal btn-custom-disabled">Uploading. Please wait...</div>');
    true


# PRICE CHECKER INITIAL CHECK
$ ->
  $("#inquirybutton").click ->
    price = $("#pricevalue").text().substring(1)
    $("#inquirybutton").val(price)
    $("#requestedprice").val(price)
    if price <= 0 || !(intRegex.test(str))   
      $("#requestedprice").val('No free lunch. No free art.')
      $("input#inquirysubmit").hide();
      $("#messageTooLong").show();
    else
      $("#messageTooLong").hide();
      $("input#inquirysubmit").show();

$ ->
  $("#requestedprice").change ->
    intRegex = /^\d+$/;
    str = $('#requestedprice').val();
    price = parseInt($("#requestedprice").val(), 10)
    if price <= 0 
      $("#requestedprice").val('No free lunch. No free art.')
      $("input#inquirysubmit").hide();
      $("#messageTooLong").show();
    else if !(intRegex.test(str))   
      $("#requestedprice").val('Hmmm, sure that\'s a number?...')
      $("input#inquirysubmit").hide();
      $("#messageTooLong").show();
    else
      $("#messageTooLong").hide();
      $("input#inquirysubmit").show();


# CHARACTER COUNTER
(($) ->
  $.fn.charCount = (options) ->
    
    # default configuration properties
    calculate = (obj) ->
      count = $(obj).val().length
      available = options.allowed - count
      if available <= options.warning and available >= 0
        $(obj).next().addClass options.cssWarning
      else
        $(obj).next().removeClass options.cssWarning
      if available < 0
        $(obj).next().addClass options.cssExceeded
        $("a#inquirycancel").hide()
        $("input#inquirysubmit").hide();
        $("#messageTooLong").show();
      else
        $(obj).next().removeClass options.cssExceeded
        $("#messageTooLong").hide();
        $("a#inquirycancel").show()
        $("input#inquirysubmit").show();
      $(obj).next().html options.counterText + available
    defaults =
      allowed: 400
      warning: 50
      css: "counter"
      counterElement: "span"
      cssWarning: "warning"
      cssExceeded: "exceeded"
      counterText: "Characters left: "

    options = $.extend(defaults, options)
    @each ->
      $(this).after "<" + options.counterElement + " class=\"" + options.css + "\">" + options.counterText + "</" + options.counterElement + ">"
      calculate this
      $(this).keyup ->
        calculate this

      $(this).change ->
        calculate this

      
) jQuery

$(document).ready ->
 	$("#messagecontent").charCount
	    allowed: 400
	    warning: 50
	    counterText: "Characters left: "



# jQuery ->
#   Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
#   order.setupForm()

# order =
#   setupForm: ->
#     $('#new_order').submit ->
#       $('input[type=submit]').attr('enabled', true)
#       if $('#card_number').length
#         order.processCard()
#         false
#       else
#         true
  
#   processCard: ->
#     card =
#       number: $('#card_number').val()
#       cvc: $('#card_code').val()
#       expMonth: $('#card_month').val()
#       expYear: $('#card_year').val()
#     Stripe.createToken(card, order.handleStripeResponse)
  
#   handleStripeResponse: (status, response) ->
#     if status == 200
#       $('#order_stripe_card_token').val(response.id)
#       $('#new_order')[0].submit()
#     else
#       $('#stripe_error').text(response.error.message)
#       $('input[type=submit]').attr('disabled', false)
