require "spec_helper"

RSpec.describe Split do
  it 'accepts both strings and integers' do
    expect{ Split.new('03:20') }.not_to raise_error
    expect{ Split.new(3, 20) }.not_to raise_error
  end

  it 'converts to strings' do
    expect(Split.new(34,12).to_s).to eq('00:34:12')
  end

  it 'accepts bracket syntax' do
    expect(Split[1,2,3].to_s).to eq('01:02:03')
  end

  describe 'parts of time' do
    let(:split) { Split.new(1,45,30) }

    it 'gives hours' do
      expect(split.hours).to eq(1)
    end

    it 'gives minutes' do
      expect(split.minutes).to eq(45)
    end

    it 'gives seconds' do
      expect(split.seconds).to eq(30)
    end
  end

  describe 'math' do
    it 'adds' do
      expect(Split.new(50) + 10).to eq(Split.new(60))
    end

    it 'substracts' do
      expect(Split.new(50) - 10).to eq(Split.new(40))
    end

    it 'multiplies' do
      expect(Split.new(1,0) * 3).to eq(Split.new(3,0))
    end

    it 'divides' do
      expect(Split.new(60) / 3).to eq(Split.new(20))
    end

    it 'coerces' do
      expect(45 + Split.new(15)).to eq(Split.new(60))
    end
  end
end
