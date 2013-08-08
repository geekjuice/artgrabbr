# # PAGINATION BASIC
# $ ->
#   $(".pagination a").live "click", ->
#     $.setFragment page: $.queryString(@href).page
#     false

#   $.fragmentChange true
#   $(document).bind "fragmentChange.page", ->
#     $.getScript $.queryString(document.location.href,
#       page: $.fragment().page
#     )

#   $(document).trigger "fragmentChange.page"  if $.fragment().page



# # FADE IN FLOOD/LOAD
# thumbStartDelay = 500
# thumbDelay = 150
# thumbInterval = 8

# thumbFadeIn = ->
# 	$divs = $(".span6")
# 	$count = $divs.length
# 	$divs.delay(thumbStartDelay).each (i) ->
# 			$(this).delay(i * thumbDelay).fadeIn(200)

# pageBottom = (delayTime) ->
# 	$("#paginateBottom").delay(delayTime).fadeIn(500)

# $ ->	
# 	$(".span6").hide()
# 	$("#paginateTop").hide()
# 	$("#paginateBottom").hide()
# 	$("#paginateTop").fadeIn(500)
# 	thumbFadeIn()
# 	pageBottom(thumbStartDelay+thumbInterval*thumbDelay)

