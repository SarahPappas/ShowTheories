<theoryList>
	<theory each={ theories } data={ this } class="theory"></theory>

	<script type="text/javascript">
		this._sortTheories = function () {
			this.theories = _.sortBy(this.theories, function (theory) {
				return -(theory.upvotesCount + theory.downvotesCount);
			}.bind(this));
		};

		this._updateTheories = function () {
			return new Promise(function (resolve, reject) {
				theoriesModel.getTheories()
					.then(function (response) {
						return this.theories = response;
						}.bind(this))
					.then(function () {
						this._sortTheories();
						}.bind(this))
					.then(function () {
						this.update();
					}.bind(this));
			}.bind(this));
		};

		theoriesModel.on("change", function () {
			this._updateTheories()
				.then(function () {
					console.log("here");
					return this.update();
				}.bind(this));
		}.bind(this));

		this._updateTheories();
	</script>
</theoryList>