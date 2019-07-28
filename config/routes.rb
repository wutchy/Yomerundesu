Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'example#top'
  match 'example/upload',to: 'example#upload', via: [:get,:post]
  match 'example/aaa',to: 'example#aaa', via: [:get,:post]
  match 'example/bbb',to: 'example#bbb', via: [:get,:post]
  match 'example/ccc',to: 'example#ccc', via: [:get,:post]
  match 'example/ddd',to: 'example#ddd', via: [:get,:post]



end
