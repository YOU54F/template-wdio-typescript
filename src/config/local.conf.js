const host = 'chromedriver';   // default appium host
const port = 4444;          // default appium port

exports.config = {

  host: host,
  port: port,
    specs: [
        './features/*.feature',
    ],
  
    exclude: [
    ],
    capabilities: [{
        browserName: 'chrome',
        maxInstances: 5
    }],
    logLevel: 'silent',
    coloredLogs: true,
    screenshotPath: './errorShots/',
    baseUrl: 'http://the-internet.herokuapp.com/',
    waitforTimeout: 15000,
    connectionRetryTimeout: 90000,
    connectionRetryCount: 3,
    framework: 'cucumber',
    reporters: ['cucumber','spec'],
    reporterOptions: {
        cucumber: {
            outputDir: './test-results/'
        }
    },
    cucumberOpts: {
      require: ['./tsrc/stepDefinitions/**/*.js',
                './tsrc/pageObjects/**/*.js'],
    backtrace: true,
        dryRun: false,
        failFast: false,
        format: ['pretty'],
        colors: true, 
        snippets: true, 
        source: true, 
        profile: [],
        strict: true,
        timeout: 20000, 
        ignoreUndefinedDefinitions: false, 
    },
    onPrepare: function onPrepare(config, capabilities) {
      console.log('*** Tests started ***');


    },
    before: function before() {
    },
    afterScenario: function (scenario) {
        browser.screenshot();
     },
    onComplete: function onComplete(exitCode) {
      console.log('*** Tests complete ***');
      }
};
