class Todo < ActiveRecord::Base
  belongs_to :user

  def self.overdue
    where("due_date < ? and completed = ?", Date.today, false)
  end

  def self.due_today
    where(due_date: Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.completed
    where(completed: true)
  end

  def self.of_user(user)
    where(user_id: user.id)
  end
end
