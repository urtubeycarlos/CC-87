Rails.application.routes.draw do
  # -----> routes <-----

  # -----> end of routes <-----
  # This is the last one for custom page not found. Important! -> LAST
  match '*unmatched', to: 'application#page_not_found', via: :all
end
