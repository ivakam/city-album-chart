$(document).on 'turbolinks:load', ->
	if $('body').hasClass('forum_threads show')
		$('.post-flag').click ->
			e = $(this)
			id = e.closest('li').find('.post-id').val()
			$('#report-post').attr('value', id)
			$('#report-form-container').toggleClass('modal-inactive')
			opacity = $('#opaque')
			opacity.css('background', 'rgba(0, 0, 0, 0.6')
			opacity.css('z-index', '5')
		$('.delete-confirm-btn').click ->
			data =
				post: 
					thread_id: $('#report-thread').val()
					id: $('#delete-post-id').val()
			$.post(window.location.href.replace(/\/forum.+/, '/posts/destroy'), data)
			.done( ->
				location.reload()
			)
			.fail( ->
				console.log('Error sending post data')
			)
		$('.post-heart').click ->
			e = $(this)
			e.toggleClass('red')
			if e.hasClass('red')
				heart = e.parent().find('.heart-animation')
				e.toggleClass('expanded')
				heart.toggleClass('hidden')
				heart.toggleClass('animated')
				setTimeout( ->
					e.toggleClass('expanded')
				, 250)
				setTimeout( ->
					heart.toggleClass('hidden')
					heart.toggleClass('animated')
				, 1250)
			data =
				upvote: 
					thread_id: $('#report-thread').val()
					post_id: $(this).closest('li').find('.post-id').val()
			$.post(window.location.href.replace(/\/forum.+/, '/upvotes/create'), data)
			.fail( ->
				console.log('Error sending post data')
			)
		$('.post-trash').click ->
			id = $(this).closest('li').find('.post-id').val()
			$('#delete-post-id').attr('value', id)
			$('.delete-modal').toggleClass('modal-inactive')
			opacity = $('#opaque')
			opacity.css('background', 'rgba(0, 0, 0, 0.6')
			opacity.css('z-index', '5')
