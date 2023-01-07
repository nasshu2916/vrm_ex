defmodule VrmEx.Schema.LookAt do
  @moduledoc """
  Eye gaze control
  """

  defstruct extensions: nil,
            extras: nil,
            offset_from_head_bone: [nil],
            range_map_horizontal_inner: %VrmEx.Schema.LookAtRangeMap{},
            range_map_horizontal_outer: %VrmEx.Schema.LookAtRangeMap{},
            range_map_vertical_down: %VrmEx.Schema.LookAtRangeMap{},
            range_map_vertical_up: %VrmEx.Schema.LookAtRangeMap{},
            type: nil

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          offset_from_head_bone: [number()],
          range_map_horizontal_inner: VrmEx.Schema.LookAtRangeMap.t(),
          range_map_horizontal_outer: VrmEx.Schema.LookAtRangeMap.t(),
          range_map_vertical_down: VrmEx.Schema.LookAtRangeMap.t(),
          range_map_vertical_up: VrmEx.Schema.LookAtRangeMap.t(),
          type: String.t()
        }

  use ExConstructor
end
