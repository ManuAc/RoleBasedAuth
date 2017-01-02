class Rule < ActiveRecord::Base
  belongs_to :role

  validates_presence_of :role_id, :action, :resource
  validates_uniqueness_of :role_id, scope: [:action, :resource]

  def matches_action? name
    action == 'manage' || action == name.to_s
  end

  def matches_resource? name
    resource == 'all' || resource == name.to_s
  end
end
