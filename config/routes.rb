Rails.application.routes.draw do
  root 'pages#index'
  get 'cdl-study-guide', to: 'pages#cdl_optin', as: :cdl_study_guide
  get 'cdl-practice-test', to: 'pages#cdl_practice_test', as: :cdl_practice_test
  get 'thanks', to: 'pages#cdl_thank_you'

  get 'cdl-study-guides-and-practice-tests', to: 'pages#cdl_study_guides_and_practice_tests', as: :study_and_practice

  resources :attempts
  resources :choices
  resources :questions

  # Practice Tests
  resources :tests do
    resources :questions
  end

  devise_for :users, controllers: { registrations: "registrations" }

  # Footer pages
  get 'about', to: 'pages#about', as: :about
  get 'contact', to: 'pages#contact', as: :contact
  post 'contact_messages', controller: 'contact_messages', action: 'create'
  get 'guarantee', to: 'pages#guarantee', as: :guarantee
  get 'terms', to: 'pages#terms', as: :terms

  # Marketing pages
  get 'class-a-endorsement', to: 'pages#class_a_endorsement', as: :class_a_endorsement
  get 'class-b-endorsement', to: 'pages#class_b_endorsement', as: :class_b_endorsement
  get 'hazardous-materials-endorsement', to: 'pages#hazardous_materials_endorsement', as: :hazardous_materials_endorsement
  get 'double-triple-endorsement', to: 'pages#double_triple_endorsement', as: :double_triple_endorsement
  get 'tank-vehicle-endorsement', to: 'pages#tank_vehicle_endorsement', as: :tank_vehicle_endorsement
  get 'passenger-vehicle-endorsement', to: 'pages#passenger_vehicle_endorsement', as: :passenger_vehicle_endorsement
  get 'school-bus-endorsement', to: 'pages#school_bus_endorsement', as: :school_bus_endorsement

  # Successful payment/signup page
  get "success", to: 'pages#success'

  get "dashboard", to: 'tests#index', as: :dashboard
end
