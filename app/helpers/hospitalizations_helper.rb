module HospitalizationsHelper
  def statuses_for_select
    @statuses_for_select ||= Hospitalization.statuses.keys
  end
end
