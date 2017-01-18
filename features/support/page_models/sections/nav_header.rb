module PageModels
  class AccountManagement < PageModels::BaseSection
    element :account_list, '#nav-link-accountList'
    element :orders, '#nav-orders'
    element :try_prime, '#nav-link-prime'
    element :card, '#nav-cart'

    def signed_in?
      !(account_list.text.include? 'Sign in')
    end
  end

  class NavHeader < PageModels::BaseSection
    element :logo, '#nav-logo'
    element :departments, '#nav-link-shopall'
    elements :links, '#nav-xshop-container a'
    section :account_management, AccountManagement, '#nav-tools'
  end
end
