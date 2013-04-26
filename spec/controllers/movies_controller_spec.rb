require 'spec_helper'

describe MoviesController do

  describe 'Edit existing movie' do
  	it 'should display the view for editing the existing movie\'s information' do
  		mock_movie_id = '1'
  		movie = mock('Movie', :id => mock_movie_id, :title => 'Princess Caraboo')
  		Movie.should_receive(:find).with(mock_movie_id).and_return(movie)
  		get :edit, :id => mock_movie_id
  		response.should render_template('edit')
  	end
  end

  describe 'Update information about existing movie' do
  	it 'should take the changes to make to the movie from user input' do
  		mock_movie_id = '1'
  		movie = mock('Movie', :id => mock_movie_id, :title => 'Princess Caraboo')
  		Movie.should_receive(:find).with(mock_movie_id).and_return(movie)
  		movie.should_receive(:update_attributes!) # TODO: explicitly change movie info??
  		put :update, :id => mock_movie_id, :movie => movie
  		response.should redirect_to movie_path(movie)
  	end
  	#it 'should update the movie information with the indicated changes'
  end

  describe 'Add director information to existing movie' do
  	# Mock a movie without director information
  	# Add director information
  end

end