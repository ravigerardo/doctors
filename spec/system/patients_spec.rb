require "rails_helper"

RSpec.describe "Patient's flow", type: :system do
  before :each do
    create_subdomain_hospital
    visit_sign_in_doctor
    sign_in_doctor @hospital
    visit_dash_path
  end

  feature "Doctor can create a patient" do
    scenario "with valid data" do
      visit_patients
      visit_new_patient
      create_new_patient "Marco"
      visit_show_patient
    end

    scenario "with invalid data" do
      visit_patients
      visit_new_patient
      create_new_patient ""
      expect(page).to have_content "Nombre no puede estar en blanco"
    end
  end

  feature "Doctor can edit a patient" do
    context "from show patient page" do
      before :each do
        visit_patients
        visit_new_patient
        create_new_patient "Marco"
        visit_show_patient
      end

      scenario "with valid data" do
        click_link "Editar"
        fill_in "patient_name", with: "Marco update"
        click_button "Actualizar Paciente"
        visit_show_patient
      end
    end
  end

  def visit_show_patient
    expect(page).to have_current_path patient_path Patient.unscoped.last
    expect(page).to have_content "INFORMACIÓN DEL PACIENTE"
  end

  def create_new_patient name
    fill_in "patient_name", with: name
    fill_in "patient_first_name", with: "Chavez"
    fill_in "patient_last_name", with: "Castro"
    fill_in "patient_birthday", with: "1989-09-19"
    fill_in "patient_height", with: 180
    fill_in "patient_weight", with: 100
    find("#patient_blood_group").find(:xpath, "option[2]").select_option
    fill_in "patient_occupation", with: "Herrero"
    fill_in "patient_referred_by", with: "Pedro Ramos"
    fill_in "patient_address_attributes_street", with: "Cuahutemoc"
    fill_in "patient_address_attributes_number", with: "12"
    fill_in "patient_address_attributes_colony", with: "Centro"
    fill_in "patient_address_attributes_postal_code", with: "68000"
    fill_in "patient_address_attributes_municipality", with: "Oaxaca"
    find("#patient_address_attributes_state").find(:xpath, "option[2]").select_option

    click_button "Crear Paciente"
  end

  def visit_new_patient
    click_link "Registrar Paciente"
    expect(page).to have_content "REGISTRAR PACIENTE"
  end

  def visit_patients
    click_link "Pacientes"
    expect(page).to have_content "PACIENTES"
  end
end
