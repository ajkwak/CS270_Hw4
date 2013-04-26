require 'spec_helper'

describe Movie do
  describe 'Get all possible ratings for a movie' do
  	it 'should return all common ratings for a movie' do
  	  all_ratings = Movie.all_ratings

  	  # Includes all common movie ratings
  	  all_ratings.should include('G')
  	  all_ratings.should include('PG')
  	  all_ratings.should include('PG-13')
  	  all_ratings.should include('R')
  	  all_ratings.should include('NC-17')

  	  # Does not include a non-rating string
  	  all_ratings.should_not include('Random String')
  	end
  end

  describe 'Search for movies with the same director' do
  	it 'should search for movies with the same director' do
  	  movie_director = 'Herbie Banks'
  	  movie = Movie.new(:id => '1', :title => 'Ghosts', :director => movie_director)
  	  
      Movie.should_receive(:find_all_by_director).with(movie_director)

      movie.find_movies_with_same_director
    end
  end

  describe 'All fields in movie are of correct types' do
  	before(:each) do
	  @attr = { 
	    :title => 'Meet John Doe',
	    :director => 'Tempus',
	    :rating => 'PG',
	    :release_date => '1977-05-25'
	  }
	  @movie = Movie.new(@attr)
	end

	it 'should be an instance of Movie' do
	  @movie.should be_an_instance_of Movie
	end

	it 'should have the correct title' do
	  @movie.title.should eql @attr[:title]
	end

	it 'should have the correct director' do
	  @movie.director.should eql @attr[:director]
	end

	it 'should have the correct rating' do
	  @movie.rating.should eql @attr[:rating]
	end


	it 'should have the correct release date' do
	  @movie.release_date.should eql @attr[:release_date]
	end

  end
end