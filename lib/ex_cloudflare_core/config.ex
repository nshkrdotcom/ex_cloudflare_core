defmodule ExCloudflareCore.Config do
  @moduledoc """
  Configuration management for Cloudflare API interactions.
  """

  @doc """
  Gets the configured Cloudflare API endpoint.
  """
  def calls_api do
    Application.get_env(:ex_cloudflare_core, :calls_api) ||
      System.get_env("CALLS_API")
  end

  @doc """
  Gets the configured Cloudflare App ID.
  """
  def app_id do
    Application.get_env(:ex_cloudflare_core, :calls_app_id) ||
      System.get_env("CALLS_APP_ID")
  end

  @doc """
  Gets the configured Cloudflare App Secret.
  """
  def app_secret do
    Application.get_env(:ex_cloudflare_core, :calls_app_secret) ||
      System.get_env("CALLS_APP_SECRET")
  end

  @doc """
  Gets the base URL for Cloudflare Calls API.
  """
  def calls_base_url do
    "#{calls_api()}/v1/apps/#{app_id()}"
  end

  @doc """
  Gets the authorization headers for Cloudflare API requests.
  """
  def auth_headers do
    [{"Authorization", "Bearer #{app_secret()}"}]
  end
end
