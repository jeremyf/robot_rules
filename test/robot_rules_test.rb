require 'test_helper'

class RobotRulesTest < Test::Unit::TestCase
  SITE_URL = "http://www.example.com"
  def setup
    @robot_rule = RobotRules.new('Ruby Spider 1.0')
    @robot_rule.parse(File.join(SITE_URL,'robots.txt'), %(User-agent:  *\nDisallow:    images))
  end
  def test_should_allow_path_imagination
    assert_equal true, @robot_rule.allowed?(File.join(SITE_URL, 'imagination/me.jpg'))
  end
  def test_should_disallow_path_images
    assert_equal false, @robot_rule.allowed?(File.join(SITE_URL, 'images/me.jpg'))
  end
  def test_should_allow_path_images_for_other_site
    assert_equal true, @robot_rule.allowed?(File.join("http://google.com", 'images/me.jpg'))
  end
  def test_should_disallow_path_images_for_other_site
    assert_equal true, @robot_rule.allowed?(File.join("http://google.com", 'images/me.jpg'))
  end

  def test_should_abide_by_disallowed_user_agent
    @robot_rule = RobotRules.new('Microsoft')
    robots_txt = %(/robots.txt:\nUser-agent: Microsoft\nDisallow:  google\nUser-agent:  *\nDisallow:    images)
    @robot_rule.parse(File.join(SITE_URL,'robots.txt'), robots_txt)
    
    assert_equal false, @robot_rule.allowed?(File.join(SITE_URL, 'google/hellow_world.txt'))
  end

  def test_should_allow_user_agent_to_specified_path
    @robot_rule = RobotRules.new('Google')
    robots_txt = %(/robots.txt:\nUser-agent: Microsoft\nDisallow:  google\nUser-agent:  *\nDisallow:    images)
    @robot_rule.parse(File.join(SITE_URL,'robots.txt'), robots_txt)
    
    assert_equal true, @robot_rule.allowed?(File.join(SITE_URL, 'google/hellow_world.txt'))
  end
end
