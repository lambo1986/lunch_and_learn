require "rails_helper"

RSpec.describe Video do
  it "exists" do
    attrs = {
      :snippet => {
        :title => "history of the world", },
      :id => {:videoId => "1234_dffdFG_567890"}
    }
    video = Video.new(attrs)

    expect(video.title).to eq("history of the world")
    expect(video.video_id).to eq("1234_dffdFG_567890")
  end
end
