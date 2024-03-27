require 'csv'

module Jekyll
  class CountryGenerator < Generator
    def generate(site)
      generate_pages_from_csv(site, 'countries.csv', 'country')
      generate_pages_from_csv(site, 'categories.csv', 'category')
      generate_pages_from_csv(site, 'tags.csv', 'tag')

      generate_en_pages_from_csv(site, 'countries.csv', 'country')
      generate_en_pages_from_csv(site, 'categories.csv', 'category')
      generate_en_pages_from_csv(site, 'tags.csv', 'tag')
    end
 
    def generate_pages_from_csv(site, csv_file, data_key)
      csv_data = CSV.read("_data/ru/#{csv_file}", headers: true)

      csv_data.each do |row|
        label = row['label']
        
        new_page = Page.new(site, site.source, "", "#{label}.html")
        new_page.data['layout'] = 'category'
        new_page.data[data_key] = label
        new_page.data['head'] = row['title']

        site.pages << new_page
      end
    end
 
    def generate_en_pages_from_csv(site, csv_file, data_key)
      csv_data = CSV.read("_data/en/#{csv_file}", headers: true)

      csv_data.each do |row|
        label = row['label']
        
        new_page = Page.new(site, site.source, "", "en/#{label}.html")
        new_page.data['layout'] = 'category'
        new_page.data[data_key] = label
        new_page.data['head'] = row['title']

        site.pages << new_page
      end
    end
  end
end
