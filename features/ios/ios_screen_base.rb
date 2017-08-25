require 'pry'
require 'calabash-cucumber/ibase'

class IOSScreenBase < Calabash::IBase

  extend Gem::Deprecate

  def self.element(element_name, &block)
    define_method(element_name.to_s, *block)
  end

  class << self
    alias :value :element
    alias :action :element
    alias :trait :element
  end



  element(:loading_screen)            { 'loading' }

  # The progress bar of the application is a custom view
  def wait_for_progress
    i = 0
    while !query("MBProgressHUD").empty? and i < 3
      sleep 2
      # touch(nil, :offset => {:x => 1, :y => 10})
      i = i + 1
    end
  end
  deprecate :wait_for_progress, "Itaú framework methods", 2017, 4

  def has_text?(text)
    !query("* {text CONTAINS[c] '#{text}'}").empty? or !query("* {accessibilityLabel CONTAINS[c] '#{text}'}").empty?
  end
  deprecate :has_text?, "Itaú framework methods", 2017, 4

  def drag_to(direction)

    # iOS swipe command doesn't work.
    # For a workaround we need to use the scroll function, but it only work after a swipe command

    # iOS swipe :up and :down are the opposite of the Android directions
    # Setting swipe_opt that will define the swipe 'force'
    swipe_opt = nil
    case direction
    when :esquerda
      direction = :left
      swipe_opt = {:'swipe-delta' => {:horizontal=>{:dx => 280} }, :offset => { :x => 300, :y => 300 } }
    when :direita
      direction = :right
      swipe_opt = {:'swipe-delta' => {:horizontal=>{:dx => 250} }, :offset => { :x => 50, :y => 300 } }
    when :cima
      direction = :down
      swipe_opt = {:'swipe-delta' => {:vertical=>{:dy => 200} }, :offset => { :x => 50, :y => 400 } }
    when :baixo
      direction = :up
      swipe_opt = {:'swipe-delta' => {:vertical=>{:dy => 200} }, :offset => { :x => 50, :y => 400 } }
    end

    swipe(direction, swipe_opt)

    sleep(1)
  end
  deprecate :drag_to, "Itaú framework methods", 2017, 4

  # In the iOS, an element could be found from its text or its accessibilityLabel
  # so this function looks for these two properties on the screen. When the query
  # looks for just a part of the text (CONTAINS[c]) then we need to specify if
  # we will look in accessibilityLabel or in any other propertie (marked)
  def ios_element_exists?(query)
    second_query = nil

    if query.include? "CONTAINS[c]"
      if query.include? "marked"
        second_query = query.gsub( 'marked', 'accessibilityLabel' )
      end
      if query.include? "accessibilityLabel"
        second_query = query.gsub( 'accessibilityLabel', 'marked' )
      end
    end

    if second_query.nil?
      element_exiswts(query)
    else
      element_exists(query) or element_exists(second_query)
    end
  end
  deprecate :ios_element_exists?, "Itaú framework methods", 2017, 4

  def drag_until_element_is_visible_with_special_query(direction, element)
    drag_until_element_is_visible direction, element, "* {accessibilityLabel CONTAINS[c] '#{element}'}"
  end
  deprecate :drag_until_element_is_visible_with_special_query, "Itaú framework methods", 2017, 4

  def drag_until_element_is_visible(direction, element, query = nil, limit = 15)
    i = 0

    element_query = ""
    if query.nil?
      element_query = "* marked:'#{element}'"
    else
      element_query = query
    end

    sleep(1)
    while !ios_element_exists?(element_query) and i < limit do
      drag_to direction
      i = i + 1
    end

    raise ("Executed #{limit} moviments #{direction.to_s} and the element '#{element}' was not found on this view!") unless i < limit
  end
  deprecate :drag_until_element_is_visible, "Itaú framework methods", 2017, 4

  def drag_for_specified_number_of_times(direction, times)
    times.times do
      drag_to direction
    end
  end
  deprecate :drag_for_specified_number_of_times, "Itaú framework methods", 2017, 4

  # Negation indicates that we want a page that doesn't has the message passed as parameter
  def is_on_page?(page_text, negation = '')
    should_not_have_exception = false
    should_have_exception = false
    begin
      wait_for(timeout: 5) { has_text? page_text }
      # If negation is not nil, we should raise an error if this message was found on the view
      should_not_have_exception = true unless negation == ''
    rescue
      # only raise exception if negation is nil, otherwise this is the expected behaviour
      should_have_exception = true if negation == ''
    end

    raise "Unexpected Page. The page should not have: '#{page_text}'" if should_not_have_exception

    raise "Unexpected Page. Expected was: '#{page_text}'" if should_have_exception
  end
  deprecate :is_on_page?, "Itaú framework methods", 2017, 4

  def enter(text, element, query = nil)
    if query.nil?
      query = "* marked:'#{element}'"
    end

    begin
      wait_for(:timeout => 5) { element_exists query }
    rescue
      # Just a better exception message
      raise "Element '#{element}' not found on view!"
    end

    touch query
    # Waits up to 20 seconds for the keyboard to show up
    begin
      wait_for(:timeout => 10) { element_exists("view:'UIKeyboardAutomatic'") }
    rescue
      # If the keyboard didn't show up, tries another time before rainsing the error message
      touch query
      wait_for(:timeout => 5) { element_exists("view:'UIKeyboardAutomatic'") }
    end

    keyboard_enter_text text
    # done
  end
  deprecate :enter, "Itaú framework methods", 2017, 4

   def touch_screen_element(element, query = nil, timeout = 5)
     query = "* marked:'#{element}'" if query.nil?
     begin
       wait_for(timeout: 5) { element_exists(query) }
       touch query
     rescue
       raise "Element #{element} not found on the view"
     end
   end
  deprecate :touch_screen_element, "Itaú framework methods", 2017, 4

  def touch_element_by_index(id, index)
    wait_for(:timeout => 5) { element_exists("* marked:'#{id}' index:#{index}") }
    touch("* marked:'#{id}' index:#{index}")
  end
  deprecate :touch_element_by_index, "Itaú framework methods", 2017, 4

  def clear_text_field(field)
    clear_text("textField marked:'#{field}'")
  end
  deprecate :clear_text_field, "Itaú framework methods", 2017, 4

  def select_date_on_date_picker(date, date_picker_field_id, date_picker_field_query = nil)
    # Touch the date picker element
    if date_picker_field_query.nil?
      touch_screen_element date_picker_field_id
    else
      touch_screen_element date_picker_field_query,  date_picker_field_id
    end
    # Waiting for the date picker to show up
    wait_for(timeout: 5) { element_exists("view:'UIDatePicker'") }

    # If date is today, then we have nothing to do
    if date.year != DateTime.now.year || date.month != DateTime.now.month || date.day != DateTime.now.day
      # Selecting 'date' on the date picker
      picker_set_date_time date
    end

    # Touch the OK button
    touch_screen_element  'concluído'
    
  end
  deprecate :select_date_on_date_picker, "Itaú framework methods", 2017, 4

  def enter_password(password)
    # No teclado virtual, o numero pode vir antes ou depois do texto 'ou', ex.: '0 ou 1'
    begin
      password.split('').each do |number|
        touch("UIButtonLabel {text CONTAINS[c] '#{number}'}")
      end
    rescue
      raise "o número #{number} não foi encontrado"
    end
  end
  deprecate :enter_password, "Itaú framework methods", 2017, 4

  def print
    dia = DateTime.now.day.to_s
    mes = DateTime.now.month.to_s
    ano = DateTime.now.year.to_s
    screenshot_embed(:prefix => "prints/android/", :name => "tela_#{" " + dia + ":" + mes + ":" + ano} #{Time.now.strftime("%H %M %S ")}")
  end

  def tocar(elemento)
    touch("* text:'#{elemento}'")
  end
  deprecate :tocar, "Itaú framework methods", 2017, 4

  action(:reiniciar_app) {
    start_test_server_in_background
  }

  action(:apagar_caracter) {
    keyboard_enter_char 'Delete'
  }

  action(:existe_componente_compartilhamento) {
    wait_for_elements_exist("* id:'ActivityListView'")
  }

  action(:tocar_concluido) {
    touch_screen_element 'concluído'
  }

  def ver_mensagem
    wait_for_elements_exist("CRToastView")
  end
  deprecate :ver_mensagem, "Itaú framework methods", 2017, 4

  def scroll_spinner(spinner, item)
    touch_screen_element "Campo #{spinner}",spinner
    i = 0
    while !element_exists("* marked:'#{item}'") and i < 5 do
      scroll("UIPickerTableView index:0", :down)
      i = i + 1
      sleep 2
    end
    touch "* marked:'#{item}'"
  end
  deprecate :scroll_spinner, "Itaú framework methods", 2017, 4

  def fechar_coach_mark
    sleep 2
    if query("* marked:'ico_fechar_branco'").size > 0
      touch_screen_element 'ico_fechar_branco'
      sleep 2
    end
  end
  deprecate :fechar_coach_mark, "Itaú framework methods", 2017, 4

  def vejo_whats_new
    query("* {text CONTAINS 'Confira as novidades'}").size > 0
  end
  deprecate :vejo_whats_new, "Itaú framework methods", 2017, 4

  def closes_new_version_available_modal_box
    begin
      touch_screen_element 'New version available modal box',
                           "* marked:'Ignore'"
    rescue
    end
  end
  deprecate :closes_new_version_available_modal_box, "Itaú framework methods", 2017, 4

  def vejo_coachMark?
    query('UIViewCoachmark').size > 0
  end
  deprecate :vejo_coachMark?, "Itaú framework methods", 2017, 4


end
