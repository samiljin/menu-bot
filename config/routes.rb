Rails.application.routes.draw do
  post 'commands/handle', to: 'commands#handle'
end
