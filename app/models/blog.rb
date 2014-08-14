class Blog
  include Cequel::Record

  key    :id, :timeuuid, auto: true
  column :name,        :text
  column :description, :text

  has_many :posts
end