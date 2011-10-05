::Refinery::Application.routes.draw do
  resources :staffs, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :staffs, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
