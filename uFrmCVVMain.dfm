object FrmCVVMain: TFrmCVVMain
  Left = 0
  Top = 0
  Caption = 'CVV - Beta 01 - 2018-05-09'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Button1: TButton
    Left = 520
    Top = 8
    Width = 107
    Height = 25
    Caption = 'Pasta de dados'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ActionList1: TActionList
    Images = DMRes.cxImageList1
    Left = 312
    Top = 152
    object ActListaAtendentes: TAction
      Caption = 'Lista De Atendentes'
      ImageIndex = 0
      OnExecute = ActListaAtendentesExecute
    end
    object ActTurnos: TAction
      Caption = 'Turnos'
      ImageIndex = 1
      OnExecute = ActTurnosExecute
    end
    object ActSair: TAction
      Caption = 'Sair'
      ImageIndex = 3
      OnExecute = ActSairExecute
    end
  end
  object MainMenu1: TMainMenu
    Images = DMRes.cxImageList1
    Left = 312
    Top = 200
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Sair1: TMenuItem
        Action = ActSair
      end
    end
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object ListaDeAtendentes1: TMenuItem
        Action = ActListaAtendentes
      end
      object ActTurnos1: TMenuItem
        Action = ActTurnos
      end
    end
  end
end
