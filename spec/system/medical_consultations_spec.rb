require "rails_helper"

RSpec.describe "Medical Consultations flow", type: :system do
  before :each do
    create_subdomain_hospital
    visit_sign_in_doctor
    sign_in_doctor @hospital
    create_patient
    create_medical_consultations_for_patient
    visit_dash_path
    visit_patients_path
    see_patient_name
    click_link_my_medical_consultations
  end

  feature "Doctor can create a medical consultation" do
    scenario "from patients list" do
      click_link_new_medical_consultation
      visit_new_medical_consultation_with_patient_id_param
      create_new_medical_consultation_with_preselected_patient
      visit_show_medical_consultation
    end
  end

  feature "Doctor should look at patient's medical consultations" do
    scenario "returns 3 medical consultations" do
      look_at_medical_consultations_for_patient
    end
  end

  def visit_show_medical_consultation
    expect(page).to have_current_path medical_consultation_path MedicalConsultation.last
    expect(page).to have_content "INFORMACIÓN DE LA CONSULTA"
    see_patient_name
  end

  def create_new_medical_consultation_with_preselected_patient
    see_patient_name
    fill_in "medical_consultation_reason", with: "Razón de la consulta"
    fill_in "medical_consultation_subjetive", with: "Subjetivo"
    fill_in "medical_consultation_objetive", with: "Objetivo"
    fill_in "medical_consultation_plan", with: "Plan"
    fill_in "medical_consultation_diagnosis", with: "Diagnóstico"
    fill_in "medical_consultation_treatment", with: "Tratamiento"
    fill_in "medical_consultation_observations", with: "Observaciones"
    fill_in "medical_consultation_prescription", with: "Receta"
    fill_in "medical_consultation_lab_results", with: "Resultados de Laboratorio"
    fill_in "medical_consultation_histopathology", with: "histopatologia"
    fill_in "medical_consultation_comments", with: "Comentarios"

    click_button "Crear Consulta"
  end

  def click_link_new_medical_consultation
    click_link "Registrar Consulta"
  end

  def visit_new_medical_consultation_with_patient_id_param
    expect(page).to have_current_path(new_medical_consultation_path(patient_id: @patient.id))
  end

  def click_link_my_medical_consultations
    click_link "Mis Consultas"
  end

  def look_at_medical_consultations_for_patient
    expect(@patient.medical_consultations.count).to eq 3
    expect(page).to have_content(/CONSULTAS DE/)
    expect(page).to have_content(/FECHA/)
  end
end
