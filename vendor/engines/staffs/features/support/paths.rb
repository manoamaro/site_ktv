module NavigationHelpers
  module Refinery
    module Staffs
      def path_to(page_name)
        case page_name
        when /the list of staffs/
          admin_staffs_path

         when /the new staff form/
          new_admin_staff_path
        else
          nil
        end
      end
    end
  end
end
