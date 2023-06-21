class Toy < ApplicationRecord
  validates :name, presence: true
  validates_format_of :image, with: URI::DEFAULT_PARSER.make_regexp, message: "must be a valid URL"
end
