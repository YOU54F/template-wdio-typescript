import { expect } from 'chai';
import { Given, Then, When } from 'cucumber';
import { LoginPage } from '../pages/login.page';

Given(
    /^I attempt to log in with valid details/,
    () => {
        LoginPage.openLogin();
        LoginPage.login('tomsmith', 'SuperSecretPassword!');
    });

Given(
    /^I attempt to log in with invalid details/,
    () => {
        LoginPage.openLogin();
        LoginPage.login('foo', 'bar');
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

Then(
    /^the logout button is visible/,
    () => {
        expect(LoginPage.logoutButton.isVisible());
    });


Then(
    /^the login button is visible/,
    () => {
        expect(LoginPage.loginButton.isVisible());
    });