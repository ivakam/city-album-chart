$(document).on 'turbolinks:load', ->
	if $('body').hasClass('forum_threads show')
		$('.post-flag').click ->
			e = $(this)
			id = e.closest('li').find('.post-id').val()
			$('#report-target').attr('value', id)
			$('#report-form-container').toggleClass('modal-inactive')
			opacity = $('#opaque')
			opacity.css('background', 'rgba(0, 0, 0, 0.6')
			opacity.css('z-index', '13')
			
		$('.edit-submit-btn').click ->
			setTimeout( ->
				location.reload()
			, 500)
			
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
					upvote_type: 'Post'
					target_id: $(this).closest('li').find('.post-id').val()
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
			opacity.css('z-index', '13')
			
		$('.post-edit').click ->
			e = $(this)
			id = e.closest('li').find('.post-id').val()
			bodyText = e.closest('li').find('.post-markdown').val()
			$('#edit-id').attr('value', id)
			editContent.value(bodyText)
			$('#edit-form-container').toggleClass('modal-inactive')
			opacity = $('#opaque')
			opacity.css('background', 'rgba(0, 0, 0, 0.6')
			opacity.css('z-index', '13')
			
		$('.post-text input').click ->
			e = $(this)
			bodyText = e.closest('li').find('.edit-post').html().replace(/\<\/div\>/g, '\n')
			bodyText = bodyText.replace(/\<div\>|\<br\>/g, '')
			data =
				post: 
					thread_id: $('#report-thread').val()
					id: e.closest('li').find('.post-id').val()
					body: bodyText
			$.post(window.location.href.replace(/\/forum.+/, '/posts/update'), data)
			.success( ->
				location.reload()
			)
			.fail( ->
				console.log('Error sending post data')
			)
		
		$('.post-bell').click ->
			e = $(this)
			id = threadId
			e.toggleClass('green')
			data =
				subscription:
					target_id: id
					subscription_type: 'ForumThread'
			$.post(window.location.href.replace(/\/forum.+/, '/subscriptions/create'), data)
			.fail( ->
				console.log('Error sending post data')
			)
			
		$('.thread-pin').click ->
			e = $(this)
			id = threadId
			e.toggleClass('green')
			data =
				thread:
					thread_id: id
			$.post(window.location.href.replace(/\/forum.+/, '/thread/toggle-pinned'), data)
			.fail( ->
				console.log('Error sending post data')
			)