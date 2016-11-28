Rails.application.routes.draw do
  root to: "home#index"

  mount ActionCable.server => "/cable"
end
