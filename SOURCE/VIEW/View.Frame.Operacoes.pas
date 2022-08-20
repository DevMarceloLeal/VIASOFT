unit View.Frame.Operacoes;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  System.SysUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Auxiliar.Forms,
  Auxiliar.Conversoes,
  Auxiliar.Controller.Global,
  Auxiliar.Variaveis.Globais;

type
  TFrameCadastroOperacoes = class(TFrame)
    edtValor: TEdit;
    lblCentroCustos: TLabel;
    lblValor: TLabel;
    edtCentroCustos: TEdit;
    btnLancar: TBitBtn;
    btnSair: TBitBtn;
    procedure edtValorExit(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure btnLancarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent) ; override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

{ TFrameCadastroOperacoes }

constructor TFrameCadastroOperacoes.Create(AOwner: TComponent);
begin
  inherited;
  edtValor.OnExit     := edtValorExit;
  edtValor.OnKeyPress := edtValorKeyPress;
  btnLancar.Hint      := 'Para efetuar o lançamento do centro de custo';
  btnSair.Hint        := 'Encerra o sistema e retorna ao windows';
  btnLancar.OnClick   := btnLancarClick;
  btnSair.OnClick     := btnSairClick;
end;

destructor TFrameCadastroOperacoes.Destroy;
begin
  inherited;
end;

procedure TFrameCadastroOperacoes.edtValorExit(Sender: TObject);
begin
  Moeda(Sender);
end;

procedure TFrameCadastroOperacoes.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['0'..'9', #8, #44])) then
     Key := #0;
end;

procedure TFrameCadastroOperacoes.btnLancarClick(Sender: TObject);
begin
  gControle.Operacoes.Formulario(Self).EfetuarLancamentos;
end;

procedure TFrameCadastroOperacoes.btnSairClick(Sender: TObject);
begin
  PressionaTecla(VK_ESCAPE);
end;

end.
