module PageModels
  class HomePage < PageModels::BasePage
    set_url 'https://www.amazon.com/'
    set_url_matcher /https:\/\/www.amazon.com\//

    section :navigation_header, NavHeader, '#navbar'
    # section :banner, Banner, '.a-carousel-row-inner'

    # def click
    #
    # end
  end
  initialize_class(HomePage)
end
