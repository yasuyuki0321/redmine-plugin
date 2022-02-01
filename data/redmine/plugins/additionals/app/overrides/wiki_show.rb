# frozen_string_literal: true

module WikiShow
  Deface::Override.new virtual_path: 'wiki/show',
                       name: 'wiki-show',
                       insert_before: 'p.wiki-update-info',
                       original: 'd9f52aa98f1cb335314570d3f5403690f1b29145',
                       partial: 'hooks/view_wiki_show_bottom'
end
