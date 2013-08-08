# Auto-scroll pagination
$(window).scroll ->
	url = $('.pagination .next a').attr('href')
	if url && $(window).scrollTop() > $(document).height() - $(window).height() - 100
		$('.pagination').replaceWith('<nav class="pagination">
		<div id="loading">Fetching more artwork...</div>
		</nav>')
		$('.pagination').fadeOut(500)
		$.getScript(url)

# # JSON sort (broken)
# $ ->
# 	$('.btnsort').click ->
# 		url = $(this).attr('href')
# 		$.getScript(url)

