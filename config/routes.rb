Rails.application.routes.draw do
  root 'teams#index'
  get '/teams/new', to: 'teams#new'
  post '/teams', to: 'teams#create'
  get '/teams/distribute_divisions', to: 'teams#distribute_divisions', as: 'distribute_divisions_teams'
  match '/teams/clear_all_teams', to: 'teams#clear_all', via: [:get, :delete], as: 'clear_all_teams'

  get '/divisions/generate_division_a_result', to: 'divisions#generate_division_a_result', as: 'generate_division_a_result'
  get '/divisions/generate_division_b_result', to: 'divisions#generate_division_b_result', as: 'generate_division_b_result'
  get '/divisions/generate_playoff_a12_result', to: 'divisions#generate_playoff_a12_result', as: 'generate_playoff_a12_result'
  get '/divisions/generate_playoff_b12_result', to: 'divisions#generate_playoff_b12_result', as: 'generate_playoff_b12_result'
  get '/divisions/generate_playoff_results', to: 'divisions#generate_playoff_results', as: 'generate_playoff_results'

  resources :divisions, only: [:index]
end
