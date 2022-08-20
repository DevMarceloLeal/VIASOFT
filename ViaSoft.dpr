program ViaSoft;



uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  View.BackTransparent in 'SOURCE\VIEW\View.BackTransparent.pas' {frmBlack},
  View.Frame.Saldo in 'SOURCE\VIEW\View.Frame.Saldo.pas' {FrameSaldo: TFrame},
  View.Frame.Agrupamento in 'SOURCE\VIEW\View.Frame.Agrupamento.pas' {FrameAgrupamento: TFrame},
  View.Frame.Log in 'SOURCE\VIEW\View.Frame.Log.pas' {FrameLog: TFrame},
  View.Frame.Operacoes in 'SOURCE\VIEW\View.Frame.Operacoes.pas' {FrameCadastroOperacoes: TFrame},
  Auxiliar.Conversoes in 'SOURCE\AUXILIAR\Auxiliar.Conversoes.pas',
  Auxiliar.DataGrid in 'SOURCE\AUXILIAR\Auxiliar.DataGrid.pas',
  Auxiliar.Dialogos in 'SOURCE\AUXILIAR\Auxiliar.Dialogos.pas',
  Auxiliar.Forms in 'SOURCE\AUXILIAR\Auxiliar.Forms.pas',
  Auxiliar.Fundo.Esmaecido in 'SOURCE\AUXILIAR\Auxiliar.Fundo.Esmaecido.pas',
  Auxiliar.Validacoes in 'SOURCE\AUXILIAR\Auxiliar.Validacoes.pas',
  Auxiliar.Variaveis.Globais in 'SOURCE\AUXILIAR\Auxiliar.Variaveis.Globais.pas',
  View.Formulario in 'SOURCE\VIEW\View.Formulario.pas' {frmPrincipal},
  Model.Observer in 'SOURCE\MODEL\Model.Observer.pas',
  Controller.Factory in 'SOURCE\CONTROLLER\Controller.Factory.pas',
  Controller.Interfaces in 'SOURCE\CONTROLLER\Controller.Interfaces.pas',
  Model.Operacoes in 'SOURCE\MODEL\Model.Operacoes.pas',
  Auxiliar.Controller.Global in 'SOURCE\AUXILIAR\Auxiliar.Controller.Global.pas',
  Model.Agrupamentos in 'SOURCE\MODEL\Model.Agrupamentos.pas',
  Model.Logs in 'SOURCE\MODEL\Model.Logs.pas',
  Model.Saldos in 'SOURCE\MODEL\Model.Saldos.pas';

{$R *.res}

begin
  TStyleManager.TrySetStyle('Sapphire Kamri');

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
