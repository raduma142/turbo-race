unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList;

type
  TMainForm = class(TForm)
    StartButton: TImage;
    ExitButton: TImage;
    MapImageList: TImageList;
    MapImage: TImage;
    SpeedTimer: TTimer;
    PlayerCar1: TImage;
    PlayerCar2: TImage;
    PlayerCar3: TImage;
    PlayerCar4: TImage;
    procedure ExitButtonClick(Sender: TObject);
    procedure StartButtonClick(Sender: TObject);
    procedure SpeedTimerTimer(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  map: array[1..10] of array[1..10] of integer;
  speed, speed_v: integer;
  x_map, y_map: integer;

implementation

{$R *.dfm}

procedure TMainForm.ExitButtonClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.StartButtonClick(Sender: TObject);
var
  i, j: integer;
begin
  ExitButton.Visible := false;
  StartButton.Visible := false;
  MapImage.Visible := true;
  PlayerCar1.Visible := true;
  PlayerCar2.Visible := false;
  PlayerCar3.Visible := false;
  PlayerCar4.Visible := false;

  map[1][1] := 11; map[1][2] := 11; map[1][3] := 11; map[1][4] := 11;
  map[1][5] := 11; map[1][6] := 11;map[1][7] := 11; map[1][8] := 11;
  map[1][9] := 11; map[1][10] := 11;
  map[2][1] := 11; map[2][2] := 4; map[2][3] := 1; map[2][4] := 1;
  map[2][5] := 1; map[2][6] := 1;map[2][7] := 0; map[2][8] := 1;
  map[2][9] := 6; map[2][10] := 11;
  map[3][1] := 11; map[3][2] := 2; map[3][3] := 11; map[3][4] := 11;
  map[3][5] := 11; map[3][6] := 11;map[3][7] := 11; map[3][8] := 11;
  map[3][9] := 2; map[3][10] := 11;
  map[4][1] := 11; map[4][2] := 3; map[4][3] := 1; map[4][4] := 1;
  map[4][5] := 6; map[4][6] := 11;map[4][7] := 4; map[4][8] := 1;
  map[4][9] := 5; map[4][10] := 11;
  map[5][1] := 11; map[5][2] := 12; map[5][3] := 11; map[5][4] := 11;
  map[5][5] := 2; map[5][6] := 11;map[5][7] := 2; map[5][8] := 11;
  map[5][9] := 11; map[5][10] := 11;
  map[6][1] := 11; map[6][2] := 4; map[6][3] := 1; map[6][4] := 1;
  map[6][5] := 5; map[6][6] := 11;map[6][7] := 3; map[6][8] := 1;
  map[6][9] := 1; map[6][10] := 6;
  map[7][1] := 11; map[7][2] := 2; map[7][3] := 11; map[7][4] := 11;
  map[7][5] := 11; map[7][6] := 11;map[7][7] := 11; map[7][8] := 11;
  map[7][9] := 11; map[7][10] := 2;
  map[8][1] := 11; map[8][2] := 2; map[8][3] := 11; map[8][4] := 11;
  map[8][5] := 11; map[8][6] := 12;map[8][7] := 4; map[8][8] := 6;
  map[8][9] := 11; map[8][10] := 2;
  map[9][1] := 11; map[9][2] := 3; map[9][3] := 1; map[9][4] := 1;
  map[9][5] := 1; map[9][6] := 1;map[9][7] := 5; map[9][8] := 3;
  map[9][9] := 1; map[9][10] := 5;
  map[10][1] := 11; map[10][2] := 11; map[10][3] := 11; map[10][4] := 11;
  map[10][5] := 11; map[10][6] := 11;map[10][7] := 11; map[10][8] := 11;
  map[10][9] := 11; map[10][10] := 11;

  For i := 1 to 10 do
    For j := 1 to 10 do
      MapImageList.Draw(MapImage.Canvas, i * 200 - 200, j * 200 - 200, map[i][j]);

  x_map := 100; y_map := -1000;
  MapImage.Left := x_map;
  MapImage.Top := y_map;

  speed := 0; speed_v := 1;
  SpeedTimer.Enabled := True;
end;

procedure TMainForm.SpeedTimerTimer(Sender: TObject);
begin
  if speed_v = 1 then
    y_map := y_map + speed;
  if speed_v = 2 then
    x_map := x_map - speed;
  if speed_v = 3 then
    y_map := y_map - speed;
  if speed_v = 4 then
    x_map := x_map + speed;
  MapImage.Left := x_map;
  MapImage.Top := y_map;
end;


procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 38 Then
    speed := speed + 2;
  If key = 40 Then
    speed := speed - 2;
  If key = 39 Then begin
    speed_v := speed_v + 1;
    if speed_v = 5 then speed_v := 1;
  end;
  If key = 37 Then begin
    speed_v := speed_v - 1;
    if speed_v = 0 then speed_v := 4;
  end;

  if speed_v = 1 then begin
    PlayerCar1.Visible := true;
    PlayerCar2.Visible := false;
    PlayerCar3.Visible := false;
    PlayerCar4.Visible := false;
  end;
  if speed_v = 2 then begin
    PlayerCar1.Visible := false;
    PlayerCar2.Visible := true;
    PlayerCar3.Visible := false;
    PlayerCar4.Visible := false;
  end;
  if speed_v = 3 then begin
    PlayerCar1.Visible := false;
    PlayerCar2.Visible := false;
    PlayerCar3.Visible := true;
    PlayerCar4.Visible := false;
  end;
  if speed_v = 4 then begin
    PlayerCar1.Visible := false;
    PlayerCar2.Visible := false;
    PlayerCar3.Visible := false;
    PlayerCar4.Visible := true;
  end;
end;

end.
