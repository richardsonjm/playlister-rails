require 'feature_helper'

feature "CRUD for Songs" do 
  given !(Song.create(:name => "Billie Jean"))

  conext 'creating a new song' do
    scenario 'loading the new song form' do
      visit '/songs/view'
      page.should have_css("form#new_song")
    end
    scenario 'asssigning an artist by name to a song' do
      visit '/songs/new'
      within 'form#new_song' do
        fill_in 'song[name]', with => "Billie Jean"
        fill_in 'song[artist_name]', :with => 'Michael Jackson'
        click_button 'Create Song'
      end
    end

    page.should have_content("Billie Jean")
    page.should have_content("Michael Jackson")
  end

end