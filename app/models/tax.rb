class Tax < ApplicationRecord

	validates_presence_of   :name,:rate

end
