require 'rails_helper'

RSpec.describe Homepage, type: :model do
  it { is_expected.to respond_to(:contact_us_text) }
  it { is_expected.to respond_to(:footer_links) }
end
