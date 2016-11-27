<theoryList>
	<theory each={ theories } data={ this }></theory>

	<script type="text/javascript">
		this.theories = theoriesModel.getTheories();

		theoriesModel.on("change", function () {
			this.update();
		}.bind(this));
	</script>
</theoryList>