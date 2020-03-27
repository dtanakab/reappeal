# frozen_string_literal: true

module RequestSpecHelper
  include Warden::Test::Helpers

  def self.included(base)
    base.before(:each) { Warden.test_mode! }
    base.after(:each) { Warden.test_reset! }
  end

  def sign_in(resource)
    login_as(resource, scope: warden_scope(resource))
  end

  def sign_out(resource)
    logout(warden_scope(resource))
  end

  def common_set_up
    types = %i(
      element_type1 element_type2 element_type3 element_type4
      element_type5 element_type6 element_type7 element_type8 element_type9
    )
    types.each { |type| create(type) }
    @slide_show = create(:slide_show1)
    @visible_slide_show = create(:slide_show3)
  end

  private

    def warden_scope(resource)
      resource.class.name.underscore.to_sym
    end
end
