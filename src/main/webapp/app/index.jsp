<sgc_template:Cabecalho>
    <script>
        function formataHora(){
            horaInicial = document.getElementById("form1:horaInicioInput").value.replace(/^\s+|\s+$/g,"").split(":");
            horaFinal   = document.getElementById("form1:horaFinalInput").value.replace(/^\s+|\s+$/g,"").split(":");
            if( horaInicial[2] == null || horaInicial[2] == ""){
                document.getElementById("form1:horaInicioInput").value = horaInicial[0]+":"+horaInicial[1]+":00";
            }
            if( horaFinal[2] == null || horaFinal[2] == ""){
                document.getElementById("form1:horaFinalInput").value = horaFinal[0]+":"+horaFinal[1]+":00";
            }
        }

        function func_1(thisObj, thisEvent) {
            var caracter;
            if(window.event) //IE
                caracter = thisEvent.keyCode;
            else
                caracter = thisEvent.which;
            //Deixar inserir as teclas de 0 a 9, virgula
            if((caracter > 47 && caracter < 58) || caracter == 8)
                return true;
            else
                return false;
        }

        //Máscara para os campos data e hora
        function formataData(campo, teclapres)
        {
            if (campo.value.length == 2) {
                campo.value = campo.value + '/';
                return true;
            }
            if (campo.value.length == 5) {
                campo.value = campo.value + '/';
                return true;
            }
        }

        function formataHora(campo, teclapres)
        {
            if (campo.value.length == 2) {
                campo.value = campo.value + ':';
                return true;
            }
            if (campo.value.length == 5) {
                campo.value = campo.value + ':';
                return true;
            }
        }
    </script>
</sgc_template:Cabecalho>
<f:view beforePhase="">

    <h:form id="form1" onkeydown="return avoidFormEnterKey(event);">
        <sgc_template:ConteudoSemMenu>

            <div class="PaginaBorda">
                <div class="PaginaTitulo1">
                    <span style="float:left">&nbsp;Agenda de Licitações</span>
                    <span style="float:right"><h:commandLink id="linkAjuda">
                        <h:graphicImage styleClass="PaginaImagem" id="AjudaLink" value="/priv/comum/img/ajuda.gif"/>
                    </h:commandLink></span>
                </div>
                <div class="BarraAcao"><h:commandButton type="submit"
                                                        styleClass="PaginaButton" id="voltar1Button" value="Voltar"
                                                        action=""/>
                    <h:commandButton type="submit"
                                     styleClass="PaginaButton" id="salvar1Button" value="Salvar"
                                     actionListener="" onclick="formataHora();"/>
                    <az:authorization id="priv.processolicitatorio.tramitarPLSec">
                        <h:commandButton type="submit" value="Trâmite" styleClass="PaginaButton" id="tramite1Button"
                                         action=""
                                         rendered="idAgenda != null}" />
                    </az:authorization>

                </div>
                <fieldset><legend>Informações da Agenda</legend>
                    <TABLE width="100%" cellspacing="3" cellpadding="2px">

                        <TR>
                            <TD class="TabelaFormCampoLabel" width="12%"><h:outputText
                                    styleClass="PaginaRotuloLabel" id="assuntoTituloText"
                                    value="Assunto:"></h:outputText></TD>
                            <TD class="TabelaFormCampoLabel" width="88%" colspan="3"><h:outputText styleClass="PaginaRotulo"
                                                                                                   id="assuntoText" value=""></h:outputText></TD>
                        </TR>

                        <TR>
                            <TD class="TabelaFormCampoLabel" width="12%"><h:outputText
                                    styleClass="PaginaRotuloLabel" id="dataHoraTituloText"
                                    value="Data e Hora Início:"></h:outputText></TD>
                            <TD class="TabelaFormCampoLabel large" width="88%" colspan="3">
                                <rich:calendar datePattern="dd/MM/yyyy HH:mm" id="calendar1"  onexpand="hideCalendar(this.id, event)"
                                               ondateselected="showTimeEditor(this);"  showApplyButton="true"  showWeeksBar="false" todayControlMode="hidden"
                                               value=""/>
                            </TD>
                        </TR>
                        <TR>
                            <TD class="TabelaFormCampoLabel" width="12%"><h:outputText
                                    styleClass="PaginaRotuloLabel" id="dataHoraFimTituloText"
                                    value="Data e Hora Fim:"></h:outputText></TD>
                            <TD class="TabelaFormCampoLabel large" width="88%" colspan="3">
                                <rich:calendar datePattern="dd/MM/yyyy HH:mm" id="calendar2"  onexpand="hideCalendar(this.id, event)"
                                               ondateselected="showTimeEditor(this);"  showApplyButton="true"  showWeeksBar="false" todayControlMode="hidden"
                                               value=""/>
                            </TD>
                        </TR>
                        <TR>
                            <TD class="TabelaFormCampoLabel" width="12%"><h:outputText
                                    styleClass="PaginaRotuloLabel" id="comissaoTituloText"
                                    value="Comissão:"></h:outputText></TD>
                            <TD align="left" height="88%" class="TabelaFormCampoLabel" nowrap colspan="3"><h:selectOneMenu
                                    styleClass="PaginaCombo" id="comissaoCombo"
                                    value="">
                                <f:selectItems value="" />
                            </h:selectOneMenu></TD>
                        </TR>
                        <TR>
                            <TD class="TabelaFormCampoLabel" width="12%"><h:outputText
                                    styleClass="PaginaRotuloLabel" id="descricaoTituloText"
                                    value="Observação:"></h:outputText></TD>
                            <TD align="left" height="88%" class="TabelaFormCampoLabel" nowrap colspan="3"><h:inputText
                                    styleClass="PaginaInput" id="descricaoInput"
                                    value="" maxlength="100" size="100"></h:inputText></TD>
                            <TD></TD>
                        </TR>
                        <TR>
                            <TD class="TabelaFormCampoLabel" width="12%"><h:outputText
                                    styleClass="PaginaRotuloLabel" id="salaText" value="Sala:"></h:outputText></TD>
                            <TD align="left" height="88%" class="TabelaFormCampoLabel" nowrap colspan="3"><h:selectOneMenu
                                    styleClass="PaginaCombo" id="salaCombo"
                                    value="">
                                <f:selectItems value="" />
                            </h:selectOneMenu></TD>
                            <TD></TD>
                        </TR>
                        <TR>
                            <TD class="TabelaFormCampoLabel" width="12%"><h:outputText
                                    styleClass="PaginaRotuloLabel" id="numItensText" value="Número de itens:"></h:outputText></TD>
                            <TD align="left" height="88%" class="TabelaFormCampoLabel" nowrap colspan="3"><h:inputText
                                    styleClass="PaginaInput" id="numItensInput"
                                    value=""></h:inputText></TD>
                            <td></td>
                        </TR>
                        <TR>
                            <TD class="TabelaFormCampoLabel" width="12%"><h:outputText
                                    styleClass="PaginaRotuloLabel" id="numLotesText" value="Número de lotes:"></h:outputText></TD>
                            <TD align="left" height="88%" class="TabelaFormCampoLabel" nowrap colspan="3"><h:inputText
                                    styleClass="PaginaInput" id="numLotesInput"
                                    value=""></h:inputText></TD>
                            <td></td>
                        </TR>

                    </TABLE>
                </fieldset><div class="BarraAcao">
                <h:commandButton type="submit"
                                 styleClass="PaginaButton" id="voltar2Button" value="Voltar"
                                 action=""/>
                <h:commandButton type="submit"
                                 styleClass="PaginaButton" id="salvar2Button" value="Salvar"
                                 actionListener="" onclick="formataHora();"/>
                <az:authorization id="priv.processolicitatorio.tramitarPLSec">
                    <h:commandButton type="submit" value="Trâmite" styleClass="PaginaButton" id="tramite2Button"
                                     action=""
                                     rendered="" />
                </az:authorization>
            </div>
            </div>

            <h:inputHidden id="pageIdHidden"
                           value="" />
            <h:inputHidden value="" />
        </sgc_template:ConteudoSemMenu>
    </h:form>
</f:view>
<sgc_template:Rodape/>