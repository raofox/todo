require 'elasticsearch/model'

class TodoList < ApplicationRecord
  belongs_to :user
  has_many :todo_items, dependent: :destroy

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title', 'description']
          }
        },
        highlight: {
          pre_tags: ['<em>'],
          post_tags: ['</em>'],
          fields: {
            title: {},
            description: {}
          }
        }
      }
    )
  end
end
TodoList.import force: true
