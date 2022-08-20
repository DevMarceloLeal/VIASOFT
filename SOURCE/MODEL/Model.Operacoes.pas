unit Model.Operacoes;

interface

uses
  System.SysUtils,
  Vcl.Forms,
  Auxiliar.Forms,
  Auxiliar.Dialogos,
  Auxiliar.Variaveis.Globais,
  Controller.Interfaces;

type
  TModelOperacoes = class(TInterfacedObject, iModel)
  private
    FFrame: TFrame;
    FObserver: iSubject;
    FMsg,
    FCentroCusto: String;
    FValor: Real;
    Notificacao: TNotificacao;
    procedure Atualizar;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModel;
    function Observer(pObserver: iSubject): iModel;
    function Formulario(pFrame: TFrame): iModel;
    procedure EfetuarLancamentos;
  end;

implementation

{ TModelOperacoes }

constructor TModelOperacoes.Create;
begin
end;

destructor TModelOperacoes.Destroy;
begin
  inherited;
end;

class function TModelOperacoes.New: iModel;
begin
  Result := Self.Create;
end;

function TModelOperacoes.Observer(pObserver: iSubject): iModel;
begin
  Result    := Self;
  FObserver := pObserver;
end;

function TModelOperacoes.Formulario(pFrame: TFrame): iModel;
begin
  Result := Self;
  FFrame := pFrame;
end;

procedure TModelOperacoes.EfetuarLancamentos;
begin
  FMsg         := '';
  FCentroCusto := GetValor(FFrame,'edtCentroCustos');
  FValor       := StrToFloat(GetValor(FFrame,'edtValor').Replace('.',''));

  if ((Length(FCentroCusto) = 6) and (FValor > 0.00)) and ((FCentroCusto.Substring(0,2) <> '00') and (FCentroCusto.Substring(2,4) <> '0000')) then
     Atualizar
  else
     begin
       if ((FCentroCusto = '') or (Length(FCentroCusto) >= 7) or (Length(FCentroCusto) <= 5)) or
          ((FCentroCusto.Substring(0,2) = '00') or (FCentroCusto.Substring(2,4) = '0000')) then
          FMsg := #13 + 'C�digo Centro de Custo [ ' + FCentroCusto + ' ] n�o aceito.' + #13 +
                        'C�difica��o aceita:' + #13 +
                        'PPFFFF onde' + #13 +
                        '---------------' + #13 +
                        'PP -> de 01 at� 99' + #13 +
                        'FFFF -> de 0001 at� 9999' + #13;

       if GetValor(FFrame,'edtValor') = '0,00' then
          FMsg := FMsg + #13 + 'Valor n�o Pode Ficar Zerado' + #13;

       Msg('Lan�amento Incorreto !!!' + #13 + FMsg, 3);
     end;

  ClearEdits(FFrame);
  SetFoco(FFrame,'edtCentroCustos');
end;

procedure TModelOperacoes.Atualizar;
begin
  Notificacao.CentroCustos := FCentroCusto;
  Notificacao.Valor        := FValor;

  FObserver.Notificar(Notificacao);
end;

end.
