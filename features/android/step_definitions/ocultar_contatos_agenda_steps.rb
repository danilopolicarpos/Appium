Dado(/^que acesso agenda telefonica$/) do
  @agenda = OcultarContatosAgendaScreen.new
  @agenda.acessar_agenda
end

Quando(/^toco em "([^"]*)"$/) do |btn_ocutar|
  @agenda.marcar_opcao_ocultar
end

Então(/^devo ver os contatos da agenda ocultos$/) do
  @agenda.contatos_agenda_oculto?
end
