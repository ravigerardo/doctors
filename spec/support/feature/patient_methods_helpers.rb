module Feature
  module PatientMethodsHelpers
    def visit_patients_path
      click_link "Pacientes"
      expect(page).to have_content "Buscar"
      expect(page).to have_current_path(patients_path)
    end

    def create_patient
      @patient = create :patient, name: "Marco", doctors: [@doctor]
    end

    def create_three_hospitalizations_for_patient
      create_list :hospitalization, 3, doctor: @doctor, patient: @patient
    end

    def create_three_appoinments_for_patient
      create_list :appoinment, 3, doctor: @doctor, patient: @patient
    end

    def see_patient_name
      expect(page).to have_content(/#{@patient}/)
    end
  end
end
