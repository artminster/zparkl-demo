(function($){
	$.fn.zparklpost = function(options) {
		$.data('zparklpost', new ZparklPost(options, $(this)));
	};

	var ZparklPost = function(options, element) {
		this.element = element;
		this.settings = $.extend(true, {}, ZparklPost.settings, options);
		this._init();
	};
	
	var formatDate = function(date) {
		return date.toDateString() +' at '+ date.toLocaleTimeString();
	};

	ZparklPost.settings = {
	    openDelay: 1000,
	    delayBetweenElements: 250,
	    numberInitialComments: 10,
	    delayBetweenComments: 150,
	    csrfmiddlewaretoken: $('input[name="csrfmiddlewaretoken"]').val()
	};

	ZparklPost.prototype = {
		_init: function() {
			this._openInitialClosedElements();
			this._initComments();
		},
		
		_openInitialClosedElements: function() {
			var self = this;
			var timing = self.settings.openDelay;
			this.element.find('.start-closed').each(function(index, element){
				var elementTiming = timing; 
				setTimeout(function(){ $(element).removeClass('start-closed'); }, elementTiming);
				timing += self.settings.delayBetweenElements;
			});		
		},
		
		_initComments: function() {
			var self = this;
			var comments = this.settings.comments;
			var total = comments.length;
			var nic = this.settings.numberInitialComments;
			var initial = total > nic ? total-nic : 0;
			for(var i=initial; i<total; i++)
				this._generateCommentHtml(comments[i]);
			this._generateNewCommentBox();

			var timing = self.settings.openDelay;
			this.element.find('.post-comment.closed, .post-new-comment.closed').each(function(index, element){
				var commentTiming = timing;
				setTimeout(function(){ $(element).removeClass('closed'); }, commentTiming);
				timing += self.settings.delayBetweenComments;
			});
		},
		
		_generateCommentHtml: function(comment) {
			var date = new Date(comment.fields.created);
			var container = this.element.find('.post-comments');
			var content = $(
				'<div class="post-comment closed">'+
				'	<img class="post-comment-image" src="'+ comment.fields.user.profile_image +'" alt="'+ comment.fields.user.name +'"/>'+
				'	<div class="post-comment-text">'+ comment.fields.text.replace(/\n/g, "<br />") +'</div>'+
				'	<div class="post-comment-info">'+
				'		<a class="post-comment-user">'+ comment.fields.user.name +'</a> on '+
				'		<span class="post-comment-date">'+ formatDate(date) +'</span>'+
				'	</div>'+
				'</div>'
			);
		 	container.append(content);
			return content;
		},
		
		_generateNewCommentBox: function() {
			var self = this;
			var content = $( 
				'<div class="post-new-comment closed">'+
				'	<textarea class="post-new-comment-textarea" placeholder="Write your comment"></textarea>'+
				'	<div class="post-new-comment-actions">'+
				'		<a href="#post-comment" class="post-comment-button btn btn-primary">Post comment</a>'+
				'	</div>'+
				'</div>'
			);
			content.insertAfter(this.element.find('.post-comments'));
			
			var input = content.find('.post-new-comment-textarea');
			input.focus(function(){ $(this).autosize(); });
			content.find('.post-comment-button').click(function(e){
				e.preventDefault();
				var value = $(input).val();
				if(value && !$(this).data('loading')) {
					var button = $(this);
					var label = $(this).html();
					$(this).html('<i class="fa fa-spinner fa-spin"></i> Saving');
					$(this).data('loading', true);
					$.ajax({
						type: 'POST',
						dataType: 'json',
						url: self.settings.POST_COMMENT_URL,
						data: {
							csrfmiddlewaretoken: self.settings.csrfmiddlewaretoken,
							text: value
						},
						success: function(data) {
							var comment = data[0];
							self.settings.comments.push(comment);
							var commentContent = self._generateCommentHtml(comment);
							setTimeout(function(){ commentContent.removeClass('closed'); }, 
								self.settings.delayBetweenComments);
							input.val('');
							input.trigger('autosize.resize');
						},
						complete: function() {
							$(button).html(label);
							$(button).data('loading', false);
						},
						error: function() {
							// SINCE THIS IS JUST AN EXAMPLE I'M NOT WRITING THE CHECKING CODE....
						}
					});
				}
			});
		}

	};	
})(jQuery);