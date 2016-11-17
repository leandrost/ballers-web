require 'rails_helper'

RSpec.describe CourtsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Court. As you add validations to Court, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: "Court Name",
      address: "Some street",
      latitude: -22.0000,
      longitude: -43.0000
    }
  end

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CourtsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all courts as @courts" do
      court = Court.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:courts)).to eq([court])
    end
  end

  describe "GET #show" do
    it "assigns the requested court as @court" do
      court = Court.create! valid_attributes
      get :show, params: {id: court.to_param}, session: valid_session
      expect(assigns(:court)).to eq(court)
    end
  end

  describe "GET #new" do
    it "assigns a new court as @court" do
      get :new, params: {}, session: valid_session
      expect(assigns(:court)).to be_a_new(Court)
    end
  end

  describe "GET #edit" do
    it "assigns the requested court as @court" do
      court = Court.create! valid_attributes
      get :edit, params: {id: court.to_param}, session: valid_session
      expect(assigns(:court)).to eq(court)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Court" do
        expect {
          post :create, params: {court: valid_attributes}, session: valid_session
        }.to change(Court, :count).by(1)
      end

      it "redirects to the created court" do
        post :create, params: {court: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Court.last)
      end
    end

    context "with invalid params" do
      it "re-renders the 'new' template" do
        post :create, params: {court: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
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
        put :update, params: {id: court.to_param, court: new_attributes}, session: valid_session
        court.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested court as @court" do
        court = Court.create! valid_attributes
        put :update, params: {id: court.to_param, court: valid_attributes}, session: valid_session
        expect(assigns(:court)).to eq(court)
      end

      it "redirects to the court" do
        court = Court.create! valid_attributes
        put :update, params: {id: court.to_param, court: valid_attributes}, session: valid_session
        expect(response).to redirect_to(court)
      end
    end

    context "with invalid params" do
      it "assigns the court as @court" do
        court = Court.create! valid_attributes
        put :update, params: {id: court.to_param, court: invalid_attributes}, session: valid_session
        expect(assigns(:court)).to eq(court)
      end

      it "re-renders the 'edit' template" do
        court = Court.create! valid_attributes
        put :update, params: {id: court.to_param, court: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested court" do
      court = Court.create! valid_attributes
      expect {
        delete :destroy, params: {id: court.to_param}, session: valid_session
      }.to change(Court, :count).by(-1)
    end

    it "redirects to the courts list" do
      court = Court.create! valid_attributes
      delete :destroy, params: {id: court.to_param}, session: valid_session
      expect(response).to redirect_to(courts_url)
    end
  end

end
