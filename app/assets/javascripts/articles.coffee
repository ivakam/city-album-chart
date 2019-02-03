$(document).on 'turbolinks:load', ->
	if $('body').hasClass('articles show_article')
		$('.post-flag').click ->
			$('#report-form-container').toggleClass('modal-inactive')
			opacity = $('#opaque')
			opacity.css('background', 'rgba(0, 0, 0, 0.6')
			opacity.css('z-index', '5')
		
		$('.delete-article-confirm-btn').click ->
			data =
				article: 
					id: $('#report-article').val()
			$.post(window.location.href.replace(/\d+$/, '/articles/destroy'), data)
			.done( ->
				location.reload()
			)
			.fail( ->
				console.log('Error sending article data')
			)
		
		$('.delete-comment-confirm-btn').click ->
			data =
				article: 
					id: $('#comment-id').val()
			$.post(window.location.href.replace(/articles.+$/, 'comments/destroy'), data)
			.done( ->
				location.reload()
			)
			.fail( ->
				console.log('Error sending comment data')
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
					article_id: $('#report-article').val()
			$.post(window.location.href.replace(/\/articles.+/, '/upvotes/create'), data)
			.fail( ->
				console.log('Error sending post data')
			)
		
		$('.article-trash').click ->
			$('#article-delete-modal').toggleClass('modal-inactive')
			opacity = $('#opaque')
			opacity.css('background', 'rgba(0, 0, 0, 0.6')
			opacity.css('z-index', '5')
	
		$('.comment-trash').click ->
            id = $(this).closest('.comment').find('.comment-id').val()
            $('#comment-delete-modal').toggleClass('modal-inactive')
            $('#comment-id').attr('value', id)
            opacity = $('#opaque')
            opacity.css('background', 'rgba(0, 0, 0, 0.6')
            opacity.css('z-index', '5')
        
		$('.post-edit').click ->
			e = $(this)
			bodyText = e.closest('li').find('.edit-post')
			btn = e.closest('li').find('.post-text input')
			headerIcon = e.closest('li').find('.header-icons')
			bodyText.toggleClass('active')
			headerIcon.toggleClass('padded')
			if bodyText.attr('contenteditable') == 'false'
				bodyText.attr('contenteditable', 'true')
			else
				bodyText.attr('contenteditable', 'false')
			btn.toggleClass('transparent')
		
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