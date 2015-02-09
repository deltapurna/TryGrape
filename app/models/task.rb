class Task < ActiveRecord::Base
  belongs_to :user

  def as_json(options={})
    super(except: [:created_at, :updated_at])
  end
end
