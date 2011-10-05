module Admin
  class StaffsController < Admin::BaseController

    crudify :staff,
            :title_attribute => 'name', :xhr_paging => true

  end
end
