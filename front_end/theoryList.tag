<theoryList>
	<theory each={ theories } data={ this } class="theory"></theory>

	<script type="text/javascript">
		this._sortTheories = function () {
			this.theories = _.sortBy(this.theories, function (theory) {
				return -(theory.upvotesCount + theory.downvotesCount);
			}.bind(this));
		};

		this._updateTheories = function () {
			this.theories = theoriesModel.getTheories();
			this._sortTheories();
			this.update();
		};

		theoriesModel.on("change", function () {
			this._updateTheories();
		}.bind(this));

		this._updateTheories();
	</script>
</theoryList>