RailsAssets::Application.routes.draw do
  get '/packages' => 'main#packages'
  get '/packages/:name' => 'main#package',
    constraints: { name: /[^\/]+/ }

  resources :components, only: [:index, :new, :create] do
    collection do
      get '/:name/rebuild' => 'components#rebuild',
        constraints: { name: /[^\/]+/ }

      get '/:name/:version' => 'components#assets',
        constraints: { version: /[^\/]+/, name: /[^\/]+/ }
    end
  end

  get "/api/v1/dependencies", to: "main#dependencies"

  get '/status', to: 'main#status'

  root to: "main#home"

  get '/home', to: redirect('/')

  match '(errors)/:status', to: 'errors#show',
    constraints: { status: /\d{3}/ },
    defaults: { status: '500' },
    via: :all
end
