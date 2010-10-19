require File.dirname(__FILE__) + '/test_helper.rb'

class TestRockyKlout < Test::Unit::TestCase

  def setup
    usage = "Usage: ruby test_rocky-klout.rb -- [klout_api_key]"
    puts "Uh oh! \n"
    puts usage
    unless !ARGV[0].nil?
      
      exit
    end
    @api_key = ARGV[0] #"uxs4r9352tszfnau7np97zqs"
    @rk = RockyKlout.new(@api_key)
    @user_single = "darthvader"
    @user_array = ["darthvader", "DeathStarPR"]
    @measure = nil # not used yet, see test
    @start_date = nil # not used yet, see test
    @end_date = nil # not used yet, see test
    @topic = "star wars"
  end
  
  # klout score
  def test_score_klout_single
    response = @rk.score_klout(@user_single)
    assert_instance_of Hash, response
    assert_equal response["status"], 200
  end
  
  def test_score_klout_array
    response = @rk.score_klout(@user_array)
    assert_instance_of Hash, response
    assert_equal response["status"], 200
  end
  
  # user methods
  def test_user_show_single
    response = @rk.user_show(@user_single)
    assert_instance_of Hash, response
    assert_equal response["status"], 200
  end
  
  def test_user_show_array
    response = @rk.user_show(@user_array)
    assert_instance_of Hash, response
    assert_equal response["status"], 200
  end
  
  def test_user_topics_single
    response = @rk.user_topics(@user_single)
    assert_instance_of Hash, response
    assert_equal response["status"], 200
  end
  
  def test_user_topics_array
    response = @rk.user_topics(@user_array)
    assert_instance_of Hash, response
    assert_equal response["status"], 200
  end
  
  def test_user_stats_single
    response = @rk.user_stats(@user_single)
    assert_instance_of Hash, response
    assert_equal response["status"], 200
  end
  
  def test_user_stats_array
    response = @rk.user_stats(@user_array)
    assert_instance_of Hash, response
    assert_equal response["status"], 200
  end
  
  # skip these because we have no way of knowing what the arguments are
  # def test_user_history_single
  #   response = @rk.user_history(@user_single, @measure, @start_date, @end_date)
  #   assert_instance_of Hash, response
  #   assert_equal response["status"], 200
  # end
  # 
  # def test_user_history_array
  #   response = @rk.user_history(@user_array, @measure, @start_date, @end_date)
  #   assert_instance_of Hash, response
  #   assert_equal response["status"], 200
  # end
  
  # relationship methods
  def test_relationship_influenced_by_single
    response = @rk.relationship_influenced_by(@user_single)
    assert_instance_of Hash, response
    assert_equal response["status"], 200
  end
  
  def test_relationship_influenced_by_array
    response = @rk.relationship_influenced_by(@user_array)
    assert_instance_of Hash, response
    assert_equal response["status"], 200
  end
  
  def test_relationship_influcencer_of_single
    response = @rk.relationship_influenced_by(@user_single)
    assert_instance_of Hash, response
    assert_equal response["status"], 200
  end
  
  def test_relationship_influcencer_of_array
    response = @rk.relationship_influenced_by(@user_array)
    assert_instance_of Hash, response
    assert_equal response["status"], 200
  end
  
  
  # topic methods
  def test_topic_search_single
    response = @rk.topic_search(@topic)
    assert_instance_of Hash, response
    assert_equal response["status"], 200
  end
  
  def test_topic_verify_array
    response = @rk.topic_verify(@topic)
    assert_instance_of Hash, response
    assert_equal response["status"], 200
  end
end
