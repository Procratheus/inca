feature 'Admin adds publisher', %q{
  As admin of the site
  I want to be able to add a new publisher to the system
  So they can manage their titles on the site
} do

  before do
    @admin = create(:admin_user)
  end

  scenario 'admin successfully adds new publisher' do
    signin(@admin.email, @admin.password)
    visit publishers_path
    click_on 'Add publisher'
    fill_form(:publisher, { name: 'Harper Collins', address: '100 Main St.',
      contract_start_date:  Date.today, contract_end_date: Date.today + 30.days} )
    click_on 'Create'
    expect(page).to have_content('Publisher added')
    expect(current_path).to_be publishers_path
  end

end
