program Project;

uses
  Forms, Figure in 'Figure.pas',
  tetrisunit in 'tetrisunit.pas' {Form1};


{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
