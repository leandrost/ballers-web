require "rails_helper"

RSpec.describe CourtsController, type: :controller do
  let(:valid_attributes) do
    {
      name: "Court Name",
      address: "Some street",
      coordinates: {
        latitude: -22.0000,
        longitude: -43.0000
      }
    }
  end

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET #index" do
    it "responds successfully" do
        Court.create!(valid_attributes)
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "responds successfully" do
      court = Court.create!(valid_attributes)
      get :show, params: { id: court.to_param }
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "responds successfully" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "responds successfully" do
      court = Court.create! valid_attributes
      get :edit, params: { id: court.to_param }
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Court" do
        expect {
          post :create, params: { court: valid_attributes }
        }.to change(Court, :count).by(1)
      end

      it "redirects to the created court" do
        post :create, params: { court: valid_attributes }
        expect(response).to redirect_to(Court.last)
      end
    end

    context "with invalid params" do
      it "responds failure" do
        post :create, params: { court: invalid_attributes }
         expect(response).to be_failure
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested court" do
        court = Court.create! valid_attributes
        put :update, params: { id: court.to_param, court: new_attributes }
        court.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the court" do
        court = Court.create! valid_attributes
        put :update, params: { id: court.to_param, court: valid_attributes }
        expect(response).to redirect_to(court)
      end
    end

    context "with invalid params" do
      it "assigns the court as @court" do
        court = Court.create! valid_attributes
        put :update, params: { id: court.to_param, court: invalid_attributes }
        expect(assigns(:court)).to eq(court)
      end

      it "re-renders the 'edit' template" do
        court = Court.create! valid_attributes
        put :update, params: { id: court.to_param, court: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested court" do
      court = Court.create! valid_attributes
      expect {
        delete :destroy, params: { id: court.to_param }
      }.to change(Court, :count).by(-1)
    end

    it "redirects to the courts list" do
      court = Court.create! valid_attributes
      delete :destroy, params: { id: court.to_param }
      expect(response).to redirect_to(courts_url)
    end
  end
end
