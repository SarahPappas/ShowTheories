<newTheory>
	<div ref="test">Add your latest theory:</div>
	<form onsubmit={ add }>
		<div class="new-theory-line">
			<div>Your Theory:</div>
			<textarea ref="content" class="new-theory-content"></textarea>
		</div>
		<div class="new-theory-line">
			<div>Who's theory is this?</div>
			<input type="text" ref="authorName">
		</div>
		<div type="submit new-theory-line" class="button">Add</div>
	</form>

	<script type="text/javascript">

		this.add = function (e) {
			e.preventDefault();
			var content = this.refs.content.value;
			var author = this.refs.authorName.value;
		}.bind(this);
	</script>
</newTheory>