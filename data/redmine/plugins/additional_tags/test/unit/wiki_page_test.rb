# frozen_string_literal: true

require File.expand_path '../../test_helper', __FILE__

class WikiPageTest < AdditionalTags::TestCase
  fixtures :projects,
           :users,
           :roles,
           :members,
           :member_roles,
           :trackers,
           :groups_users,
           :projects_trackers,
           :enabled_modules,
           :issue_statuses,
           :issues,
           :enumerations,
           :custom_fields,
           :custom_values,
           :custom_fields_trackers,
           :wikis,
           :wiki_pages,
           :wiki_contents,
           :additional_tags, :additional_taggings

  def setup
    prepare_tests
    User.current = nil
    @wiki = wikis :wikis_001
    @page = @wiki.pages.first
  end

  def test_no_change_should_not_update_page
    User.current = users :users_002

    with_tags_settings active_wiki_tags: 1 do
      page = WikiPage.find_by title: 'Another_page'
      assert_no_difference 'WikiContentVersion.count' do
        assert_save page
      end
    end
  end

  def test_add_tag_should_not_create_new_version
    User.current = users :users_002

    with_tags_settings active_wiki_tags: 1 do
      page = WikiPage.find_by title: 'Another_page'
      assert_no_difference 'WikiContentVersion.count' do
        page.tag_list << 'Test1'
        assert_save page

        page.reload
        assert_equal %w[First Test1], page.tag_list.sort
      end
    end
  end

  def test_with_tags_with_nil
    assert_equal [], WikiPage.with_tags(nil)
  end

  def test_with_tags_with_non_existing_tag
    assert_equal [], WikiPage.with_tags('non-existing-tag')
  end

  def test_with_tags_with_existing_tag
    assert_equal 2, WikiPage.with_tags('First').count
  end

  def test_with_tags_mulitple_tags
    assert_equal 2, WikiPage.with_tags(%w[First Second]).count
  end

  def test_with_tags_order_by_date
    assert_equal 2, WikiPage.with_tags('First', order: 'date_desc').count
  end
end
