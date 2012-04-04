require 'spec_helper'

describe MoviesController do
  describe 'searching for similar movies' do
    it 'should call the model method that find similar movies to the current' do
      Movie.searchsimilar(:id => '1')
    end
    it 'should select the Similar Movies template for rendering' do
      response.should render_template('searchsimilar')
    end
    it 'should insert the Similar Movies found into the template' do

    end

  end
end
