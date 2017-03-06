require 'rails_helper'

RSpec.describe Download, type: :model do
  it { is_expected.to respond_to(:blob) }
  it { is_expected.to respond_to(:title) }
end
