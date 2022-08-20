unit View.Formulario;

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
  View.Frame.Operacoes,
  View.Frame.Log,
  View.Frame.Agrupamento,
  View.Frame.Saldo,
  Controller.Interfaces,
  Controller.Factory,
  Auxiliar.Forms,
  Auxiliar.Dialogos,
  Auxiliar.Controller.Global,
  Auxiliar.Variaveis.Globais;

type
  TfrmPrincipal = class(TForm)
    FrameCadastroOperacoes: TFrameCadastroOperacoes;
    FrameAgrupamento: TFrameAgrupamento;
    FrameSaldo: TFrameSaldo;
    FrameLog: TFrameLog;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    bhHint: TBalloonHint;
    procedure Setup;
  end;
var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Setup;
end;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    Char(VK_ESCAPE):
      begin
        Key := #0;
        Close;
      end;

    char(VK_RETURN):
      begin
        Key := #0;
        keybd_event(VK_TAB, 0, 0, 0);
      end;
  end;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := Msg('Deseja Realmente Sair ?', 4);
  if CanClose then
     ModalResult := mrCancel
  else
     SetFoco(FrameCadastroOperacoes, 'edtCentroCustos');
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  Application.Terminate;
  TerminateProcess(GetCurrentProcess, 0);
end;

procedure TfrmPrincipal.Setup;
begin
  bhHint         := TBalloonHint.Create(nil);
  bhHint.Delay   := 10;
  bhHint.Style   := bhsBalloon;
  CustomHint     := bhHint;
  ShowHint       := True;
  gTopo          := Top;
  gEsquerda      := Left;
  gLargura       := Width;
  gComprimento   := Height;
  gPosicao       := poMainFormCenter;
  gControle      := TController.New;

  gControle.Observer.Adicionar(FrameLog);
  gControle.Observer.Adicionar(FrameAgrupamento);
  gControle.Observer.Adicionar(FrameSaldo);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
