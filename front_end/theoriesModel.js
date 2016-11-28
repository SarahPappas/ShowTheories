function TheoriesModel() {
	// Makes TheoriesModel an event emitter.
	riot.observable(this);

	this._theories = [
		{ 
			id: 1,
			content: "Arnold is not real",
			authorName: "Sarah",
			upvotesCount: 10,
			downvotesCount: 5
		},
		{ 
			id: 2,
			content: "Charolette Hale is also a host",
			authorName: "Tebo",
			upvotesCount: 3,
			downvotesCount: 7
		},
		{ 
			id: 3,
			content: "Maeve will escape",
			authorName: "Gerry",
			upvotesCount: 1,
			downvotesCount: 14
		},
	];
}

TheoriesModel.prototype = {
	getTheories: function (method, url) {
		var request = new XMLHttpRequest();
		request.addEventListener("load", function () {
			this._theories = _.cloneDeep(request.responseText);
			// return _.cloneDeep(this._theories);
			// this.trigger("change");
		}.bind(this));

		request.addEventListener("error", function (err) {
			console.log(err)
		});

		request.open(method, url);
		request.send();

		return _.cloneDeep(this._theories);
	},
	getTheoryById: function (id) {
		return _.cloneDeep(this._getTheoryById(id));
	},
	updateTheory: function (theory) {
		var index = this._getTheoryIndexById(theory.id);
		this._theories[index] = _.cloneDeep(theory);
		this.trigger("change");
	},
	addTheory: function (theory) {
		this._theories.push(_.cloneDeep(theory));
		this.trigger("change");
	},
	_getTheoryById: function (id) {
		var index = this._getTheoryIndexById(id);
		return this._theories[index];
	},
	_getTheoryIndexById: function (id) {
		for (var i = 0; i < this._theories.length; i++) {
			var theory = this._theories[i];
			if (theory.id == id) {
				return i;
			}
		}
	}
};

var theoriesModel = new TheoriesModel();
