class Location < ApplicationRecord
  validates :zipcode, presence: true , length: {in: 5..10 }

  has_many :reports,  :dependent => :delete_all

  def highest_reported
    self.reports.max_by{|report| report.inches}
  end

  def sorted_reports
    self.reports.sort_by {|report| report.inches}.reverse
  end
end
