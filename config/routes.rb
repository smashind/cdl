Rails.application.routes.draw do
  
  root 'pages#cdl_optin'
  get 'cdl-practice-test', to: 'pages#cdl_practice_test', as: :cdl_practice_test
  get 'thanks', to: 'pages#cdl_thank_you'
  get 'index', to: 'pages#index'

  get 'cdl-study-guides-and-practice-tests', to: 'pages#cdl_study_guides_and_practice_tests', as: :study_and_practice

  resources :attempts
  resources :choices
  resources :questions

  # Practice Tests
  resources :tests do
    resources :questions
  end

  devise_for :users

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
