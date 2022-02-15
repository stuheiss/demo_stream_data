# DemoStreamData

**A simple demo of Property-based Testing with StreamData**

## StreamData
Functions to create and combine generators. Used for property based testing

## ExUnitProperties
Provides macros for property-based testing.

Quick setup, add Quixir to deps in mix.exs, install with mix.
```elixir
  defp deps do
    [
      {:stream_data, "~> 0.5", only: :test}
    ]
  end
```

```sh
sh> mix deps.get
```

See [StreamData docs](https://hexdocs.pm/stream_data/StreamData.html)

See [Overview of property based testing](https://hexdocs.pm/stream_data/ExUnitProperties.html#content)
