defmodule PhxsandboxWeb.ArticleHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use PhxsandboxWeb, :html

  embed_templates "article_html/*"
end
