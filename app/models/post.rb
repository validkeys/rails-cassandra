class Post
  include Cequel::Record
  # this must come BEFORE the key declaration
  belongs_to :blog #partition key

  # The auto option for the key declaration means Cequel will initialize new records with a UUID already generated. This option is only valid for :uuid and :timeuuid key columns.
  # key ~> clustering column
  key :id, :timeuuid, auto: true
  column :title, :text
  column :body, :text
end