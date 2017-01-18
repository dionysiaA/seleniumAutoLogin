module PageModels
  class SignInPage < PageModels::BasePage
    set_url ''
    set_url_matcher /https:\/\/www.amazon.com\/ap\/signin/

    section :sign_in_form, SignInForm, 'form[name="signIn"]'
  end
  initialize_class(SignInPage)
end
