# == Route Map
#
#                   Prefix Verb   URI Pattern                       Controller#Action
#         new_user_session GET    /users/sign_in(.:format)          devise/sessions#new
#             user_session POST   /users/sign_in(.:format)          devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)         devise/sessions#destroy
#            user_password POST   /users/password(.:format)         devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)     devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)    devise/passwords#edit
#                          PATCH  /users/password(.:format)         devise/passwords#update
#                          PUT    /users/password(.:format)         devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)           devise/registrations#cancel
#        user_registration POST   /users(.:format)                  devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)          devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)             devise/registrations#edit
#                          PATCH  /users(.:format)                  devise/registrations#update
#                          PUT    /users(.:format)                  devise/registrations#update
#                          DELETE /users(.:format)                  devise/registrations#destroy
#        user_confirmation POST   /users/confirmation(.:format)     devise/confirmations#create
#    new_user_confirmation GET    /users/confirmation/new(.:format) devise/confirmations#new
#                          GET    /users/confirmation(.:format)     devise/confirmations#show
#              chart_items GET    /chart_items(.:format)            chart_items#index
#                          POST   /chart_items(.:format)            chart_items#create
#           new_chart_item GET    /chart_items/new(.:format)        chart_items#new
#          edit_chart_item GET    /chart_items/:id/edit(.:format)   chart_items#edit
#               chart_item GET    /chart_items/:id(.:format)        chart_items#show
#                          PATCH  /chart_items/:id(.:format)        chart_items#update
#                          PUT    /chart_items/:id(.:format)        chart_items#update
#                          DELETE /chart_items/:id(.:format)        chart_items#destroy
#                     root GET    /                                 chart_items#index
#

Rails.application.routes.draw do
  devise_for :users
  resources :chart_items
  root "chart_items#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
