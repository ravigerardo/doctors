class MedicalConsultation < ApplicationRecord
  default_scope { where(hospital_id: Hospital.current_id) }

  belongs_to :doctor
  belongs_to :patient

  validates :reason, :subjetive, :objetive, :prescription, presence: true
end
