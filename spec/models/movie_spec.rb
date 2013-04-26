require 'spec_helper'

describe Movie do
  describe 'Search for movies with the same director' do
  	it 'should search for movies with the same director' do
  	  movie_director = 'Herbie Banks'
  	  movie = Movie.new(:id => '1', :title => 'Ghosts', :director => movie_director)
  	  
      Movie.should_receive(:find_all_by_director).with(movie_director)

      movie.find_movies_with_same_director
    end
  end
end