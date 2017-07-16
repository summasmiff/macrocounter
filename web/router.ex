defmodule Macrocounter.Router do
  use Macrocounter.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Macrocounter do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/entries", EntryController, except: [:new, :edit]
    resources "/foods", FoodController, except: [:new, :edit]
    resources "/goals", GoalController, except: [:new, :edit]
    resources "/users", UserController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Macrocounter do
  #   pipe_through :api
  # end
end
