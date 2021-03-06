defmodule Phoenix.Component do
  @moduledoc """
  API for function components.

  A function component is any function that receives
  an assigns map as argument and returns a rendered
  struct built with the `~H` sigil.

  Here is an example:

      defmodule MyComponent do
        use Phoenix.Component

        # Optionally also bring the HTML helpers
        # use Phoenix.HTML

        def greet(assigns) do
          ~H"\""
          <p>Hello, <%= assigns.name %></p>
          "\""
        end
      end

  The component can be invoked as a regular function:

      MyComponent.greet(%{name: "Jane"})

  But it is typically invoked using the function component
  syntax from the `~H` sigil:

      ~H"\""
      <MyComponent.greet name="Jane" />
      "\""

  If the `MyComponent` module is imported or if the function
  is defined locally, you can skip the module name:

      ~H"\""
      <.greet name="Jane" />
      "\""

  Learn more about the `~H` sigil [in its documentation](`Phoenix.LiveView.Helpers.sigil_H/2`).

  ## `use Phoenix.Component`

  Modules that have to define components should call `use Phoenix.Component`
  at the top. Doing so will import the functions found in the `Phoenix.LiveView`
  and `Phoenix.LiveView.Helpers` modules.

  Note it is not necessary to `use Phoenix.Component` inside `Phoenix.LiveView`
  and `Phoenix.LiveComponent`.

  ## Blocks

  It is also possible to HTML blocks to function components,
  as to regular HTML tags. For example, you could create a
  button component that is invoked like this:

      <.button>
        This does <strong>inside</strong> the button!
      </.button>

  Where the function component would be defined as:

      def button(assigns) do
        ~H"\""
        <button class="btn">
          <%= render_block(@inner_block) %>
        </button>
        "\""
      end

  Where `render_block` is defined at
  `Phoenix.LiveView.Helpers.render_block/2`.
  """

  @doc false
  defmacro __using__(_) do
    quote do
      import Phoenix.LiveView
      import Phoenix.LiveView.Helpers
    end
  end
end