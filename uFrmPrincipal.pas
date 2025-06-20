unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uFrmRequisitos, uFrmResultado, uDadosPessoa;

type
  TFrmPrincipal = class(TForm)
    BtnResultados: TButton;
    BtnRequisitos: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    EdtAltura: TEdit;
    EdtPeso: TEdit;
    CmbSexo: TComboBox;
    procedure BtnRequisitosClick(Sender: TObject);
    procedure BtnResultadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.BtnRequisitosClick(Sender: TObject);
begin
  FrmRequisitos.ShowModal;
end;

procedure TFrmPrincipal.BtnResultadosClick(Sender: TObject);
begin

  try
    P_Dados_Pessoa.Altura := StrToFloat(EdtAltura.text);
    P_Dados_Pessoa.Peso := StrToFloat(EdtPeso.Text);
    P_Dados_Pessoa.Sexo := CmbSexo.text;
    P_Dados_Pessoa.IMC := CalcularIMC(P_Dados_Pessoa.Peso, 
    P_Dados_Pessoa.Altura,
     P_Dados_Pessoa.Sexo);


    FrmResultado.ShowModal;
  except
    ShowMessage('Dados Inválidos');
  end;

end;

end.
