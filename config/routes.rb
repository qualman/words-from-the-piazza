Rails.application.routes.draw do
  get "/madlib", to: "madlibs#index"
end
