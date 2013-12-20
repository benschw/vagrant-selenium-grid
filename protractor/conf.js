exports.config = {
	seleniumAddress: 'http://localhost:4444/wd/hub',

	capabilities: {
		'browserName': 'firefox'
	},

	specs: ['example_spec.js'],

	jasmineNodeOpts: {
		showColors: true,
		defaultTimeoutInterval: 30000
	}
};
