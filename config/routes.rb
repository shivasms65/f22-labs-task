Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope :api do
    scope :v1 do
      resources :users, only: [] do
        get '/:branch_type/:branch_id/questions', to: 'questions#index', constraints: lambda { |path_params, req| %w(exams subjects topics chapters).include?(path_params[:branch_type]) }, as: :questions
        get '/:branch_type/:branch_id/results', to: 'results#index', constraints: lambda { |path_params, req| %w(exams subjects topics chapters).include?(path_params[:branch_type]) }, as: :user_results
        resources :results, only: [:index]
      end

      resources :questions, only: [] do
        resources :answers, only: [:create]
      end
    end
  end

  resources :users, only: [:index, :show]
  root 'users#index'
end
