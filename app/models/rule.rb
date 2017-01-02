class Rule < ActiveRecord::Base
  belongs_to :role

  validates_presence_of :role_id, :action, :subject
  validates_uniqueness_of :role_id, scope: [:action, :subject]

  def matches_action? name
    action == 'manage' || action == name.to_s
  end

  def matches_subject? name
    subject == 'all' || subject == name.to_s
  end
end
