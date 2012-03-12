class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
#    reset_session
    redirect = false
    value_sort = nil
    if params[:sort_by] == nil and not session[:sort_by].eql? nil
      value_sort = session[:sort_by]
      session[:sort_by] = nil
      redirect = true
    end
    
    value_ratings = nil
    if params[:ratings] == nil and not session[:ratings].eql? nil
      value_ratings = session[:ratings]
      session[:ratings] = nil
      redirect = true
    end
    
    if redirect == true
      if value_sort != nil and value_ratings != nil
        redirect_to movies_path(:sort_by => value_sort, :ratings => value_ratings)
      elsif value_sort != nil and value_ratings == nil
        redirect_to movies_path(:sort_by => value_sort)
      else
        redirect_to movies_path(:ratings => value_ratings)
      end
      return
    end
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
   if not params[:sort_by].eql? nil
     session[:sort_by] = params[:sort_by]
   end
   if not params[:ratings].eql? nil
     session[:ratings] = params[:ratings]
   end
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
