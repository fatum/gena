module Gena
  module Generator
    module SinatraAppHelpers
      def app_class_name
        name.split(/[-_]/).map(&:capitalize).join
      end


      def app(fpath)
        "#{name}/#{fpath}"
      end
    end
  end
end
