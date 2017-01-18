module PageModels
  class BasePage < SitePrism::Page

  end

  def current_page
    @_current_page ||= BasePage.new
  end
end
