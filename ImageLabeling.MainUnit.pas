unit ImageLabeling.MainUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, REST.Types, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  RESTClient1.ResetToDefaults;
  RESTClient1.Accept := 'application/json';
  RESTClient1.AcceptCharset := 'UTF-8, *;q=0.8';
  RESTClient1.BaseURL :=
    'https://api.apilayer.com/image_labeling/url?apikey=37BHHAMeQCOYhkfR4qtz31b8fCuJE3fV&url='
     + Edit1.Text; // image url via Edit1

  RESTResponse1.ContentType := 'application/json';
  // send request
  RESTRequest1.Execute;

  Memo1.Lines.Clear;
  Memo1.Lines.Add(RESTResponse1.Content);
end;

end.
