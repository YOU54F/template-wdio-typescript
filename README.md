
### Tech Stack

* [WebdriverIO](http://webdriver.io/) - It is the selenium webdriver api bindings for node.js, It has a very simple api which could be used to automate web & browser apps in a fast and scalable way.
* [Typescript(Javascript)](https://www.typescriptlang.org/) - It is the superset of javascript which has additional static typings and features like JAVA and other languaes. Now you could write your code which compiles to pure javascript.
* [Cucumber](https://cucumber.io/) - The popular BDD test framework which helps us write automated tests.

## Getting Started

### Pre-requisites

1. Docker

## Installation

### Setup Scripts

* Clone the repository into a folder
* Optional - build docker image locally
* Install dependencies with `docker-compose run --rm webdriverio npm install`

You can build the docker image locally

`docker build Dockerfile/. -t wdiodocker` or `npm run dockerbuild`

Don't forget to update your `docker-compose.yml` to use the local docker image

### Compiling tests

* Run docker-compose to connect to the container and compile the typeScript src files

 `docker-compose run --rm webdriverio npm run build`

### Running Tests

#### Saucelabs

To execute across Saucelabs, set the `SAUCE_USERNAME` and `SAUCE_ACCESSKEY` environment variables.

Note that you aren't required to create a Sauce Connect tunnel, this will be handled automatically.

Run `docker-compose run --rm webdriverio npm run test-sauce`

#### BrowserStack

To execute across BrowserStack, set the `BROWSERSTACK_USERNAME` and `BROWSERSTACK_ACCESSKEY` environment variables.

Run `docker-compose run --rm webdriverio npm run test-browserstack`

#### TestingBot

To execute across TestingBot, set the `TESTINGBOT_USERNAME` and `TESTINGBOT_ACCESSKEY` environment variables.

Run `docker-compose run --rm webdriverio npm run test-testingbot`

#### Selenium in Locally Hosted Docker Container

Run `docker-compose run --rm webdriverio npm run test-local`

## Configuration

`tsconfig.json` defines the `outDir` where Typescript will transpile to.  This directory is deleted by the `npm run clean` or `npm run clean-build` commands.

`conf/local.conf.js` and `conf/saucelabs.conf.js` define the configuration of webdriverio.  
- `specs: [...]` defines matchers for the cucumber feature files to run as default.  
- `suites: {...}` defines named matcher sets for different suite types (e.g. smoke, login, etc.)
- `services` and `capabilities` define the nature of the selenium execution.  Most commonly support local (standalone) execution or Saucelabs.
- `baseUrl:` defines the default/base URL to use for the tests.  This is most commonly the landing URL for the desired environment & app.
- `require: [...]` defines the matchers for the step definitions to use in the run.

For more information on configuration, see http://webdriver.io/guide/testrunner/configurationfile.html


## Writing Tests

Cucumber framework has been integrated with this project, WebdriverIO's `wdio-cucumber-framework` adapter helps write BDD style tests with Features & Step Definitions.

```
import { expect } from 'chai';
import { Given, Then, When } from 'cucumber';
import { LoginPage } from '../pages/login.page';

Given(
    /^I attempt to log in with valid details/,
    () => {
        LoginPage.openLogin();
        LoginPage.login('tomsmith', 'SuperSecretPassword!');
    });

Then(
    /^I am presented with the (success|error) message$/,
    (message: string) => {
        const successMessage: string = 'You logged into a secure area!';
        const errorMessage: string = 'Your username is invalid!';
        if (message === 'success') {
            expect(LoginPage.getConfirmationText(message)).to.contain(successMessage);
        } else if (message === 'error') {
            expect(LoginPage.getConfirmationText(message)).to.contain(errorMessage);
        }
    });

```
## Page Objects

This framework is strictly written using page-object design pattern.

```
class LoginPageObject {

  private _url: string = '/login';
  private _username: string = '#username';
  private _password: string = '#password';
  private _submit: string = 'button[type="submit"]';

  public get loginButton() { return browser.element(this._submit); }
  public get username() { return browser.element(this._username); }
  public get password() { return browser.element(this._password); }

  public openLogin(): void {
    browser.url(this._url);
  }

  public login(username: string, password: string): void {
    this.username.setValue(username);
    this.password.setValue(password);
    this.loginButton.click();
  }

export const LoginPage = new LoginPageObject();
```

### Intellisense

Typings have been added for WebDriverIO / Cucumber / Chai / Node from the [DefinitelyTyped](https://github.com/DefinitelyTyped/DefinitelyTyped) project.

Add these to your IDE for a much more pleasant development experience
