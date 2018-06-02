$:.unshift("../lib")
require 'konuezu_rust'
require 'rspec'

# live < 2, die
# live 2/3, live
# live with > 3, die
# dead with == 3, spawn

RSpec.describe 'KonuezuRust' do
  context ".hello()" do
    it "says hello" do
      expect(KonuezuRust.hello).to match(/Hello/)
    end
  end
end
