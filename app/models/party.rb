class Party < ApplicationRecord
  belongs_to :game
  has_many :solutions

  validates :word, presence: true
  # Ce mot doit être présent dans le dictionnaire.
  # Ce mot doit être constitué de lettres appartenants à la liste d'entrée.

end
