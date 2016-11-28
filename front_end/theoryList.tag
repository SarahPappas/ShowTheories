<theoryList>
	<theory each={ theories } data={ this } class="theory"></theory>

	<script type="text/javascript">
		this._sortTheories = function () {
			this.theories = _.sortBy(this.theories, function (theory) {
				return -(theory.upvotesCount + theory.downvotesCount);
			}.bind(this));
		};

		this._updateTheories = function () {
			console.log(theoriesModel.getTheories());
			this.theories = theoriesModel.getTheories();
			this._sortTheories();		
		};

		theoriesModel.on("change", function () {
			this._updateTheories();
			this.update();
		}.bind(this));

		this._updateTheories();
	</script>
</theoryList>