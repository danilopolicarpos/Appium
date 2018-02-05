# coding: utf-8
# frozen_string_literal: true

class OcultarContatosAgendaScreen
  def initialize
    @layout_name = 'title'
    @check_ocultar_teclado = 'showInvisible'
    @contato = 'contactEntryText'
  end

  def acessar_agenda
    find_element(id: @layout_name)
  end

  def marcar_opcao_ocultar
    find_element(id: @check_ocultar_teclado).click
  end

  def contatos_agenda_oculto?
    raise 'Contatos telefônicos estão visíveis' unless find_elements(id: @contato).empty?
  end

  def visualiza_contato
    wait_for_element(id: @contato,:timeout => 5)
  end
end
