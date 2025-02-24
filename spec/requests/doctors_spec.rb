require "rails_helper"

RSpec.describe "Doctors" do
  let(:hospital) { create(:hospital, :basic) }
  let(:doctor) do
    create(:doctor, :admin, hospital_id: hospital.id)
  end

  before do
    allow(Hospital).to receive(:current_id).and_return hospital.id
    allow_any_instance_of(ApplicationController).to receive(:current_hospital).and_return hospital
    sign_in doctor
  end

  describe "GET /doctors" do
    it "List of doctors" do
      get doctors_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /doctors/1" do
    it "doctors show" do
      get doctor_path doctor
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /doctors/1/edit" do
    it "doctors edit" do
      get edit_doctor_path doctor
      expect(response).to have_http_status(:ok)
    end
  end
end
