module ApplicationHelper
  def patients_for_select
    Patient.all.map { |p| [p, p.id] }
  end

  def states_for_select
    [
      "Aguascalientes", "Baja California", "Baja California Sur",
      "Campeche", "Chiapas", "Chihuahua", "Ciudad de México", "Coahuila",
      "Colima", "Durango", "Guanajuato", "Guerrero", "Hidalgo", "Jalisco",
      "Estado de México", "Michoacán", "Morelos", "Nayarit", "Nuevo León",
      "Oaxaca", "Puebla", "Querétaro", "Quintana Roo", "San Luis Potosí",
      "Sinaloa", "Sonora", "Tabasco", "Tamaulipas", "Tlaxcala", "Veracruz",
      "Yucatán", "Zacatecas"
    ]
  end

  def blood_groups_for_select
    ["A+", "O+", "B+", "AB+", "A-", "O-", "B-", "AB-"]
  end
end
