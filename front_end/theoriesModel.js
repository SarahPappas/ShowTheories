function TheoriesModel() {
	// Makes TheoriesModel an event emitter.
	riot.observable(this);

	this._theories = [
		{ 
			content: "Arnold is not real",
			authorName: "Sarah",
			upvotesCount: 100,
			downvotesCount: 300
		},
		{ 
			content: "Ms. Hayes is also a host",
			authorName: "Tebo",
			upvotesCount: 500,
			downvotesCount: 100
		},
		{ 
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
	}
};

var theoriesModel = new TheoriesModel();
