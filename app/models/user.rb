class User < ActiveRecord::Base
  has_and_belongs_to_many :roles, join_table: 'user_roles'
  has_many :rules, through: :roles

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  def has_role? name
    roles.find_by_name(name.to_s).present? ? true : false
  end

  def add_role name
    role = Role.find_by_name(name.to_s)
    raise "#{name} role not found" if role.nil?
    raise "#{name} role has already been assigned" if roles.find_by_name(name.to_s).present?
    roles << role
  end

  def remove_role name
    role = Role.find_by_name(name.to_s)
    raise "#{name} role not found" if role.nil?
    roles -= [role]
  end

  def can? action, subject
    flag = false
    rules.reverse.each do |rule|
      flag = true if rule.matches_action?(action.to_s) && rule.matches_subject?(subject.to_s)
    end
    flag
  end

  def cannot? action, subject
    !can? action, subject
  end
end
