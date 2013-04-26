require 'spec_helper'

describe MoviesController do

  describe 'New movie' do
    it 'should show the form for creating a new movie' do
      get :new
      response.should render_template('new')
    end
  end

  describe 'Create a new movie' do
    it 'should successfully create a movie' do # no sad paths yet
      mock_movie_id = '1'
      mock_movie = mock('Movie', :id => mock_movie_id, :title => 'Princess Caraboo')

      # Verify movie is created in the database
      Movie.should_receive(:create!).and_return(mock_movie)
      post :create, :movie => mock_movie
      response.should redirect_to(movies_path)
    end
  end

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
  		mock_movie = mock('Movie', :id => mock_movie_id, :title => 'Princess Caraboo')
  		Movie.should_receive(:find).with(mock_movie_id).and_return(mock_movie)
  		
      # Verify calls the update_attributes method of the model (is actually persisted in the database)
      mock_movie.should_receive(:update_attributes!)

  		put :update, :id => mock_movie_id, :movie => mock_movie
  		response.should redirect_to movie_path(mock_movie)
  	end
  end

  describe 'Search for all movies with the same director as an existing movie' do
    it 'should show other movies with the same director' do
      mock_movie_id = '1'
      mock_movie = mock('Movie', :id => mock_movie_id, :director => 'Princess Caraboo')
      mock_results = [mock('Movie'), mock('Movie')]
      Movie.should_receive(:find).with(mock_movie_id).and_return(mock_movie)
      
      # Verify that the model's 'director' and 'find_movies_with_same_director' methods are called
      mock_movie.should_receive(:director)
      mock_movie.should_receive(:find_movies_with_same_director).and_return(mock_results)

      get :search_by_director, :id => mock_movie_id
      response.should render_template('search_by_director')
    end
    it 'should redirect to home page and show error message if movie has no director info' do
      mock_movie_id = '1'
      mock_movie = mock('Movie', :id => mock_movie_id, :title => 'Princess Caraboo')
      mock_movie.stub(:director).and_return('')
      Movie.should_receive(:find).with(mock_movie_id).and_return(mock_movie)

      # Verify that the model's 'director' and 'find_movies_with_same_director' methods are called
      mock_movie.should_receive(:director)
      mock_movie.should_not_receive(:find_movies_with_same_director)

      get :search_by_director, :id => mock_movie_id
      response.should redirect_to(movies_path)
    end
  end

  describe 'Delete an existing movie' do
    it 'should successfully delete the movie' do
      mock_movie_id = '1'
      mock_movie = mock('Movie', :id => mock_movie_id, :title => 'Princess Caraboo')
      Movie.should_receive(:find).with(mock_movie_id).and_return(mock_movie)
      
      # Verify that the movie's destroy method is called
      mock_movie.should_receive(:destroy)

      delete :destroy, :id => mock_movie_id
      response.should redirect_to(movies_path)
    end
  end
end