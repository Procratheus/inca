describe User do

  describe 'unconfirmed user' do
    let(:user) { create(:user) }

    it 'has a valid factory' do
      expect(user).to be_valid
    end

    it 'has a default role of standard' do
      expect(user.role).to eql('standard')
    end
  end

  describe 'confirmed user' do
    let(:confirmed_user) { create(:confirmed_user) }

    it 'has a valid factory' do
      expect(confirmed_user).to be_valid
    end
  end
end