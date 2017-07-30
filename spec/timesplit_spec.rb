require "spec_helper"

RSpec.describe Timesplit do
  it "has a version number" do
    expect(Timesplit::VERSION).not_to be nil
  end

  it 'accepts () syntax' do
    expect(Split('1:2:3').to_s).to eq('01:02:03')
  end
end
