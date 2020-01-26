Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope :api do
    scope :v1 do
      resources :questions, only: [] do
        resources :answers, only: [:create]
      end
    end
  end
end
