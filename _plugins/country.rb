require 'json'

module Jekyll
  class CountryGenerator < Generator
    def generate(site)
      generate_pages_from_json(site, 'countries.json', 'country')
      generate_pages_from_json(site, 'categories.json', 'category')
      generate_pages_from_json(site, 'tags.json', 'tag')

      generate_en_pages_from_json(site, 'countries.json', 'country')
      generate_en_pages_from_json(site, 'categories.json', 'category')
      generate_en_pages_from_json(site, 'tags.json', 'tag')
    end
 
    def generate_pages_from_json(site, json_file, data_key)
      json_data = JSON.parse(File.read("_data/ru/#{json_file}"))

      json_data.each do |row|
        label = row['label']
        
        new_page = Page.new(site, site.source, "", "#{label}.html")
        new_page.data['layout'] = 'category'
        new_page.data[data_key] = label
        new_page.data['head'] = row['title']

        site.pages << new_page
      end
    end
 
    def generate_en_pages_from_json(site, json_file, data_key)
      json_data = JSON.parse(File.read("_data/en/#{json_file}"))

      json_data.each do |row|
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
