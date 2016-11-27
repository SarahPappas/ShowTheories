<theoryList>
	<theory each={ theories } data={ this }></theory>

	<script type="text/javascript">
		this._sortTheories = function () {
			return _.sortBy(this.theories, function (theory) {
				return -(theory.upvotesCount + theory.downvotesCount);
			}.bind(this));
		};

		this.theories = theoriesModel.getTheories();
		this.theories = this._sortTheories();

		theoriesModel.on("change", function () {
			this.theories = theoriesModel.getTheories();
			
			this.theories = this._sortTheories();

			this.update();
		}.bind(this));
	</script>
</theoryList>