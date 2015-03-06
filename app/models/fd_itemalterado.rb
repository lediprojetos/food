class FdItemalterado < ActiveRecord::Base
  belongs_to :fd_itempedido
  belongs_to :fd_items
end
