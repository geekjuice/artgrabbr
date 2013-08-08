# Dropdown Signin Fix
$ ->
  $(".dropdown form").on "click", (e) ->
    e.stopPropagation()


$ ->
	$(".alert").delay(4000).slideUp(500, 'swing')

$ ->
	$('#noticetag').tooltip({
		'title':'Welcome to the beta site for Artgrabbr! We hope you enjoy the site and enjoy the art even more. For our beta launch, we are currently only operating in New York. In addition, I (the developer) apologize for any bugs or issues with the site. If you find any, please report them to support@artgrabbr.com and I will work ASAP to fix them. Thank you again for supporting Artgrabbr!',
		'placement':'right'
		})

$ ->
	$('#messagetip').tooltip({
		'title':'Include available dates and times for possible pickup. Curious about the details regarding the art? Try asking here and hopefully the artist is willing to elaborate.',
		'placement':'right'
		})

$ ->
	$('#pricetip').tooltip({
		'title':'Lowball, Highball? If there are a lot of requests, consider paying more than the suggested price to entice the artist to sell to you.',
		'placement':'right'
		})

$ ->
	$('#closenotice').click ->
		$('#noticebanner').animate
			opacity: 0
		, 350, ->
			$('#noticebanner').remove()

# $ ->
# 	$("#noticebanner").delay(10000).animate({'opacity': '0'}, 500, ->
# 		$('#noticebanner').remove()
# 		)
