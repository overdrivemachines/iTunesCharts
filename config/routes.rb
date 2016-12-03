# == Route Map
#
#          Prefix Verb   URI Pattern                     Controller#Action
#     chart_items GET    /chart_items(.:format)          chart_items#index
#                 POST   /chart_items(.:format)          chart_items#create
#  new_chart_item GET    /chart_items/new(.:format)      chart_items#new
# edit_chart_item GET    /chart_items/:id/edit(.:format) chart_items#edit
#      chart_item GET    /chart_items/:id(.:format)      chart_items#show
#                 PATCH  /chart_items/:id(.:format)      chart_items#update
#                 PUT    /chart_items/:id(.:format)      chart_items#update
#                 DELETE /chart_items/:id(.:format)      chart_items#destroy
#

Rails.application.routes.draw do
  resources :chart_items
  root "chart_items#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
