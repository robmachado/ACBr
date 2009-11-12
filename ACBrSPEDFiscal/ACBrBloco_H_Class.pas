{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2009   Isaque Pinheiro                      }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 10/04/2009: Isaque Pinheiro
|*  - Cria��o e distribui��o da Primeira Versao
*******************************************************************************}

unit ACBrBloco_H_Class;

interface

uses SysUtils, Classes, DateUtils, ACBrSped, ACBrBloco_H;

type
  /// TBLOCO_H -
  TBloco_H = class(TACBrSPED)
  private
    FRegistroH001: TRegistroH001;      /// BLOCO H - RegistroH001
    FRegistroH005: TRegistroH005;      /// BLOCO H - RegistroH005
    FRegistroH010: TRegistroH010List;  /// BLOCO H - Lista de RegistroH010
    FRegistroH990: TRegistroH990;      /// BLOCO H - RegistroH990
  public
    constructor Create(AOwner: TComponent); override; /// Create
    destructor Destroy; override; /// Destroy

    function WriteRegistroH001: string;
    function WriteRegistroH005: string;
    function WriteRegistroH010: string;
    function WriteRegistroH990: string;

    property RegistroH001: TRegistroH001 read FRegistroH001 write FRegistroH001;
    property RegistroH005: TRegistroH005 read FRegistroH005 write FRegistroH005;
    property RegistroH010: TRegistroH010List read FRegistroH010 write FRegistroH010;
    property RegistroH990: TRegistroH990 read FRegistroH990 write FRegistroH990;
  end;

implementation

{ TBloco_H }

constructor TBloco_H.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FRegistroH001 := TRegistroH001.Create;
  FRegistroH005 := TRegistroH005.Create;
  FRegistroH010 := TRegistroH010List.Create;
  FRegistroH990 := TRegistroH990.Create;
  FRegistroH990.QTD_LIN_H := 0;
end;

destructor TBloco_H.Destroy;
begin
  FRegistroH001.Free;
  FRegistroH005.Free;
  FRegistroH010.Free;
  FRegistroH990.Free;
  inherited;
end;

function TBloco_H.WriteRegistroH001: string;
begin
  Result := '';

  if Assigned(RegistroH001) then
  begin
     with RegistroH001 do
     begin
       Check(((IND_MOV = 0) or (IND_MOV = 1)), 'BLOCO H - REGISTROH001: Na abertura do bloco, deve ser informado o n�mero 0 ou 1!');
       ///
       Result := LFill('H001') +
                 LFill(IND_MOV, 1) +
                 Delimitador +
                 #13#10;
       ///
       RegistroH990.QTD_LIN_H := RegistroH990.QTD_LIN_H + 1;
     end;
  end;
end;

function TBloco_H.WriteRegistroH005: string;
begin

end;

function TBloco_H.WriteRegistroH010: string;
begin

end;

function TBloco_H.WriteRegistroH990: string;
begin
  Result := '';

  if Assigned(RegistroH990) then
  begin
     with RegistroH990 do
     begin
       QTD_LIN_H := QTD_LIN_H + 1;
       ///
       Result := LFill('H990') +
                 LFill(QTD_LIN_H,0) +
                 Delimitador +
                 #13#10;
     end;
  end;
end;

end.
