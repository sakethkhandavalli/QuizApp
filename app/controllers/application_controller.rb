class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    $current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to '/login' unless current_user
  end

  def require_Admin
    redirect_to '/genres' unless current_user.Admin?
  end

  def get_subgenre
    if(params.has_key?(:subgenre) and params.has_key?(:subgenre_name))
      $subgenre = params['subgenre']
      $subgenre_name = params['subgenre_name']
    end
  end

  def get_genre
    if(params.has_key?(:genre))
      $genre = params['genre']
      $genre_name = params['genre_name']
    end
  end

end
