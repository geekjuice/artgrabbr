$ ->
	$(".banner-holder").bind "click", ->
		bannerID =  $(this).attr("id")
		if $("#" + bannerID + "-inquiry").is(':visible') == false
			$("#" + bannerID + "-inquiry").slideDown 300
		else
			$("#" + bannerID + "-inquiry").slideUp 300

$ ->		
	$("#showall").click ->
		$(".multi-inquiries").slideDown 300

	$("#hideall").click ->
		$(".multi-inquiries").slideUp 300
