module Jekyll
  module LiquidFilter
    def liquify(input)
      Liquid::Template.parse(input).render(@context)
    end
  end
end
Liquid::Template.register_filter(Jekyll::LiquidFilter)

# https://fettblog.eu/snippets/jekyll/liquid-in-frontmatter/
# http://acegik.net/blog/ruby/jekyll/plugins/howto-nest-liquid-template-variables-inside-yaml-front-matter-block.html
