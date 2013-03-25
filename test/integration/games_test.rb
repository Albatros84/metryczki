require 'test_helper'
require 'minitest/reporters'
MiniTest::Reporters.use!

class GamesTest < ActionController::IntegrationTest
  def test_log_in
    log_in
    assert_select '#user_nav', text: /maciek@kapustka.net/
  end

  def test_add_game_to_project
    log_in

    # see that checkboxes exist
    project = projects(:urzad_miasta)
    get "/projects/#{project.id}/edit"
    assert_select "input[type=checkbox][name='project[game_ids][]'][value=#{games(:ekoskrzaty).id}]"
    assert_select "input[type=checkbox][name='project[game_ids][]'][value=#{games(:strike).id}]"

    get "/projects/#{project.id}"
    p response.body

    # add game
    put "/projects/#{project.id}", :project => {
        name: project.name,
        client: project.client,
        project_type: project.project_type,
        highrise: project.highrise,
        game_ids: [games(:ekoskrzaty).id, games(:strike).id]
    }

    # check changes and remembered history
    assert project.games.include? games(:strike)
  end

  def log_in
    post_via_redirect '/sessions', email: 'maciek@kapustka.net', password: 'tajne'
  end

  def test_remove_game_from_project
    # post remove of one game
    # check binding
    # post remove of all games
    # check binding
  end

  def test_delete_game
    # delete game
    # check that it is deleted but project exists
  end
end
