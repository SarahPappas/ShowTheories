<theory>
	<div>{ opts.data.content }</div>
	<div>{ opts.data.authorName }</div>
	<div>{ opts.data.upvotesCount }</div>
	<button onclick={ upvote }>upvote</button>
	<div>{ opts.data.downvotesCount }</div>
	<button onclick={ downvote }>downvote</button>

	<script type="text/javascript">
		this.upvote = function (e) {
			e.preventUpdate = true;
			var theory = theoriesModel.getTheoryById(opts.data.id);
			theory.upvotesCount++;
			theoriesModel.updateTheory(theory);
		};

		this.downvote = function (e) {
			e.preventUpdate = true;
			var theory = theoriesModel.getTheoryById(opts.data.id);
			theory.downvotesCount++;
			theoriesModel.updateTheory(theory);
		};
	</script>
</theory>