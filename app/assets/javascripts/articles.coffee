$(document).on 'turbolinks:load', ->
	if $('body').hasClass('articles show_article')
		$('.edit-submit-btn').click ->
			setTimeout( ->
				location.reload()
			, 500)
		
		$('.article-flag').click ->
			$('#report-form-container').toggleClass('modal-inactive')
			$('#report-type').attr('value', 'article')
			id = $('#report-article').val()
			$('#report-target').attr('value', id)
			opacity = $('#opaque')
			opacity.css('background', 'rgba(0, 0, 0, 0.6')
			opacity.css('z-index', '5')
		
		$('.comment-flag').click ->
            $('#report-form-container').toggleClass('modal-inactive')
            $('#report-type').attr('value', 'comment')
            id = $(this).closest('.comment').find('.comment-id').val()
            $('#report-target').attr('value', id)
            opacity = $('#opaque')
            opacity.css('background', 'rgba(0, 0, 0, 0.6')
            opacity.css('z-index', '5')
			
		$('.delete-article-confirm-btn').click ->
			data =
				article: 
					article_id: $('#report-article').val()
			$.post(window.location.href.replace(/\d+$/, 'destroy'), data)
			.done( ->
				location.reload()
			)
			.fail( ->
				console.log('Error sending article data')
			)
		
		$('.delete-comment-confirm-btn').click ->
			data =
				comment: 
					comment_id: $('#comment-id').val()
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
					target_id: $('#report-article').val()
					upvote_type: 'article'
			$.post(window.location.href.replace(/\/articles.+/, '/upvotes/create'), data)
			.fail( ->
				console.log('Error sending post data')
			)
			
		$('.comment-heart').click ->
			e = $(this)
			id = e.closest('.comment').find('.comment-id').val()
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
					target_id: id
					upvote_type: 'comment'
			$.post(window.location.href.replace(/\/articles.+/, '/upvotes/create'), data)
			.fail( ->
				console.log('Error sending post data')
			)
			
		$('.article-bell').click ->
			e = $(this)
			id = $('#article-id').val()
			e.toggleClass('green')
			data =
				subscription:
					target_id: id
					subscription_type: 'Article'
			$.post(window.location.href.replace(/\/articles.+/, '/subscriptions/create'), data)
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
        
		$('.comment-edit').click ->
			e = $(this)
			id = e.closest('.comment').find('.comment-id').val()
			bodyText = e.closest('.comment').find('.comment-markdown').val()
			$('#edit-comment-id').attr('value', id)
			commentContent.value(bodyText)
			$('#edit-comment-form-container').toggleClass('modal-inactive')
			opacity = $('#opaque')
			opacity.css('background', 'rgba(0, 0, 0, 0.6')
			opacity.css('z-index', '5')
			
		$('.article-edit').click ->
			e = $(this)
			id = e.closest('.article').find('#article-id').val()
			bodyText = e.closest('.article').find('#article-markdown').val()
			$('#edit-article-id').attr('value', id)
			articleContent.value(bodyText)
			$('#edit-article-form-container').toggleClass('modal-inactive')
			opacity = $('#opaque')
			opacity.css('background', 'rgba(0, 0, 0, 0.6')
			opacity.css('z-index', '5')
		
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
		