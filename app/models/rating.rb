class Rating < ActiveRecord::Base
  belongs_to :student
  belongs_to :rater, :class_name => 'Student'
  belongs_to :iteration
  validates :stars, :numericality => {:only_integer => true, :greater_than => 0, :less_than => 5}

  def self.rating_descriptions
    ['Does not meet expectations: Did not contribute at all',
      'Barely meets expectations: Contributed, but definitely less than others on team',
      'Meets expectations: Contributions comparable to others on team',
      'Exceeds expectations: Contributed more than others on team',
      'Far exceeds expectations: Superstar who raised our project to whole new level or carried the team to victory for this iteration'
    ].freeze
  end
  

end
