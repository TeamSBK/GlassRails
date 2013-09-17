GlassRails::Application.routes.draw do
  mount Glass::Engine => '/api', as: :glass

  root to: 'pages#index'
end
