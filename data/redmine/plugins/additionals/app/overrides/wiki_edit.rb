# frozen_string_literal: true

module WikiEdit
  Deface::Override.new virtual_path: 'wiki/edit',
                       name: 'wiki-edit',
                       insert_before: 'fieldset',
                       original: 'ededb6cfd5adfe8a9723d00ce0ee23575c7cc44c',
                       partial: 'hooks/view_wiki_form_bottom'
end
