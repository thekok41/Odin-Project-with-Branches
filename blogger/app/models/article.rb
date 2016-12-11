# no attr defined inside the model.  how does Rails know that an Article should have a title, a body, etc? The answer is a technique called reflection. Rails queries the database, looks at the articles table, and assumes that whatever columns that table has should be the attributes for the model.
class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  # an article has a list of tags through the ralationship of taggings.
  has_many :tags, through: :taggings
  # This has_attached_file method is part of the paperclip library.
  # As of version 4.0, all attachments are required to include a content_type validation, a file_name validation, or to explicitly state that they’re not going to have either. Paperclip raises MissingRequiredValidatorError error if you do not do this.
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/ipg", "image/jpeg", "image/png"]

  def tag_list()
    # if we only do tags.join(", "), the array of tags will show sth like this: "#<Tag:0x007fe4d60c2430>, #<Tag:0x007fe4d617da50>", which is ugly, so we want to 1)convert all tag objects to an array of tag names, 2)join the arr of tag names together
    # tags.join(", ")

    # "self.method" create methods that don't require objects to be created first -> a class method
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

# create an attribute named "tag_list"
# the next step is to go through each of those tag_names and find or create a tag with that name
# about the equal sign after tag_list  http://stackoverflow.com/questions/5398919/what-does-the-equal-symbol-do-when-put-after-the-method-name-in-a-method-d
def tag_list=(tags_string)
  tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
  new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
  self.tags = new_or_found_tags
end
end
