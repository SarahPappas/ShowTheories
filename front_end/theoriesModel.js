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
