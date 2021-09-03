require "spec_helper"
require_relative "../lib/picking_token"
require_relative 'data_test/data_test'


RSpec.describe PickingToken do
  scenarios = DataTest.get_scenarios_file_paths

  it "has a version number" do
    expect(PickingToken::VERSION).not_to be nil
  end

  it "return and puts in console [345048] array" do
    json_path = scenarios["scenario_1"]
    result = PickingToken.pick_tokens_recommendations(json_path)
    expect([345048]).to eq(result)
  end

  it "return and puts in console [790952, 103678, 788138, 802358] array" do
    json_path = "/home/ernes/work/gitHub/picking_token/spec/data_test/scenario_2.json"
    result = PickingToken.pick_tokens_recommendations(json_path)
    expect([790952, 103678, 788138, 802358]).to eq(result)
  end

  it "return and puts in console [103678, 790952, 802358, 788138] array" do
    json_path = "/home/ernes/work/gitHub/picking_token/spec/data_test/scenario_3.json"
    result = PickingToken.pick_tokens_recommendations(json_path)
    expect([103678, 790952, 802358, 788138]).to eq(result)
  end

  it "return and puts in console [790952, 103678, 802358, 562873] array" do
    json_path = "/home/ernes/work/gitHub/picking_token/spec/data_test/scenario_4.json"
    result = PickingToken.pick_tokens_recommendations(json_path)
    expect([790952, 103678, 802358, 562873]).to eq(result)
  end

end
