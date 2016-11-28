<newTheory>
	<div ref="test">Add your latest theory:</div>
	<form>
		<div class="new-theory-line">
			<div>Your Theory:</div>
			<textarea ref="content" class="new-theory-content"></textarea>
		</div>
		<div class="new-theory-line">
			<div>Who's theory is this?</div>
			<input type="text" ref="authorName">
		</div>
		<div class="button" onclick={ add }>Add</div>
	</form>

	<script type="text/javascript">
		this.add = function (e) {
			e.preventDefault();
			var newTheory = {};
			newTheory.content = this.refs.content.value;
			newTheory.authorName = this.refs.authorName.value;
			newTheory.upvotesCount = 0;
			newTheory.downvotesCount = 0;
			console.log(newTheory);
			theoriesModel.addTheory(newTheory);
		}.bind(this);
	</script>
</newTheory>