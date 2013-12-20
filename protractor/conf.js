exports.config = {
	seleniumAddress: 'http://localhost:4445/wd/hub',

	capabilities: {
		'browserName': 'firefox'
	},

	specs: ['example_spec.js'],

	jasmineNodeOpts: {
		showColors: true,
		defaultTimeoutInterval: 30000
	}
};
