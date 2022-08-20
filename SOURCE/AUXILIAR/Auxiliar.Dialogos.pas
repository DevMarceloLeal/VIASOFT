unit Auxiliar.Dialogos;

interface

uses
  Winapi.Windows,
  System.UITypes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Controls,
  Auxiliar.Fundo.Esmaecido;

  function Msg(StrMsg: String; Tipo: Integer = 1): Boolean;

implementation

/// ####################################################################################################################
/// Fun��o   : Msg()
/// Objetivo : Respons�vel pela janela de mensagens nativas da linguagem
/// ####################################################################################################################
function Msg(StrMsg: String; Tipo: Integer = 1): Boolean;
var
  I: Integer;
  StrTitulo: String;
  DlgType: TMsgDlgType;
  Fundo: TFundoEsmaecido;
  bhMsgSys: TBalloonHint;
  Janela: TForm;

begin
  StrTitulo      := 'VIASOFT Sistemas';
  Fundo          := TFundoEsmaecido.New;
  bhMsgSys       := TBalloonHint.Create(nil);
  bhMsgSys.Delay := 10;
  bhMsgSys.Style := bhsBalloon;

  DlgType := mtInformation;
  if Tipo = 2 then
     DlgType := mtWarning
  else if Tipo = 3 then
     DlgType := mtError
  else if Tipo = 4 then
     DlgType := mtCustom;

  Fundo.Escurecer;
  if Tipo <= 3 then
     Janela := CreateMessageDialog(StrMsg, DlgType, [mbOK])
  else
     Janela := CreateMessageDialog(StrMsg, DlgType, mbYesNo);

  with Janela do
     try
       for I := 0 to ComponentCount - 1 do
         if Components[I] IS TButton then
            begin
              with TButton(Components[I]) do
                case ModalResult of
                  mrOK:
                    begin
                      Caption := '&OK';
                      Cursor := crHandPoint;
                      Hint := 'Clique Para Encerrar a Janela';
                      ModalResult := mrOK;
                    end;
                  mrYes:
                    begin
                      Caption := '&Sim';
                      Cursor := crHandPoint;
                      Hint := 'Clique Para Informar Sim';
                      ModalResult := mrYes;
                    end;
                  mrNo:
                    begin
                      Caption := '&N�o';
                      Cursor := crHandPoint;
                      Hint := 'Clique Para Informar N�o';
                      ModalResult := mrNo;
                    end;
                end;
            end;

       MessageBeep(MB_ICONINFORMATION);

       Caption := StrTitulo;
       CustomHint := bhMsgSys;
       ShowHint := True;
       ShowModal;
     finally
       Fundo.Clarear;
       Fundo.Free;
       bhMsgSys.Free;
       Free;
       Result := (ModalResult = mrOK) or (ModalResult = mrYes);
     end;
end;

end.
