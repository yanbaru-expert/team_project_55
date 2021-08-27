class MoviesController < ApplicationController
  PER_PAGE = 12

  def index
    @movies = if params[:genre]
                Movie.where(genre: "php").includes(:watch_progresses).page(params[:page]).per(PER_PAGE)
              else
                Movie.where(genre: Movie::RAILS_GENRE_LIST).includes(:watch_progresses).page(params[:page]).per(PER_PAGE)
              end
  end
end
