unit View.Frame.Agrupamento;

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
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  Data.DB,
  Datasnap.DBClient,
  Controller.Interfaces,
  Model.Agrupamentos,
  Auxiliar.DataGrid,
  Auxiliar.Variaveis.Globais;

type
  TFrameAgrupamento = class(TFrame, iObserver)
    dbgPai: TDBGrid;
    dbgFilho: TDBGrid;
    LabelCreditos: TLabel;
    LabelDebitos: TLabel;
  private
    FControle: TModelAgrupamentos;
  public
    constructor Create(AOwner: TComponent) ; override;
    destructor Destroy; override;
    procedure Atualizar(Notificacao: TNotificacao);
  end;

implementation

{$R *.dfm}

{ TFrameAgrupamento }

constructor TFrameAgrupamento.Create(AOwner: TComponent);
begin
  inherited;
  FControle := TModelAgrupamentos.New;
  FControle.Formulario(Self).Dados;
end;

destructor TFrameAgrupamento.Destroy;
begin
  inherited;
end;

procedure TFrameAgrupamento.Atualizar(Notificacao: TNotificacao);
begin
  FControle.Formulario(Self).EfetuarLancamentos(Notificacao);
end;

end.
