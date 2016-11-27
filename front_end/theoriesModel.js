function TheoriesModel() {
	// Makes TheoriesModel an event emitter.
	riot.observable(this);

	this._theories = [
		{ 
			id: 1,
			content: "Arnold is not real",
			authorName: "Sarah",
			upvotesCount: 100,
			downvotesCount: 300
		},
		{ 
			id: 2,
			content: "Ms. Hayes is also a host",
			authorName: "Tebo",
			upvotesCount: 500,
			downvotesCount: 100
		},
		{ 
			id: 3,
			content: "Maeve will escape",
			authorName: "Gerry",
			upvotesCount: 900,
			downvotesCount: 600
		},
	];
}

TheoriesModel.prototype = {
	getTheories: function () {
		return this._theories;
	},
	getTheoryById: function (id) {
		for (var i = 0; i < this._theories.length; i++) {
			var theory = this._theories[i];
			if (theory.id == id) {
				return theory;
			}
		}
	},
	notifyTheoryChange: function (theory) {
		this.trigger("change");
	}
};

var theoriesModel = new TheoriesModel();
