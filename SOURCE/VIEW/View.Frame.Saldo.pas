unit View.Frame.Saldo;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Controller.Interfaces,
  Model.Saldos,
  Auxiliar.Variaveis.Globais;

type
  TFrameSaldo = class(TFrame, iObserver)
    LabelTitulo: TLabel;
    LabelSaldo: TLabel;
    LabelTotalGeral: TLabel;
  private
    FControle: TModelSaldos;
  public
    constructor Create(AOwner: TComponent) ; override;
    destructor Destroy; override;
    procedure Atualizar(Notificacao: TNotificacao);
  end;

implementation

{$R *.dfm}

{ TFrameSaldo }

constructor TFrameSaldo.Create(AOwner: TComponent);
begin
  inherited;
  FControle := TModelSaldos.New;
end;

destructor TFrameSaldo.Destroy;
begin
  inherited;
end;

procedure TFrameSaldo.Atualizar(Notificacao: TNotificacao);
begin
  LabelTotalGeral.Caption := FControle.EfetuarLancamentos(Notificacao);
end;

end.
