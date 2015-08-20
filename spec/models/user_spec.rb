describe User do

  let(:user) { create(:user) }
  # subject { user }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

end