class BaseDecorator < SimpleDelegator
  def self.wrap(collection)
    collection.map { |el| new(el) }
  end
end