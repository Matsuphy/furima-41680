require 'rails_helper'

RSpec.describe Buyer, type: :model do
  it 'statusが正しく関連付けられている' do
    buyer = FactoryBot.create(:buyer, status: FactoryBot.create(:status))
    expect(buyer.status).to be_a(Status)
  end
end
