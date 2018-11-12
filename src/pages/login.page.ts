class LoginPageObject {

  private _url: string = '/login';
  private _username: string = '#username';
  private _password: string = '#password';
  private _submit: string = 'button[type="submit"]';
  private _usernameBox: string = 'button[type="username"]';
  private _passwordBox: string = 'button[type="password"]';
  private _successMessage: string = '.success';
  private _errorMessage: string = '.error';

  public get usernameBox() { return browser.element(this._usernameBox); }
  public get passwordBox() { return browser.element(this._passwordBox); }
  public get loginButton() { return browser.element(this._submit); }
  public get logoutButton() { return browser.element("//i[@class='icon-2x icon-signout']"); }
  public get successMessage() { return browser.element(this._successMessage); }
  public get errorMessage() { return browser.element(this._errorMessage); }
  public get username() { return browser.element(this._username); }
  public get password() { return browser.element(this._password); }
  public get form() { return browser.element('#login'); }
  public get flash() { return browser.element('#flash'); }

  public openLogin(): void {
    browser.url(this._url);
  }

  public login(username: string, password: string): void {
    this.username.setValue(username);
    this.password.setValue(password);
    this.loginButton.click();
  }

  public getConfirmationText(message: string): string {
    if (message === 'success') {
      return this.successMessage.getText();
    } else if (message === 'error') {
      return this.errorMessage.getText();
    }
  }

  public submit(): void {
    this.form.submitForm();
  }
}

export const LoginPage = new LoginPageObject();
