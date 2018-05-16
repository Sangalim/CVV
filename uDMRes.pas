unit uDMRes;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls,
  cxImageList, cxGraphics, cxStyles, cxClasses;

type
  TDMRes = class(TDataModule)
    cxImageList1: TcxImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxOdd: TcxStyle;
    cxEven: TcxStyle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRes: TDMRes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
