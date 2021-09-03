require "spec_helper"

RSpec.describe PickingToken do
  it "has a version number" do
    expect(PickingToken::VERSION).not_to be nil
  end

  it "return and puts in console [345048] array as string" do
    json_path = "/home/ernes/work/gitHub/picking_token/spec/data_test/scenario_1.json"
    result = pick_tokens_recomendations(json_path)
    expect([345048]).to eq(result)
  end
end
