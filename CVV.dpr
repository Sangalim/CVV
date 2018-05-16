program CVV;

uses
  Vcl.Forms,
  uFrmCVVMain in 'uFrmCVVMain.pas' {FrmCVVMain},
  uDM in 'uDM.pas' {DM: TDataModule},
  uDMRes in 'uDMRes.pas' {DMRes: TDataModule},
  uFrmListaDePessoas in 'uFrmListaDePessoas.pas' {FrmListaDePessoas},
  uMinhaShell in '..\DelUnits\MinhaShell\uMinhaShell.pas',
  uFrmTurnos in 'uFrmTurnos.pas' {FrmTurnos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDMRes, DMRes);
  Application.CreateForm(TFrmCVVMain, FrmCVVMain);
  Application.Run;
end.
