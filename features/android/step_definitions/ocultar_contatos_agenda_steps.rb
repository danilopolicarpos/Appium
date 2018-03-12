# frozen_string_literal: true

Dado(/^que acesso agenda telefonica$/) do
  @agenda = OcultarContatosAgendaScreen.new
  @agenda.acessar_agenda
end

Dado(/^vejo os contatos da agenda$/) do
  @agenda.visualiza_contato
end

Quando(/^toco em "([^"]*)"$/) do |_btn_ocutar|
  @agenda.marcar_opcao_ocultar
end

Então(/^devo ver os contatos da agenda ocultos$/) do
  @agenda.contatos_agenda_oculto?
end
