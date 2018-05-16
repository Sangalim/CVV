unit uFrmCVVMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.Menus;

type
  TFrmCVVMain = class(TForm)
    ActionList1: TActionList;
    Button1: TButton;
    ActListaAtendentes: TAction;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Cadastro1: TMenuItem;
    ListaDeAtendentes1: TMenuItem;
    ActTurnos: TAction;
    ActSair: TAction;
    Sair1: TMenuItem;
    ActTurnos1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure ActListaAtendentesExecute(Sender: TObject);
    procedure ActSairExecute(Sender: TObject);
    procedure ActTurnosExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCVVMain: TFrmCVVMain;

implementation

{$R *.dfm}

uses uDM, uDMRes, uFrmListaDePessoas, uMinhaShell, uFrmTurnos;

procedure TFrmCVVMain.ActListaAtendentesExecute(Sender: TObject);
begin
  TFrmListaDePessoas.Exibe;
end;

procedure TFrmCVVMain.ActSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmCVVMain.ActTurnosExecute(Sender: TObject);
begin
  TFrmTurnos.Exibe;
end;

procedure TFrmCVVMain.Button1Click(Sender: TObject);
begin
  uMinhaShell.ExecExplorer(DM.PastaBase, True, False);
end;

end.
