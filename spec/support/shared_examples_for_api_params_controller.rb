RSpec.shared_examples 'ApiController' do |api|
  describe "GET index" do
    it "assigns all #{api}_params as @api_params" do
      api_param = api.create! valid_attributes
      get :index, {type: api}, valid_session
      expect(assigns(:hotmart_params)).to eq([hotmart_param])
    end
  end
end