require 'rails_helper'

RSpec.describe Status, type: :model do
  it 'userが正しく関連付けられている' do
    status = FactoryBot.create(:status, user: FactoryBot.create(:user))
    expect(status.user).to be_a(User)
  end

  it 'itemが正しく関連付けられている' do
    status = FactoryBot.create(:status, item: FactoryBot.create(:item))
    expect(status.item).to be_a(Item)
  end
end
