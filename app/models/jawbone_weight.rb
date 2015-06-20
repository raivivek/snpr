class JawboneWeight < ActiveRecord::Base
  belongs_to :jawbone_profile

  def self.find_or_create_by_jawbone_profile_id_and_date_logged(jawbone_profile_id, date_logged)
    obj = self.find_by_jawbone_profile_id_and_date_logged( jawbone_profile_id, date_logged ) || self.new(:jawbone_profile_id => jawbone_profile_id, :date_logged => date_logged)
    obj
  end

end
