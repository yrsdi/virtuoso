defmodule MementoMori do
  @moduledoc """
  Remember Death
  """
  alias MementoMori.FastThinking
  alias MementoMori.SlowThinking
  alias MementoMori.Routine

  @recipient_ids [
    Application.get_env(:virtuoso, :memento_mori_fb_page_recipient_id)
  ]

  @doc """
  Getter for receiver_id
  """
  def recipient_ids(), do: @recipient_ids

  @doc """
  Main pipeline for the bot.
  """
  def respond_to(impression, conversation_state) do
    impression
    |> FastThinking.run()
    |> SlowThinking.run()
    |> Routine.runner(conversation_state)
  end
end
