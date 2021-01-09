Rails.application.routes.draw do
  devise_for :clients, controllers: {
    registrations: 'clients/registrations',
    sessions: 'clients/sessions'
  }
  devise_for :admin, controllers: {
    sessions: 'admins/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :clients, only: [:show, :edit, :update] do
      member do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end

    resources :products, only: [:show, :index]
    resources :deliveries, only: [:create, :index, :edit, :update, :destroy]
    resources :cart_items, only: [:create, :index, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end

    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'confirm'
        get 'thanks'
      end
    end
  end

  namespace :admin do
    root to: 'homes#top'
    resources :clients, only: [:index, :show, :edit, :update]
    resources :products, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :orders, only: [:index, :show, :edit, :update]
    get 'detail/:id' => 'orders#detail', as: 'detail'
    resources :order_items, only: [:update]
  end
end
