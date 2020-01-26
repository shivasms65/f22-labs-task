Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope :api do
    scope :v1 do
      
      get '/:branch_type/:branch_id/questions', to: 'questions#index', constraints: lambda { |path_params, req| %w(exams subjects topics chapters).include?(path_params[:branch_type]) }, as: :questions

      resources :questions, only: [] do
        resources :answers, only: [:create]
      end
    end
  end
end
