module PageModels
  class BaseSection < SitePrism::Section

    def all_there_displayed?
      self.class.mapped_items.each do |element_page|
        visible_flag = (send "has_#{element_page}?".to_sym)
        return visible_flag if visible_flag.false?
        visible_flag = all_there_displayed_deeply_in_section(element_page)
        return visible_flag if visible_flag.false?
      end
      true
    end

    def all_there_displayed_deeply_in_section(element_page)
      element_selected = send element_page.to_sym
      element_selected.all_there_displayed? if element_selected.is_a? SitePrism::Section
    end
  end
end
