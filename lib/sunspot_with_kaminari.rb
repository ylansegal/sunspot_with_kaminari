module SunspotWithKaminari
  module Search
    module AbstractSearchInstanceMethods
      # ==== Returns
      #
      # Integer:: Current page number
      #
      def current_page
        @query.page
      end

      # ==== Returns
      #
      # Integer:: Total number of pages for matching documents
      #
      def num_pages
        (total.to_f / @query.per_page).ceil
      end

      # ==== Returns
      #
      # Integer:: Number of records displayed per page
      #
      def limit_value
        @query.per_page
      end

      def empty?
        total == 0
      end

      def any?
        total > 0
      end
    end
  end
end

module SunspotWithKaminari
    module Search
      module StubSessionInstanceMethods
        def current_page 
          1
        end
        
        def num_pages
          1
        end

        alias_method :total_pages, :num_pages
        
        def limit_value
          30
        end
        
        def empty?
          total == 0
        end

        def any?
          total > 0
        end
      end
    end
end

Sunspot::Search::AbstractSearch.send(:include, SunspotWithKaminari::Search::AbstractSearchInstanceMethods)
Sunspot::Rails::StubSessionProxy::Search.send(:include, SunspotWithKaminari::Search::StubSessionInstanceMethods)
