object FrmTurnos: TFrmTurnos
  Left = 0
  Top = 0
  Caption = 'Turnos'
  ClientHeight = 216
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    635
    216)
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 156
    Height = 15
    Caption = 'Selecione um atendente ativo'
  end
  object LblClok: TLabel
    Left = 543
    Top = 176
    Width = 84
    Height = 32
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = 'LblClok'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 259
  end
  object LblTxtIniciado: TLabel
    Left = 8
    Top = 58
    Width = 129
    Height = 32
    Caption = 'Iniciado em:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LblInicio: TLabel
    Left = 174
    Top = 58
    Width = 74
    Height = 32
    Caption = '--:--:--'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblTxtEncerrado: TLabel
    Left = 8
    Top = 136
    Width = 152
    Height = 32
    Caption = 'Encerrado em:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LblEncerrado: TLabel
    Left = 174
    Top = 134
    Width = 74
    Height = 32
    Caption = '--:--:--'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblTxtAtendimentos: TLabel
    Left = 8
    Top = 174
    Width = 155
    Height = 32
    Caption = 'Atendimentos:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LblNroAtendimentos: TLabel
    Left = 174
    Top = 174
    Width = 14
    Height = 32
    Caption = '0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblTxtDuracao: TLabel
    Left = 8
    Top = 96
    Width = 93
    Height = 32
    Caption = 'Dura'#231#227'o:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LblDuracao: TLabel
    Left = 174
    Top = 96
    Width = 74
    Height = 32
    Caption = '--:--:--'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxCMBAtivos: TcxComboBox
    Left = 8
    Top = 29
    Properties.DropDownListStyle = lsFixedList
    Properties.IncrementalFiltering = True
    TabOrder = 0
    Width = 425
  end
  object cxButton1: TcxButton
    Left = 208
    Top = 178
    Width = 25
    Height = 25
    Action = ActMais
    TabOrder = 1
  end
  object cxButton2: TcxButton
    Left = 254
    Top = 178
    Width = 25
    Height = 25
    Action = ActMenos
    TabOrder = 2
  end
  object cxButton3: TcxButton
    Left = 512
    Top = 8
    Width = 115
    Height = 25
    Action = ActIniciar
    Anchors = [akTop, akRight]
    TabOrder = 3
  end
  object cxButton4: TcxButton
    Left = 512
    Top = 39
    Width = 115
    Height = 25
    Action = ActFinalizar
    Anchors = [akTop, akRight]
    TabOrder = 4
  end
  object ActionList1: TActionList
    Images = DMRes.cxImageList1
    Left = 464
    Top = 96
    object ActMais: TAction
      ImageIndex = 6
      ShortCut = 16429
      OnExecute = ActMaisExecute
      OnUpdate = ActMaisUpdate
    end
    object ActMenos: TAction
      ImageIndex = 7
      ShortCut = 8238
      OnExecute = ActMenosExecute
      OnUpdate = ActMenosUpdate
    end
    object ActIniciar: TAction
      Caption = 'Iniciar turno'
      ImageIndex = 1
      OnExecute = ActIniciarExecute
      OnUpdate = ActIniciarUpdate
    end
    object ActFinalizar: TAction
      Caption = 'Finalizar'
      ImageIndex = 2
      OnExecute = ActFinalizarExecute
      OnUpdate = ActFinalizarUpdate
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 520
    Top = 96
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
  end
end
