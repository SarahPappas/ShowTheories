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
	getTheories: function () {
		this._httpRequest("GET", "http://localhost:3000/theories")
			.then(function (response) {
				this._theories = _.cloneDeep(JSON.parse(response));
				}.bind(this))
			.then(function () {
				return _.cloneDeep(this._theories);
				}.bind(this));
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
	},
	_httpRequest: function (method, url, body) {
		return new Promise(function (resolve, reject) {
			var request = new XMLHttpRequest();
	
			request.addEventListener("load", function () {
				resolve(request.responseText);
			}.bind(this));
	
			request.addEventListener("error", function (err) {
				console.log(err);
				reject(err);
			});
	
			request.open(method, url);
			request.send(body);
		});
	}
};

var theoriesModel = new TheoriesModel();
