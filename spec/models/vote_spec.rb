require 'rails_helper'

describe Vote do
	before do
		@vote = Vote.new
	end
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
      	@vote.value = 1
      	expect(@vote.valid?).to eq(true)
        #expect(@vote.value.abs).to eq(1)

        @vote.value = 3
        expect(@vote.valid?).to eq(false)
      end
    end
  end
end