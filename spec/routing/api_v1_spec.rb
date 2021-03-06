require "spec_helper"

describe "routes for api v1" do

  it "routes tickers api" do
    Market.expects(:find_by_id).with('xxxyyy').returns(Market.new(id: 'xxxyyy'))
    { get: '/api/tickers/xxxyyy' }.should be_routable

    Market.expects(:find_by_id).with('yyyxxx').returns(nil)
    { get: '/api/tickers/yyyxxx' }.should_not be_routable
  end

end
