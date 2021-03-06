defmodule Strava.SegmentEffortTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  doctest Strava.SegmentEffort

  setup_all do
    HTTPoison.start
  end

  test "retrieve segment effort" do
    use_cassette "segment_effort/retrieve#269990681" do
      segment_effort = Strava.SegmentEffort.retrieve(269990681)

      assert segment_effort != nil
      assert segment_effort.name == "Losantiville Ave. "
      assert segment_effort.elapsed_time == 181
    end
  end
end