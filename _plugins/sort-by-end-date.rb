module Jekyll
  module DateFilter
    require 'date'
    def date_sort(collection)
      collection.sort_by do |item|
        Date.parse(item['start'], '%b %Y')
      end
    end
  end
end
Liquid::Template.register_filter(Jekyll::DateFilter)
