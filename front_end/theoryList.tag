<theoryList class="theories { hidden: isHidden }">
	<theory each={ theories } data={ this } class="theory"></theory>

	<script type="text/javascript">
		this.isHidden = activeViewModel.isHidden("theoryList");

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

		theoriesModel.on("error", function (errorMsg) {
			window.alert("Unfortunately there has been an error: " + errorMsg);
		});

		theoriesModel.on("change", function () {
			this._updateTheories();
		}.bind(this));

		activeViewModel.on("viewChange", function() {
			this.isHidden = activeViewModel.isHidden("theoryList");
			this.update();
			console.log("theoryList hidden?", this.isHidden);
		}.bind(this));

		this._updateTheories();
	</script>
</theoryList>