require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  let(:valid_attributes) {
    {
      first_name: "John",
      last_name: "Doe",
      birthday: "1990-01-01",
      gender: "Male",
      email: "john.doe@example.com",
      phone_number: "1234567890",
      subject: "Test Subject"
    }
  }

  let(:invalid_attributes) {
    {
      first_name: "",
      last_name: "",
      email: "invalid",
      phone_number: ""
    }
  }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful # HTTP Status 200
      expect(assigns(:registrations)).to eq(Registration.all)
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Registration and redirects to root' do
        expect {
          post :create, params: { registration: valid_attributes }
        }.to change(Registration, :count).by(1)

        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new registration and renders form again' do
        expect {
          post :create, params: { registration: invalid_attributes }
        }.not_to change(Registration, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:registration) { Registration.create! valid_attributes }

    it 'destroys the requested registration and redirects to root' do
      expect {
        delete :destroy, params: { id: registration.id }
      }.to change(Registration, :count).by(-1)

      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq('Registration was successfully destroyed.')
    end
  end

  describe 'GET #register_modal' do
    it 'renders the turbo_stream for register modal' do
      get :register_modal
      expect(response.media_type).to eq Mime[:turbo_stream].to_s
      expect(response).to be_successful
    end
  end
end
