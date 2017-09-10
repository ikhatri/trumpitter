class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def markov_main
      @tweetText = "yeet yeet fucker"
  end
end
