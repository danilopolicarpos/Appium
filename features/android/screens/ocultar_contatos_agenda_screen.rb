# coding: utf-8
class OcultarContatosAgendaScreen 
    
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
    @layout_name =  'title'
    @check_ocultar_teclado = 'showInvisible'
    @contato = 'contactEntryText'

  end

  def acessar_agenda
    @driver.find_element(id: "#{@layout_name}")
  end  

  def marcar_opcao_ocultar
    @driver.find_element(id: "#{@check_ocultar_teclado}").click
  end

  def contatos_agenda_oculto?
     fail "Contatos telefônicos estão visíveis" if @driver.find_elements(id: "#{@contato}").size!= 0
  end

end

