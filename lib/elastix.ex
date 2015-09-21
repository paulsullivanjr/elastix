defmodule Elastix do
  @moduledoc """
  A module that provides a simple Interface to communicate with an Elastic server via REST.
  """

  @config Application.get_env(:elastix, Elastix)

  if !@config, do: raise "Elastix is not configured"
  if !Dict.get(@config, :elastic_url), do: raise "Elastix requires an :elastic_url"

  @doc false
  def start do
    :application.ensure_all_started(:elastix)
  end

  @doc false
  def config, do: @config
  @doc false
  def config(key), do: Dict.get(config, key)
  @doc false
  def config(key, default), do: Dict.get(config, key, default)
end
