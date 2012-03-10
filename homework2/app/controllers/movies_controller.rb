class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @movies = Movie.all
    if params[:ratings] != nil
      if params[:sort_by] == "date"
        @movies = Movie.find(:all, :order => "release_date", 
            :conditions => { :rating => params[:ratings].keys })
      elsif params[:sort_by] == "title"
        @movies = Movie.find(:all, :order => "title", 
            :conditions => { :rating => params[:ratings].keys })
      else
        @movies = Movie.all(:conditions => 
                  { :rating => params[:ratings].keys })
      end
    else 
      if params[:sort_by] == "date"
        @movies = Movie.find(:all, :order => "release_date") 
      elsif params[:sort_by] == "title"
        @movies = Movie.find(:all, :order => "title") 
      else
        @movies = Movie.all
      end
    end
    all_ratings
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  def all_ratings
    @all_ratings = Movie.find(:all,:select => "rating").map(&:rating).uniq
  end

end
