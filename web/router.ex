defmodule Eval.Router do
  use Eval.Web, :router

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


  scope "/", Eval do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/droppers", DropperController
  end

  #Other scopes may use custom stacks.
  scope "/api", Eval do
    pipe_through :api

    resources "/droppers", ApiController, only: [:index, :show]
  end
end
