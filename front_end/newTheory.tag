<newTheory>
	<div>Add your latest theory:</div>
	<form onsubmit={ add }>
		<div>
			<div>Your Theory:</div>
			<input type="text" ref="content">
		</div>
		<div>
			<div>Who's theory is this?</div>
			<input type="text" ref="authorName">
		</div>
		<button type="submit">Add</button>
	</form>

	<script type="text/javascript">

		this.on("mount", function () {
			// console.log(this.refs.test.value)
			
		}.bind(this))

		this.add = function (e) {
			e.preventDefault();
			console.log(this.refs.content.value);
			console.log(this.refs.authorName.value);
		}.bind(this);
	</script>
</newTheory>