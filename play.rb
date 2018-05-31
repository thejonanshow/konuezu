require 'rspec'

# live < 2, die
# live 2/3, live
# live with > 3, die
# dead with == 3, spawn

class Biome
  attr_reader :year

  def initialize
    @year = 0
  end

  def evolve
    @year += 1
  end
end

RSpec.describe 'Conway' do
  context Biome do
    let(:biome) { Biome.new }

    it "starts at year 0" do
      expect(biome.year).to eq(0)
    end

    it "increments the year when it evolves" do
      expect { biome.evolve }.to change { biome.year }.by 1
    end
  end
end
