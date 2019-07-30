Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'example#top'
  match 'example/food_upload',to: 'example#food_upload', via: [:get,:post]
  match 'example/general_upload',to: 'example#general_upload', via: [:get,:post]
  match 'example/face_upload',to: 'example#face_upload', via: [:get,:post]
  match 'example/food',to: 'example#food', via: [:post]
  match 'example/general',to: 'example#general', via: [:post]
  match 'example/face',to: 'example#face', via: [:post]
  match 'example/food',to: 'example#reload', via: [:get]
  match 'example/general',to: 'example#reload', via: [:get]
  match 'example/face',to: 'example#reload', via: [:get]
  match 'example/text',to: 'example#text', via: [:get,:post]



end
