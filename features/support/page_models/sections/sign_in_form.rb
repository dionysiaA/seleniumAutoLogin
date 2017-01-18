module PageModels
  class SignInForm < PageModels::BaseSection
    element :email, 'input#ap_email'
    element :password, 'input#ap_password'
    element :forgot_password, '#auth-fpp-link-bottom'
    element :sign_in_button, '#signInSubmit'
    element :checkbox, 'input[name="rememberMe"]'
    element :register_account, '#createAccountSubmit'

    def submit(email_address, password)
      # all_there_displayed?
      self.email.set email_address
      self.password.set password
      self.sign_in_button.click
    end

    def fill_in_password(password)
      self.password.set password
    end

    def fill_in_email(email)
      self.email.set email
    end

    def enter_sign_in_details(email_address, password)
      self.email.set email_address
      self.password.set password
    end

    def click_sign_in_button
      wait_for_sign_in_button
      sign_in_button.click
    end
  end
end
