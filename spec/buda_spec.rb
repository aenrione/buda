require 'buda'
require 'buda/client'

RSpec.describe Buda do
  it 'has a version number' do
    expect(Buda::VERSION).not_to be nil
  end
end
