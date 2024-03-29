module Jekyll
  class AddCustomVariable < Generator
    def generate(site)
      image_storage = site.config['image-storage']
      
      site.posts.docs.each do |post|
        # Format the page date as YYYY-MM-DD
        formatted_date = post.date.strftime("%F")
        slug = post.data['slug']
        post.data['i'] = "#{image_storage}/#{formatted_date}-#{slug}/"
      end
    end
  end
end

# https://alphahydrae.com/2021/01/how-to-generate-and-enrich-pages-in-a-jekyll-blog/
