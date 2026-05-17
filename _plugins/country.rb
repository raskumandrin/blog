require 'json'

module Jekyll
  class CountryGenerator < Generator
    def generate(site)
      generate_pages_from_json(site, 'ru', 'countries.json', 'country')
      generate_pages_from_json(site, 'ru', 'categories.json', 'category')
      generate_pages_from_json(site, 'ru', 'tags.json', 'tag')

      generate_pages_from_json(site, 'en', 'countries.json', 'country')
      generate_pages_from_json(site, 'en', 'categories.json', 'category')
      generate_pages_from_json(site, 'en', 'tags.json', 'tag')
    end
 
    def generate_pages_from_json(site, lang, json_file, data_key)
      json_path = File.join(site.source, '_data', lang, json_file)
      json_data = JSON.parse(File.read(json_path))

      json_data.each do |row|
        label = row['label']

        page_dir = lang == 'en' ? 'en' : ''
        new_page = PageWithoutAFile.new(site, site.source, page_dir, "#{label}.html")
        new_page.data['layout'] = 'category'
        new_page.data[data_key] = label
        new_page.data['head'] = row['title']
        new_page.data['lang'] = lang

        site.pages << new_page
      end
    end
  end
end
