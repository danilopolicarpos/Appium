# coding: utf-8

class OcultarContatosAgendaScreen
  def initialize
    @layout_name = 'title'
    @check_ocultar_teclado = 'showInvisible'
    @contato = 'contactEntryText'
  end

  def acessar_agenda
    find_element(id: @layout_name.to_s)
  end

  def marcar_opcao_ocultar
    find_element(id: @check_ocultar_teclado.to_s).click
  end

  def contatos_agenda_oculto?
    raise 'Contatos telefônicos estão visíveis' unless find_elements(id: @contato.to_s).empty?
  end
end
